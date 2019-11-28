package com.qst.ssm.service.impl;


import com.qst.ssm.dao.IAdminDao;
import com.qst.ssm.dao.IProductDao;
import com.qst.ssm.entity.Admin;
import com.qst.ssm.entity.Product;
import com.qst.ssm.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements IAdminService{
    @Autowired
    @Qualifier("adminDao")
    private IAdminDao adminDao;
    @Autowired
    @Qualifier("productDao")
    private IProductDao productDao;
    @Override
    @Transactional(propagation = Propagation.NEVER )
    public List<Admin> queryAdmin() {
        return adminDao.queryAdmin();
    }

    @Override
    @Transactional(propagation = Propagation.NEVER )
    public Admin getAdmin(int adminId) {
        return adminDao.getAdmin(adminId) ;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int insertAdmin(Admin admin) {
        return adminDao.insertAdmin(admin);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int deleteAdmin(int adminId) {
        return adminDao.deleteAdmin(adminId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updateAdmin(Admin admin) {
        return adminDao.updateAdmin(admin);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updatepass(int adminId) {
        return 0;
    }

    /**
     * 根据admin账号密码获取admin信息
     * @param admin
     * @return
     */
    @Override
    public Admin login(Admin admin) {
        return adminDao.login(admin);
    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public List<Product> queryProduct() {
        return productDao.queryProduct();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public Product getProduct(int pdId) {
        return productDao.getProduct(pdId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int insertProduct(Product product) {
        return productDao.insertProduct(product);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int deleteProduct(int pdId) {
        return productDao.deleteProduct(pdId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updateProduct(Product product) {
        return productDao.updateProduct(product);
    }

    @Override
    public int logout(int adminId) {
        return adminDao.logout(adminId);
    }


}
