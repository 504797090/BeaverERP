package com.beaver.controller;


import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.beaver.bean.Account;
import com.beaver.bean.to.JsonObject;
import com.beaver.service.AccountService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/account")
@Controller
public class AccountController {

    @Autowired  //注入service服务对象
    private AccountService accountService;

    @Autowired
    HttpServletRequest request;

    //添加单个用户
    @RequestMapping("/addOneAccount")
    @ResponseBody
    public JsonObject addOneUser(Account account) {
        int result = 0;
        result = accountService.addOneAccount(account);   //这个
        if (result == 1) {
            return new JsonObject(1, "添加成功");
        } else {
            return new JsonObject(2, "添加失败");
        }
    }

    @ResponseBody
    @RequestMapping("/userLogin")
    public int userLonin(Account account, String imgText) {
        String trueCode = (String) request.getSession().getAttribute("code");

        if (!imgText.equals(trueCode)) {
            return 3;
        } else {

            Account a = accountService.userLonin(account);
            if (a != null) {
                HttpSession sessoin = request.getSession();
                sessoin.setAttribute("bv_name", a.getBvName());
                sessoin.setAttribute("bv_department", a.getBvDepartment());
                sessoin.setAttribute("bv_password", a.getBvPassword());
                return 1;
            } else {
                return 0;
            }
        }


    }

    @RequestMapping("/getCode")
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {

        //HuTool定义图形验证码的长和宽,验证码的位数，干扰线的条数
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(116, 36, 4, 10);
        //将验证码放入session
        session.setAttribute("code", lineCaptcha.getCode());
        try {
            ServletOutputStream outputStream = response.getOutputStream();
            lineCaptcha.write(outputStream);
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ResponseBody
    @RequestMapping("/userIsLogin")
    public int checkUserIsLogin() {
        HttpSession session = request.getSession();
        String bv_name = (String) session.getAttribute("bv_name");
        if (!StringUtils.isEmpty(bv_name)) {
            System.out.println("不空");
            return 1;
        } else {
            return 0;
        }
    }

    @RequestMapping("/accountSkip")
    public String accountSkip() {
        return "main";
    }


}
