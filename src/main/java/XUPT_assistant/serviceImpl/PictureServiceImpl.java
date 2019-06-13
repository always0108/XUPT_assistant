package XUPT_assistant.serviceImpl;

import XUPT_assistant.dao.PictureDAO;
import XUPT_assistant.model.Picture;
import XUPT_assistant.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PictureServiceImpl implements PictureService {
    @Autowired
    private PictureDAO pictureDAO;
    //获取图片
    public Picture getPictureById(Integer id){
        return pictureDAO.getPictureById(id);
    }

    //新增图片
    public boolean addPicture(Picture picture){
        pictureDAO.addPicture(picture);
        return true;
    }

    //删除图片
    public boolean deletePicture(Integer id){
        if(pictureDAO.getPictureById(id) == null){
            return false;
        }else {
            pictureDAO.deletePicture(id);
            return true;
        }
    }

    //更新图片信息
    public void updatePicture(Integer target_id ,Integer type,Integer id){
        pictureDAO.updatePicture(target_id,type,id);
    }
}
