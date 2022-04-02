package com.huahua.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.constant.MessageConstant;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.entity.Result;
import com.huahua.pojo.Menu;
import com.huahua.pojo.Role;
import com.huahua.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

/**
 * @author Huahua
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Reference
    private UserService userService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;




    /**
     * 获取登陆用户名提供校验
     * @return
     */
    @RequestMapping("/getUsername")
    public Result getUsername(){
        //获得当前登录用户的用户名
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user!=null) {
            String username = user.getUsername();
            return new Result(true, MessageConstant.GET_USERNAME_SUCCESS, username);
        }
        return new Result(false,MessageConstant.GET_USERNAME_FAIL);
    }

    /**
     * 查询当前角色的所有菜单
     * @return
     */
    @RequestMapping("/getAllMenus")
    public Result getAllMenus() {
        try {
            //springsecurity完成认证后，获取保存在安全框架中的user对象
            org.springframework.security.core.userdetails.User loginUser =
                    (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            //获取登录的用户名
            if (loginUser != null) {
                String username = loginUser.getUsername();

                com.huahua.pojo.User user = userService.findByUsername(username);

                user.setStation("1");
                userService.editUser(user);

                LinkedHashSet<Menu> menus = userService.getAllMenusById(user.getId());

                return new Result(true, MessageConstant.GET_USERNAME_SUCCESS, menus);
            }
            return new Result(false, MessageConstant.GET_USERNAME_FAIL);
        } catch (Exception e) {
            e.getStackTrace();
            return new Result(false, MessageConstant.GET_USERNAME_FAIL);
        }
    }

    /**
     * 查询所有用户
     * @param queryPageBean
     * @return
     */
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return userService.findPage(queryPageBean);
    }



    /**
     * 没有分页的查询全部角色
     * @return
     */
    @RequestMapping("/findAllRoles")
    public Result findAllRoles() {
        try {
            List<Role> list = userService.findAllRoles();
            return new Result(true, MessageConstant.GET_ROLE_SUCCESS, list);
        } catch (Exception e) {
            e.getStackTrace();
            return new Result(false, MessageConstant.GET_ROLE_FAIL);
        }
    }


    /**
     * 添加用户
     * @param roleIds
     * @param user
     * @return
     */
    @RequestMapping("/add")
    public Result add(Integer[] roleIds, @RequestBody com.huahua.pojo.User user) {
        try {
            if (user == null && user.getUsername() == null && user.getPassword() == null) {
                return new Result(false, MessageConstant.ADD_USER_FAIL);
            }

            //对密码进行加密处理
            String encode = passwordEncoder.encode(user.getPassword());
            user.setPassword(encode);

            //通过username查找是否有相同用户，如果有添加失败
            com.huahua.pojo.User oldUser = userService.findByUsername(user.getUsername());
            if (oldUser != null) {
                return new Result(false, "用户名已存在，请重新添加");
            }

            userService.add(roleIds, user);
            return new Result(true, MessageConstant.ADD_USER_SUCCESS);
        } catch (Exception e) {
            e.getStackTrace();
            return new Result(false, MessageConstant.ADD_USER_FAIL);
        }
    }


    /**
     * 单纯的修改用户的密码
     * @param map
     * @return
     */
    @RequestMapping("/changePassword")
    public Result changePassword(@RequestBody Map map) {
        try {
            //查询当前登录用户
            org.springframework.security.core.userdetails.User loginUser =
                    (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            //根据用户名查找当前用户
            com.huahua.pojo.User user = userService.findByUsername(loginUser.getUsername());

            String password = (String) map.get("password");
            String senPassword = (String) map.get("senPassword");

            if (password != null && password.equals(senPassword)) {
                user.setPassword(passwordEncoder.encode(password));
            }

            userService.upload(user);


            return new Result(true, "修改密码成功");
        } catch (Exception e) {
            return new Result(false, "修改密码失败");
        }
    }


    /**
     * 编辑用户
     * @param roleIds
     * @param user
     * @return
     */
    @RequestMapping("/edit")
    public Result edit(Integer[] roleIds, @RequestBody com.huahua.pojo.User user) {
        try {
            if (user == null && user.getUsername() == null && user.getPassword() == null) {
                return new Result(false, MessageConstant.EDIT_USER_FAIL);
            }
            //查询当前登录用户
            org.springframework.security.core.userdetails.User loginUser =
                    (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            //查询修改前的用户
            com.huahua.pojo.User oldUser = userService.findById(user.getId());

            if (oldUser==null){
                return new Result(false, MessageConstant.EDIT_USER_FAIL);
            }


            //如果用户名发生修改，编辑失败
            if (!oldUser.getUsername().equals(user.getUsername())) {
                return new Result(false, MessageConstant.EDIT_USER_FAIL + ",用户名无法被修改");
            }
            //判断用户密码是否发生改变，发生改变就对新密码进行加密处理
            if (!user.getPassword().equals(oldUser.getPassword())){
                String encode = passwordEncoder.encode(user.getPassword());
                user.setPassword(encode);
            }
            userService.edit(roleIds, user);
            return new Result(true, MessageConstant.EDIT_USER_SUCCESS);
        } catch (Exception e) {
            e.getStackTrace();
            return new Result(false, MessageConstant.EDIT_USER_FAIL);
        }
    }



    /**
     * 通过用户id查找所有与用户有关的角色id
     * @param uId
     * @return
     */
    @RequestMapping("/findRoleIdByUid")
    public Result findRoleIdByUid(Integer uId) {
        try {
            List<Integer> roleIds = userService.findRoleIdByUid(uId);
            return new Result(true, MessageConstant.GET_ROLE_SUCCESS, roleIds);
        } catch (Exception e) {
            e.getStackTrace();
            return new Result(false, MessageConstant.GET_ROLE_FAIL);
        }
    }


    /**
     * 删除角色
     * @param user
     * @return
     */
    @RequestMapping("/delete")
    public Result delete(@RequestBody com.huahua.pojo.User user) {
        try {
            //通过用户id删除用户
            //查询当前登录用户，如果用户是当前登录用户则无法删除
            org.springframework.security.core.userdetails.User loginUser =
                    (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (loginUser.getUsername().equals(user.getUsername())) {
                return new Result(false, MessageConstant.DELETE_USER_FAIL + ",当前登录用户无法被删除");
            }
            userService.delete(user);
            return new Result(true, MessageConstant.DELETE_USER_SUCCESS);
        } catch (Exception e) {
            e.getStackTrace();
            return new Result(false, MessageConstant.DELETE_USER_FAIL);
        }
    }



    /**
     * 用户退出
     */
    @RequestMapping("/quit")
    public void quit(){
        org.springframework.security.core.userdetails.User loginUser =
                (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        com.huahua.pojo.User user = userService.findByUsername(loginUser.getUsername());
        user.setStation("0");
        userService.editUser(user);
    }
}
