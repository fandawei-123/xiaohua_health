package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;

/**
 * @author Huahua
 */
public interface BookingService {
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);

}
