package com.qst.ssm.controller;

import cn.hutool.crypto.digest.DigestUtil;
import com.qst.ssm.entity.User;
import com.qst.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理用户业务控制器
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    @Qualifier("userService")
    private IUserService userService;

    /***
     * 查询所有用户
     * @return
     */
    @RequestMapping("query")
    public String queryUser(HttpServletRequest request) {
        String username=request.getParameter("username");
        String password1= request.getParameter("password");
        String pwd=DigestUtils.md5DigestAsHex(password1.getBytes());
        User user= userService.queryUser(username);
        String password= user.getPassword();
        if(password.equals(pwd)){
            return"/main.jsp";
        }
        return"/top.jsp";
    }

    /**
     * 根据用户ID删除用户
     *
     * @param userId
     * @return
     */
    @RequestMapping("delete")
    public String deleteUser(@RequestParam("user_id") int userId) {
        int rows = userService.deleteUser(userId);
        //重定向到删除结果的页面
        return "redirect:/user/delete_user_result.jsp?rows=" + rows;
    }

    /**
     * 查看详细信息
     *
     * @return
     */
    @RequestMapping("info")
    public String showInfo(@RequestParam("user_id") int userId, Model model) {
        User user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "/user/info.jsp";
    }

    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    @RequestMapping("add")
    public String addUser(User user) {
        int rows = userService.insertUser(user);
        return "redirect:/user/info?rows=" + rows;
    }

    /**
     * 加载用户数据
     * http://localhost:8080/user/load_one?user_id=4
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "load_one", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> loadUserData(@RequestParam("user_id") int userId,HttpServletRequest request) {
        User user = userService.getUser(userId);
        String username=request.getParameter("username");
        User users = userService.queryUser(username);
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("user", user);
        return dataMap;
    }

    /**
     * 修改用户
     *
     * @param user
     * @return
     */
    @RequestMapping("update")
    public String updateUser(User user) {
        int rows =userService.updateUser(user);
        return "redirect:/user/update_user_result.jsp?rows="+rows;
    }

}
