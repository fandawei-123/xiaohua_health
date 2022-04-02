package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Food;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @author Huahua
 */
public interface FoodService {
    public Food findById(Integer id);

    public PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    void add(Food food);

    void delete(Integer id);

    void edit(Food food);


    List<Food> findAll();

}
