package com.beaver.bean.product;


import lombok.Data;

@Data
public class Product {

    private String pId;
    private String cId;
    private String countryCode;
    private String postalCode;
    private String projectTime;
    private String productSerialNumber;  //产品序列
    private String state;
    private String productType; //产品类型



}
