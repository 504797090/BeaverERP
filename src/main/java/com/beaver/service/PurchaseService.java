package com.beaver.service;

import com.beaver.bean.Purchase;
import com.beaver.bean.vo.PurchaseAccountSupplierMaterial;

import java.util.List;
public interface PurchaseService {

    List<PurchaseAccountSupplierMaterial> getAllPurchase();

     int addtOnePurchase(Purchase purchase);

    int  updatePurchasFromTable(Purchase purchase);

    int deletePurchase(int pid);
}
