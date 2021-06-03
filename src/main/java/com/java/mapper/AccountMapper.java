package com.java.mapper;

import com.java.bean.Account;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface AccountMapper {

    int addOneAccount(Account account);    //添加一个账号
    Account userLonin(Account account);  //用户登录
    int updateAccountPassword(Account account); //更改账号密码
    int deleteAccount(Account account); //删除账号


}
