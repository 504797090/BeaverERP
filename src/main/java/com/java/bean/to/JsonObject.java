package com.java.bean.to;

import lombok.Data;

@Data
public class JsonObject {

    private Integer status;//状态码,1表示成功,2表示失败
    private String msg;//返回信息
    private Object data;// 返回的数据111


    public JsonObject() {
    }

    public JsonObject(Integer status, String msg) {
        this.status = status;
        this.msg = msg;
    }
}
