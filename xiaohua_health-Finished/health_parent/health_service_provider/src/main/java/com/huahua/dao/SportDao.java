package com.huahua.dao;

import com.github.pagehelper.Page;
import com.huahua.pojo.Sport;

import java.util.List;

/**
 * @author Huahua
 */
public interface SportDao {
    Page<Sport> selectByCondition(String queryString);

    void add(Sport sport);

    Sport findById(Integer id);

    void edit(Sport sport);

    void delete(Integer id);

    List<Sport> findAll();

    int findCountSportName(Sport sport);

    int findIdBySportName(String name);
}
