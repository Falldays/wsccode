package com.qst.ssm.service;

import com.qst.ssm.entity.Admin;
import com.qst.ssm.entity.Product;

import java.util.List;

/***
 * 管理员业务层接口
 */
public interface IAdminService {
    /**
     * 查询所有管理员
     *
     * @return
     */
    List<Admin> queryAdmin();

    /**
     * 根据管理员ID加载管理员信息
     * @param adminId
     * @return
     */
    Admin getAdmin(int adminId);
    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    int insertAdmin(Admin admin);

    /**
     * 根据管理员ID删除管理员记录
     *
     * @param adminId
     * @return
     */
    int deleteAdmin(int adminId);

    /**修改管理员
     * @param admin
     * @return
     */
    int updateAdmin(Admin admin);

    /**修改管理员密码
     * @param adminId
     * @return
     */
    int updatepass(int adminId);
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
