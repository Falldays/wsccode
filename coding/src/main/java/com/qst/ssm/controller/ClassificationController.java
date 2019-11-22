package com.qst.ssm.controller;

import com.qst.ssm.entity.Two;
import com.qst.ssm.service.IClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
//    @RequestMapping(value = "queryThreeClassification")
//    public String queryThreeClassification(HttpServletRequest request, Model model) {
//        List<Map> twoClassificationListBy = classificationService.queryTwoClassification();
//        List<Map> oneClassificationList = classificationService.queryClassification();
//        model.addAttribute("twoClassificationListBy",twoClassificationListBy);
//        model.addAttribute("oneClassificationList",oneClassificationList);
//        return "/classification/twoClassification.jsp";
//    }
    /**
     * 查询全部一级分类信息
     *
     * @return
     */
    @RequestMapping(value = "load_two")
    public Map<String, Object> load_two(@RequestParam("oneId") int oneId) {
        List<Two> twoList = classificationService.queryClassificationByTwo(oneId);
        Map<String, Object> twoMap = new HashMap<>();
        twoMap.put("twos",twoList);
        return twoMap;
    }

}
