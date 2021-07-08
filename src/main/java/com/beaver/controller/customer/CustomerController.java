package com.beaver.controller.customer;

import com.alibaba.fastjson.JSON;
import com.beaver.bean.customer.Customer;
import com.beaver.bean.customer.jsonTree.ChildNode;
import com.beaver.bean.customer.jsonTree.MainJson;
import com.beaver.service.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.applet.Main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/new-customer")
    public String newCustomer() {
        return "/admin/customer/new-customer";
    }

    @RequestMapping("/customer-index")
    public String customer() {
        return "/admin/customer/customer";
    }

    @RequestMapping("/edit-customer")
    public String editCustomer() {
        return "/admin/customer/edit-customer";
    }

    @RequestMapping("/query-customer")
    public String queryCustomer() {
        return "/admin/customer/query-customer";
    }


    @RequestMapping("/addOneCustomer")
    @ResponseBody
    public int addOneCustomer(Customer customer) {
        return customerService.addOneCustomer(customer);
    }

    @RequestMapping("/findAllCustomer")
    @ResponseBody
    public List<Customer> findAllCustomer() {
        return customerService.findAllCustomer();
    }


    //    tree framework
    @RequestMapping("/returnTreeFramework")
    @ResponseBody
    public String returnTreeFramework() {

        ArrayList<ChildNode> a = new ArrayList<>();

//        a.add(new ChildNode("1", "一级目录", "这是一个描述", null));
//        a.add(new ChildNode("11", "12", "这是一个描述", "1"));
//        a.add(new ChildNode("111", "12", "这是一个描述", "11"));
//        a.add(new ChildNode("2", "一级目录2", "这是一个描述", null));
//        a.add(new ChildNode("22", "12", "这是一个描述", "2"));
//        a.add(new ChildNode("23", "12", "这是一个描述", "2"));
//        a.add(new ChildNode("233", "12", "这是一个描述", "23"));
//        a.add(new ChildNode("2333", "12", "这是一个描述_sub2_sub2_sub2", "233"));
//        a.add(new ChildNode("23333", "12", "这是一个描述_sub2_sub2_sub2", "233"));
//        a.add(new ChildNode("233333", "12", "这是一个描述_sub2_sub2_sub2", "233"));
//        a.add(new ChildNode("24", "12", "这是一个描述_sub2_sub2_sub2", "2"));
//
//        a.add(new ChildNode("3", "一级目录3", "做一个三级目录", null));
//        a.add(new ChildNode("33", "12", "这是一个描述", "3"));
//        a.add(new ChildNode("33", "12", "这是一个描述", "3"));
//        a.add(new ChildNode("33", "12", "这是一个描述", "3"));
//
//        a.add(new ChildNode("4", "一级目录4", "做一个第四个目录", null));
//        a.add(new ChildNode("44", "12", "这是一个描述", "4"));
//        a.add(new ChildNode("44", "12", "这是一个描述", "4"));
//        a.add(new ChildNode("44", "12", "这是一个描述", "4"));
        MainJson mainJson = new MainJson(3, customerService.getAllNode());

        return JSON.toJSONString(mainJson);
    }


    @RequestMapping("/addOneNode")
    @ResponseBody
    public int addOneNode(ChildNode childNode) {

        System.out.println(childNode);
        if (childNode.getId() == 0) {   //父节点
            System.out.println("进入111");
            int id = customerService.findNodeMax();
            childNode.setId(id);
            customerService.addOneNode(childNode);
        } else {

            //            这里要查这个节点  下面   是否 已经有其他的节点 然后和他们设置的一样
            int idHadBrotherId = customerService.getBrotherId(childNode.getId());
            System.out.println("idHadBrotherId" +idHadBrotherId);

            int id = childNode.getId();   //父节点ID
            String id1 = id + "";

              id1 =id1+ "1";
            //新的id
            id = Integer.parseInt(id1);

            if (idHadBrotherId  != 0  ){
                childNode.setId(idHadBrotherId);
            }else{
                childNode.setId(id);
            }


           customerService.addOneNode(childNode);
        }

        return 1;
    }


    @RequestMapping("/deleteNode")
    @ResponseBody
    public int deleteNode(int id) {

        return customerService.deleteNode(id);
    }


    //公司/ID  用于select
    @RequestMapping("/allIdCustomer")
    @ResponseBody
    public  String getAllIdCustomer() {
        return JSON.toJSONString(customerService.getAllIdCustomer());
    }


}
