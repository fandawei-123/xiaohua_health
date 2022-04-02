package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Permission;
import com.huahua.pojo.Role;

import java.util.List;

/**
 * @author Huahua
 */
public interface PermissionService {

    PageResult findPage(QueryPageBean queryPageBean);

    void add(Permission permission);

    Permission findByPmName2KeyWord(String name, String keyword);

    void edit(Permission permission);

    List<Role> findRolesByPmId(Integer id);

    void delete(Integer id);

    List<Permission> findAllPermissionZF();
}
