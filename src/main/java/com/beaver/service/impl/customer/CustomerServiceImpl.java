package com.beaver.service.impl.customer;

import com.beaver.bean.customer.Customer;
import com.beaver.bean.customer.jsonTree.ChildNode;
import com.beaver.mapper.customer.CustomerMapper;
import com.beaver.service.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public int addOneCustomer(Customer customer) {
        return customerMapper.addOneCustomer(customer);
    }

    @Override
    public List<Customer> findAllCustomer() {
        return customerMapper.findAllCustomer();
    }

    @Override
    public List<ChildNode> getAllNode() {
        return customerMapper.getAllNode();
    }

    @Override
    public int addOneNode(ChildNode childNode) {
        return customerMapper.addOneNode(childNode);
    }

    @Override
    public int findNodeMax() {
        return customerMapper.findNodeMax();
    }

    @Override
    public int deleteNode(int id) {
        return customerMapper.deleteNode(id);
    }

    @Override
    public int getBrotherId(int id) {
        return customerMapper.getBrotherId(id);
    }

    @Override
    public List<Map<Integer, String>> getAllIdCustomer() {

        return customerMapper.getAllIdCustomer();
    }


}
