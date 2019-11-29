package com.qst.ssm.mapper;

import com.qst.ssm.entity.Order;
import com.qst.ssm.entity.Orderxx;
import com.qst.ssm.entity.Shop;

import java.util.List;
import java.util.Map;

public interface ShopMapper {
    /**
     * 查询购物车信息
     * @return
     */
    List<Map> queryShop();

    /**
     * 修改购物车数量和
     * @param shop
     * @return
     */
    int updateShop(Shop shop);

    /**
     *根据购物车ID删除商品
     * @param
     * @return
     */
    int deleteShop(int useId);

    /**
     * 根据用户ID查询购物车信息
     * @param useId
     * @return
     */
    List<Map> queryCart(int useId);

    /**
     * 将购物车信息插入订单表中,并返回orderId
     * @param order
     * @return
     */
    int  addOrder(Order order);

    /**
     * 向订单插入信息
     * @param orderxx
     * @return
     */
    int addOrderxx(Orderxx orderxx);


}
