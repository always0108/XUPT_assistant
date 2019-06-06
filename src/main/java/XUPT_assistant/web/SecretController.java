package XUPT_assistant.web;

import XUPT_assistant.model.Secret;
import XUPT_assistant.service.SecretService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/secret")
public class SecretController {

    @Autowired
    private SecretService secretService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> addSecret(Secret secret) throws ParseException {
        //获取当前时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date time = simpleDateFormat.parse(simpleDateFormat.format(new Date()));
        secret.setTime(time);

        Map<String,String> map = new HashMap<>();
        if(secret == null){
            map.put("type","error");
            map.put("msg","输入信息为空！");
            return map;
        }
        if(!secretService.addSecret(secret)){
            map.put("type","error");
            map.put("msg","树洞发表失败！");
            return map;
        }
        map.put("type","success");
        map.put("msg","树洞发表成功！");
        return map;
    }

    @RequestMapping(value = "/getAllSecrets" , method = RequestMethod.GET )
    @ResponseBody
    public List<Secret> getAllSecrets(){
        List<Secret> list = secretService.getAllSecrets();
        return list;
    }

    @RequestMapping(value = "/getMySecrets", method = RequestMethod.GET)
    @ResponseBody
    public List<Secret> getMySecrets(String username){
        List<Secret> list = secretService.getMySecrets(username);
        return list;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteSecretById(int id) {
        Map<String, String> map = new HashMap<>();
        if (!secretService.deleteSecretById(id)) {
            map.put("type","error");
            map.put("msg","删除失败!");
            return map;
        }
        map.put("type","success");
        map.put("msg","删除成功！");
        return map;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public Map<String,String> updateSecretContent(String content,int id){
        Map<String,String> map = new HashMap<>();
        if(!secretService.updateSecretContent(content,id)){
            map.put("type","error");
            map.put("msg","修改失败!");
            return map;
        }
        map.put("type","success");
        map.put("msg","修改成!");
        return map;
    }
}
