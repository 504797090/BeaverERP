package com.java.bean;

public class Material {

    private  int m_id; //物料表主键ID
    private String material;//物料名称
    private String type;// 物料种类
    private double price;//物料价格
    private int s_id;// 供应商表主键ID
    private double inventory;//库存

    public Material() {
    }

    public Material(int m_id, String material, String type, double price, int s_id, double inventory) {
        this.m_id = m_id;
        this.material = material;
        this.type = type;
        this.price = price;
        this.s_id = s_id;
        this.inventory = inventory;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public double getInventory() {
        return inventory;
    }

    public void setInventory(double inventory) {
        this.inventory = inventory;
    }
}
