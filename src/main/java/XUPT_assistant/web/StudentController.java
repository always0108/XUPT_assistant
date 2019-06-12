package XUPT_assistant.web;

import XUPT_assistant.dao.StudentDao;
import XUPT_assistant.model.Student;
import XUPT_assistant.model.User;
import XUPT_assistant.service.StudentService;
import XUPT_assistant.utils.ConnectJWGL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentDao studentDao;

    @Autowired
    private StudentService studentService;

    @ResponseBody
    @RequestMapping(value = "/bind",method = RequestMethod.GET)
    public String studentBind(@RequestParam("number") String number,
                              @RequestParam("password") String password,
                              HttpServletRequest request)
            throws IOException {
//        User user = (User)request.getSession().getAttribute("user");
//        System.out.println(user.getId());
        Student student;
        try {
            ConnectJWGL connectJWGL = new ConnectJWGL(number,password);
            connectJWGL.init();
            if(connectJWGL.beginLogin()){
                student = connectJWGL.getStudentInformaction();
                student.setPassword(password);
                student.setUser_id(1);
                studentDao.addStudent(student);
                connectJWGL.logout();
            }
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
        return "success";
    }


    @RequestMapping(value = "/updatePassword",method = RequestMethod.GET)
    @ResponseBody
    public String updatePassword(String password,String newPassword,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        int user_id = user.getId();
        Student student = studentService.selectStudentByUserId(user_id);
        if(!student.getPassword().equals(password)){
            return "原密码错误";
        }
        if(studentService.updatePassword(student.getId(),newPassword)){
            return "修改成功";
        }else{
            return "修改失败";
        }
    }
}
