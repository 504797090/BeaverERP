package com.beaver.bean;

import lombok.Data;

@Data
public class Reception {

    private  int rId; //物料接收表主键ID
    private  int id;//员工表主键ID
    private  int mId;  //物料表ID

    public Reception() {
    }
}
