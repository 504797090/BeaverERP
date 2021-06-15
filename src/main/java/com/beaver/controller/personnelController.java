package com.beaver.controller;

import com.beaver.bean.Account;
import com.beaver.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/personnel")
@Controller
public class personnelController {
    @Autowired
    private AccountService accountService;

    // 正在测试  正在大同
    @RequestMapping("/simple-check")
    public String projectPurchasing() {
        return "/admin/personnel/simple-check";
    }


    @RequestMapping("/getAllStaff")
    @ResponseBody
    public List<Account> getAllStaff(){
        return  accountService.getAllStaff();
    }

    @RequestMapping("/deleteOneStaff")
    @ResponseBody
    public int  deleteOneStaff(Account account){
      return   accountService.deleteAccount(account);
    }
    @RequestMapping("/getOneStaffById")
    @ResponseBody
    public Account  getOneStaffById(int id){
       return accountService.findUserById(id);

    }

}
