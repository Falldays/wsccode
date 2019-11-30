package com.qst.ssm.service.impl;

import com.qst.ssm.dao.ICollectionDao;
import com.qst.ssm.entity.Collect;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Shop;
import com.qst.ssm.service.ICollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository("collService")
public class CollectionServiceImpl implements ICollectionService {
    @Autowired
    @Qualifier("collDao")
    private ICollectionDao collDao;

    @Override
    @Transactional(propagation = Propagation.NEVER)
    public List<Collect> queryColl() {
        return collDao.queryColl();
    }

    @Override
    @Transactional(propagation = Propagation.NEVER)
    public List<Map> collPro(int userId) {
        return collDao.collPro(userId);
    }

    @Override
    @Transactional(propagation = Propagation.NEVER)
    public Product getPro(int pdId) {
        return collDao.getPro(pdId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public Integer delPro(int collId) {

        return collDao.delPro(collId);
    }

    @Override
    public int addShop(Shop shop) {
        return collDao.addShop(shop);
    }


    /*未使用*/
    @Override
    public int getCollnum(int pdId) {
        return 0;
    }


    @Override
    public int insertPro(int collId) {
        return 0;
    }

    @Override
    public int addCollect(Collect collect) {
        return collDao.addCollect(collect);
    }
}
