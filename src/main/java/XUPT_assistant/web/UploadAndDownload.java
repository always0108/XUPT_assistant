package XUPT_assistant.web;

import XUPT_assistant.model.Picture;
import XUPT_assistant.model.Transaction;
import XUPT_assistant.model.User;
import XUPT_assistant.service.PictureService;
import XUPT_assistant.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
@RequestMapping("/image")
public class UploadAndDownload {
    @Autowired
    private PictureService pictureService;
    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public Object upload(@RequestParam("images") MultipartFile file) throws IOException {
        BASE64Encoder encoder = new BASE64Encoder();
        String image = encoder.encode(file.getBytes());
        Picture picture = new Picture(file.getOriginalFilename(),image);
        pictureService.addPicture(picture);
        return picture;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Object delete(@RequestParam("id")Integer id) throws IOException {
        pictureService.deletePicture(id);
        return "success";
    }

    @RequestMapping(value = "/upload",method = RequestMethod.GET)
    public String upload(){
        return "upload";
    }

    @RequestMapping(value="/getImage",method=RequestMethod.GET)
    public void download(HttpServletResponse response,
                         @RequestParam("id") Integer id) throws IOException{
        Picture picture = pictureService.getPictureById(id);
        if(picture == null){
            return;
        }

        byte[] byteAry = (byte[])picture.getImage();
        String data = new String(byteAry,"UTF-8");
        BASE64Decoder decoder = new BASE64Decoder();

        byte[] bytes = decoder.decodeBuffer(data);
        for(int i = 0; i < bytes.length;++i){
            if(bytes[i] < 0){ // 调整异常数据
                bytes[i] += 256;
            }
        }
        response.setContentType("image/jpeg");
//        System.out.println(picture.getName());
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition","attachment; filename="+picture.getName());
        //获取响应报文输出流对象
        ServletOutputStream  out =response.getOutputStream();
        //输出
        out.write(bytes);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/test",method = RequestMethod.POST)
    @ResponseBody
    public String test(@RequestParam("enclosure")String enclosure,
                       Transaction transaction,
                       HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        transaction.setUser_id(user.getId());
        transaction.setSeller(user.getName());
        transaction.setStatus(0);
        transactionService.addTransaction(transaction);
        Integer transaction_id = transaction.getId();
        if (enclosure.equals("null")) {
            //附件为空
        } else {
            //附件不为空
            String[] nums = enclosure.split("\\+");
            for (String num : nums) {
                pictureService.updatePicture(transaction_id,0,Integer.parseInt(num));
            }
        }
        return "success";
    }
}
