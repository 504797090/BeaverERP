package com.beaver.controller.customer;

import com.alibaba.fastjson.JSON;
import com.beaver.bean.customer.Trade;
import com.beaver.service.customer.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("/trade")
public class TradeController {
    @RequestMapping("/trade-manage")
    public String intoTradeManage() {
        return "admin/customer/trade/trade-manage";
    }
    @Autowired
    private TradeService tradeService;

    @RequestMapping("/findAllTrade")
    @ResponseBody
    public List<Trade> findAllTrade() {
        return tradeService.findAllTrade();
    }

    @RequestMapping("/getAllFirstIdTrade")
    @ResponseBody
    public String getAllFirstIdTrade() {
        return JSON.toJSONString(tradeService.getAllFirstIdTrade());
    }

    @RequestMapping("/saveTrade")
    @ResponseBody
    public int saveTrade(Trade trade) {
        System.out.println(trade.getTradeName());
        int i = tradeService.verifyRepeat(trade.getTradeName());
        if (i==1){
            return 3;
        }
        System.out.println(111);
        if (trade.getTradeLevel() == 1) {
            return tradeService.addFirstTrade(trade.getTradeName());
        } else {

            return tradeService.addSecondTrade(trade);
        }


    }

    @RequestMapping("/allTrade")
    @ResponseBody
    public List<Trade> allTrade() {
        return tradeService.findAllTrade();
    }


    @RequestMapping("/deleteTrade")
    @ResponseBody
    public int  deleteTrade(Trade trade) {
        return tradeService.deleteTrade(trade);
    }
    @RequestMapping("/getAllSecondIdTrade")
    @ResponseBody
    public String getAllSecondIdTrade() {
        return JSON.toJSONString(tradeService.getAllSecondIdTrade());
    }

}
