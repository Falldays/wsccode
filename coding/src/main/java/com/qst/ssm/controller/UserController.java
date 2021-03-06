package com.qst.ssm.controller;

import com.qst.ssm.entity.User;
import com.qst.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
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
    @RequestMapping("cxUser")
    public String cxUser(Model model){
        List<User> userList=userService.cxUser();
        model.addAttribute("userList",userList);
        return "/user/query_user.jsp";
    }
    @RequestMapping("xgUser")
    public String xgUser(Model model){
        List<User> userList=userService.cxUser();
        model.addAttribute("userList",userList);
        return "/user/query+update-user.jsp";
    }
    @RequestMapping("query")
    public String queryUser(Model model) {
        List<User> userList = userService.queryUser();
        model.addAttribute("userList",userList);
        return "/user/query_user.jsp";
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
        return "redirect:/user/add_user_result.jsp?rows=" + rows;
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
//        User users = userService.queryUser(username);
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

    /**
     * 用户登录
     * @param user
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(User user, Model model, HttpSession session){
        User user1 = userService.login(user);
        String href= null;
        if (user1==null){
            //出现异常
            model.addAttribute("msg","发生异常，请重新登录！");
              return "/user/userLogin.jsp";
        }else if (user1.getUserId()==null){
            //不存在
            model.addAttribute("msg","账号或密码错误，请重新登录！");
              return "/user/userLogin.jsp";
        }//else {
            //登录成功
            session.setAttribute("user",user1);
             return   "redirect:/userIndex.jsp";
       /* }
        model.addAttribute("msg","用户名或密码错误，请重新登录！");
        System.out.println("用户名或密码错误，请重新登录");
        return  href="/userLogin.jsp";*/
    }

    /**
     * 用户退出
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session)throws Exception{
        session.removeAttribute("userId");
        session.invalidate();
        return "redirect:/userIndex.jsp";
    }

}
