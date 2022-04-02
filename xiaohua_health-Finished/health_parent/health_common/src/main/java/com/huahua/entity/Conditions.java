package com.huahua.entity;

import java.util.Arrays;
import java.util.Date;

/**
 * @author Huahua
 */
public class Conditions extends QueryPageBean {
    private Date[] queryDate;
    private String queryOrderType;
    private String queryOrderStatus;
    private String queryString;

    public Date[] getQueryDate() {
        return queryDate;
    }

    public void setQueryDate(Date[] queryDate) {
        this.queryDate = queryDate;
    }

    public String getQueryOrderType() {
        return queryOrderType;
    }

    public void setQueryOrderType(String queryOrderType) {
        this.queryOrderType = queryOrderType;
    }

    public String getQueryOrderStatus() {
        return queryOrderStatus;
    }

    public void setQueryOrderStatus(String queryOrderStatus) {
        this.queryOrderStatus = queryOrderStatus;
    }

    public String getQueryString() {
        return queryString;
    }

    public void setQueryString(String queryString) {
        this.queryString = queryString;
    }


}
