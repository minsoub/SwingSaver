package com.swing.saver.web.domain;

import java.io.Serializable;


import lombok.Data;
@Data
public class GroupMemberPK implements Serializable{
	private static final long serialVersionUID = 5435917295888810298L;
	private String groupid;
	private Integer memberid;
}
