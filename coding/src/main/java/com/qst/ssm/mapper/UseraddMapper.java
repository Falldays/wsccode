package com.qst.ssm.mapper;

import com.qst.ssm.entity.Useradd;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UseraddMapper {


    /**
     * 根据用户ID加载用户收货地址
     * @param userId
     * @return
     */
    List<Useradd> getUseradd(@Param("user_id") int userId);

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
    int delUseradd(@Param("useraddId") int useraddId);

    /**
     * 修改收货地址
     * @param useradd
     * @return
     */
    int updUseradd(Useradd useradd);

    /**
     * 根据地址ID查询地址信息
     * @param useraddId
     * @return
     */
    Useradd findUseraddbyaddId(@Param("useraddId") int useraddId);



}
