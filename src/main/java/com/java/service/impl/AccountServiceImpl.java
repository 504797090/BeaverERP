package com.java.service.impl;

import com.java.bean.Account;
import com.java.mapper.AccountMapper;
import com.java.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Override
    public int addOneAccount(Account account) {
        System.out.println(account);
       int a  =  accountMapper.addOneAccount(account);

        System.out.println(a);
       if(a>0){
           return 1 ;
       }else{
           return 0;
       }
    }

    @Override
    public Account userLonin(Account account) {
        return accountMapper.userLonin(account);
    }

    @Override
    public int updateAccountPassword(Account account) {
       int a=  accountMapper.updateAccountPassword(account);
        if(a>0){
            return 1 ;
        }else{
            return 0;
        }
    }
    @Override
    public int deleteAccount(Account account) {
        int a = accountMapper.deleteAccount(account);
        if(a>0){
            return 1 ;
        }else{
            return 0;
        }
    }
}
