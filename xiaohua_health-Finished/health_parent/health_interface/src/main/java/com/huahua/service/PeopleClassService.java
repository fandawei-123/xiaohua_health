package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;

/**
 * @author Huahua
 */
public interface PeopleClassService {
    PageResult findPage(QueryPageBean queryPageBean);
}
