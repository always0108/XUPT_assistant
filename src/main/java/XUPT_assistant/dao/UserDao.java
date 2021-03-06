package XUPT_assistant.dao;

import XUPT_assistant.model.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserDao {

    @Select("select * from user where name = #{username}")
    User findByUserName(String username);

    @Insert("insert into user(id,name,password,bind) values(null,#{name},#{password},0)")
    void addUser(User user);

    @Update("update user set name = #{name},sex = #{sex} , " +
            "phone = #{phone} , intro = #{intro} where id = #{id}")
    void updateUser(User user);

    //修改密码
    @Update("update user set password = #{newPassword} where id = #{id}")
    void updatePassword(@Param("id") int id,@Param("newPassword") String newPassword);

    //修改绑定状态
    @Update("update user set bind = #{bind} where id = #{id}")
    void updateBindStatus(@Param("id") int id,@Param("bind") Integer bind);
}
