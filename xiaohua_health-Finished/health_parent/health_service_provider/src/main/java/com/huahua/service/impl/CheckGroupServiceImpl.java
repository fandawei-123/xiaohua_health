package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huahua.dao.CheckGroupDao;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.CheckGroup;
import com.huahua.service.CheckGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Huahua
 */
@Service(interfaceClass = CheckGroupService.class)
@Transactional(rollbackFor = Exception.class)
public class CheckGroupServiceImpl implements CheckGroupService {
    @Autowired
    private CheckGroupDao checkGroupDao;

    /**
     * 新增功能
     * @param checkGroup
     * @param checkitemIds
     */
    @Override
    public void add(CheckGroup checkGroup, Integer[] checkitemIds) {
        //新增检查组
        checkGroupDao.add(checkGroup);
        //获取检查组id
        Integer groupId = checkGroup.getId();
        //调用新增关联关系方法
        this.setCheckGroupIdAndCheckItemId(groupId,checkitemIds);
    }


    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取当前页，总页数，条件查询的参数
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        //启动分页插件
        PageHelper.startPage(currentPage,pageSize);
        //调用持久层查询所有
        Page<CheckGroup> page=checkGroupDao.selectByCondition(queryString);
        //获取总条目数
        long total = page.getTotal();
        //获取查询结果
        List<CheckGroup> rows = page.getResult();
        return new PageResult(total,rows);
    }


    /**
     * 根据id查询
     * @param checkgroupId
     * @return
     */
    @Override
    public CheckGroup findById(Integer checkgroupId) {
        return checkGroupDao.findById(checkgroupId);
    }


    /**
     * 根据检查组id查询其所关联的检查项的id
     * @param checkgroupId
     * @return
     */
    @Override
    public List<Integer> findCheckitemIdsByCheckgroupId(Integer checkgroupId) {
        return checkGroupDao.findCheckitemIdsByCheckgroupId(checkgroupId);
    }


    /**
     * 编辑
     * @param checkGroup
     * @param checkitemIds
     */
    @Override
    public void edit(CheckGroup checkGroup, Integer[] checkitemIds) {
        //修改检查组
        checkGroupDao.edit(checkGroup);
        //获取检查组id
        Integer groupId = checkGroup.getId();
        //清理关联关系
        checkGroupDao.clear(groupId);
        //重新插入关联关系
        this.setCheckGroupIdAndCheckItemId(groupId,checkitemIds);
    }


    /**
     * 删除
     * @param id
     */
    @Override
    public void delete(Integer id) {
        //先删除关联关系
        checkGroupDao.clear(id);
        //再删除检查组
        checkGroupDao.delete(id);
    }


    /**
     * 不带分页的查询所有
     * @return
     */
    @Override
    public List<CheckGroup> findAll() {
        return checkGroupDao.findAll();
    }


    /**
     * 抽取的新增关联关系的方法
     * @param groupId
     * @param checkitemIds
     */
    public void setCheckGroupIdAndCheckItemId(Integer groupId, Integer[] checkitemIds){
        //判断检查项ids数组是否为空
        if (checkitemIds!=null&&checkitemIds.length>0){
            //不为空则遍历数组，用map存储CheckItemId和CheckGroupId
            for (Integer checkitemId : checkitemIds) {
                Map map=new HashMap<>();
                map.put("checkgroupId",groupId);
                map.put("checkitemId",checkitemId);
                //新增关联关系
                checkGroupDao.setCheckGroupIdAndCheckItemId(map);
            }
        }
    }
}
