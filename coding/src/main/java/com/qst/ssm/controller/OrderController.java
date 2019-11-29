package com.qst.ssm.controller;

import com.qst.ssm.entity.Order;
import com.qst.ssm.entity.User;
import com.qst.ssm.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//处理订单业务请求控制器
@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    @Qualifier("orderService")
    private IOrderService orderService;

    //根据用户ID查询订单
    @RequestMapping(value = "queryOrder",method = {RequestMethod.GET,RequestMethod.POST})
    public String queryOrder(HttpSession session, Model model){
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        List<Map> mapList=orderService.queryOrder(userId);
        model.addAttribute("mapList",mapList);
        return "/order/query-order.jsp";
    }
    //根据用户ID以及订单状态查询所有订单
    @RequestMapping(value = "info", method = {RequestMethod.GET,RequestMethod.POST})
    public String info(HttpSession session,@RequestParam("orderStatus") int orderStatus, Model model){
        User user= new User();
        user= (User) session.getAttribute("user");
        int userId=user.getUserId();
        List<Map>  mapList=orderService.info(userId,orderStatus);
        model.addAttribute("mapList",mapList);
        if(0==orderStatus){
            return "/order/status0.jsp";
        }else if(1==orderStatus){
            return "/order/status1.jsp";
        }else
        return "/order/status2.jsp";
    }

    //删除订单
    @RequestMapping("deleteOrder")
    public String deleteOrder(@RequestParam("order_id") int orderId){
        int row=orderService.deleteOrder(orderId);
        return "redirect:/order/delete-order-result.jsp?row="+row;
    }
    /**
     * 加载订单数据
     * http://localhost:8080/emp/load_one?emp_id=4
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "load_order", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String,Object> loadOrderData(@RequestParam("order_id") int orderId) {
        Order order=orderService.getOrder(orderId);
        Map<String,Object> dataMap=new HashMap<>();
        dataMap.put("order",order);
        return dataMap;
    }
    //修改订单
    @RequestMapping("updateOrder")
    public String updateOrder(Order order){
        int row=orderService.updateOrder(order);
        return "redirect:/order/update-order-result.jsp？row="+row;
    }
    //查询所有订单
    @RequestMapping("cxOrder")
    public String cxOrder(Model model){
        List<Order> orderList=orderService.cxOrder();
        model.addAttribute("orderList",orderList);
        return "/order/cx-order.jsp";
    }
    //查询所有订单
    @RequestMapping("quOrder")
    public String quOrder(Model model){
        List<Order> orderList=orderService.cxOrder();
        model.addAttribute("orderList",orderList);
        return "/order/query+update-order.jsp";
    }

}
