package com.java.bean;

import lombok.Data;

@Data
public class Supplier {

    private int s_id;//供应商表主键ID
    private String  company_name;//供应商名称
    private String linkman;//联系人
    private String telphone; //联系人手机号

    public Supplier() {
    }


}
