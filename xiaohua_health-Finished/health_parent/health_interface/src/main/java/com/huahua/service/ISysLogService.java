package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Syslog;

import java.text.ParseException;

/**
 * @author Huahua
 */
public interface ISysLogService {
    void saveLog(Syslog syslog); //保存日志

    PageResult findAll(QueryPageBean queryPageBean) throws ParseException;//查询所有日志

    void deleteById(String id);

    void deleteByIds(String[] id);
}
