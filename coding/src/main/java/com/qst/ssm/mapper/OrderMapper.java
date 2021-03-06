package com.qst.ssm.mapper;

import com.qst.ssm.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

//订单表
public interface OrderMapper {

    //根据用户ID查询订单信息
    List<Map> queryOrder(@Param("userId") int userId);
    //根据用户ID以及订单状态查询所有订单
    List<Map> info(@Param("userId") int userId, @Param("orderStatus") int orderStatus);
    //根据订单ID删除订单
    int deleteOrder(@Param("orderId") int orderId);
    //修改订单
    int updateOrder(Order order);
    //根据订单ID查询订单信息
    Order getOrder(int orderId);
    //查询所有订单
    List<Order> cxOrder();
}
