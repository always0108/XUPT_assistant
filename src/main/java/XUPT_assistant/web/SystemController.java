package XUPT_assistant.web;


import XUPT_assistant.model.User;
import XUPT_assistant.service.UserService;
import XUPT_assistant.utils.CpachaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/system")
public class SystemController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String home(){
        return "home";
    }

    @RequestMapping(value = "/loginAct",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> loginAct(User user, String cpacha,HttpServletRequest request){
        Map<String,String> map = new HashMap<>();
        if(user.getName().equals("")){
            map.put("type","error");
            map.put("msg","请填写用户名");
            return map;
        }
        if(user.getPassword().equals("") ){
            map.put("type","error");
            map.put("msg","请填写密码");
            return map;
        }
        if(cpacha.equals("") ){
            map.put("type","error");
            map.put("msg","请填写验证码");
            return map;
        }
        Object loginCpacha = request.getSession().getAttribute("loginCpacha");
        if(!cpacha.toUpperCase().equals(loginCpacha.toString().toUpperCase())){
            map.put("type","error");
            map.put("msg","验证码错误");
            return map;
        }
        User findByUserName = userService.findByUserName(user.getName());
        if(findByUserName == null){
            map.put("type","error");
            map.put("msg","用户名不存在");
            return map;
        }
        if(!user.getPassword().equals(findByUserName.getPassword())){
            map.put("type","error");
            map.put("msg","密码错误");
            return map;
        }
        request.getSession().setAttribute("user",findByUserName);
        map.put("type","success");
        map.put("msg","登陆成功");
        return map;

    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> register(User user, String repassword){
        Map<String,String> map = new HashMap();
        if(user.getName().equals("")){
            map.put("type","error");
            map.put("msg","请填写用户名");
            return map;
        }
        if(user.getPassword().equals("") ){
            map.put("type","error");
            map.put("msg","请填写密码");
            return map;
        }
        if(repassword.equals("")){
            map.put("type","error");
            map.put("msg","请再次填写密码");
            return map;
        }
        if (!user.getPassword().equals(repassword)){
            map.put("type","error");
            map.put("msg","两次输入密码不一致，请重新输入！");
            return map;
        }
        if(isExits(user.getName())){
            map.put("type","error");
            map.put("msg","用户名已存在");
            return map;
        }
        if(!userService.addUser(user)){
            map.put("type","error");
            map.put("msg","注册失败");
            return map;
        }
        map.put("type","success");
        map.put("msg","注册成功");
        return map;

    }

    @RequestMapping(value = "/get_cpacha",method = RequestMethod.GET)
    public void generateCpacha(
            @RequestParam(name = "vl",required = false,defaultValue = "4") Integer vcodeLen,
            @RequestParam(name = "wd",required = false,defaultValue = "100") Integer width,
            @RequestParam(name = "ht",required = false,defaultValue = "30") Integer height,
            @RequestParam(name = "type",required = true,defaultValue = "loginCpacha") String cpachaType,
            HttpServletRequest request,
            HttpServletResponse response){
        CpachaUtil cpachaUtil = new CpachaUtil(vcodeLen,width,height);
        String generatorVode = cpachaUtil.generatorVCode();
        request.getSession().setAttribute(cpachaType,generatorVode);
        BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVode,true);
        try {
            ImageIO.write(generatorRotateVCodeImage,"gif",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean isExits(String name){
        User user = userService.findByUserName(name);
        if(user != null){
            return true;
        }
        return false;
    }
}