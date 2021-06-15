package com.beaver.bean;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Material {

    @Id
    private  int mId; //物料表主键ID
    private String material;//物料名称
    private String type;// 物料种类
    private double price;//物料价格
    private int sId;// 供应商表主键ID
    private double inventory;//库存

    private double   amount; //物料数量

    public Material() {
    }


}
