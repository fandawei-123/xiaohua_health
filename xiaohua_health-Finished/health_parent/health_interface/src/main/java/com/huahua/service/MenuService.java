package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Menu;
import com.huahua.pojo.Role;

import java.util.List;
import java.util.Map;

/**
 * @author Huahua
 */
public interface MenuService {


    PageResult findPage(QueryPageBean queryPageBean);

    List<Map<String, Integer>> findAllMenu();

    List<Menu> findByNameAndLkurl(String name, String linkUrl);

    void add(Menu menu);

    Menu findById(Integer id);

    void edit(Menu menu);

    List<Role> findRoleBymid(Integer id);

    Menu findmenuById(Integer id);

    void delete(Integer id);
}
