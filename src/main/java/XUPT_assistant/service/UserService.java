package XUPT_assistant.service;

import XUPT_assistant.model.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    User findByUserName(String username);
    boolean addUser(User user);
    boolean updateUser(User user);
    boolean updatePassword(int id,String newPassword);
    boolean updateBindStatus(int id,Integer bind);
}
