package com.huahua.jobs;

import com.huahua.constant.RedisConstant;
import com.huahua.utils.QiniuUtils;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.JedisPool;

import java.util.Set;

/**
 * @author Huahua
 */
public class ClearImgJob {
    @Autowired
    private JedisPool jedisPool;


    /**
     * 定时清理垃圾图片
     */
    public void clearImg() {
        //获取垃圾图片名称
        Set<String> setmealSet = jedisPool.getResource().sdiff(RedisConstant.SETMEAL_PIC_RESOURCES, RedisConstant.SETMEAL_PIC_DB_RESOURCES);
        Set<String> addressSet = jedisPool.getResource().sdiff(RedisConstant.ADDRESS_PIC_RESOURCES, RedisConstant.ADDRESS_PIC_DB_RESOURCES);
        if (setmealSet != null) {
            for (String picName : setmealSet) {
                //删除垃圾照片
                QiniuUtils.deleteFileFromQiniu(picName);
                //清理Redis中的垃圾图片名称
                jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_RESOURCES, picName);
                System.out.println("清理垃圾图片成功。。。。" + picName);
            }
        }
        if (addressSet != null) {
            for (String picName : addressSet) {
                //删除垃圾照片
                QiniuUtils.deleteFileFromQiniu(picName);
                //清理Redis中的垃圾图片名称
                jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_RESOURCES, picName);
                System.out.println("清理垃圾图片成功。。。。" + picName);
            }
        }
    }
}
