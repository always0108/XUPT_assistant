package XUPT_assistant.serviceImpl;

import XUPT_assistant.dao.SecretDao;
import XUPT_assistant.model.Secret;
import XUPT_assistant.service.SecretService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SecretServiceImpl implements SecretService {
    @Autowired
    private SecretDao secretDao;

    @Override
    public boolean addSecret(Secret secret){
        secretDao.addSecret(secret);
        return true;
    }

    @Override
    public List<Secret> getAllSecrets(){
        return secretDao.getAllSecrets();
    }

    @Override
    public List<Secret> getMySecrets(String username){
        return secretDao.getMySecrets(username);
    }

    @Override
    public boolean deleteSecretById(int id){
        secretDao.deleteSecretById(id);
        return true;
    }

    @Override
    public boolean updateSecretContent(String content,int id){
        secretDao.updateSecretContent(content,id);
        return true;
    }
}
