package XUPT_assistant.dao;

import XUPT_assistant.model.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StudentDao {
    //根据id获取学生信息
    @Select("select * from student where id = #{id}")
    Student selectStudentById(Integer id);

    //根据学号获取学生信息
    @Select("select * from student where number = #{number}")
    Student selectStudentBySchoolNumber(String number);

    //新增学生
    @Insert("insert into student(user_id,name,number,sex,nation,password,college,specialty,clazz,entrollment_year,id_number,politics_status) " +
            "values (#{user_id},#{name},#{number},#{sex},#{nation},#{password},#{college},#{specialty},#{clazz},#{entrollment_year},#{id_number},#{politics_status})")
    void addStudent(Student student);

    //删除学生
    @Delete("delete from student where id = #{id}")
    void deleteStudentById(Integer id);
}
