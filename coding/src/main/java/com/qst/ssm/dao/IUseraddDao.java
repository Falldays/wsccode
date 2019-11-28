package com.qst.ssm.dao;

import com.qst.ssm.entity.Useradd;

import java.util.List;

public interface IUseraddDao {


    /**
     * 根据用户ID加载用户信息
     * @param userId
     * @return
     */
    List<Useradd> getUseradd(int userId);

    /**
     * 添加用户收货地址
     * @param useradd
     * @return
     */
    int insertUseradd(Useradd useradd);

    /**
     * 根据编号ID删除收货地址
     *
     * @param useraddId
     * @return
     */
    int delUseradd(int useraddId);

    /**
     * 根据地址ID修改收货地址
     * @param useradd
     * @return
     */
    int updUseradd(Useradd useradd);

    /**
     * 根据地址ID查询地址信息
     * @param useraddId
     * @return
     */
    Useradd findUseraddbyaddId(int useraddId);



}
