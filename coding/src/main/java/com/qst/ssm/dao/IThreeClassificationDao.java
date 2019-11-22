package com.qst.ssm.dao;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;

import java.util.List;
import java.util.Map;

/**
 * 商品三级分类Dao接口
 * author：lbs
 */
public interface IThreeClassificationDao {


    /**
     * 根据二级分类ID查询所有三级分类信息
     * @return
     */
    List<Three> queryClassificationByThree(Integer twoId);





    /**
     * 添加三级商品分类
     * @param three    三级商品分类信息
     * @return  影响行数
     */
    Integer addClassificationByThree(Three three);

    /**
     * 根据三级分类id删除该三级分类
     * @param threeId 三级分类ID
     * @return 影响行数
     */
    Integer deleteClassificationByThree(Integer threeId);

}
