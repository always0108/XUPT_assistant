package XUPT_assistant.serviceImpl;

import XUPT_assistant.dao.TransactionDao;
import XUPT_assistant.model.Page;
import XUPT_assistant.model.Transaction;
import XUPT_assistant.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    private TransactionDao transactionDao;

    @Override
    public void addTransaction(Transaction transaction) {
        transactionDao.addTransaction(transaction);
    }

    @Override
    public void deleteTransaction(int id){
        transactionDao.deleteTransaction(id);
    }

    @Override
    public void updateTransaction(Transaction transaction){
        transactionDao.updateTransaction(transaction);
    }

    @Override
    public List<Transaction> getAllTransaction(Page page){
        return transactionDao.getAllTransaction(page);
    }

    @Override
    public List<Transaction> getMyTransaction(int user_id,Page page){
        return transactionDao.getMyTransaction(user_id,page.getStart(),page.getPageSize());
    }
}
