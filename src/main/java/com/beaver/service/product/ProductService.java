package com.beaver.service.product;

import com.beaver.bean.product.Product;
import com.beaver.bean.vo.ProductChildNodeCustomer;

import java.util.List;

public interface ProductService {

    int addOneProduct(Product product);

    List<ProductChildNodeCustomer> getAllProductList();
}
