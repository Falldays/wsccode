package com.qst.ssm.controller;

import com.qst.ssm.entity.Admin;
import com.qst.ssm.entity.Product;
import com.qst.ssm.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理管理员业务控制器
 */
@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    @Qualifier("adminService")
    private IAdminService adminService;

    /***
     * 查询所有管理员
     * @return
     */
    @RequestMapping("query")
    public String queryAdmin(HttpServletRequest request, Model model) {
        List<Admin> adminList = adminService.queryAdmin();
        //request.setAttribute("adminList",adminList);
        model.addAttribute("adminList", adminList);
        return "/admin/query_admin.jsp";
    }

    /**
     * 根据管理员ID删除管理员
     *
     * @param adminId
     * @return
     */
    @RequestMapping("delete")
    public String deleteAdmin(@RequestParam("admin_id") int adminId) {
        int rows = adminService.deleteAdmin(adminId);
        //重定向到删除结果的页面
        return "redirect:/admin/delete_admin_result.jsp?rows=" + rows;
    }

    /**
     * 查看详细信息
     *
     * @return
     */
    @RequestMapping("info")
    public String showInfo(@RequestParam("admin_id") int adminId, Model model) {
        Admin admin = adminService.getAdmin(adminId);
        model.addAttribute("admin", admin);
        return "/admin/info.jsp";
    }

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    @RequestMapping("add")
    public String addAdmin(Admin admin) {
        int rows = adminService.insertAdmin(admin);
        return "redirect:/admin/info?rows=" + rows;
    }

    /**
     * 加载管理员数据
     * http://localhost:8080/admin/load_one?admin_id=4
     *
     * @param adminId
     * @return
     */
    @RequestMapping(value = "load_one", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> loadAdminData(@RequestParam("admin_id") int adminId) {
        Admin admin = adminService.getAdmin(adminId);
        List<Admin> admins = adminService.queryAdmin();
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("admin", admin);
        return dataMap;
    }

    /**
     * 修改管理员
     *
     * @param admin
     * @return
     */
    @RequestMapping("update")
    public String updateAdmin(Admin admin) {
        int rows = adminService.updateAdmin(admin);
        return "redirect:/admin/update_admin_result.jsp?rows=" + rows;
    }


    /**
     * 管理员登录
     * @param admin
     * @param model
     * @param session
     * @return
             */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Admin admin, Model model, HttpSession session){
        Admin admin1 = adminService.login(admin);
        String href= null;
        if (admin1==null){
            //出现异常
            model.addAttribute("msg","发生异常，请重新登录！");
            href = "/adminLogin.jsp";
        }else if (admin1.getAdminId()==null){
            //不存在
            model.addAttribute("msg","账号或密码错误，请重新登录！");
            return href = "/adminLogin.jsp";
        }else {
            //登录成功
            session.setAttribute("admin",admin1);
            return href = "redirect:/main.jsp";
        }
        model.addAttribute("msg","用户名或密码错误，请重新登录！");
        return  href="/adminLogin.jsp";
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session)throws Exception{
        session.removeAttribute("adminId");
        session.invalidate();
        return "redirect:/admin/login";
    }

    /**
     * 查询商品
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("queryproduct")
    public String productQuery(Model model){
        List<Product> productList=adminService.queryProduct();
        model.addAttribute("productList", productList);
        return "/product/query_product.jsp";
    };

    @RequestMapping("deleteproduct")
    public String productDelete(@RequestParam("pd_id")int pdId){
        int rows=adminService.deleteProduct(pdId);
        return "redirect:/product/delete_product_result.jsp?rows="+rows;
    };
    /**
     * 商品管理
     * @param pdId
     * @return
     */
    @RequestMapping(value = "load_product",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String,Object> loadProduct(@RequestParam("pd_id") int pdId){
        Product product=adminService.getProduct(pdId);
        Map<String,Object> dataMap=new HashMap<>();
        dataMap.put("product",product);
        return dataMap;
    }
    @RequestMapping("updateproduct")
    public String updateProduct(Product product){
        int rows=adminService.updateProduct(product);
        return "redirect:/product/update_product_result.jsp?rows="+rows;
    };
    /**
     * 添加商品
     * @param product
     * @return
     */
    @RequestMapping("addproduct")
    public String addProduct(Product product){
        int rows=adminService.insertProduct(product);
        return "redirect:/product/add_product_result.jsp?rows="+rows;
    };
}
