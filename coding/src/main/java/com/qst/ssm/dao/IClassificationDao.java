package com.qst.ssm.dao;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 商品分类Dao接口
 * author：lbs
 */
public interface IClassificationDao {
    /**
     * 查询所有的一级分类信息
     * @return
     */
    List<Map> queryClassification();

    /**
     * 根据一级Id查询一级分类信息，包含二级数量
     * @return
     */
    List<Map> queryClassificationByOneId(Integer oneId);

    /**
     * 根据一级Id查询一级分类信息
     * @return
     */
    Classification queryOneClassificationByOneId(Integer oneId);

    /**
     * 根据一级名称查询一级分类信息
     * @return
     */
    List<Classification> queryOneClassificationByOneName(Classification classification);

    /**
     * 根据编号或名称查询一级分类
     * @param classification
     * @return
     */
    List<Classification> queryClassificationByNoOrName(Classification classification);



    /**
     * 添加一级商品分类
     * @param classification    一级商品分类信息
     * @return  影响行数
     */
    Integer addClassificationByOne(Classification classification);




    /**
     * 根据一级分类id删除该一级分类
     * @param oneId 一级分类ID
     * @return 影响行数
     */
    Integer deleteClassificationByOne(Integer oneId);

    /**
     * 根据Id修改一级分类名称
     * @param classification
     * @return
     */
    int updateOne(Classification classification);


}
