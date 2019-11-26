package com.qst.ssm.dao.impl;

import com.qst.ssm.dao.IClassificationDao;
import com.qst.ssm.dao.IThreeClassificationDao;
import com.qst.ssm.entity.Classification;
import com.qst.ssm.entity.Three;
import com.qst.ssm.entity.Two;
import com.qst.ssm.mapper.ClassificationMapper;
import com.qst.ssm.mapper.ThreeClassificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 商品分类Dao接口实现类
 * author：lbs
 */
@Repository("threeClassificationDao")
public class ThreeClassificationDaoImpl implements IThreeClassificationDao {

    @Autowired
    @Qualifier("threeClassificationMapper")
    private ThreeClassificationMapper threeClassificationMapper;

    /**
     * 根据二级分类ID查询所有三级分类信息
     * @return
     */
    @Override
    public List<Three> queryClassificationByThree(Integer twoId) {
        return threeClassificationMapper.queryClassificationByThree(twoId);
    }

    /**
     * 根据三级分类ID查询一个三级分类信息
     * @return
     */
    @Override
    public Three queryThreeByThreeId(Integer threeId) {
        return threeClassificationMapper.queryThreeByThreeId(threeId);
    }

    /**
     * 根据二级id和三级名称查询三级分类信息
     * @param three
     * @return
     */
    @Override
    public Three queryThreeByTwoIdAndThreeName(Three three) {
        return threeClassificationMapper.queryThreeByTwoIdAndThreeName(three);
    }

    /**
     * 根据三级编号或三级名称查询三级信息
     * @param three
     * @return
     */
    @Override
    public List<Three> queryThreeByThreeNoOrThreeName(Three three) {
        return threeClassificationMapper.queryThreeByThreeNoOrThreeName(three);
    }

    /**
     * 添加三级商品分类
     * @param three    三级商品分类信息
     * @return  影响行数
     */
    @Override
    public Integer addClassificationByThree(Three three) {
        return threeClassificationMapper.addClassificationByThree(three);
    }

    /**
     * 根据三级分类id删除该三级分类
     * @param threeId 三级分类ID
     * @return 影响行数
     */
    @Override
    public Integer deleteClassificationByThree(Integer threeId) {
        return threeClassificationMapper.deleteClassificationByThree(threeId);
    }

    /**
     * 修改三级分类
     * @param three
     * @return
     */
    @Override
    public Integer updateThree(Three three) {
        return threeClassificationMapper.updateThree(three);
    }

    /**
     * 查询所有商品分类信息
     * @return
     */
    @Override
    public List<Map> getClassification(Map map) {
        return threeClassificationMapper.getClassification(map);
    }

    @Override
    public List<Map> getClassificationByType(Map<String,Object> map) {
        return threeClassificationMapper.getClassificationByType(map);
    }

}
