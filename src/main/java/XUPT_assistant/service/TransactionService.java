package XUPT_assistant.service;

import XUPT_assistant.model.Page;
import XUPT_assistant.model.Transaction;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TransactionService {
    void addTransaction(Transaction transaction);
    void deleteTransaction(int id);
    void updateTransaction(Transaction transaction);
    List<Transaction> getAllTransaction(Page page);
    List<Transaction> getMyTransaction(int user_id,Page page);
}
