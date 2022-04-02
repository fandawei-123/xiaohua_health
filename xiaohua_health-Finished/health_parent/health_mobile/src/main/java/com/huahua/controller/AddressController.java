package com.huahua.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.huahua.constant.MessageConstant;
import com.huahua.entity.Result;
import com.huahua.pojo.Address;
import com.huahua.service.AddressService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Huahua
 */
@RestController
@RequestMapping("/address")
public class AddressController {

    @Reference
    private AddressService addressService;



    /**
     * 查询所有体检机构信息
     * @return
     */
    @RequestMapping("/findAllAddress")
    public Result findAllAddress(){
        try {
            List<Address> addressList = addressService.findAll();
            return new Result(true, MessageConstant.QUERY_ADDRESS_LIST_SUCCESS,addressList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_ADDRESS_LIST_FAIL);
        }
    }


    /**
     *
     * @param addressId
     * @return
     */
    @RequestMapping("/findByAddressId")
    public Result findByAddressId(Integer addressId){
        Address address = addressService.findById(addressId);
        return new Result(true, MessageConstant.GET_ADDRESS_SUCCESS,address);
    }

}
