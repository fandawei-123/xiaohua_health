package com.huahua.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.entity.Result;
import com.huahua.pojo.Sport;
import com.huahua.service.SportService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

;

/**
 * 运动管理后台
 * @author Huahua
 */
@RestController
@RequestMapping("/sport")
public class SportController {
    @Reference
    private SportService sportService;



    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    @PreAuthorize("hasAuthority('SPORT_QUERY')")
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return sportService.findPage(queryPageBean);
    }


    /**
     * 新增运动管理
     * @param sport
     * @return
     */
    @PreAuthorize("hasAuthority('SPORT_ADD')")
    @RequestMapping("/addSport")
    public Result addSport(@RequestBody Sport sport) {
        try {
            sportService.add(sport);
            return new Result(true, "新增运动成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "新增运动失败！");
        }
    }


    /**
     * 根据id实现数据回显
     * @param id
     * @return
     */
    @RequestMapping("/findSportById")
    public Result findSportById(Integer id) {
        try {
            Sport sport = sportService.findById(id);
            return new Result(true, "所选运动数据回显成功！",sport);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "所选运动数据回显失败！");
        }
    }


    /**
     * 修改
     * @param sport
     * @return
     */
    @PreAuthorize("hasAuthority('SPORT_EDIT')")
    @RequestMapping("/edit")
    public Result edit(@RequestBody Sport sport) {
        try {
            sportService.edit(sport);
            return new Result(true, "修改运动成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改运动失败！");
        }
    }



    /**
     * 删除
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('SPORT_DELETE')")
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            sportService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除运动成功！");
        }
        return new Result(true,"删除运动失败！");
    }


    /**
     * 查询所有运动信息
     * @return
     */
    @RequestMapping("/findAllSport")
    public Result findAllSport() {
        try {
            List<Sport> list = sportService.findAll();
            return new Result(true, "查询全部运动成功！",list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false,"查询全部运动失败！");
        }
    }
}
