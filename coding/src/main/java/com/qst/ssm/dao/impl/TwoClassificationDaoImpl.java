package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IClassificationDao;
import com.qst.ssm.dao.ITwoClassificationDao;
import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;
import com.qst.ssm.mapper.ClassificationMapper;
import com.qst.ssm.mapper.TwoClassificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 商品分类Dao接口实现类
 * author：lbs
 */
@Repository("twoClassificationDao")
public class TwoClassificationDaoImpl implements ITwoClassificationDao {

    @Autowired
    @Qualifier("twoClassificationMapper")
    private TwoClassificationMapper twoClassificationMapper;

    /**
     * 根据一级分类ID查询所有二级分类信息
     * @return
     */
    @Override
    public List<Two> queryClassificationByTwo(Integer oneId) {
        return twoClassificationMapper.queryClassificationByTwo(oneId);
    }

    /**
     * 查询二级分类信息，包括一级名、三级数量
     * @return
     */
    @Override
    public List<Map> queryTwoClassification(Map map) {
        return twoClassificationMapper.queryTwoClassification(map);
    }

    /**
     * 根据二级编号或名称查询二级信息
     * @param two
     * @return
     */
    @Override
    public List<Two> queryTwoByNoOrName(Two two) {
        return twoClassificationMapper.queryTwoByNoOrName(two);
    }

    /**
     * 根据二级id查询二级分类信息
     * @param twoId
     * @return
     */
    @Override
    public Two queryTwoByTwoId(Integer twoId) {
        return twoClassificationMapper.queryTwoByTwoId(twoId);
    }

    /**
     * 根据一级id和二级名称查询二级分类信息
     * @param two
     * @return
     */
    @Override
    public Two queryTwoByOneIdAndTwoName(Two two) {
        return twoClassificationMapper.queryTwoByOneIdAndTwoName(two);
    }


    /**
     * 添加二级商品分类
     * @param two    二级商品分类信息
     * @return  影响行数
     */
    @Override
    public Integer addClassificationByTwo(Two two) {
        return twoClassificationMapper.addClassificationByTwo(two);
    }

    /**
     * 修改二级分类
     * @param two
     * @return
     */
    @Override
    public int updateTwo(Two two) {
        return twoClassificationMapper.updateTwo(two);
    }


    /**
     * 根据二级分类id删除该二级分类
     * @param twoId 二级分类ID
     * @return 影响行数
     */
    @Override
    public Integer deleteClassificationByTwo(Integer twoId) {
        return twoClassificationMapper.deleteClassificationByTwo(twoId);
    }


}
