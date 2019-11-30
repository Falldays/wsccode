package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.ICollectionDao;
import com.qst.ssm.entity.Collect;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Shop;
import com.qst.ssm.mapper.CollectionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository("collDao")
public class CollectionImpl implements ICollectionDao {
    @Autowired
    @Qualifier("collectionMapper")
    private CollectionMapper collectionMapper;

    @Override
    public List<Collect> queryColl() {
        return collectionMapper.queryColl();
    }

    @Override
    public List<Map> collPro(int userId) {
        return collectionMapper.collPro(userId);
    }

    @Override
    public Product getPro(int pdId) {
        return collectionMapper.getPro(pdId);
    }

    @Override
    public Integer delPro(int collId) {

        return collectionMapper.delPro(collId);
    }

    @Override
    public int addShop(Shop shop) {
        return collectionMapper.addShop(shop);
    }

    @Override
    public int addCollect(Collect collect) {
        return  collectionMapper.addCollect(collect);
    }

    @Override
    public int getCollnum(int pdId) {
        return 0;
    }

    @Override
    public int insertPro(int collId) {
        return 0;
    }


}
