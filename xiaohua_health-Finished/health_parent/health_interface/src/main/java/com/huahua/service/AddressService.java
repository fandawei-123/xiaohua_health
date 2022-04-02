package com.huahua.service;

import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Address;

import java.util.List;

/**
 * @author Huahua
 */
public interface AddressService {
    PageResult findPage(QueryPageBean queryPageBean);

    void add(Address address);

    long findByAddressId(Integer id);

    void edit(Address address);

    void delete(Integer id);

    Address findUpdate(Integer id);

    List<Address> findAll();

    Address findById(Integer addressId);

    Address getByMemberId(Integer id);
}
