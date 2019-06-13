package XUPT_assistant.dao;

import XUPT_assistant.model.Picture;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface PictureDAO {
    //获取图片
    @Select("select * from picture where id = #{id}")
    Picture getPictureById(Integer id);

    //新增图片
    @Insert("insert into picture(name,image) values " +
            "(#{name},#{image})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
    void addPicture(Picture picture);

    //删除图片
    @Delete("delete from picture where id = #{id}")
    void deletePicture(Integer id);

    //更新图片信息
    @Update("update picture set target_id = #{target_id} , type = #{type} where id = #{id}")
    void updatePicture(@Param("target_id")Integer target_id ,
                       @Param("type")Integer type,
                       @Param("id") Integer id);
}
