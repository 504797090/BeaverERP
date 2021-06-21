package com.beaver.service.impl;

import com.beaver.bean.Account;
import com.beaver.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Async
    @Override
    public void sendRegisterMail(Account account) {
        // 构建一个邮件对象
        SimpleMailMessage message = new SimpleMailMessage();
        String obj= "有新用户注册beaverERPSystem:"+"\r\n姓名:"+account.getBvName()+"\r\n部门:"+account.getBvDepartment();
        message.setSubject("有新用户注册beaverERPSystem,请及时查看"); // 设置邮件主题
        message.setFrom("beaver_lufeng@126.com"); // 设置邮件发送者，这个跟application.yml中设置的要一致
        // 设置邮件接收者，可以有多个接收者，中间用逗号隔开，以下类似
        // message.setTo("10*****16@qq.com","12****32*qq.com");
        message.setTo("504797090@qq.com");
//            // 设置邮件抄送人，可以有多个抄送人
//            message.setCc("12****32*qq.com");
//            // 设置隐秘抄送人，可以有多个
//            message.setBcc("7******9@qq.com");
        // 设置邮件发送日期
        message.setSentDate(new Date());
        message.setText(obj);      // 设置邮件的正文
        javaMailSender.send(message); // 发送邮件
    }
}
