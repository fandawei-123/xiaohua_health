package com.huahua.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.entity.Conditions;
import com.huahua.entity.Result;
import com.huahua.pojo.Order;
import com.huahua.service.OrderService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author Huahua
 */
@RestController
@RequestMapping("/order")
public class OrderController {
    @Reference
    private OrderService orderService;


    /**
     * 分页查询
     *
     * @param conditions
     * @return
     */
    @PreAuthorize("hasAuthority('ORDER_QUERY')")
    @RequestMapping("/findByPageAndCondition")
    public Result findByPageAndCondition(@RequestBody Conditions conditions) {
        if (conditions.getQueryString() != null) {
            return new Result(true, "查询成功", orderService.findByPhoneOrName(conditions.getQueryString()) );
        }
        return new Result(true, "查询成功", orderService.findByPageAndCondition(conditions));
    }


    /**
     * 编辑操作，先查询点击对象的id
     *
     * @param id
     * @return
     */
    @RequestMapping("/findOrderById")
    public Result findOrderById(Integer id) {
        try {
            Map map = orderService.findOrderById(id);
            return new Result(true, "查询成功", map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }


    /**
     * 通过订单id查询套餐idq
     *
     * @param id
     * @return
     */
    @RequestMapping("/findSetmealIdsByOrderId")
    public Result findSetmealIdsByOrderId(Integer id) {
        try {
            List<Integer> setmealIds = orderService.findSetmealIdsByOrderId(id);
            return new Result(true, "查询成功", setmealIds);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }


    /**
     * 保存编辑后的数据
     *
     * @param setmealId
     * @param map
     * @return
     */
    @PreAuthorize("hasAuthority('ORDER_EDIT')")
    @RequestMapping("/edit")
    public Result edit(Integer setmealId, @RequestBody Map map) {
        try {
            orderService.edit(setmealId, map);
            return new Result(true, "编辑成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "编辑失败");
        }
    }


    /**
     * 删除预约
     *
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('ORDER_DELETE')")
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            orderService.delete(id);
            return new Result(true, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除失败");
        }
    }


    /**
     * 新增预约
     *
     * @param map
     * @return
     * @throws Exception
     */
    @PreAuthorize("hasAuthority('ORDER_BY_TELEPHONE')")
    @RequestMapping("/addPhoneOrder")
    public Result addPhoneOrder(@RequestBody Map map) throws Exception {
        map.put("orderType", Order.ORDERTYPE_TELEPHONE);
        return orderService.addPhoneOrder(map);
    }


    /**
     * 修改预约状态
     *
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('STATUS_EDIT')")
    @RequestMapping("/statusEdit")
    public Result statusEdit(Integer id) {
        try {
            orderService.statusEdit(id);
            return new Result(true, "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改失败");
        }
    }

    /**
     * 根据用户id查询健康干预信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/findSuggestionById")
    public Result findSuggestionById(Integer id) {
        try {
            Map<String, Object> result = orderService.findSuggestionById(id);
            return new Result(true, "查询成功", result);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }
}
