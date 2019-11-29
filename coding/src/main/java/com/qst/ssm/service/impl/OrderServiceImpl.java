package com.qst.ssm.service.impl;

import com.qst.ssm.dao.IOrderDao;
import com.qst.ssm.entity.Order;
import com.qst.ssm.mapper.OrderMapper;
import com.qst.ssm.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository("orderService")
public class OrderServiceImpl implements IOrderService {

    @Autowired
    @Qualifier("orderDao")
    private IOrderDao orderDao;

    @Override
    public List<Map> queryOrder(int userId) {
        return orderDao.queryOrder(userId);
    }

    @Override
    public List<Map> info(int userId, int orderStatus) {
        return orderDao.info(userId,orderStatus);
    }

    @Override
    public int deleteOrder(int orderId) {
        return orderDao.deleteOrder(orderId);
    }

    @Override
    public int updateOrder(Order order) {
        return orderDao.updateOrder(order);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public Order getOrder(int orderId) {
        return orderDao.getOrder(orderId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public List<Order> cxOrder() {
        return orderDao.cxOrder();
    }
}
