package com.huahua.dao;

import com.github.pagehelper.Page;
import com.huahua.pojo.Member;

public interface Intervention_controlDao {
    //分页查询
    Page<Member> selectIntervenByCondition(String queryString);
}
