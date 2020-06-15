package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayVo {
	private String		order_idx;
	private String		good_name;
	private String		good_mny;
	private String		buyr_name;
	private String		buyr_mail;
	private String      buyr_tel1;
	private String      buyr_tel2;
	private String		artype;
	private String		arid;
}
