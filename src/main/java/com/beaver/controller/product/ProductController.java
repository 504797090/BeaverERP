package com.beaver.controller.product;


import com.beaver.bean.customer.Customer;
import com.beaver.bean.product.Product;
import com.beaver.bean.vo.ProductChildNodeCustomer;
import com.beaver.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/intoProductIndex")
    public String intoProductIndex() {
        return "/admin/product/product";
    }

    @RequestMapping("/modify-product")
    public String modifyProduct() {
        return "/admin/product/modify-product";
    }

    @RequestMapping("/new-product")
    public String newProduct() {
        return "/admin/product/new-product";
    }

    @RequestMapping("/query-product")
    public String queryProduct() {
        return "/admin/product/query-product";
    }

    @RequestMapping("/ops-product")
    public String opsProduct() {
        return "/admin/product/ops-product";
    }


    @RequestMapping("/addOneProduct")
    @ResponseBody
    public int addOneProduct(Product product) {
        return productService.addOneProduct(product);
    }

    @RequestMapping("/findAllProduct")
    @ResponseBody
    public List<ProductChildNodeCustomer> findAllProduct() {

        return productService.getAllProductList();
    }

}
