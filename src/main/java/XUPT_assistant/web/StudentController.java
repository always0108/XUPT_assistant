package XUPT_assistant.web;

import XUPT_assistant.model.Course;
import XUPT_assistant.model.Grade;
import XUPT_assistant.model.Student;
import XUPT_assistant.model.User;
import XUPT_assistant.service.StudentService;
import XUPT_assistant.service.UserService;
import XUPT_assistant.utils.ConnectJWGL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@RequestMapping("/student")
@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/bind",method = RequestMethod.POST)
    @ResponseBody
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
                studentService.addStudent(student);
                connectJWGL.logout();
            }else {
                return "fail";
            }
        }catch (Exception e){
            return "fail";
        }
        user.setBind(1);
        userService.updateBindStatus(user.getId(),1);
        request.getSession().setAttribute("user",user);
        return "success";
    }

    @RequestMapping(value = "/unbind",method = RequestMethod.POST)
    @ResponseBody
    public String studentUnbind(HttpServletRequest request) {
        User user = (User)request.getSession().getAttribute("user");
        Integer student_id = studentService.selectStudentByUserId(user.getId()).getId();
        studentService.deleteStudentById(student_id);
        user.setBind(0);
        userService.updateBindStatus(user.getId(),0);
        request.getSession().setAttribute("user",user);
        return "success";
    }

    @RequestMapping(value = "/bind",method = RequestMethod.GET)
    public String bind(HttpServletRequest request,Model model){
        User user = (User)request.getSession().getAttribute("user");
        if(user.getBind() == 0){
            model.addAttribute("status",0);
            return "bind";
        }
        model.addAttribute("status",1);
        model.addAttribute("student",studentService.selectStudentByUserId(user.getId()));
        return "bind";
    }

    @RequestMapping(value = "/courseSearch",method = RequestMethod.GET)
    public String getCourseSearch(HttpServletRequest request,Model model){
        User user = (User)request.getSession().getAttribute("user");
        if(user.getBind() == 0){
            model.addAttribute("status",0);
            return "bind";
        }
        return "courseSearch";
    }

    @RequestMapping(value = "/gradeSearch",method = RequestMethod.GET)
    public String gradeSearch(HttpServletRequest request,Model model){
        User user = (User)request.getSession().getAttribute("user");
        if(user.getBind() == 0){
            model.addAttribute("status",0);
            return "bind";
        }
        return "gradeSearch";
    }



    @RequestMapping(value = "/courseSearch",method = RequestMethod.POST)
    public Object courseSearch(@RequestParam("year") String year,
                               @RequestParam("semester") String semester,
                               HttpServletRequest request,
                               Model model){
        User user = (User)request.getSession().getAttribute("user");
        Student student = studentService.selectStudentByUserId(user.getId());
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

    @RequestMapping(value = "/gradeSearch",method = RequestMethod.POST)
    public String gradeSearch(@RequestParam("year") String year,
                               @RequestParam("semester") String semester,
                               HttpServletRequest request,
                               Model model){
        User user = (User)request.getSession().getAttribute("user");
        Student student = studentService.selectStudentByUserId(user.getId());
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
