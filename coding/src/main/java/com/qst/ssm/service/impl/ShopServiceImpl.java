package com.qst.ssm.service.impl;

import com.qst.ssm.dao.IShopDao;
import com.qst.ssm.entity.Order;
import com.qst.ssm.entity.Orderxx;
import com.qst.ssm.entity.Shop;
import com.qst.ssm.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Repository("shopService")
public class ShopServiceImpl implements IShopService {
    @Autowired
    @Qualifier("shopDao")
    private IShopDao shopDao;

    @Override
    public int updateShop(Shop shop) {
        return shopDao.updateShop(shop);
    }

    @Override
    public int deleteShop(int userId) {
        return shopDao.deleteShop(userId);
    }

    @Override
    public List<Map> queryCart(int useId) {
        return shopDao.queryCart(useId);
    }

    @Override
    public int addOrder(Order order) {
        return shopDao.addOrder(order);
    }

    @Override
    public int addOrderxx(Orderxx orderxx) {
        return shopDao.addOrderxx(orderxx);
    }
}
