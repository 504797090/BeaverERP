package com.beaver.bean.customer.jsonTree;


import lombok.Data;

import java.util.List;

@Data
public class MainJson {

    private  int total;
    private List<ChildNode> rows;


    public MainJson(int total, List<ChildNode> rows) {
        this.total = total;
        this.rows = rows;
    }
}
