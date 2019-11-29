package com.qst.ssm.controller;

import com.qst.ssm.entity.Order;
import com.qst.ssm.entity.Orderxx;
import com.qst.ssm.entity.Shop;
import com.qst.ssm.entity.User;
import com.qst.ssm.service.IShopService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("shop")
public class ShopController {
    @Autowired
    @Qualifier("shopService")
    private IShopService shopService;


    /**
     * 修改购物车数量和
     * @param shop
     * @return
     */
    @RequestMapping("")
    public String updateShop(Shop shop){
        int rows=shopService.updateShop(shop);
        return null;
    };

    /**
     *根据购物车ID删除商品
     * @param scId
     * @return
     */
    @RequestMapping("deleteshopsp")
    public String deleteShop(@Param("scId") int scId){
        int rows=shopService.deleteShop(scId);
        return null;
    };

    /**
     * 查询购物车
     * @param
     *
     * @return
     */
    @RequestMapping( "queryshop")
//    @ResponseBody
    public String loadCart( Model model, HttpSession session){
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        List<Map> cartlist=shopService.queryCart(userId);
        for (int i = 0; i <cartlist.size() ; i++) {
            cartlist.get(i).put("no",i);
        }
        session.setAttribute("size",cartlist.size());
        model.addAttribute("cartlist",cartlist);
        return "/shop/gwc.jsp";
    };

    private Order order;
    private Orderxx orderxx;
    @RequestMapping("jiesuan")
    public String jiesuanCart(/*@RequestParam Map map,*/ HttpSession session){
       /* int size= (int) session.getAttribute("size");
        Integer sc=0,s=0,p=0;
        Integer scprice=0;
        for (int i = 0; i <size ; i++) {
            s=Integer.valueOf( map.get("pdId"+i)+"");
            p=Integer.valueOf( map.get("scNumber"+i)+"");
            sc=s*p;
        }
        scprice=scprice+sc;
        order.setUserId(1);
        Date date= new Date();
        order.setCreateTime(date);
        order.setOrderStatus(1);//订单状态
        order.setPdPrice(scprice);
        int orderId=shopService.addOrder(order);//添加订单信息
        for (int i = 0; i <size; i++) {
            orderxx.setOrderId(orderId);
            orderxx.setPdId(Integer.valueOf( map.get("pdId"+i)+""));
            shopService.addOrderxx(orderxx);//添加订单详细信息
        }*/
//        int userid=Integer.valueOf( map.get("userId")+"");
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        shopService.deleteShop(userId);//清除购物车选择的商品
        return "/shop/jiesuan_result.jsp";
    };
}
