package com.huahua.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.entity.Result;
import com.huahua.service.ISysLogService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;


/**
 * @author Huahua
 */
@RestController
@RequestMapping("/spuLog")
public class LogSpuController {
    @Reference
    private ISysLogService spuService;

    /**
     * 查询
     * @param queryPageBean
     * @return
     * @throws ParseException
     */
    @PreAuthorize("hasAuthority('SYSLOG_QUERY')")
    @RequestMapping("/findAll")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) throws ParseException {
        return spuService.findAll(queryPageBean);
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('SYSLOG_DELETE')")
    @RequestMapping("/deleteById")
    public Result deleteById(String id){
        try {
            spuService.deleteById(id);
            return new Result(true,"删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"删除失败");

        }
    }

    /**
     * 批量删除
     * @param list
     * @return
     */
    @PreAuthorize("hasAuthority('SYSLOG_DELETE')")
    @RequestMapping("/deleteByIds")
    public Result deleteByIds(@RequestBody String[] list){
        try {
            spuService.deleteByIds(list);
            return new Result(true,"批量删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"批量删除失败");

        }
    }
}
