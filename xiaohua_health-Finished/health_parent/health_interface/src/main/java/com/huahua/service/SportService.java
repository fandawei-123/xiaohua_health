package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Sport;

import java.util.List;

/**
 * @author Huahua
 */
public interface SportService {
    PageResult findPage(QueryPageBean queryPageBean);

    void add(Sport sport);

    Sport findById(Integer id);

    void edit(Sport sport);

    void delete(Integer id);

    List<Sport> findAll();

}
