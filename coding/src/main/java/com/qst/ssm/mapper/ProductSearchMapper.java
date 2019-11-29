package com.qst.ssm.mapper;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Two;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductSearchMapper {
    /**
     * 查询所有商品
     * @return
     */
    List<Product> queryProductByRange(Map map);

    /**
     * 根据商品名称模糊查询商品
     * @param pdName
     * @return
     */
    List<Product> queryProductByName(@Param("pdName") String pdName);

    /**
     * 根据一级id或二级id查询商品
     * @param map
     * @return
     */
    List<Product> queryProductByOneOrTwo(Map map);


    /**
     * 查询所有一级分类信息
     * @return
     */
    List<Classification> queryOne();

    /**
     * 查询所有二级分类信息
     * @return
     */
    List<Two> queryTwo();

}
