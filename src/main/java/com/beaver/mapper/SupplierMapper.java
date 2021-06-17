package com.beaver.mapper;


import com.beaver.bean.Supplier;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SupplierMapper {


    int addOneSupplier(Supplier supplier);

    List<Supplier> getAllSupplier();

    int deleteSupplier(int sId);

    List<Map<Integer, String>> getAllSupplierIdName();


}
