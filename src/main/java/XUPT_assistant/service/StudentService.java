package XUPT_assistant.service;

import XUPT_assistant.model.Student;

public interface StudentService {
    //根据user_id获取学生信息
    Student selectStudentUserById(Integer user_id);

    //根据学号获取学生信息
    Student selectStudentBySchoolNumber(String number);

    //新增学生
    void addStudent(Student student);

    //删除学生
    void deleteStudentById(Integer id);
}
