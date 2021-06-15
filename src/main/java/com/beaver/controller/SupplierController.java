package com.beaver.controller;


import com.alibaba.fastjson.JSON;
import com.beaver.bean.Supplier;
import com.beaver.service.SuppilerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//供应商
@RequestMapping("/supplier")
@Controller
public class SupplierController {

    @Autowired
    private SuppilerService suppilerService;

    @RequestMapping("/getAllSupplier")
    @ResponseBody
    public List<Supplier> getAllSupplier( ) {
        return suppilerService.getAllSupplier();
    }

    @RequestMapping("/addSupplier")
    @ResponseBody
    public int  addSupplier( Supplier supplier) {
        System.out.println(supplier);
        int result = 0;
        result = suppilerService.addOneSupplier(supplier);
        return  result;
    }

    @RequestMapping("/deleteSupplier")
    @ResponseBody
    public int  deleteSupplier(  String sid) {
        System.out.println(sid);
        int result = 0;
        result = suppilerService.deleteSupplier(Integer.parseInt(sid));

        System.out.println(result);
        return  result;
    }


    @RequestMapping("/getAllSupplierIdName")
    @ResponseBody
    public String  getAllSupplierIdName(){
        return  JSON.toJSONString(suppilerService.getAllSupplierIdName());
    }


}
