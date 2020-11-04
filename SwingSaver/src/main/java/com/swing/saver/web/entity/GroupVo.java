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
    private String sts;
    private String sts_name;     // 그룹 상태 (Y:Active, N:Inactive, P:Pending)
    private String del_yn;			// 삭제 여부 Y:삭제, N:미삭제
    private String userid;
    private String groupadmin;
    private int proid;	// 마켓 프로인 경우 마켓 프로 아이디
}
