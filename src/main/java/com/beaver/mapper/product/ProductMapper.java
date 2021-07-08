package com.beaver.mapper.product;

import com.beaver.bean.product.Product;
import com.beaver.bean.vo.ProductChildNodeCustomer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {


    int addOneProduct(Product product);

    List<ProductChildNodeCustomer>  getAllProductList();
}
