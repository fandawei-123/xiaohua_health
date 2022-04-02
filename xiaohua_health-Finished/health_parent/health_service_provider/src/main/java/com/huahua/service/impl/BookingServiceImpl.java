package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huahua.dao.BookingDao;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Booking;
import com.huahua.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * @author Huahua
 */
@Service(interfaceClass = BookingService.class)
@Transactional(rollbackFor = Exception.class)
public class BookingServiceImpl implements BookingService {
    @Autowired
    private BookingDao bookingDao;

    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        //查询规则
        String queryString = queryPageBean.getQueryString();
        PageHelper.startPage(currentPage,pageSize);
        Page<Booking> page = bookingDao.findPage(queryString);
        //查询的总条数
        long total = page.getTotal();
        //查询的当前页的集合
        List<Booking> result = page.getResult();
        return new PageResult(total,result);
    }
}
