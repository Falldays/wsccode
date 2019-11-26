package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IClassificationDao;
import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;
import com.qst.ssm.mapper.ClassificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 商品分类Dao接口实现类
 * author：lbs
 */
@Repository("classificationDao")
public class ClassificationDaoImpl implements IClassificationDao {

    @Autowired
    @Qualifier("classificationMapper")
    private ClassificationMapper classificationMapper;

    /**
     * 查询所有的一级分类信息
     * @return
     */
    @Override
    public List<Map> queryClassification() {
        return classificationMapper.queryClassification();
    }

    /**
     * 根据一级Id查询一级分类信息,包含二级数量
     * @return
     */
    @Override
    public List<Map> queryClassificationByOneId(Integer oneId) {
        return classificationMapper.queryClassificationByOneId(oneId);
    }

    /**
     * 根据一级Id查询一级分类信息
     * @return
     */
    @Override
    public Classification queryOneClassificationByOneId(Integer oneId) {
        return classificationMapper.queryOneClassificationByOneId(oneId);
    }

    /**
     * 根据一级名称查询一级分类信息
     * @return
     */
    @Override
    public List<Classification> queryOneClassificationByOneName(Classification classification) {
        return classificationMapper.queryOneClassificationByOneName(classification);
    }

    /**
     * 根据编号或名称查询一级分类
     * @param classification
     * @return
     */
    @Override
    public List<Classification> queryClassificationByNoOrName(Classification classification) {
        return classificationMapper.queryClassificationByNoOrName(classification);
    }


    /**
     * 添加一级商品分类
     * @param classification    一级商品分类信息
     * @return  影响行数
     */
    @Override
    public Integer addClassificationByOne(Classification classification) {
        return classificationMapper.addClassificationByOne(classification);
    }


    /**
     * 根据一级分类id删除该一级分类
     * @param oneId 一级分类ID
     * @return 影响行数
     */
    @Override
    public Integer deleteClassificationByOne(Integer oneId) {
        return classificationMapper.deleteClassificationByOne(oneId);
    }

    /**
     * 根据Id修改一级分类名称
     * @param classification
     * @return
     */
    @Override
    public int updateOne(Classification classification) {
        return classificationMapper.updateOne(classification);
    }


}
