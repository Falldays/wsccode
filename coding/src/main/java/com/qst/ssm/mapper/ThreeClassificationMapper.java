package com.qst.ssm.mapper;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 商品三级分类Mapper接口
 * author：lbs
 */
public interface ThreeClassificationMapper {

    /**
     * 根据二级分类ID查询所有三级分类信息
     * @return
     */
    List<Three> queryClassificationByThree(Integer twoId);

    /**
     * 根据三级分类ID查询一个三级分类信息
     * @return
     */
    Three queryThreeByThreeId( @Param("threeId") Integer threeId);

    /**
     * 根据二级id和三级名称查询三级分类信息
     * @param three
     * @return
     */
    Three queryThreeByTwoIdAndThreeName(Three three);

    /**
     * 根据三级编号或三级名称查询三级信息
     * @param three
     * @return
     */
    List<Three> queryThreeByThreeNoOrThreeName(Three three);

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
    Integer deleteClassificationByThree(@Param("threeId") Integer threeId);

    /**
     * 修改三级分类
     * @param three
     * @return
     */
    Integer updateThree(Three three);
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

}
