package com.qst.ssm.controller;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Two;
import com.qst.ssm.service.IClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.InsufficientResourcesException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品分类管理控制器类
 * author: lbs
 */
@Controller
@RequestMapping("classification")
public class ClassificationController {

    @Autowired
    @Qualifier("classificationService")
    private IClassificationService classificationService;

    /**
     * 查询全部一级分类信息
     *
     * @return
     */
    @RequestMapping(value = "queryClassification")
    public String queryClassification(HttpServletRequest request, Model model) {
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("oneClassificationListBy",oneClassificationList);
        model.addAttribute("oneClassificationList",oneClassificationList);
        return "/classification/oneClassification.jsp";
    }

    /**
     * 查询全部一级分类信息
     *
     * @return
     */
    @RequestMapping(value = "queryClassificationByOneId")
    public String queryClassificationByOneId(HttpServletRequest request, Model model,Integer oneId) {
        List<Map> oneClassificationListBy = classificationService.queryClassificationByOneId(oneId);
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("oneClassificationListBy",oneClassificationListBy);
        model.addAttribute("oneClassificationList",oneClassificationList);
        return "/classification/oneClassification.jsp";
    }

    /**
     * 查询全部二级分类信息queryThreeClassification
     *
     * @return
     */
    @RequestMapping(value = "queryTwoClassification")
    public String queryTwoClassification(HttpServletRequest request, Model model) {
        List<Map> twoClassificationListBy = classificationService.queryTwoClassification();
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("twoClassificationListBy",twoClassificationListBy);
        model.addAttribute("oneClassificationList",oneClassificationList);
        return "/classification/twoClassification.jsp";
    }
    /**
     * 查询全部三级分类信息
     * @return
     */
    @RequestMapping(value = "queryThreeClassification")
    public String queryThreeClassification(HttpServletRequest request, Model model) {
        List<Map> threeClassificationListBy = classificationService.getClassification();
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("threeClassificationListBy",threeClassificationListBy);
        model.addAttribute("oneClassificationList",oneClassificationList);
        return "/classification/threeClassification.jsp";
    }
    /**
     * 查询全部一级分类信息
     *
     * @return
     */
    @RequestMapping(value = "load_two")
    @ResponseBody
    public Map<String, Object> load_two(HttpServletRequest request, HttpServletResponse response,@RequestParam("oneId") int oneId) {
        List<Two> twoList = classificationService.queryClassificationByTwo(oneId);
        Map<String, Object> twoMap = new HashMap<>();
        twoMap.put("twos",twoList);
        return twoMap;
    }

    /**
     * 添加一级分类信息
     *
     * @return
     */
    @RequestMapping(value = "addOneClassification")
    public String addOneClassification(Classification classification,Model model) {
        String href = null;
        List<Classification> classificationList  = classificationService.queryClassificationByNoOrName(classification);
        String msg;
        if (classificationList.size()!=0){
            //存在编号或名称重复
            msg="添加失败，编号或名称已存在！";
            model.addAttribute("cla",classification);
            href = "/classification/addOne.jsp";
        }else {
            int rows = classificationService.addClassificationByOne(classification);
            if (rows!=1){
                //出现异常，添加失败
                msg="发生异常，添加失败！";
                model.addAttribute("cla",classification);
                href = "/classification/addOne.jsp";
            }else {
                msg="添加分类成功！";
                href = "redirect:/classification/queryClassificationByOneId";
            }
        }
        model.addAttribute("msg",msg);
        return href;
    }


    /**
     * 根据一级分类ID删除该分类
     * @param model
     * @param oneId
     * @return
     */
    @RequestMapping(value = "deleteOneClassification")
    public String deleteOneClassification(Model model,Integer oneId) {
        int rows = classificationService.deleteClassificationByOne(oneId);
        if (rows==1){
            //删除成功
            model.addAttribute("msg","删除成功！");
        }else if (rows==0){
            //该分类不存在
            model.addAttribute("msg","该分类不存在，或已被删除！");
        }else {
            //发生异常
            model.addAttribute("msg","出现异常，删除分类失败！");
        }
        return "redirect:/classification/queryClassification";
    }

    /**
     * 根据一级分类ID删除该分类
     * @param model
     * @param oneId
     * @return
     */
    @RequestMapping(value = "deleteOneClassificationByOneId")
    public Integer deleteOneClassificationByOneId(Model model, Integer oneId) {
        return classificationService.deleteClassificationByOne(oneId);
    }

    /**
     * 根据二级分类ID删除该分类
     * @param model
     * @param twoId
     * @return
     */
    @RequestMapping(value = "deleteTwoClassification")
    public String deleteTwoClassification(Model model,Integer twoId) {
        int rows = classificationService.deleteClassificationByTwo(twoId);
        if (rows==1){
            //删除成功
            model.addAttribute("msg","删除成功！");
        }else if (rows==0){
            //该分类不存在
            model.addAttribute("msg","该分类不存在，或已被删除！");
        }else {
            //发生异常
            model.addAttribute("msg","出现异常，删除分类失败！");
        }
        return "redirect:/classification/queryTwoClassification";
    }

    /**
     * 根据三级分类ID删除该分类
     * @param model
     * @param threeId
     * @return
     */
    @RequestMapping(value = "deleteThreeClassification")
    public String deleteThreeClassification(Model model,Integer threeId) {
        int rows = classificationService.deleteClassificationByThree(threeId);
        if (rows==1){
            //删除成功
            model.addAttribute("msg","删除成功！");
        }else if (rows==0){
            //该分类不存在
            model.addAttribute("msg","该分类不存在，或已被删除！");
        }else {
            //发生异常
            model.addAttribute("msg","出现异常，删除分类失败！");
        }
        return "redirect:/classification/queryThreeClassification";
    }

}
