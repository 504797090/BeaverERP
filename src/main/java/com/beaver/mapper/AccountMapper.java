package com.beaver.mapper;

import com.beaver.bean.Account;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AccountMapper {

    int addOneAccount(Account account);    //添加一个账号
    Account userLonin(Account account);  //用户登录
    int updateAccountPassword(Account account); //更改账号密码
    int deleteAccount(Account account); //删除账号

    //得到所有账号
     List<Account> getAllStaff ();

     //根据账号主键查询这个账号
    Account findUserById(int id);



}
