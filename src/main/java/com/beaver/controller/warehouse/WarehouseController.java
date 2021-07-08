package com.beaver.controller.warehouse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ware")
public class WarehouseController {
//进入仓库中的齐套入库
    @RequestMapping("/complete-warehouse")
    public String completeWarehouse(){
        return "/admin/warehouse/complete-warehouse";
    }
    @RequestMapping("/warehourse-manage")
    public String warehourseManage(){
        return "/admin/warehouse/warehourse-manage";
    }





}
