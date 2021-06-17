package com.beaver.service.impl;

import com.beaver.bean.Account;
import com.beaver.mapper.AccountMapper;
import com.beaver.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired  //注入Mapper接口代理对象
    private AccountMapper accountMapper;

    @Override
    public int addOneAccount(Account account) {
        System.out.println(account);  //这个怎么是空的Account(id=0, bvName=null, bvDepartment=0, bvPassword=null, bvQuanxian=0)
        return accountMapper.addOneAccount(account); //添加一个账户 mybatiss 好像
    }

    @Override
    public Account userLonin(Account account) {
        return accountMapper.userLonin(account);
    }

    @Override
    public int updateAccountPassword(Account account) {
        int a = accountMapper.updateAccountPassword(account);
        if (a > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public int deleteAccount(Account account) {
        int a = accountMapper.deleteAccount(account);
        if (a > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public List<Account> getAllStaff() {
        return accountMapper.getAllStaff();
    }

    @Override
    public Account findUserById(int id) {
        return accountMapper.findUserById(id);
    }
}
