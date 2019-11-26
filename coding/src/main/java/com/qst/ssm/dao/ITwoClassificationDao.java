package com.qst.ssm.dao;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;

import java.util.List;
import java.util.Map;

/**
 * 商品二级分类Dao接口
 * author：lbs
 */
public interface ITwoClassificationDao {


    /**
     * 根据一级分类ID查询所有二级分类信息
     * @return
     */
    List<Two> queryClassificationByTwo(Integer oneId);

    /**
     * 查询二级分类信息，包括一级名、三级数量
     * @return
     */
    List<Map> queryTwoClassification(Map map);

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
     * 添加二级商品分类
     * @param two    二级商品分类信息
     * @return  影响行数
     */
    Integer addClassificationByTwo(Two two);

    /**
     * 修改二级分类
     * @param two
     * @return
     */
    int updateTwo(Two two);

    /**
     * 根据二级分类id删除该二级分类
     * @param twoId 二级分类ID
     * @return 影响行数
     */
    Integer deleteClassificationByTwo(Integer twoId);


}
