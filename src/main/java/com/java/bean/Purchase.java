package com.java.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Purchase {

    private  int p_id;  //订单主键ID
    private  int  id;  //账号表的主键ID
    private int s_id;  //供应商id
    private Date pay_time1; //第一次付款时间
    private Date pay_time2;  //第二次付款时间
    private int r_id;  //接收对象ID
    private String remark;  //备注
    private Date data;  //采购日期
    private double total_prices1; //第一次付款
    private double total_prices2; //第二次付款
    private double real_price;  //合同价格

    public Purchase() {
    }
}
