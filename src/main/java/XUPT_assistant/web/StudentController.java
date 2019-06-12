package XUPT_assistant.web;

import XUPT_assistant.dao.StudentDao;
import XUPT_assistant.model.Course;
import XUPT_assistant.model.Grade;
import XUPT_assistant.model.Student;
import XUPT_assistant.model.User;
import XUPT_assistant.utils.ConnectJWGL;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentDao studentDao;

    @ResponseBody
    @RequestMapping(value = "/student/bind",method = RequestMethod.POST)
    public String studentBind(@RequestParam("number") String number,
                              @RequestParam("password") String password,
                              HttpServletRequest request)
            throws IOException {
        User user = (User)request.getSession().getAttribute("user");
        Student student;
        try {
            ConnectJWGL connectJWGL = new ConnectJWGL(number,password);
            connectJWGL.init();
            if(connectJWGL.beginLogin()){
                student = connectJWGL.getStudentInformaction();
                student.setPassword(password);
                student.setUser_id(user.getId());
                studentDao.addStudent(student);
                connectJWGL.logout();
            }else {
                return "fail";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "fail";
        }
        return "success";
    }

    @RequestMapping(value = "/student/bind",method = RequestMethod.GET)
    public String bind(Model model){
        return "bind";
    }

    @RequestMapping(value = "/student/courseSearch",method = RequestMethod.GET)
    public String getCourseSearch(Model model){
        return "courseSearch";
    }

    @RequestMapping(value = "/student/gradeSearch",method = RequestMethod.GET)
    public String gradeSearch(){
        return "gradeSearch";
    }

    @RequestMapping(value = "/system/modifyInfo",method = RequestMethod.GET)
    public String modifyInfo(){
        return "modifyIntro";
    }

    @RequestMapping(value = "/student/courseSearch",method = RequestMethod.POST)
    public Object courseSearch(@RequestParam("year") String year,
                               @RequestParam("semester") String semester,
                               HttpServletRequest request,
                               Model model){
        User user = (User)request.getSession().getAttribute("user");
        Student student = studentDao.selectStudentByUserId(user.getId());
        try {
            ConnectJWGL connectJWGL = new ConnectJWGL(student.getNumber(),student.getPassword());
            connectJWGL.init();
            if(connectJWGL.beginLogin()){
                List<Course> courses =  connectJWGL.getStudentTimetable(Integer.parseInt(year),Integer.parseInt(semester));
                connectJWGL.logout();
                model.addAttribute("courses",courses);
            }else {
                model.addAttribute("notes","fail");
            }
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("notes","fail");
        }
        return "courseSearch";
    }

    @RequestMapping(value = "/student/gradeSearch",method = RequestMethod.POST)
    public String gradeSearch(@RequestParam("year") String year,
                               @RequestParam("semester") String semester,
                               HttpServletRequest request,
                               Model model){
        User user = (User)request.getSession().getAttribute("user");
        Student student = studentDao.selectStudentByUserId(user.getId());
        try {
            ConnectJWGL connectJWGL = new ConnectJWGL(student.getNumber(),student.getPassword());
            connectJWGL.init();
            if(connectJWGL.beginLogin()){
                List<Grade> grades = connectJWGL.getStudentGrade(Integer.parseInt(year),Integer.parseInt(semester));
                connectJWGL.logout();
                model.addAttribute("grades",grades);
            }else {
                model.addAttribute("notes","fail");
            }
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("notes","fail");
        }
        return "gradeSearch";
    }
}
