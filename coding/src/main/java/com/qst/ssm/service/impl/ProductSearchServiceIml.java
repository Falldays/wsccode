package com.qst.ssm.service.impl;

import com.qst.ssm.dao.IProductDao;
import com.qst.ssm.dao.IProductSearchDao;
import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Two;
import com.qst.ssm.service.IProductSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("productSearchService")
public class ProductSearchServiceIml implements IProductSearchService {

    @Autowired
    @Qualifier("productSearchDao")
    private IProductSearchDao productSearchDao;

    @Autowired
    @Qualifier("productDao")
    private IProductDao productDao;

    /**
     * 按范围查询商品
     * @param map
     * @return
     */
    @Override
    public List<Product> queryProductByRange(Map map) {
        return productSearchDao.queryProductByRange(map);
    }

    /**
     * 根据商品ID加载商品信息
     * @param pdId
     * @return
     */
    @Override
    public Product getProduct(Integer pdId) {
        return productDao.getProduct(pdId);
    }

    /**
     * 根据商品名称模糊查询商品
     * @param pdName
     * @return
     */
    @Override
    public List<Product> queryProductByName(String pdName) {
        return productSearchDao.queryProductByName(pdName);
    }

    /**
     * 根据一级id或二级id查询商品
     * @param map
     * @return
     */
    @Override
    public List<Product> queryProductByOneOrTwo(Map map) {
        return productSearchDao.queryProductByOneOrTwo(map);
    }

    /**
     * 查询所有一级分类信息
     * @return
     */
    @Override
    public List<Classification> queryOne() {
        return productSearchDao.queryOne();
    }

    /**
     * 查询所有二级分类信息
     * @return
     */
    @Override
    public List<Two> queryTwo() {
        return productSearchDao.queryTwo();
    }
}
