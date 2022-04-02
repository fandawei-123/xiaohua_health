package com.huahua.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huahua.dao.AddressDao;
import com.huahua.entity.PageResult;
import com.huahua.entity.QueryPageBean;
import com.huahua.pojo.Address;
import com.huahua.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @author Huahua
 */
@Service(interfaceClass = AddressService.class)
@Transactional()
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressDao AddressDao;


    /**
     * 分页查询所有机构信息功能
     * @param queryPageBean
     * @return com.huahua.entity.PageResult
     * @author JANME
     * @date 2020-09-22 19:03
     */
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取当前页的页码
        Integer currentPage = queryPageBean.getCurrentPage();
        //获取每页显示条目数
        Integer pageSize = queryPageBean.getPageSize();
        //获取查询条件
        String queryString = queryPageBean.getQueryString();
        //对查询条件进行 模糊查询
        if (queryString != null && queryString.length() > 0) {
            queryString = "%" + queryString + "%";

            //使用分页插件进行分页
            PageHelper.startPage(currentPage, pageSize);
            Page<Address> addressPage = AddressDao.findByCondition(queryString);

            //获取集合
            List<Address> addressList = addressPage.getResult();
            //获取数据总条目数
            long total = addressPage.getTotal();
            return new PageResult(total, addressList);
        }

        //使用分页插件进行分页
        PageHelper.startPage(currentPage, pageSize);
        Page<Address> addressPage = AddressDao.findPage();

        //获取集合
        List<Address> addressList = addressPage.getResult();
        //获取数据总条目数
        long total = addressPage.getTotal();
        return new PageResult(total, addressList);
    }

    /**新增体检机构
     * @param address
     * @return void
     * @author JANME
     * @date 2020-09-22 19:03
     */
    @Override
    public void add(Address address) {
        AddressDao.add(address);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Override
    public long findByAddressId(Integer id) {
        return AddressDao.findByAddressId(id);
    }

    /**
     * 修改
     * @param address
     */
    @Override
    public void edit(Address address) {
        AddressDao.edit(address);
    }

    /**
     * 删除
     * @param id
     */
    @Override
    public void delete(Integer id) {
        AddressDao.delete(id);
    }

    /**
     * 根据id查询机构进行回显数据
     * @param id
     * @return
     */
    @Override
    public Address findUpdate(Integer id) {
        return AddressDao.findUpdate(id);
    }

    /**
     * 查询所有
     * @return
     */
    @Override
    public List<Address> findAll() {
        return AddressDao.findAll();
    }

    /**
     *
     * @param addressId
     * @return
     */
    @Override
    public Address findById(Integer addressId) {
        return AddressDao.findById(addressId);
    }


    /**
     * 通过用户id查询关联表获得对应的体检机构
     * @param id
     * @return
     */
    @Override
    public Address getByMemberId(Integer id) {
        return AddressDao.getByMemberId(id);
    }
}
