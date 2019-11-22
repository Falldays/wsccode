package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IShopDao;
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

    @Override
    public List<Map> queryShop() {
        return shopMapper.queryShop();
    }

    @Override
    public int updateShop(Shop shop) {
        return shopMapper.updateShop(shop);
    }

    @Override
    public int deleteShop(int scId) {
        return shopMapper.deleteShop(scId);
    }
}
