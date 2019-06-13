package XUPT_assistant.service;


import XUPT_assistant.model.Picture;

import java.util.List;

public interface PictureService {
    //获取文件
    Picture getPictureById(Integer id);

    //新增文件
    boolean addPicture(Picture picture);

    //删除文件
    boolean deletePicture(Integer id);

    //更新图片信息
    void updatePicture(Integer target_id ,Integer type,Integer id);

    //根据交易id和type获取图片
    List<Integer> getPictureByTargetId(Integer target_id, Integer type);
}
