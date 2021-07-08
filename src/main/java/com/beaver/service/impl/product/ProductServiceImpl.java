package com.beaver.service.impl.product;

import com.beaver.bean.product.Product;
import com.beaver.bean.vo.ProductChildNodeCustomer;
import com.beaver.mapper.product.ProductMapper;
import com.beaver.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public int addOneProduct(Product product) {
        return productMapper.addOneProduct(product);
    }

    @Override
    public List<ProductChildNodeCustomer> getAllProductList() {
        return productMapper.getAllProductList();
    }
}
