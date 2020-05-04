package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by mycom on 2019-06-09.
 */
@Getter
@Setter
public class GroupVo {
    private String id;//get 받을때 groupid
    private String groupid;
    private String groupname;
    private String grouptype;
    private String grouptypename;
    private String address;
    private String phone;
    private int quota;
    private int storagespace;
    private String startdate;
    private String enddate;
    private int membercount;
    private String status;
    private String userid;
    private String groupadmin;
    private int proid;	// 마켓 프로인 경우 마켓 프로 아이디
}
