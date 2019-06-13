package XUPT_assistant.dao;

import XUPT_assistant.model.Page;
import XUPT_assistant.model.Transaction;
import org.apache.ibatis.annotations.*;
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
    @Update("update transaction set id = #{id},user_id = #{user_id},name = #{name},price = #{price} , information = #{information} ," +
            "phone = #{phone},seller = #{seller},status = #{status} where id = #{id}")
    void updateTransaction(Transaction transaction);

    //查询所有物品交易信息
    @Select("select * from transaction where status = 0 limit #{start} , #{pageSize}")
    List<Transaction> getAllTransaction(Page page);

    //查询个人物品交易信息
    @Select("select * from transaction where user_id = #{user_id} limit #{start} , #{pageSize}")
    List<Transaction> getMyTransaction(@Param("user_id") int user_id,@Param("start")int start,@Param("pageSize")int pageSize);
}
