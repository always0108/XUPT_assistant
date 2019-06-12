package XUPT_assistant.dao;

import XUPT_assistant.model.Transaction;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionDao {
    //增加物品交易
    @Insert("insert into transaction (name,user_id,price,information,seller," +
            "phone,status) values(#{name},#{user_id},#{price},#{information},#{seller}," +
            "#{phone},#{status})")
    void addTransaction(Transaction transaction);

    //删除物品交易
    @Delete("delete from transaction where id = #{id}")
    void deleteTransaction(int id);

    //修改物品交易
    @Update("update transaction set name = #{name},price = #{price} , information = #{information} ," +
            "phone = #{phone},status = #{status} where id = #{id}")
    void updateTransaction(Transaction transaction);

    //查询所有物品交易信息
    @Select("select * from transaction where status = 0")
    List<Transaction> getAllTransaction();

    //查询个人物品交易信息
    @Select("select * from transaction where user_id = #{user_id}")
    List<Transaction> getMyTransaction(int user_id);
}
