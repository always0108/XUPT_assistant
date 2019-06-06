package XUPT_assistant.dao;

import XUPT_assistant.model.Secret;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SecretDao {
    @Insert("insert into secret(id,username,content,time) values(null,#{username},#{content},#{time})")
    void addSecret(Secret secret);

    @Select("select * from secret")
    List<Secret> getAllSecrets();

    @Select("select * from secret where username = #{username}")
    List<Secret> getMySecrets(String username);

    @Delete("delete from secret where id = #{id}")
    void deleteSecretById(int id);

    @Update("update secret set content = #{content} where id = #{id}")
    void uodateSecretContent(String content,int id);
}