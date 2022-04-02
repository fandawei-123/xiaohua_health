package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huahua.dao.ISysLogDao;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Syslog;
import com.huahua.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Huahua
 */
@Service(interfaceClass = ISysLogService.class)
@Transactional(rollbackFor = Exception.class)
public class ISysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao iSysLogDao;

    /**
     * 保存日志
     * 当mysql数据库设置默认值时，如果使用insert插入会把字段为空的值也插入到数据库，所以数据库设置的默认值也没用
     * @param syslog
     */
    public void saveLog(Syslog syslog) {
        iSysLogDao.insert(syslog);
    }


    /**
     * 查找所有
     * @param queryPageBean
     * @return
     * @throws ParseException
     */
    public PageResult findAll(QueryPageBean queryPageBean) throws ParseException {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        PageHelper.startPage(currentPage, pageSize);
        Page<Syslog> page = iSysLogDao.selectAll(queryString);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Syslog syslog : page.getResult()) {
            Date visitTime = syslog.getVisitTime();
            String dateFormat = simpleDateFormat.format(syslog.getVisitTime());
            syslog.setVisitTime(simpleDateFormat.parse(dateFormat));
        }
        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 通过id删除
     *
     * @param id 日志id
     * @return 返回
     */
    public void deleteById(String id) {
        iSysLogDao.deleteById(id);
    }

    /**
     * 通过id批量删除
     *
     * @param list 日志集合
     */
    public void deleteByIds(String[] list) {
        if (list != null && list.length > 0) {
            for (String id : list) {
                iSysLogDao.deleteById(id);
            }
        }
    }


}
