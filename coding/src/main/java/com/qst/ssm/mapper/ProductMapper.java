package com.qst.ssm.mapper;

import com.qst.ssm.entity.Product;

import java.util.List;

public interface ProductMapper {
    /**
     * 查询所有商品
     * @return
     */
    List<Product> queryProduct();

    /**
     * 根据商品ID加载商品信息
     * @param pdId
     * @return
     */
    Product getProduct(int pdId);

    /**
     * 添加商品
     * @param product
     * @return
     */
    int insertProduct(Product product);

    /**
     * 根据商品ID删除商品记录
     * @param pdId
     * @return
     */
    int deleteProduct(int pdId);

    /**
     * 修改商品
     * @param product
     * @return
     */
    int updateProduct(Product product);
}
