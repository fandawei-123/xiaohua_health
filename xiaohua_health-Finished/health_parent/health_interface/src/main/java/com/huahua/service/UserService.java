package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Menu;
import com.huahua.pojo.Role;
import com.huahua.pojo.User;

import java.util.LinkedHashSet;
import java.util.List;

/**
 * @author Huahua
 */
public interface UserService {
    //根据用户名查询用户
    User findByUsername(String username);
    PageResult findPage(QueryPageBean queryPageBean);

    List<Role> findAllRoles();

    void add(Integer[] roleIds, User user);

    void edit(Integer[] roleIds, User user);

    List<Integer> findRoleIdByUid(Integer uId);

    void delete(User user);

    LinkedHashSet<Menu> getAllMenusById(Integer id);

    void upload(User user);

    User findById(Integer id);

    void editUser(User user);
}
