package com.huahua.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.constant.MessageConstant;
import com.huahua.entity.CheckItemDeleteException;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.entity.Result;
import com.huahua.pojo.CheckItem;
import com.huahua.service.CheckItemService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Huahua
 */
@RestController
@RequestMapping("/checkitem")
public class CheckitemController {
    @Reference
    private CheckItemService checkItemService;


    /**
     * 新增
     * @param checkItem
     * @return
     */
    @PreAuthorize("hasAuthority('CHECKITEM_ADD')")//权限校验
    @RequestMapping("/add.do")
    public Result add(@RequestBody CheckItem checkItem) {
        try {
            checkItemService.add(checkItem);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.ADD_CHECKITEM_SUCCESS);
    }


    /**
     * 查询所有(分页查询)
     * @param queryPageBean
     * @return
     */
    @PreAuthorize("hasAuthority('CHECKITEM_QUERY')")//权限校验
    @RequestMapping("/findPage.do")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return checkItemService.findPage(queryPageBean);
    }


    /**
     * 根据id删除
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('CHECKITEM_DELETE')")//权限校验
    @RequestMapping("/delete.do")
    public Result deltetByid(Integer id) {
        try {
            checkItemService.deltetByid(id);
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof CheckItemDeleteException) {
                return new Result(false, "已经有检查组关联此检查项，请先输出相应的检查组");
            }
            return new Result(false, MessageConstant.DELETE_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.DELETE_CHECKITEM_SUCCESS);
    }

    /**
     * 编辑
     * @param checkItem
     * @return
     */
    @PreAuthorize("hasAuthority('CHECKITEM_EDIT')")//权限校验
    @RequestMapping("/edit.do")
    public Result edit(@RequestBody CheckItem checkItem) {
        try {
            checkItemService.edit(checkItem);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.EDIT_CHECKITEM_SUCCESS);
    }


    /**
     * 不带分页的查询所有
     * @return
     */
    @RequestMapping("/findAll.do")
    public Result findAll() {
        List<CheckItem> data = null;
        try {
            data = checkItemService.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.QUERY_CHECKITEM_SUCCESS, data);
    }
}
