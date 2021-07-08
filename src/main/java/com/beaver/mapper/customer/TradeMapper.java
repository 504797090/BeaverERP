package com.beaver.mapper.customer;


import com.beaver.bean.customer.Trade;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TradeMapper {

    //    添加一级菜单
    int addFirstTrade(String first);

    //一级菜单集合
    List<Map<Integer, String>> getAllFirstIdTrade();

    int addSecondTrade(Trade trade);

    int deleteTrade(Trade trade);

    int updateTrade(Trade trade);

    List<Trade> findAllTrade();

    //名字是否存在
    int  verifyRepeat(String tradeName);

    //显示用
    List<Map<Integer, String>> getAllSecondIdTrade();


}
