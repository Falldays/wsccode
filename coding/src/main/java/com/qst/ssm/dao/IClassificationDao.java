package com.qst.ssm.dao;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;

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
     * 根据一级Id查询一级分类信息
     * @return
     */
    List<Map> queryClassificationByOneId(Integer oneId);



    /**
     * 查询所有商品分类信息
     * @return
     */
    List<Map> getClassification();

    /**
     * 按分类级别查询所有商品分类信息
     * @return
     */
    List<Map> getClassificationByType(Map<String, Object> map);

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




}
