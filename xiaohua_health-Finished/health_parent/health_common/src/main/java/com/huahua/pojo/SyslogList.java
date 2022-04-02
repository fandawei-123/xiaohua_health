package com.huahua.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * @author Huahua
 */
public class SyslogList implements Serializable {
    private List<Syslog> syslogList;

    public List<Syslog> getSyslogList() {
        return syslogList;
    }

    public void setSyslogList(List<Syslog> syslogList) {
        this.syslogList = syslogList;
    }
}
