package com.beaver.service.impl.customer;

import com.beaver.bean.customer.Trade;
import com.beaver.mapper.customer.TradeMapper;
import com.beaver.service.customer.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TradeServiceImpl implements TradeService {
    @Autowired
    private TradeMapper tradeMapper;
    @Override
    public int addFirstTrade(String first) {
        return tradeMapper.addFirstTrade(first);
    }

    @Override
    public List<Map<Integer, String>> getAllFirstIdTrade() {
        return tradeMapper.getAllFirstIdTrade();
    }

    @Override
    public int addSecondTrade(Trade trade) {
        return tradeMapper.addSecondTrade(trade);
    }

    @Override
    public int deleteTrade(Trade trade) {
        return tradeMapper.deleteTrade(trade);
    }

    @Override
    public int updateTrade(Trade trade) {
        return tradeMapper.updateTrade(trade);
    }

    @Override
    public List<Trade> findAllTrade() {
        return tradeMapper.findAllTrade();
    }

    @Override
    public int verifyRepeat(String tradeName) {
        return tradeMapper.verifyRepeat(tradeName);
    }

    @Override
    public List<Map<Integer, String>> getAllSecondIdTrade() {
        return tradeMapper.getAllSecondIdTrade();
    }
}
