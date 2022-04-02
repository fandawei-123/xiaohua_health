package com.huahua.service;



import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Setmeal;

import java.util.List;
import java.util.Map;

/**
 * @author Huahua
 */
public interface SetmealService {
    //新增
    void add(Setmeal setmeal, Integer[] checkgroupIds);
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);
    //查询所有套餐
    List<Setmeal> findAll();
    //根据id查询套餐数据
    Setmeal findById(int id);
    //获取套餐预约占比
    List<Map<String, Object>> findSetmealCount();
    //根据检查组Id查询检查项Id
    List<String> findIdInMiddleTable(String setMealId);
    //编辑套餐
    void edit(Setmeal setmeal, Integer[] checkgroupIds, String tempImgId);
    //删除套餐
    void delete(Integer setMealId, String imgId);
    //不带分页的查询所有
    List<Setmeal> findAllSetmeal();
}
