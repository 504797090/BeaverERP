package com.beaver.service.customer;

import com.beaver.bean.customer.Customer;
import com.beaver.bean.customer.jsonTree.ChildNode;

import java.util.List;
import java.util.Map;

public interface CustomerService {

    int addOneCustomer(Customer customer);

    List<Customer> findAllCustomer();

    List<ChildNode>  getAllNode();

    int addOneNode(ChildNode childNode);

    int  findNodeMax();


    int deleteNode(int id);

    int getBrotherId(int id);

    List<Map<Integer,String>> getAllIdCustomer();
}
