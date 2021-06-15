package com.beaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/beaver")
@Controller
public class MainController {

    //添加单个用户
    @RequestMapping("/old")
    public String login() {
        return "index";
    }
    @RequestMapping("/new")
    public String newPage() {
        return "index_admin";
    }

}
