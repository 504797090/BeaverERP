package com.beaver.bean.vo;

import lombok.Data;

@Data
public class ProductChildNodeCustomer {
//产品
    private String pId;
    private String cId;
    private String countryCode;
    private String postalCode;
    private String projectTime;
    private String productSerialNumber;  //产品序列
    private String state;
    private String productType; //产品类型
//子节点
    private int number;
    private int id;
    private String name;
    private String description;
    private String parentId;
//    客户
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
}
