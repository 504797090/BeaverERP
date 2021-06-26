package com.beaver.config;

import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//@Configuration
public class RabbitMqConfiguration {
    //1.声明fanout模式的交换机

    @Bean
    public FanoutExchange fanoutExchange() {
        return new FanoutExchange("fanout_order_exchange", true, false);
    }

    //2 队列声明
    @Bean
    public Queue smsQueue() {
        return new Queue("sms.fanout.queue", true);
    }
    //3完成绑定关系

}
