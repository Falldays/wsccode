package com.qst.ssm.controller;

import com.qst.ssm.entity.Collect;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Shop;
import com.qst.ssm.entity.User;
import com.qst.ssm.service.ICollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("collect")
public class CollectionController {
    @Autowired
    @Qualifier("collService")
    private ICollectionService collService;
    /**
     * 收藏夹查询商品
     * @param
     * @param model
     * @return
     */
    @RequestMapping("querypro")
    public String collPro(HttpSession session, Model model) {
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        List<Map> mapList = collService.collPro(userId);
        model.addAttribute("mapList", mapList);
//        跳转
        return "/coll/query_pro.jsp";
    }

    /**
     * 收藏夹查看商品详细信息
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

    /**
     * 根据收藏ID删除收藏信息
     * @param session
     * @param collId
     * @return
     */
    @RequestMapping("delete")
    public String deletePro(HttpSession session,@RequestParam("coll_id") int collId){
        /*影响行数*/
        int rows=collService.delPro(collId);
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        return "redirect:/collect/querypro";
    }

    /**
     * 加入购物车
     * @param shop
     * @return
     */
    @RequestMapping("addshop")
    public String addShop(HttpSession session,Shop shop,String pdId,Integer collId){
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        shop.setUserId(userId);
        shop.setPdId(pdId);
        Date date=new Date();
        shop.setScDate(date);
        shop.setPdId(pdId);
        int rows=collService.addShop(shop);//加入购物车
        collService.delPro(collId);//删除收藏夹信息
        return "/coll/add_shop.jsp?rows=" + rows;

    }

    /**
     * 加入收藏夹
     * @param session
     * @param collect
     * @param pdId
     * @return
     */
    @RequestMapping("addcollect")
    public String addcollect(HttpSession session,Collect collect,Integer pdId){
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        collect.setUserId(userId);
        collect.setPdId(pdId);
        Date date=new Date();
        collect.setCollDate(date);
        collect.setPdId(pdId);
        int rows=collService.addCollect(collect);//加入收藏夹
        return "/coll/add_collect.jsp?rows=" + rows;

    }
}