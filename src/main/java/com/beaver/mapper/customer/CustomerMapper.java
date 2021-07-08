package com.beaver.mapper.customer;


import com.beaver.bean.customer.Customer;
import com.beaver.bean.customer.jsonTree.ChildNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CustomerMapper {

    int addOneCustomer(Customer customer);

    List<Customer>  findAllCustomer();

    List<ChildNode>  getAllNode();

    int addOneNode(ChildNode childNode);

//    查找最大值
    int  findNodeMax();
//    根据id 删除
    int deleteNode(int id);

    int getBrotherId(int id);


    List<Map<Integer,String>> getAllIdCustomer();
}
