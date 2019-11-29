package com.qst.ssm.service.impl;

import com.qst.ssm.dao.IUserDao;
import com.qst.ssm.entity.User;
import com.qst.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    @Qualifier("userDao")
    private IUserDao userDao;

    @Override
    @Transactional(propagation = Propagation.NEVER)
    public  List<User> queryUser() {
        return userDao.queryUser();
    }

    @Override
    @Transactional(propagation = Propagation.NEVER)
    public User getUser(int userId) {
        return userDao.getUser(userId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int deleteUser(int userId) {
        return userDao.deleteUser(userId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updatepassword(int userId) {
        return 0;
    }

    /**
     * 根据用户账号密码获取用户信息
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    /**
     * 用户退出
     * @param userId
     * @return
     */
    @Override
    public int logout(int userId) {
        return userDao.logout(userId);
    }
    /**
     * 查询所有用户
     *
     * @return
     */
    @Override
    public List<User> cxUser() {
        return userDao.cxUser();
    }
}
