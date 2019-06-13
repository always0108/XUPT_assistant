package XUPT_assistant.dao;

import XUPT_assistant.model.Like;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDao {
    @Insert("Insert into likenum(user_id,secret_id) values(#{user_id},#{secret_id})")
    void addLike(@Param("user_id") int user_id,@Param("secret_id") int secret_id);

    @Delete("delete from likenum where user_id = #{user_id} and secret_id = #{secret_id}")
    void deleteLike(@Param("user_id") int user_id,@Param("secret_id") int secret_id);

    @Select("select count(*) from likenum where secret_id = #{secret_id}")
    int getCount(int secret_id);

    @Select("select * from likenum where user_id = #{user_id} and secret_id = #{secret_id}")
    Like getLike(@Param("user_id") int user_id, @Param("secret_id") int secret_id);

}
