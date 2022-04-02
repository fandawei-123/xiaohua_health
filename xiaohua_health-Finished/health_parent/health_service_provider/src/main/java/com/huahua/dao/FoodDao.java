package com.huahua.dao;


import com.github.pagehelper.Page;
import com.huahua.pojo.Food;

import java.util.List;

/**
 * @author Huahua
 */
public interface FoodDao {
    Page<Food> selectByCondition(String queryString);

    void add(Food food);

    Food findById(Integer id);

    void delete(Integer id);

    void edit(Food food);

    Integer findCountByFoodName(Food food);

    List<Food> findAll();

    int findIdByFoodName(String name);

}
