package com.java.bean;

import lombok.Data;

@Data
public class Account {

    private  int id;  //账号表主键ID
    private String bvName;   //姓名
    private int bvDepartment; //部门表主键ID
    private String bvPassword; //密码
    private int bvquanxian; //权限表ID

    public Account() {
    }



}
