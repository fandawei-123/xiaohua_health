package com.huahua.service;

import java.util.Map;

/**
 * @author Huahua
 */
public interface BusinessReportService {
    //运营数据统计
    Map<String, Object> getBusinessReportData() throws Exception;
}
