package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IUseraddDao;
import com.qst.ssm.entity.Useradd;
import com.qst.ssm.mapper.UseraddMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("useraddDao")
public class UseraddDaoImpl implements IUseraddDao {
    @Autowired
    @Qualifier("useraddMapper")
    private UseraddMapper useraddMapper;

    @Override
    public List<Useradd> getUseradd(int userId) {
        return useraddMapper.getUseradd(userId);
    }

    @Override
    public int insertUseradd(Useradd useradd) {
        return useraddMapper.insertUseradd(useradd);
    }

    @Override
    public int delUseradd(int useraddId) {
        return useraddMapper.delUseradd(useraddId);
    }

    @Override
    public int updUseradd(Useradd useradd) {
        return useraddMapper.updUseradd(useradd);
    }

    @Override
    public Useradd findUseraddbyaddId(int useraddId) {
        return useraddMapper.findUseraddbyaddId(useraddId);
    }


}
