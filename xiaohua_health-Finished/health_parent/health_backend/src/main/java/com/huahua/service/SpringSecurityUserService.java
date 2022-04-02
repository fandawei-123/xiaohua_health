package com.huahua.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.pojo.Permission;
import com.huahua.pojo.Role;
import com.huahua.pojo.User;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Huahua
 */
@Component
public class SpringSecurityUserService implements UserDetailsService {
    @Reference
    private UserService userService;

    /**
     * 根据用户名查询数据库获取用户信息
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user =userService.findByUsername(username);
        if (user==null){
            //用户名不存在
            return null;
        }
        Set<Role> roles = user.getRoles();
        List<SimpleGrantedAuthority> authorities=new ArrayList<>();
        if (roles!=null&&roles.size()>0){
            for (Role role : roles) {
                authorities.add(new SimpleGrantedAuthority(role.getKeyword()));
                Set<Permission> permissions = role.getPermissions();
                if (permissions!=null&&permissions.size()>0){
                    for (Permission permission : permissions) {
                        authorities.add(new SimpleGrantedAuthority(permission.getKeyword()));
                    }
                }
            }
        }
        return new org.springframework.security.core.userdetails.User(username,user.getPassword(),authorities);
    }


}
