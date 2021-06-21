package com.beaver.service;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class OrderService {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    //模拟用户下单
    public void makeOrder(String  userid, String productid,int num){
//1根据上变频ID查询商品是否充足
        //2保存订单
        //通过MQ完成消息分发
        //参数1 交换机 参数2路由key/quene队列名称 参数3 消息本体
        String exchangeName = "fanout_order_exchange";
        String routingkey = "";
        String orderid = UUID.randomUUID().toString();
        rabbitTemplate.convertAndSend(exchangeName,routingkey,orderid);
    }
}
