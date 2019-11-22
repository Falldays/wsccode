package com.qst.ssm.controller;

import com.qst.ssm.entity.Shop;
import com.qst.ssm.service.IShopService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("shop")
public class ShopController {
    @Autowired
    @Qualifier("shopService")
    private IShopService shopService;

    /**
     * 查询购物车信息
     * @return
     */
    @RequestMapping("queryshop")
    public List<Map> queryShop(){
        List<Map> shopmap=shopService.queryShop();
        return null;
    };

    /**
     * 修改购物车数量和
     * @param shop
     * @return
     */
    public String updateShop(Shop shop){
        int rows=shopService.updateShop(shop);
        return null;
    };

    /**
     *根据购物车ID删除商品
     * @param scId
     * @return
     */
    public String deleteShop(@Param("scId") int scId){
        int rows=shopService.deleteShop(scId);
        return null;
    };

}
