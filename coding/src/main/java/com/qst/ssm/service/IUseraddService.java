package com.qst.ssm.service;

import com.qst.ssm.entity.Useradd;

import java.util.List;

/***
 * 用户业务层接口
 */
public interface IUseraddService {

    /**
     * 根据用户ID加载用户收货地址
     * @param userId
     * @return
     */
    List<Useradd> getUseradd(int userId);

    /**
     * 添加收货地址
     * @param useradd
     * @return
     */
    int insertUseradd(Useradd useradd);


    /**
     * 删除收货地址
     * @param useraddId
     * @return
     */
    int delUseradd(int useraddId);

    /**
     * 修改收货地址
     */
    int updUseradd(Useradd useradd);

    /**
     * 根据地址ID查询地址信息
     * @param useraddId
     * @return
     */
    Useradd findUseraddbyaddId(int useraddId);

}
