package com.beaver.bean.customer.jsonTree;


import lombok.Data;


@Data
public class ChildNode {

    private int number;
    private int id;
    private String name;
    private String description;
    private String parentId;


//    public ChildNode(int id, String name, String description, String parentId) {
//        this.id = id;
//        this.name = name;
//        this.description = description;
//        this.parentId = parentId;
//    }

    public ChildNode(int number, int id, String name, String description, String parentId) {
        this.number = number;
        this.id = id;
        this.name = name;
        this.description = description;
        this.parentId = parentId;
    }

}



