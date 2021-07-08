package com.beaver.bean.customer;


import lombok.Data;

@Data
public class Customer {
    private int cId;
    private int tradeId;
    private String companyName;
    private String companyAttributes;
    private String companyAddress;
    private String companyResponsible;
    private String responsiblePhone;
    private String responsibleWechat;
    private String responsibleMail;
    private String linkmanName;
    private String linkmanPhone;
    private String linkmanWechat;
    private String linkmanMail;
    private String operatorName;
    private String operatorPhone;
    private String operatorWechat;
    private String operatorMail;


    //映射
    private String  tradeName;
}
