package com.beaver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/beaver")
@Controller
public class MainController {


    @RequestMapping("/old")
    public String login() {
        return "index";
    }

    @RequestMapping("/login")
    public String newPage() {
        return "index";
    }

}
