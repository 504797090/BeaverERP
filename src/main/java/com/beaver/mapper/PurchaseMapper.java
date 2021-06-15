package com.beaver.mapper;


import com.beaver.bean.Purchase;
import com.beaver.bean.vo.PurchaseAccountSupplierMaterial;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PurchaseMapper {

    List<PurchaseAccountSupplierMaterial> getAllPurchase();

    int addtOnePurchase(Purchase purchase);

    int updatePurchasFromTable(Purchase purchase);

    int deletePurchase(int pid);
}
