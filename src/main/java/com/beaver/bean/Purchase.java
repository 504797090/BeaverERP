package com.beaver.bean;

import lombok.Data;


@Data
public class Purchase {

    private int pId;  //订单主键ID
//    private  int  id;  //账号表的主键ID

    private String sponsorUsername;
    private String sponsorDepartment;  //发起人  在session中

    private int sId;  //供应商id
//    @Value("${aaa.bbb.ccc:DefaultValue}")
    private String payTime1; //第一次付款时间
    private String payTime2;  //第二次付款时间
    private int rId;  //接收对象ID
    private String remark;  //备注
    private String data;  //采购日期
    private double totalPrices1; //第一次付款
    private double totalPrices2; //第二次付款
    private double realPrice;  //合同价格
    private String purchaseName; //订单名称
    private String  receptionName;
    private String receptionDepartment;
    private int mId;

    public Purchase() {
    }
}
