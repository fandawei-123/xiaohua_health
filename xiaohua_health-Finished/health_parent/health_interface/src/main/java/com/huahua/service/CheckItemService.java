package com.huahua.service;

import com.huahua.entity.CheckItemDeleteException;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.CheckItem;

import java.util.List;

/**
 * @author Huahua
 */
public interface CheckItemService {
    //新增功能
    void add(CheckItem checkItem);
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);
    //根据id删除
    void deltetByid(Integer id) throws CheckItemDeleteException;
    //编辑
    void edit(CheckItem checkItem);
    //不带分页的查询所有
    List<CheckItem> findAll();
}
