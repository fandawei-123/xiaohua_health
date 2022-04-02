package com.huahua.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.constant.MessageConstant;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.entity.Result;
import com.huahua.pojo.Menu;
import com.huahua.pojo.Permission;

import com.huahua.pojo.Role;
import com.huahua.pojo.User;
import com.huahua.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Huahua
 */
@RestController
@RequestMapping("/role")
public class RoleController {
    @Reference
    private RoleService roleService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;



    /**
     * 查询所有角色
     * @param queryPageBean
     * @return
     */
    @PreAuthorize("hasAuthority('ROLE_QUERY')")
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return roleService.findPage(queryPageBean);
    }


    /**
     * 查询所有的权限
     * @return
     */
    @RequestMapping("/findAllPermission")
    public Result findAllPermission() {
        try {
            Set<Permission> set = roleService.findAllPermission();
            return new Result(true, MessageConstant.GET_PERMISSION_SUCCESS, set);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_PERMISSION_FAIL);
        }
    }


    /**
     * 查询所有的菜单
     * @return
     */
    @RequestMapping("/findAllMenus")
    public Result findAllMenus() {
        try {
            Set<Menu> set = roleService.findAllMenus();
            return new Result(true, MessageConstant.QUERT_MENU_SUCCESS, set);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERT_MENU_FAIL);
        }
    }


    /**
     * 添加角色
     * @param permissionIds
     * @param menuIds
     * @param role
     * @return
     */
    @PreAuthorize("hasAuthority('ROLE_ADD')")
    @RequestMapping("/add")
    public Result add(Integer[] permissionIds, Integer[] menuIds, @RequestBody Role role) {
        try {

            if (role == null && role.getName() == null && role.getKeyword() == null) {
                return new Result(false, MessageConstant.ADD_ROLE_FAIL);
            }
            //判断当前角色名或者关键字是否存在，如果存在，添加失败
            List<Role> list = roleService.findByName2Kd(role.getName(), role.getKeyword());
            if (list.size() > 0) {
                return new Result(false, MessageConstant.ADD_ROLE_FAIL + "，角色名或关键字已存在");
            }
            //添加角色
            roleService.add(permissionIds, menuIds, role);
            return new Result(true, MessageConstant.ADD_ROLE_SUCCESS);
        } catch (Exception e) {
            return new Result(false, MessageConstant.ADD_ROLE_FAIL);
        }
    }


    /**
     * 通过角色id查找所有与角色有关的权限id
     * @param rId
     * @return
     */
    @RequestMapping("/findPermissionIdByrid")
    public Result findPermissionIdByrid(Integer rId) {
        try {
            List<Integer> permissionIds = roleService.findPermissionIdByrid(rId);
            return new Result(true, MessageConstant.GET_ROLE_SUCCESS, permissionIds);
        } catch (Exception e) {
            return new Result(false, MessageConstant.GET_ROLE_FAIL);
        }
    }


    /**
     * 通过角色id查找所有与角色有关的权限id
     * @param rId
     * @return
     */
    @RequestMapping("/findMenuIdByrid")
    public Result findMenuIdByrid(Integer rId) {
        try {
            List<Integer> menuIds = roleService.findMenuIdByrid(rId);
            return new Result(true, MessageConstant.GET_ROLE_SUCCESS, menuIds);
        } catch (Exception e) {
            return new Result(false, MessageConstant.GET_ROLE_FAIL);
        }
    }



    /**
     * 编辑角色
     * @param permissionIds
     * @param menuIds
     * @param role
     * @return
     */
    @PreAuthorize("hasAuthority('ROLE_EDIT')")
    @RequestMapping("/edit")
    public Result edit(Integer[] permissionIds, Integer[] menuIds, @RequestBody Role role) {
        try {
            if (role == null && role.getName() == null && role.getKeyword() == null) {
                return new Result(false, MessageConstant.EDIT_ROLE_FAIL);
            }
            //通过id查询当前角色的名字与关键字是否改变
            Role oldRole = roleService.findById(role.getId());
            if (oldRole==null){
                new Result(false, "大佬太秀了，教教我");
            }
            boolean nflag = (role.getName().equals(oldRole.getName())); //名字发生未发生改变为true
            boolean kflag = (role.getKeyword().equals(oldRole.getKeyword())); //关键字为发生改变为true
            List<Role> list = roleService.findByName2Kd(role.getName(), role.getKeyword());

            if (nflag && kflag) { //关键字、名字未发生改变
                if (list != null && list.size() > 1) {
                    return new Result(false, MessageConstant.EDIT_ROLE_FAIL + "，角色名或关键字已存在");
                }
            } else if (!nflag && !kflag) {//当角色名与关键字都发生改变
                //如果list有且容量大于等于1，则修改失败，角色名或关键字冲突
                if (list != null && list.size() >= 1) {
                    return new Result(false, MessageConstant.EDIT_ROLE_FAIL + "，角色名或关键字已存在");
                }
            } else {//当角色名与关键字只有1个发生改变
                if (list != null && list.size() > 1) {
                    return new Result(false, MessageConstant.EDIT_ROLE_FAIL + "，角色名或关键字已存在");
                }
            }
            roleService.edit(permissionIds, menuIds, role);
            return new Result(true, MessageConstant.EDIT_ROLE_SUCCESS);
        } catch (Exception e) {
            e.getStackTrace();
            return new Result(false, MessageConstant.EDIT_ROLE_FAIL);
        }
    }


    /**
     * 通过角色id查找所有的关联的用户
     * @param id
     * @return
     */
    @RequestMapping("/findUsById")
    public Result findUsById(Integer id) {

        try {
            List<User> userList = roleService.findUsById(id);
            if (userList != null && userList.size() > 0) {
                return new Result(true, userList.size() + "角色");
            }

            return new Result(false, MessageConstant.GET_USER_FAIL);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_USER_FAIL);
        }
    }


    /**
     * 删除角色
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('ROLE_DELETE')")
    @RequestMapping("/deleterole")
    public Result deleterole(Integer id) {
        try {
            roleService.deleterole(id);
            return new Result(true, MessageConstant.DELETE_ROLE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_ROLE_FAIL);
        }
    }

    /**
     *
     * @param request
     * @return
     */
    @RequestMapping("/getRoleByUserName")
    public Result getMenuByRoleByUserName(HttpServletRequest request){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        try {
            Set menus = roleService.getMenuByRoleByUserName(user.getUsername());
            return new Result(true, "查询成功",menus);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }

}
