package com.huahua.dao;

import com.github.pagehelper.Page;
import com.huahua.pojo.Booking;

public interface BookingDao {
    //分页查询预约信息
    Page<Booking> findPage(String queryString);
}
