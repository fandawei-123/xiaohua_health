package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.huahua.dao.AdviceDao;
import com.huahua.dao.FoodDao;
import com.huahua.dao.MemberDao;
import com.huahua.dao.SportDao;
import com.huahua.pojo.Food;
import com.huahua.pojo.Order;
import com.huahua.pojo.Sport;
import com.huahua.service.AdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Huahua
 */
@Service(interfaceClass = AdviceService.class)
@Transactional(rollbackFor = Exception.class)
public class AdviceServiceImpl implements AdviceService {
    @Autowired
    private AdviceDao adviceDao;
    @Autowired
    private FoodDao foodDao;
    @Autowired
    private SportDao sportDao;
    @Autowired
    private MemberDao memberDao;


    /**
     * 添加
     * tempOrderId:预约表中的id值 suggestion：健康师的建议
     *
     * @param tempOrderId
     * @param foodIds
     * @param sportIds
     * @param username
     * @param suggestion
     */
    public void add(Integer tempOrderId, Integer[] foodIds, Integer[] sportIds, String username, String suggestion) {
        String foodtemp = "";//定义一个food中间字符串接收 饮食的名称
        String sporttemp = "";//定义一个字符串接受 运动的id数组信息
        Order order = new Order();

        for (Integer foodId : foodIds) {
            Food food_name = foodDao.findById(foodId);//根据food的id值 获取到food
            String foodname = food_name.getFoodname();//获取food的名称属性
            foodtemp += foodname + ",";//苹果，葡萄，
        }
        if (foodtemp != null && !foodtemp.equals("")) {
            String food = foodtemp.substring(0, foodtemp.length() - 1);//去掉最后一个逗号 //苹果，葡萄
            order.setFood(food);
        }

        for (Integer sportId : sportIds) {
            Sport sport_name = sportDao.findById(sportId);//根据sport的id值 获取到sport
            String sportname = sport_name.getSportname();//获取sport的名称属性
            sporttemp += sportname + ",";//跑步，跳绳，
        }
        if (sporttemp != null && !sporttemp.equals("")) {
            String sport = sporttemp.substring(0, sporttemp.length() - 1);//跑步，跳绳
            order.setSport(sport);
        }


        order.setId(tempOrderId);
        order.setHealthName(username);
        order.setSuggestion(suggestion);

        //把健康管理师 添加到会员表中
        memberDao.update(tempOrderId, username);//把管理师姓名添加到会员表中

        adviceDao.update(order);//把预约订单的id值 饮食 运动 健康管理师 建议 保存到Order表中

    }
}
