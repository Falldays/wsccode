package com.qst.ssm.controller;

import com.qst.ssm.entity.Collect;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Shop;
import com.qst.ssm.service.ICollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("collect")
public class CollectionController {
    @Autowired
    @Qualifier("collService")
    private ICollectionService collService;
    /**
     * 购物车查询商品
     * @param userId
     * @param model
     * @return
     */
    @RequestMapping("querypro")
    public String collPro(@RequestParam("user_id") int userId, Model model) {
        List<Map> mapList = collService.collPro(userId);
        model.addAttribute("mapList", mapList);
//        跳转
        return "/coll/query_pro.jsp";
    }

    /**
     * 购物车查看商品信息
     * @param pdId
     * @param model
     * @return
     */
    @RequestMapping("getpro")
    public String getPro(@RequestParam("pd_id")int pdId, Model model) {
        Product pro = collService.getPro(pdId);
        model.addAttribute("pro", pro);
//        跳转
        return "/coll/pro_info.jsp";
    }

    @RequestMapping("delete")
    public String deletePro(@RequestParam("coll_id") int collId){
        /*影响行数*/
        int rows=collService.delPro(collId);

        return "redirect:/collect/querypro?user_id=1";
    }

    /**
     * 加入购物车
     * @param shop
     * @return
     */
    @RequestMapping("addshop")
    public String addShop(Shop shop){
        int rows=collService.addShop(shop);
        return "/coll/add_shop.jsp?rows=" + rows;

    }

}