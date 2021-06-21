package com.beaver.service;

import com.beaver.bean.Account;
import org.springframework.stereotype.Service;


public interface MailService {

    void sendRegisterMail(Account account);

}
