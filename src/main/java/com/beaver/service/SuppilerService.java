package com.beaver.service;

import com.beaver.bean.Supplier;

import java.util.List;
import java.util.Map;


public interface SuppilerService {
    int addOneSupplier(Supplier supplier);

    List<Supplier> getAllSupplier();

    int deleteSupplier(int sId);

    List<Map<Integer, String>> getAllSupplierIdName();
}
