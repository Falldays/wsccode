package com.qst.ssm.controller;

import com.qst.ssm.entity.User;
import com.qst.ssm.entity.Useradd;
import com.qst.ssm.service.IUseraddService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 处理用户收货地址控制器
 */
@Controller
@RequestMapping("useradd")
public class UseraddController {
    @Autowired
    @Qualifier("useraddService")
    private IUseraddService useraddService;

    /***
     * 根据用户ID查询收货地址
     * @return
     */
    @RequestMapping("getUseradd")
    public String getUseradd( Model model,HttpSession session) {
        User user   =(User) session.getAttribute("user");
        Integer userId = user.getUserId();
        List<Useradd> useradd = useraddService.getUseradd(userId);
        model.addAttribute("useradds", useradd);
        return "/user_address.jsp";
    }

    @RequestMapping("insertUseradd")
    public String addUseradd(String addAddress1,String addAddress2, String addAddress3,String addAddress4,Useradd useradd,HttpSession session) {
        User user   =(User) session.getAttribute("user");
        Integer userId = user.getUserId();
        String addAddress=addAddress1+addAddress2+addAddress3+addAddress4;
        System.out.println(addAddress);
        useradd.setAddAddress(addAddress);
        useradd.setUserId(userId);
        int rows = useraddService.insertUseradd(useradd);
        return "redirect:/useradd/getUseradd";
    }

    /**
     * 根据收货地址ID删除收货地址
     * @param useraddId
     * @return
     */
    @RequestMapping("delUseradd")
    public String delUseradd(@RequestParam("useradd_id") int useraddId) {
        System.out.println(useraddId);
        Useradd useradd=new Useradd();
        useradd.setUseraddId(useraddId);
        int rows = useraddService.delUseradd(useraddId);
        //重定向到删除结果的页面
        return "redirect:/useradd/getUseradd" ;
    }


    @RequestMapping("/toEditUseradd.action")
    public String toeditUseradd(int useradd_id, Model model, HttpSession sesson) {
        Useradd useradd =useraddService.findUseraddbyaddId(useradd_id);
        System.out.println(useradd);
        model.addAttribute("useradd", useradd);
        //返回信息展示页面
        return "/upd_user_address.jsp";
    }


    @RequestMapping("updUseradd")
    public String updUseradd(Useradd useradd,String addAddress1,String addAddress2, String addAddress3,String addAddress4){
        String addAddress=addAddress1+addAddress2+addAddress3+addAddress4;
        System.out.println(addAddress);
        useradd.setAddAddress(addAddress);
        int rows =useraddService.updUseradd(useradd);
        return "redirect:/useradd/getUseradd" ;
    }

}
