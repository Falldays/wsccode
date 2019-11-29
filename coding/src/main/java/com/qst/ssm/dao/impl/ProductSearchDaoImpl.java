package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IProductSearchDao;
import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Two;
import com.qst.ssm.mapper.ProductSearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("productSearchDao")
public class ProductSearchDaoImpl implements IProductSearchDao {

    @Autowired
    @Qualifier("productSearchMapper")
    private ProductSearchMapper productSearchMapper;

    /**
     * 按范围查询商品
     * @param map
     * @return
     */
    @Override
    public List<Product> queryProductByRange(Map map) {
        return productSearchMapper.queryProductByRange(map);
    }

    /**
     * 根据商品名称模糊查询商品
     * @param pdName
     * @return
     */
    @Override
    public List<Product> queryProductByName(String pdName) {
        return productSearchMapper.queryProductByName(pdName);
    }

    /**
     * 根据一级id或二级id查询商品
     * @param map
     * @return
     */
    @Override
    public List<Product> queryProductByOneOrTwo(Map map) {
        return productSearchMapper.queryProductByOneOrTwo(map);
    }

    /**
     * 查询所有一级分类信息
     * @return
     */
    @Override
    public List<Classification> queryOne() {
        return productSearchMapper.queryOne();
    }

    /**
     * 查询所有e二级分类信息
     * @return
     */
    @Override
    public List<Two> queryTwo() {
        return productSearchMapper.queryTwo();
    }
}
