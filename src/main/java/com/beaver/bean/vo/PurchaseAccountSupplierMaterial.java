package com.beaver.bean.vo;

import lombok.Data;

import java.util.Date;

@Data
public class PurchaseAccountSupplierMaterial {

    //物料表
    private  int mId; //物料表主键ID
    private String material;//物料名称
    private String type;// 物料种类
    private double price;//物料价格
//    private int sId;// 供应商表主键ID
    private double inventory;//库存
    private double   amount; //物料数量

    //账号表
    private  int id;  //账号表主键ID
    private String bvName;   //姓名
    private int bvDepartment; //部门表主键ID
    private String bvPassword; //密码
    private int bvQuanxian; //权限表ID

    //供应商
    private int sId;//供应商表主键ID
    private String  companyName;//供应商名称
    private String linkman;//联系人
    private String telphone; //联系人手机号

    //订单表
    private  int pId;  //订单主键ID
//    private  int  id;  //账号表的主键ID
//    private int sId;  //供应商id
    private String sponsorUsername;  //发起人信息
    private String sponsorDepartment;
    private String payTime1; //第一次付款时间
    private String payTime2;  //第二次付款时间
    private int rId;  //接收对象ID
    private String remark;  //备注
    private Date data;  //采购日期
    private double totalPrices1; //第一次付款
    private double totalPrices2; //第二次付款
    private double realPrice;  //合同价格
    private String purchaseName; //订单名称

    private String  receptionName;
    private String receptionDepartment;

    public PurchaseAccountSupplierMaterial() {
    }
}
