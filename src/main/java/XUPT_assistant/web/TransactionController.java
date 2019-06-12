package XUPT_assistant.web;

import XUPT_assistant.model.Transaction;
import XUPT_assistant.model.User;
import XUPT_assistant.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("transaction")
public class TransactionController {

    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    public String addTransaction(Transaction transaction, HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        transaction.setUser_id(user.getId());
        transactionService.addTransaction(transaction);
        return "发表成功";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public String deleteTransaction(int id){
        transactionService.deleteTransaction(id);
        return "删除成功";
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    public String updateTransaction(Transaction transaction){
        transactionService.updateTransaction(transaction);
        return "修改成功";
    }

    @RequestMapping(value = "/getAll",method = RequestMethod.GET)
    @ResponseBody
    public List<Transaction> getAllTransaction(){
        return transactionService.getAllTransaction();
    }

    @RequestMapping(value = "/getMy",method = RequestMethod.GET)
    @ResponseBody
    public List<Transaction> getMyTransaction(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        return transactionService.getMyTransaction(user.getId());
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String get(){
        return "transaction";
    }
}
