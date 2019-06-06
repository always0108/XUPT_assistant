package XUPT_assistant.web;

import XUPT_assistant.dao.StudentDao;
import XUPT_assistant.model.Student;
import XUPT_assistant.utils.ConnectJWGL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class StudentController {
    @Autowired
    private StudentDao studentDao;

    @ResponseBody
    @RequestMapping(value = "/student/bind",method = RequestMethod.POST)
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
}
