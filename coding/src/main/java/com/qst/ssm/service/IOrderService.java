package com.qst.ssm.service;

import com.qst.ssm.entity.Order;

import java.util.List;
import java.util.Map;

//订单表
public interface IOrderService {
//根据用户ID查询订单信息
    List<Map> queryOrder(int userId);
    //根据用户ID以及订单状态查询所有订单
    List<Map> info(int userId, int orderStatus);
//根据订单ID删除订单
    int deleteOrder(int orderId);
    //修改订单
    int updateOrder(Order order);
    //根据订单ID查询订单信息
    Order getOrder(int orderId);
}
