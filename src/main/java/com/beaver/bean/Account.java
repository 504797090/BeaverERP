package com.beaver.bean;

import lombok.Data;

@Data
public class Account {

    private int id;  //账号表主键ID
    private String bvName;   //姓名
    private String bvDepartment; //部门表主键ID
    private String bvPassword; //密码
    private String bvQuanxian; //权限表ID
    private String mail;
    private int usable;  //初始不可用


    public Account() {
    }

}
