package com.qst.ssm.service;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;

import java.util.List;
import java.util.Map;

/**
 * 商品分类服务类接口
 * author：lbs
 */
public interface IClassificationService {
    /**
     * 查询所有的一级分类信息
     * @return
     */
    List<Map> queryClassification();

    /**
     * 根据编号或名称查询一级分类
     * @param classification
     * @return
     */
    List<Classification> queryClassificationByNoOrName(Classification classification);

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
     * 根据一级分类ID查询所有二级分类信息
     * @return
     */
    List<Two> queryClassificationByTwo(Integer oneId);

    /**
     * 根据二级编号或名称查询二级信息
     * @param two
     * @return
     */
    List<Two> queryTwoByNoOrName(Two two);

    /**
     * 根据二级id查询二级分类信息
     * @param twoId
     * @return
     */
    Two queryTwoByTwoId(Integer twoId);

    /**
     * 根据一级id和二级名称查询二级分类信息
     * @param two
     * @return
     */
    Two queryTwoByOneIdAndTwoName(Two two);


    /**
     * 查询二级分类信息，包括一级名、三级数量
     * @return
     */
    List<Map> queryTwoClassification(Map map);

    /**
     * 根据二级分类ID查询所有三级分类信息
     * @return
     */
    List<Three> queryClassificationByThree(Integer twoId);

    /**
     * 根据三级编号或三级名称查询三级信息
     * @param three
     * @return
     */
    List<Three> queryThreeByThreeNoOrThreeName(Three three);

    /**
     * 根据三级分类ID查询一个三级分类信息
     * @return
     */
    Three queryThreeByThreeId(Integer threeId);

    /**
     * 根据二级id和三级名称查询三级分类信息
     * @param three
     * @return
     */
    Three queryThreeByTwoIdAndThreeName(Three three);

    /**
     * 查询所有商品分类信息
     * @return
     */
    List<Map> getClassification(Map map);


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
     * 添加二级商品分类
     * @param two    二级商品分类信息
     * @return  影响行数
     */
    Integer addClassificationByTwo(Two two);

    /**
     * 添加三级商品分类
     * @param three    三级商品分类信息
     * @return  影响行数
     */
    Integer addClassificationByThree(Three three);

    /**
     * 根据一级分类id删除该一级分类
     * @param oneId 一级分类ID
     * @return 影响行数
     */
    Integer deleteClassificationByOne(Integer oneId);

    /**
     * 根据二级分类id删除该二级分类
     * @param twoId 二级分类ID
     * @return 影响行数
     */
    Integer deleteClassificationByTwo(Integer twoId);

    /**
     * 根据三级分类id删除该三级分类
     * @param threeId 三级分类ID
     * @return 影响行数
     */
    Integer deleteClassificationByThree(Integer threeId);

    /**
     * 根据Id修改一级分类名称
     * @param classification
     * @return
     */
    int updateOne(Classification classification);

    /**
     * 修改二级分类
     * @param two
     * @return
     */
    int updateTwo(Two two);

    /**
     * 修改三级分类
     * @param three
     * @return
     */
    Integer updateThree(Three three);
}
