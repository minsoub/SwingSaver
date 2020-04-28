package com.swing.saver.web.entity;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by mycom on 2019-06-09.
 */
@Getter
@Setter
public class UserVo {

    private String email;
    private String firstname;
    private String lastname;
    private String dob;

    private String phone;
    private String gender;
    private String photo;
    private int availablepoints;
    private int usedspace;
    private int storagespace;
    private long id;
    private long userid;
    private List<Map<String,String>> subgroups;
    private String membertype;
    private String status;
    private String gradecode;
    private String enddate;
    private int average;
    private double handicap;
    private int distance;

}
