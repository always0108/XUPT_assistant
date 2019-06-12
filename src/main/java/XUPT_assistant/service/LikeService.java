package XUPT_assistant.service;

import org.springframework.stereotype.Service;

@Service
public interface LikeService {
    void addLike(int user_id,int secret_id);
    void deleteLike(int user_id,int secret_id);
    int getCount(int secret_id);
    boolean isExist(int user_id,int secret_id);
}
