package XUPT_assistant.serviceImpl;

import XUPT_assistant.dao.StudentDao;
import XUPT_assistant.model.Student;
import XUPT_assistant.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("StudedntService")
public class StudentImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;

    //根据user_id获取学生信息
    public Student selectStudentUserById(Integer user_id){
        return studentDao.selectStudentByUserId(user_id);
    }

    //根据学号获取学生信息
    public Student selectStudentBySchoolNumber(String number){
        return studentDao.selectStudentBySchoolNumber(number);
    }

    //新增学生
    public void addStudent(Student student){
        studentDao.addStudent(student);
    }

    //删除学生
    public void deleteStudentById(Integer id){
        studentDao.deleteStudentById(id);
    }
}
