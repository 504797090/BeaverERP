package com.java.controller;


import com.java.bean.Account;
import com.java.bean.to.JsonObject;
import com.java.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/account")
@RestController
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/user-add")
    public String addUser() {
        return "user/user-add";
    }

    //添加单个用户
    @RequestMapping("/addOneAccount")
    @ResponseBody
    public JsonObject addOneUser(Account account) {
        System.out.println(account);
       int result =     accountService.addOneAccount(account);
        System.out.println(result);
       if(result==1){
           return new JsonObject(1, "添加成功");
       }else{
           return new JsonObject(2, "添加失败");
       }
    }


}
