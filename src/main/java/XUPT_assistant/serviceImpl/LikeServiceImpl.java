package XUPT_assistant.serviceImpl;

import XUPT_assistant.dao.LikeDao;
import XUPT_assistant.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeServiceImpl implements LikeService {
    @Autowired
    private LikeDao likeDao;

    @Override
    public void addLike(int user_id, int secret_id) {
        likeDao.addLike(user_id,secret_id);
    }

    @Override
    public void deleteLike(int user_id, int secret_id) {
        likeDao.deleteLike(user_id,secret_id);
    }

    @Override
    public int getCount(int secret_id) {
        return likeDao.getCount(secret_id);
    }

    @Override
    public boolean isExist(int user_id, int secret_id) {
        if(isExist(user_id,secret_id)){
            return true;
        }else {
            return false;
        }
    }
}
