package com.qst.ssm.mapper;

import com.qst.ssm.entity.Two;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 商品二级分类Mapper接口
 * author：lbs
 */
public interface TwoClassificationMapper {

    /**
     * 根据一级分类ID查询所有二级分类信息
     * @return
     */
    List<Two> queryClassificationByTwo(Integer oneId);

    /**
     * 查询二级分类信息，包括一级名、三级数量
     * @return
     */
    List<Map> queryTwoClassification();

    /**
     * 添加二级商品分类
     * @param two    二级商品分类信息
     * @return  影响行数
     */
    Integer addClassificationByTwo(Two two);



    /**
     * 根据二级分类id删除该二级分类
     * @param twoId 二级分类ID
     * @return 影响行数
     */
    Integer deleteClassificationByTwo(@Param("twoId") Integer twoId);



}
