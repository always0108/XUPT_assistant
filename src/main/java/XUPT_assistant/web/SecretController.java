package XUPT_assistant.web;

import XUPT_assistant.model.Secret;
import XUPT_assistant.model.User;
import XUPT_assistant.service.SecretService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/secret")
public class SecretController {

    @Autowired
    private SecretService secretService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String addSecret(Secret secret, HttpServletRequest request) throws ParseException {
        //获取当前时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date time = simpleDateFormat.parse(simpleDateFormat.format(new Date()));
        secret.setTime(time);

        User user = (User)request.getSession().getAttribute("user");
        secret.setUser_id(user.getId());
        secret.setUsername(user.getName());
        if(secretService.addSecret(secret)){
            return "发表成功";
        }else{
            return "发表失败";
        }

    }

    @RequestMapping(value = "/getAllSecrets" , method = RequestMethod.GET )
    @ResponseBody
    public List<Secret> getAllSecrets(){
        List<Secret> list = secretService.getAllSecrets();
        return list;
    }

    @RequestMapping(value = "/getMySecrets", method = RequestMethod.GET)
    @ResponseBody
    public List<Secret> getMySecrets(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        String username = user.getName();
        List<Secret> list = secretService.getMySecrets(username);
        return list;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String deleteSecretById(int id) {
        if(secretService.deleteSecretById(id)){
            return "删除成功";
        }else {
            return "删除失败";
        }
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateSecretContent(String content,int id){
        if(secretService.updateSecretContent(content,id)){
            return "修改成功";
        }else {
            return "修改失败";
        }
    }
}
