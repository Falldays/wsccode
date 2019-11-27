package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IProductDao;
import com.qst.ssm.entity.Product;
import com.qst.ssm.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productDao")
public class ProductDaoImpl implements IProductDao {
    @Autowired
    @Qualifier("productMapper")
    private ProductMapper productMapper;

    @Override
    public List<Product> queryProduct() {
        return productMapper.queryProduct();
    }

    @Override
    public Product getProduct(int pdId) {
        return productMapper.getProduct(pdId);
    }

    @Override
    public int insertProduct(Product product) {
        return productMapper.insertProduct(product);
    }

    @Override
    public int deleteProduct(int pdId) {
        return productMapper.deleteProduct(pdId);
    }

    @Override
    public int updateProduct(Product product) {
        return productMapper.updateProduct(product);
    }
}
