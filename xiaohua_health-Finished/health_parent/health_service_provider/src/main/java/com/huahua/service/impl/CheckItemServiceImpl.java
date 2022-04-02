package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huahua.dao.CheckItemDao;
import com.huahua.entity.CheckItemDeleteException;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.CheckItem;
import com.huahua.service.CheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Huahua
 */
@Service(interfaceClass = CheckItemService.class)
@Transactional(rollbackFor = Exception.class)
public class CheckItemServiceImpl implements CheckItemService {
    @Autowired
    private CheckItemDao checkItemDao;

    /**
     * 新增功能
     * @param checkItem
     */
    @Override
    public void add(CheckItem checkItem) {
       checkItemDao.add(checkItem);
    }


    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        //使用分页插件分页查询
        PageHelper.startPage(currentPage,pageSize);
        //调用持久层查询所有
        Page<CheckItem> page = checkItemDao.selectByCondition(queryString);
        //获取总共查询到的条目数
        long total = page.getTotal();
        //获取查询结果
        List<CheckItem> rows = page.getResult();
        return new PageResult(total,rows);
    }


    /**
     * 根据id删除
     * @param id
     * @throws CheckItemDeleteException
     */
    @Override
    public void deltetByid(Integer id) throws CheckItemDeleteException {
        //先查询有无关联关系
        long count=checkItemDao.findCountCheckItemID(id);
        //如何有关联关系不进行删除操作
        if (count>0){
            throw new CheckItemDeleteException();
        }
        //如果没有关联关系直接执行删除操作
        checkItemDao.deltetByid(id);
    }


    /**
     * 编辑
     * @param checkItem
     */
    @Override
    public void edit(CheckItem checkItem) {
        checkItemDao.edit(checkItem);
    }


    /**
     * 不带分页的查询所有
     * @return
     */
    @Override
    public List<CheckItem> findAll() {
        return checkItemDao.findAll();
    }

}
