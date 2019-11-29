package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IShopDao;
import com.qst.ssm.entity.Order;
import com.qst.ssm.entity.Orderxx;
import com.qst.ssm.entity.Shop;
import com.qst.ssm.mapper.ShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Repository("shopDao")
public class ShopDaoImpl implements IShopDao {
    @Autowired
    @Qualifier("shopMapper")
    private ShopMapper shopMapper;

//    @Override
//    public List<Map> queryShop() {
//        return shopMapper.queryShop();
//    }

    @Override
    public int updateShop(Shop shop) {
        return shopMapper.updateShop(shop);
    }

    @Override
    public int deleteShop(int userId) {
        return shopMapper.deleteShop(userId);
    }


    /*    */
    @Override
    public List<Map> queryCart(int useId) {
        return shopMapper.queryCart(useId);
    }

    @Override
    public int addOrder(Order order) {
        return shopMapper.addOrder(order);
    }

    @Override
    public int addOrderxx(Orderxx orderxx) {
        return shopMapper.addOrderxx(orderxx);
    }
}
