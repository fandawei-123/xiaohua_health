package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author Huahua
 */
public interface Intervention_controlService {
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean);

}
