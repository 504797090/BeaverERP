package com.beaver.service.impl;

import com.beaver.bean.Purchase;
import com.beaver.bean.vo.PurchaseAccountSupplierMaterial;
import com.beaver.mapper.PurchaseMapper;
import com.beaver.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PurceaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Override
    public List<PurchaseAccountSupplierMaterial> getAllPurchase() {
        return purchaseMapper.getAllPurchase();
    }

    @Override
    public int addtOnePurchase(Purchase purchase) {
        return purchaseMapper.addtOnePurchase(purchase);

    }

    @Override
    public int updatePurchasFromTable(Purchase purchase) {
        return purchaseMapper.updatePurchasFromTable(purchase);
    }

    @Override
    public int deletePurchase(int pid) {
        return purchaseMapper.deletePurchase(pid);
    }


}
