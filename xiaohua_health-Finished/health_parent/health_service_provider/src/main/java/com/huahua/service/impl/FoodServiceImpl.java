package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.huahua.dao.FoodDao;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Food;
import com.huahua.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 饮食管理
 * @author Huahua
 */
@Service(interfaceClass = FoodService.class)
@Transactional(rollbackFor = Exception.class)
public class FoodServiceImpl implements FoodService {
    @Autowired
    private FoodDao foodDao;



    /**
     * 分页查询食品库
     * @param queryPageBean
     * @return
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<Food> page = foodDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<Food> rows = page.getResult();

        return new PageResult(total,rows);
    }


    /**
     * 新增饮食管理
     * @param food
     */
    public void add(Food food) {
        foodDao.add(food);
    }


    /**
     * 根据id查询 - 实现数据回显
     * @param id
     * @return
     */
    public Food findById(Integer id) {
        return foodDao.findById(id);
    }


    /**
     * 删除
     * @param id
     */
    public void delete(Integer id) {
        foodDao.delete(id);
    }


    /**
     * 更新
     * @param food
     */
    public void edit(Food food) {
        foodDao.edit(food);
    }


    /**
     * 查找全部
     * @return
     */
    public List<Food> findAll() {
        return foodDao.findAll();
    }
}
