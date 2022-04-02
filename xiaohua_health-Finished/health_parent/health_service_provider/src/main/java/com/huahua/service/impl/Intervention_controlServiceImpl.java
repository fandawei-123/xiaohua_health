package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huahua.dao.Intervention_controlDao;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Member;
import com.huahua.service.Intervention_controlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Huahua
 */
@Service(interfaceClass = Intervention_controlService.class)
@Transactional(rollbackFor = Exception.class)
public class Intervention_controlServiceImpl implements Intervention_controlService {
    @Autowired
    private Intervention_controlDao intervention_controlDao;

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
        Page<Member> page = intervention_controlDao.selectIntervenByCondition(queryString);
        long total = page.getTotal();
        List<Member> rows = page.getResult();

        return new PageResult(total,rows);
    }

}
