package com.beaver.service.impl;

import com.beaver.bean.Supplier;
import com.beaver.mapper.SupplierMapper;
import com.beaver.service.SuppilerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class SupplierServiceImpl  implements SuppilerService {

    @Autowired
    private SupplierMapper supplierMapper;

    @Override
    public int addOneSupplier(Supplier supplier) {
        return supplierMapper.addOneSupplier(supplier);
    }

    @Override
    public List<Supplier> getAllSupplier() {
        return supplierMapper.getAllSupplier();
    }

    @Override
    public int deleteSupplier(int sId) {
        return supplierMapper.deleteSupplier(sId);
    }



    @Override
    public List<Map<Integer, String>> getAllSupplierIdName() {
        return supplierMapper.getAllSupplierIdName();
    }
}
