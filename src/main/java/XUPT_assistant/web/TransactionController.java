package XUPT_assistant.web;

import XUPT_assistant.model.Page;
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

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("transaction")
public class TransactionController {

    @Autowired
    private TransactionService transactionService;
    @Autowired
    private PictureService pictureService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam("enclosure")String enclosure,
                       Transaction transaction,
                       HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        transaction.setUser_id(user.getId());
        transaction.setSeller(user.getName());
        transaction.setStatus(0);
        if (transaction.getName() == null || transaction.getInformation() == null || transaction.getPhone() == null || transaction.getPrice() == null){
            return "发表失败";
        }
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
        return "发表成功";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String deleteTransaction(int id){
        transactionService.deleteTransaction(id);
        return "删除成功";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateTransaction(Transaction transaction,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        transaction.setUser_id(user.getId());
        transaction.setSeller(user.getName());
        if (transaction.getName() == null || transaction.getInformation() == null || transaction.getPhone() == null || transaction.getPrice() == null || transaction.getStatus() == null){
            return "修改失败";
        }
        transactionService.updateTransaction(transaction);
        return "修改成功";
    }

    @RequestMapping(value = "/getAll",method = RequestMethod.GET)
    @ResponseBody
    public List<Transaction> getAllTransaction(Page page){
        List<Transaction> transactions = transactionService.getAllTransaction(page);
        for(Transaction transaction:transactions){
            transaction.setPics(pictureService.getPictureByTargetId(transaction.getId(),0));
        }
        return transactions;
    }

    @RequestMapping(value = "/getMy",method = RequestMethod.GET)
    @ResponseBody
    public List<Transaction> getMyTransaction(HttpServletRequest request,Page page){
        User user = (User)request.getSession().getAttribute("user");
        return transactionService.getMyTransaction(user.getId(),page);
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String get(){
        return "transaction";
    }
}
