package com.qst.ssm.controller;

import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Product;
import com.qst.ssm.entity.Two;
import com.qst.ssm.service.IProductSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("productSearch")
public class ProductSearchController {

    @Autowired
    @Qualifier("productSearchService")
    private IProductSearchService productSearchService;

    /**
     * 加载主页的数据
     * @return
     */
    @RequestMapping("loadMain")
    public String loadMain(Model model){
        List<Classification> classificationList = productSearchService.queryOne();
        List<Two> twoList = productSearchService.queryTwo();
        model.addAttribute("classificationList",classificationList);
        model.addAttribute("twoList",twoList);
        return "/userIndex.jsp";
    }

    /**
     * 加载主页的数据
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "loadFirst" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Map<String,Object> loadFirst(){
        Map<String,Integer> map = new HashMap<>();
        map.put("subscript",0);
        map.put("number",10);
        List<Product> productList1 = productSearchService.queryProductByRange(map);
        map.clear();
        map.put("subscript",10);
        map.put("number",15);
        List<Product> productList2 = productSearchService.queryProductByRange(map);
        map.clear();
        map.put("subscript",25);
        map.put("number",14);
        List<Product> productList3 = productSearchService.queryProductByRange(map);
        Map<String, Object> dataMap = new HashMap<>();
        List<Classification> classificationList = productSearchService.queryOne();
        List<Two> twoList = productSearchService.queryTwo();
        dataMap.put("productList1", productList1);
        dataMap.put("productList2", productList2);
        dataMap.put("productList3", productList3);
        dataMap.put("classificationList",classificationList);
        dataMap.put("twoList",twoList);
        return dataMap;
    }

    /**
     * 根据商品名称模糊查询商品信息
     * @return
     */
    @RequestMapping("productSearchByName")
    public String productSearchByName(Model model,String pdName){
        List<Product> productList = productSearchService.queryProductByName(pdName);
        System.out.println(productList);
        model.addAttribute("productList",productList);
        return "redirect:/userIndex.jsp";
    }

    /**
     * 根据一级分类和二级分类查询商品
     * @return
     */
    @RequestMapping("productSearchByOneOrTwo")
    public String productSearchByOneOrTwo(Model model,Integer oneId,Integer twoId){
        Map<String,Integer> map = new HashMap<>();
        map.put("oneId",oneId);
        map.put("twoId",twoId);
        List<Product> productList = productSearchService.queryProductByOneOrTwo(map);
        System.out.println(productList);
        model.addAttribute("productList",productList);
        return "redirect:/userIndex.jsp";
    }

    /**
     * 根据商品ID加载商品的数据
     * @return
     */
    @RequestMapping("productSearchByPdId")
    public String productSearchByPdId(Model model,Integer pdId){
        Product product = productSearchService.getProduct(pdId);
        System.out.println(product);
        model.addAttribute("product",product);
        return "redirect:/userIndex.jsp";
    }

}
