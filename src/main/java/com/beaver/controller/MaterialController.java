package com.beaver.controller;

import com.beaver.bean.Material;
import com.beaver.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/material")
@RestController
public class MaterialController {

    @Autowired
    private MaterialService  materialService;

    @RequestMapping("/addOneMaterial")
    @ResponseBody
    public int addOneMaterial(Material material) {

        System.out.println("进入addOneMaterial");
        return  materialService.addOneMaterial(material);
    }




}
