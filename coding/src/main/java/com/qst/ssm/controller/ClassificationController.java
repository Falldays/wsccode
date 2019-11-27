package com.qst.ssm.controller;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;
import com.qst.ssm.service.IClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品分类管理控制器类qqqqqqqqqqqq
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
     * 按id查询一级分类信息
     *
     * @return
     */
    @RequestMapping(value = "queryClassificationByOneId")
    public String queryClassificationByOneId(HttpServletRequest request, Model model, Integer oneId, String msg) {
        List<Map> oneClassificationListBy = classificationService.queryClassificationByOneId(oneId);
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("msg",msg);
        model.addAttribute("oneClassificationListBy",oneClassificationListBy);
        model.addAttribute("oneClassificationList",oneClassificationList);
        return "/classification/oneClassification.jsp";
    }

    /**
     * 加载一级分类，返回到添加二级分类页面
     *
     * @return
     */
    @RequestMapping(value = "addTwoLoadOne")
    public String addTwoLoadOne( Model model, Integer oneId, String msg) {
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("msg",msg);
        model.addAttribute("oneClassificationList",oneClassificationList);
        return "/classification/addTwo.jsp";
    }

    /**
     * 加载一级分类，返回到添加三级分类页面
     *
     * @return
     */
    @RequestMapping(value = "addThreeLoadOne")
    public String addThreeLoadOne( Model model, String msg) {
        List<Map> oneClassificationList = classificationService.queryClassification();
        Long oneId = (Long)oneClassificationList.get(0).get("claFid");
        System.out.println(oneId);
        Map<String,Object> map = new HashMap<>();
        map.put("oneId",oneId);
        List<Map> twoMap  = classificationService.queryTwoClassification(map);
        model.addAttribute("msg",msg);
        model.addAttribute("twoMap",twoMap);
        model.addAttribute("oneClassificationList",oneClassificationList);
        return "/classification/addThree.jsp";
    }

    /**
     * 查询二级分类信息
     *
     * @return
     */
    @RequestMapping(value = "queryTwoClassification")
    public String queryTwoClassification(HttpServletRequest request, Model model,Integer oneId,Integer twoId, String msg) {
        Map<String,Integer> map = new HashMap<>();
        map.put("oneId",oneId);
        map.put("twoId",twoId);
        List<Map> twoClassificationListBy = classificationService.queryTwoClassification(map);
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("twoClassificationListBy",twoClassificationListBy);
        model.addAttribute("oneClassificationList",oneClassificationList);
        model.addAttribute("msg",msg);
        return "/classification/twoClassification.jsp";
    }
    /**
     * 查询全部三级分类信息
     * @return
     */
    @RequestMapping(value = "queryThreeClassification")
    public String queryThreeClassification(HttpServletRequest request, Model model,Integer oneId,
                                           Integer twoId,Integer threeId, String msg) {
        Map<String,Integer> map = new HashMap<>();
        map.put("oneId",oneId);
        map.put("twoId",twoId);
        map.put("threeId",threeId);
        List<Map> threeClassificationListBy = classificationService.getClassification(map);
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("threeClassificationListBy",threeClassificationListBy);
        model.addAttribute("oneClassificationList",oneClassificationList);
        model.addAttribute("msg",msg);
        return "/classification/threeClassification.jsp";
    }
    /**
     * 加载二级分类信息
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
     * 加载三级分类信息
     *
     * @return
     */
    @RequestMapping(value = "load_three")
    @ResponseBody
    public Map<String, Object> load_three(@RequestParam("twoId") int twoId) {
        List<Three> threeListList = classificationService.queryClassificationByThree(twoId);
        Map<String, Object> threeMap = new HashMap<>();
        threeMap.put("threes",threeListList);
        return threeMap;
    }

    /**
     * 添加一级分类信息
     *
     * @return
     */
    @RequestMapping(value = "addOneClassification")
    public String addOneClassification(Classification classification, Model model, HttpServletResponse response) {
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
     * 添加二级分类信息
     *
     * @return
     */
    @RequestMapping(value = "addTwo")
    public String addTwo(Two two, Model model, HttpServletResponse response) {
        String href = null;
        List<Two> twoList  = classificationService.queryTwoByNoOrName(two);
        String msg;
        if (twoList.size()!=0){
            //存在编号或名称重复
            msg="添加失败，编号或名称已存在！";
            model.addAttribute("two",two);
            href = "/classification/addTwo.jsp";
        }else {
            int rows = classificationService.addClassificationByTwo(two);
            if (rows!=1){
                //出现异常，添加失败
                msg="发生异常，添加失败！";
                model.addAttribute("two",two);
                href = "/classification/addTwo.jsp";
            }else {
                msg="添加分类成功！";
                href = "redirect:/classification/queryTwoClassification";
            }
        }
        model.addAttribute("msg",msg);
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("oneClassificationList",oneClassificationList);
        return href;
    }

    /**
     * 添加三级分类信息
     *
     * @return
     */
    @RequestMapping(value = "addThree")
    public String addThree(Three three, Model model) {
        String href = null;
        List<Three> threeList  = classificationService.queryThreeByThreeNoOrThreeName(three);
        Two two = classificationService.queryTwoByTwoId(three.getPd_twoId());
        String msg;
        if (threeList.size()!=0){
            //存在编号或名称重复
            msg="添加失败，编号或名称已存在！";
            href = "/classification/addThree.jsp";
        }else {
            int rows = classificationService.addClassificationByThree(three);
            if (rows!=1){
                //出现异常，添加失败
                msg="发生异常，添加失败！";
                href = "/classification/addThree.jsp";
            }else {
                msg="添加分类成功！";
                href = "redirect:/classification/queryThreeClassification";
            }
        }
        model.addAttribute("msg",msg);
        model.addAttribute("two",two);
        model.addAttribute("three",three);
        Map<String,Object> map  = new HashMap<>();
        map.put("oneId",two.getClaFid());
        List<Map> twoMap = classificationService.queryTwoClassification(map);
        System.out.println(twoMap);
        model.addAttribute("twoMap",twoMap);
        List<Map> oneClassificationList = classificationService.queryClassification();
        model.addAttribute("oneClassificationList",oneClassificationList);
        return href;
    }

    /**
     * 加载某一级分类详细信息
     *
     * @return
     */
    @RequestMapping(value = "oneInfo")
    public String oneInfo(Integer oneId, Model model, HttpServletResponse response) {
        System.out.println(oneId);
        Classification classification01 = classificationService.queryOneClassificationByOneId(oneId);
        String msg=null;
        if (classification01==null){
            //加载数据异常
            msg="加载数据异常！";
        }else if (classification01.getClaNo()==null){
            msg="未加载到数据！";
        }
        model.addAttribute("msg",msg);
        model.addAttribute("cla",classification01);
        return "/classification/updateOne.jsp";
    }


    /**
     * 加载某二级分类详细信息
     *
     * @return
     */
    @RequestMapping(value = "twoInfo")
    public String twoInfo(Integer twoId, Model model, HttpServletResponse response) {
        Two two = classificationService.queryTwoByTwoId(twoId);
        Classification classification = classificationService.queryOneClassificationByOneId(two.getClaFid());
        String msg=null;
        if (two==null){
            //加载数据异常
            msg="加载数据异常！";
        }else if (two.getPd_twoNo()==null){
            msg="未加载到数据！";
        }
        model.addAttribute("msg",msg);
        model.addAttribute("two",two);
        model.addAttribute("cla",classification);
        return "/classification/updateTwo.jsp";
    }

    /**
     * 加载某三级分类详细信息
     *
     * @return
     */
    @RequestMapping(value = "threeInfo")
    public String threeInfo(Integer threeId, Model model) {
        Three three = classificationService.queryThreeByThreeId(threeId);
        Two two = classificationService.queryTwoByTwoId(three.getPd_twoId());
        Classification classification = classificationService.queryOneClassificationByOneId(two.getClaFid());
        String msg=null;
        if (three==null){
            //加载数据异常
            msg="加载数据异常！";
        }else if (three.getPd_threeNo()==null){
            msg="未加载到数据！";
        }
        model.addAttribute("msg",msg);
        model.addAttribute("two",two);
        model.addAttribute("cla",classification);
        model.addAttribute("three",three);
        return "/classification/updateThree.jsp";
    }

    /**
     * 修改一级分类
     * @param model
     * @param classification
     * @return
     */
    @RequestMapping(value = "updateOneClassification")
    public String updateOne(Model model, Classification classification) {
        List<Classification> classificationList= classificationService.queryOneClassificationByOneName(classification);
        if (classificationList.size()!=0){
            //存在重复名称
            model.addAttribute("msg","修改失败，该名称已存在!");
        }else {
            //不重复
            int rows = classificationService.updateOne(classification);
            if (rows==1){
                //修改成功
                model.addAttribute("msg","修改成功！");
            }else {
                //修改失败
                model.addAttribute("msg"," 出现异常，修改失败！");
            }
        }
        model.addAttribute("cla",classification);
        return "/classification/updateOne.jsp";
    }

    /**
     * 修改二级分类
     * @param model
     * @param two
     * @return
     */
    @RequestMapping(value = "updateTwo")
    public String updateTwo(Model model, Two two) {
        Two two1 = classificationService.queryTwoByOneIdAndTwoName(two);
        if (two1!=null) {
            //存在重复名称
            model.addAttribute("msg", "修改失败，该名称已存在!");
        } else {
            //不重复
            int rows = classificationService.updateTwo(two);
            if (rows == 1) {
                //修改成功
                model.addAttribute("msg", "修改成功！");
            } else {
                //修改失败
                model.addAttribute("msg", " 出现异常，修改失败！");
            }
        }
        Classification classification = classificationService.queryOneClassificationByOneId(two.getClaFid());
        model.addAttribute("two",two);
        model.addAttribute("cla", classification);
        return "/classification/updateTwo.jsp";
    }

    /**
     * 修改三级分类
     * @param model
     * @param three
     * @return
     */
    @RequestMapping(value = "updateThree")
    public String updateThree(Model model, Three three) {
        Three three1 = classificationService.queryThreeByTwoIdAndThreeName(three);
        if (three1!=null) {
            //存在重复名称
            model.addAttribute("msg", "修改失败，该名称已存在!");
        } else {
            //不重复
            int rows = classificationService.updateThree(three);
            if (rows == 1) {
                //修改成功
                model.addAttribute("msg", "修改成功！");
            } else {
                //修改失败
                model.addAttribute("msg", " 出现异常，修改失败！");
            }
        }
        Two two = classificationService.queryTwoByTwoId(three.getPd_twoId());
        Classification classification = classificationService.queryOneClassificationByOneId(two.getClaFid());
        model.addAttribute("two",two);
        model.addAttribute("cla", classification);
        model.addAttribute("three",three);
        return "/classification/updateThree.jsp";
    }

    /**
     * 根据一级分类ID删除该分类
     * @param model
     * @param oneId
     * @return
     */
    @RequestMapping(value = "deleteOne")
    public String deleteOne(Model model,Integer oneId) {
        int rows = classificationService.deleteClassificationByOne(oneId);
        return "redirect:/classification/delete_one_result.jsp?rows="+rows;
    }


    /**
     * 根据二级分类ID删除该分类
     * @param model
     * @param twoId
     * @return
     */
    @RequestMapping(value = "deleteTwo")
    public String deleteTwo(Model model,Integer twoId) {
        int rows = classificationService.deleteClassificationByTwo(twoId);
        return "redirect:/classification/delete_two_result.jsp?rows="+rows;
    }

    /**
     * 根据三级分类ID删除该分类
     * @param model
     * @param threeId
     * @return
     */
    @RequestMapping(value = "deleteThree")
    public String deleteThree(Model model,Integer threeId) {
        int rows = classificationService.deleteClassificationByThree(threeId);
        return "redirect:/classification/delete_three_result.jsp?rows="+rows;
    }

}
