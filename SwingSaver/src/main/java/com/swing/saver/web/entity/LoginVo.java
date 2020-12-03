package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by mycom on 2019-06-04.
 */
@Getter
@Setter
public class LoginVo extends BaseEntity {

    private long userid;
    private String username;
    private String result;

    private String groupadmin;		// 그룹어드민 여부
    private String grouppro;        // 그룹멤버의 프로여부 (Admin, Pro)
    private String groupmember;     // 그룹의 멤버 여부
    private String groupid;         // 그룹 아이디
    private String market_pro_chk;   //마켓 프로여부 (Y/N)
    
    private String prev_url;

}
