package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Menu;
import com.huahua.pojo.Permission;
import com.huahua.pojo.Role;
import com.huahua.pojo.User;

import java.util.List;
import java.util.Set;

/**
 * @author Huahua
 */
public interface RoleService {


    PageResult findPage(QueryPageBean queryPageBean);

    Set<Permission> findAllPermission();

    Set<Menu> findAllMenus();

    List<Role> findByName2Kd(String name, String keyword);

    void add(Integer[] permissionIds, Integer[] menuIds, Role role);

    List<Integer> findPermissionIdByrid(Integer rId);

    List<Integer> findMenuIdByrid(Integer rId);

    void edit(Integer[] permissionIds, Integer[] menuIds, Role role);

    Role findById(Integer id);

    Set<Permission> findPmByrId(Integer id);

    Set<Menu> findMnByrId(Integer id);

    List<User> findUsById(Integer id);

    void deleterole(Integer id);

    Set getMenuByRoleByUserName(String username);
}
