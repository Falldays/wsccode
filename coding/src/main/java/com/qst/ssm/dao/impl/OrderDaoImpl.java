package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IOrderDao;
import com.qst.ssm.entity.Order;
import com.qst.ssm.mapper.OrderMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("orderDao")
public class OrderDaoImpl implements IOrderDao {

    @Autowired
    @Qualifier("orderMapper")
    private OrderMapper orderMapper;

    @Override
    public List<Map> queryOrder(int userId) {
        return orderMapper.queryOrder(userId);
    }

    @Override
    public List<Map> info(int userId, int orderStatus) {
        return orderMapper.info(userId,orderStatus);
    }

    @Override
    public int deleteOrder(int orderId) {
        return orderMapper.deleteOrder(orderId);
    }

    @Override
    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    @Override
    public Order getOrder(int orderId) {
        return orderMapper.getOrder(orderId);
    }
}
