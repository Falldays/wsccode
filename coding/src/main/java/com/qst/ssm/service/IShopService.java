package com.qst.ssm.service;

import com.qst.ssm.entity.Shop;

import java.util.List;
import java.util.Map;

public interface IShopService {
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
     * @param scId
     * @return
     */
    int deleteShop(int scId);
}
