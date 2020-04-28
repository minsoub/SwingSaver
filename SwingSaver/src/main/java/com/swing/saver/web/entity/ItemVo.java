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
	private String	item_type;
	private String	item_type_name;
	private int		period;
	private int		lessoncount;
	private int     buycount;
	private boolean result;
	private String	error;
}
