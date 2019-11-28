package com.qst.ssm.service.impl;

import com.qst.ssm.dao.IUseraddDao;
import com.qst.ssm.entity.Useradd;
import com.qst.ssm.service.IUseraddService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("useraddService")
public class UseraddServiceImpl implements IUseraddService {
    @Autowired
    @Qualifier("useraddDao")
    private IUseraddDao useraddDao;

    @Override
    @Transactional(propagation = Propagation.NEVER)
    public List<Useradd> getUseradd(int userId) {
        return useraddDao.getUseradd(userId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int insertUseradd(Useradd useradd) {
        return useraddDao.insertUseradd(useradd);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int delUseradd(int useraddId) {
       return useraddDao.delUseradd(useraddId);
        }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int updUseradd(Useradd useradd) {
        return useraddDao.updUseradd(useradd);
    }

    @Override
    public Useradd findUseraddbyaddId(int useraddId) {
        return useraddDao.findUseraddbyaddId(useraddId);
    }


}
