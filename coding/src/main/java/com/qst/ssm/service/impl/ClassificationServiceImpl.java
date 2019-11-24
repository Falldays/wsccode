package com.qst.ssm.service.impl;

import com.qst.ssm.dao.IClassificationDao;
import com.qst.ssm.dao.IThreeClassificationDao;
import com.qst.ssm.dao.ITwoClassificationDao;
import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;
import com.qst.ssm.service.IClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 商品分类服务类接口实现类
 * author：lbs
 */
@Service("classificationService")
public class ClassificationServiceImpl implements IClassificationService {

    @Autowired
    @Qualifier("classificationDao")
    private IClassificationDao classificationDao;

    @Autowired
    @Qualifier("threeClassificationDao")
    private IThreeClassificationDao threeClassificationDao;

    @Autowired
    @Qualifier("twoClassificationDao")
    private ITwoClassificationDao twoClassificationDao;

    /**
     * 查询所有的一级分类信息
     * @return
     */
    @Override
    public List<Map> queryClassification() {
        return classificationDao.queryClassification();
    }

    /**
     * 根据编号或名称查询一级分类
     * @param classification
     * @return
     */
    @Override
    public List<Classification> queryClassificationByNoOrName(Classification classification) {
        return classificationDao.queryClassificationByNoOrName(classification);
    }

    /**
     * 根据一级Id查询一级分类信息
     * @return
     */
    @Override
    public List<Map> queryClassificationByOneId(Integer oneId) {
        return classificationDao.queryClassificationByOneId(oneId);
    }

    /**
     * 根据一级分类ID查询所有二级分类信息
     * @return
     */
    @Override
    public List<Two> queryClassificationByTwo(Integer oneId) {
        return twoClassificationDao.queryClassificationByTwo(oneId);
    }

    /**
     * 查询所有二级分类信息，包括一级名、三级数量
     * @return
     */
    @Override
    public List<Map> queryTwoClassification() {
        return twoClassificationDao.queryTwoClassification();
    }

    /**
     * 根据二级分类ID查询所有三级分类信息
     * @return
     */
    @Override
    public List<Three> queryClassificationByThree(Integer twoId) {
        return threeClassificationDao.queryClassificationByThree(twoId);
    }

    /**
     * 查询所有商品分类信息
     * @return
     */
    @Override
    public List<Map> getClassification() {
        return threeClassificationDao.getClassification();
    }


    /**
     * 按分类级别查询所有商品分类信息
     * @return
     */
    @Override
    public List<Map> getClassificationByType(Map<String,Object> map) {
        return threeClassificationDao.getClassificationByType(map);
    }

    /**
     * 添加一级商品分类
     * @param classification    一级商品分类信息
     * @return  影响行数
     */
    @Override
    public Integer addClassificationByOne(Classification classification) {
        return classificationDao.addClassificationByOne(classification);
    }

    /**
     * 添加二级商品分类
     * @param two    二级商品分类信息
     * @return  影响行数
     */
    @Override
    public Integer addClassificationByTwo(Two two) {
        return twoClassificationDao.addClassificationByTwo(two);
    }

    /**
     * 添加三级商品分类
     * @param three    三级商品分类信息
     * @return  影响行数
     */
    @Override
    public Integer addClassificationByThree(Three three) {
        return threeClassificationDao.addClassificationByThree(three);
    }

    /**
     * 根据一级分类id删除该一级分类
     * @param oneId 一级分类ID
     * @return 影响行数
     */
    @Override
    public Integer deleteClassificationByOne(Integer oneId) {
        return classificationDao.deleteClassificationByOne(oneId);
    }

    /**
     * 根据二级分类id删除该二级分类
     * @param twoId 二级分类ID
     * @return 影响行数
     */
    @Override
    public Integer deleteClassificationByTwo(Integer twoId) {
        return twoClassificationDao.deleteClassificationByTwo(twoId);
    }

    /**
     * 根据三级分类id删除该三级分类
     * @param threeId 三级分类ID
     * @return 影响行数
     */
    @Override
    public Integer deleteClassificationByThree(Integer threeId) {
        return threeClassificationDao.deleteClassificationByThree(threeId);
    }
}
