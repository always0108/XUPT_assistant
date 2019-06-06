package XUPT_assistant.service;

import XUPT_assistant.model.Secret;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SecretService {
    boolean addSecret(Secret secret);
    List<Secret> getAllSecrets();
    List<Secret> getMySecrets(String username);
    boolean deleteSecretById(int id);
    boolean updateSecretContent(String content,int id);
}
