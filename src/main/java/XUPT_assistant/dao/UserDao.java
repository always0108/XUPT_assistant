package XUPT_assistant.dao;

import XUPT_assistant.model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserDao {

    @Select("select * from user where name = #{username}")
    User findByUserName(String username);

    @Insert("insert into user(id,name,password) values(null,#{name},#{password})")
    void addUser(User user);
}
