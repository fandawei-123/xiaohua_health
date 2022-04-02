package com.huahua.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.constant.MessageConstant;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.entity.Result;
import com.huahua.pojo.Member;
import com.huahua.service.MemberService;
import com.huahua.utils.DateUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * @author Huahua
 */
@RestController
@RequestMapping("/member")
public class MemberController {
    @Reference
    private MemberService memberService;

    /**
     * 分页查询
     *
     * @param queryPageBean
     * @return
     */
    @PreAuthorize("hasAuthority('MEMBER_QUERY')")
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
//        List<>memberService.findPage(queryPageBean)
        return memberService.findPage(queryPageBean);
    }

    /**
     * 查询健康管理师
     *
     * @return
     */
    @RequestMapping("/findHealthManager")
    public Result findHealthManager() {
        try {
            List<Map<String, Object>> list = memberService.findHealthManager();
            return new Result(true, MessageConstant.GET_USER_SUCCESS, list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_USER_FAIL);
        }
    }

    /**
     * 添加会员 注意传输数据类型
     *
     * @return
     */
    @PreAuthorize("hasAuthority('MEMBER_ADD')")
    @RequestMapping("/addMember")
    public Result addMember(@RequestBody Member member) {
        System.out.println(member);
        //调用添加
        try {
            Date regTime = DateUtils.getToday();
            member.setRegTime(regTime);
            memberService.addMember(member);
            return new Result(true, MessageConstant.ADD_MEMBER_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_MEMBER_FAIL);
        }
    }


    /**
     * 根据id查询会员信息并回显
     *
     * @param memberId
     * @return
     */
    @RequestMapping("/findMemberById")
    public Result findMemberById(Integer memberId) {
        try {
            Member member = memberService.findMemberById(memberId);
            return new Result(true, MessageConstant.GET_MEMBER_SUCCESS, member);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_MEMBER_FAIL);
        }
    }

    /**
     * 修改会员信息
     *
     * @param member
     * @return
     */
    @PreAuthorize("hasAuthority('MEMBER_EDIT')")
    @RequestMapping("/editMember")
    public Result editMember(@RequestBody Member member) {
        try {
            memberService.editMember(member);
            return new Result(true, MessageConstant.EDIT_MEMBER_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_MEMBER_FAIL);
        }


    }

    /**
     * 根据id删除会员
     *
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('MEMBER_DELETE')")
    @RequestMapping("/deleteMember")
    public Result deleteMember(Integer id) {
        try {
            Result result = memberService.deleteMember(id);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_MEMBER_FAIL);
        }

    }


    /**
     * 将数据存入seioss域中
     *
     * @param request
     * @param list
     * @return
     */
    @RequestMapping("/findMemberByIds")
    public Result findMemberByIds(HttpServletRequest request, @RequestBody List<Member> list) {
        request.getSession().setAttribute("member", list);
        return new Result(true, "成功");
    }
}