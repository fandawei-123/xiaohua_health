package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huahua.dao.SportDao;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Sport;
import com.huahua.service.SportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 运动管理
 * @author Huahua
 */
@Service(interfaceClass = SportService.class)
@Transactional(rollbackFor = Exception.class)
public class SportServiceImpl implements SportService {
    @Autowired
    private SportDao sportDao;


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

        PageHelper.startPage(currentPage, pageSize);
        Page<Sport> page = sportDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<Sport> rows = page.getResult();

        return new PageResult(total, rows);
    }

    /**
     * 添加
     * @param sport
     */
    @Override
    public void add(Sport sport) {
        sportDao.add(sport);
    }

    /**
     *
     * @param id
     * @return
     */
    @Override
    public Sport findById(Integer id) {
        return sportDao.findById(id);
    }

    /**
     * 编辑
     * @param sport
     */
    @Override
    public void edit(Sport sport) {
        sportDao.edit(sport);
    }

    /**
     * 删除
     * @param id
     */
    @Override
    public void delete(Integer id) {
        sportDao.delete(id);
    }

    /**
     *
     * @return
     */
    @Override
    public List<Sport> findAll() {
        return sportDao.findAll();
    }

}
