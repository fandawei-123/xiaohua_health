package com.huahua.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.entity.Result;
import com.huahua.pojo.Food;
import com.huahua.service.FoodService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 饮食管理后台
 * @author Huahua
 */
@RestController
@RequestMapping("/food")
public class FoodController {
    @Reference
    private FoodService foodService;



    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    @PreAuthorize("hasAuthority('FOOD_QUERY')")
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return foodService.findPage(queryPageBean);
    }


    /**
     * 新增饮食
     * @param food
     * @return
     */
    @PreAuthorize("hasAuthority('FOOD_ADD')")
    @RequestMapping("/addFood")
    public Result addFood(@RequestBody Food food) {
        try {
            foodService.add(food);
            return new Result(true, "新增饮食成功！");//新增饮食成功
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "新增饮食失败！");//新增饮食失败
        }
    }


    /**
     * 根据id查询饮食 实现数据回显
     * @param id
     * @return
     */
    @RequestMapping("/findFoodById")
    public Result findFoodById(Integer id) {
        try {
            Food food = foodService.findById(id);
            return new Result(true, "所选饮食数据回显成功！", food);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"所选饮食数据回显失败！");
        }
    }


    /**
     * 修改
     * @param food
     * @return
     */
    @PreAuthorize("hasAuthority('FOOD_EDIT')")
    @RequestMapping("/edit")
    public Result edit(@RequestBody Food food) {
        try {
            foodService.edit(food);
            return new Result(true, "修改饮食成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改饮食失败！");
        }
    }


    /**
     * 删除
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('FOOD_DELETE')")
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            foodService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除饮食成功！");
        }
        return new Result(true, "删除饮食失败！");
    }


    /**
     * 查询所有饮食信息
     * @return
     */
    @RequestMapping("/findAllFood")
    public Result findAllFood() {
        try {
            List<Food> list = foodService.findAll();
            return new Result(true, "查询全部饮食成功！", list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询全部饮食失败！");
        }
    }
}
