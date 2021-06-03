package com.java.bean;

import lombok.Data;

@Data
public class Reception {

    private  int r_id; //物料接收表主键ID
    private  int id;//员工表主键ID
    private  int m_id;  //物料表ID

    public Reception() {
    }
}
