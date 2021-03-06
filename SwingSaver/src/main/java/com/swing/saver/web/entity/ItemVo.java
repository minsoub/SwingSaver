package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemVo {
	private int		id;
	private int		proid;
	private String	title;
	private String	description;
	private int		price;
	private String	status;
	private String	status_name;
	private String  groupid;
	private String  subgroupid;
	
	private String	item_type;
	private String	item_type_name;  // 월정액(1), 원포인트(2)
	private String	expiryperiod;
	private int		lessoncount;
	
	private String	quota;
	private String  startdate;
	private String  enddate;
	
	private int     buycount;
	private boolean result;
	private String	error;
}
