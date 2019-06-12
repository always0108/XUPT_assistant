package XUPT_assistant.serviceImpl;

import XUPT_assistant.dao.UserDao;
import XUPT_assistant.model.User;
import XUPT_assistant.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User findByUserName(String username){
        return userDao.findByUserName(username);
    }

    @Override
    public boolean addUser(User user){
        userDao.addUser(user);
        return true;
    }

    @Override
    public boolean updateUser(User user){
        userDao.updateUser(user);
        return true;
    }
}
