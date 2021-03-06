package com.qst.ssm.mapper;

import com.qst.ssm.entity.Collect;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Shop;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CollectionMapper {
    /**
     * 根据用户ID查询收藏夹信息
     * @param
     * @return
     */
    List<Collect> queryColl();

    /**
     * 收藏夹查询商品
     * @param userId
     * @return
     */
    List<Map> collPro(int userId);

    /**
     * 根据商品ID搜索商品详情
     * @param
     * @return
     */
    Product getPro(int pdId);

    /**
     * 根据收藏夹ID删除商品ID
     * @param collId
     * @return
     */
    Integer delPro( @Param("collId") Integer collId);

    /**
     * 根据用户ID查询商品数量
     * @param pdId
     * @return
     */
    int getCollnum(int pdId);
    /**
     * 根据收藏夹ID增加商品ID
     * @param collId
     * @return
     */
    int insertPro(int collId);

    /**
     * 加入购物车
     * @param shop
     * @return
     */
    int addShop(Shop shop);

    /**
     * 加入收藏夹
     * @param collect
     * @return
     */
    int addCollect(Collect collect);
}
