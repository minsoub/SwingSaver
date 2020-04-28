package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayVo {
	private int			id;			// 결제 key
	private int			itemid;		// 상품 key
	private int			userid;		// 사용자 key
	private int			pay_amt;	// 결제금액
	private String		pay_sts;	// 결제상태
	private String		pay_dt;		// 결제일자
	private int			usecount;	// 사용횟수
	private String		period_dt;	// 유효 마감일자
	private String		use_yn;		// 사용여부
	
	private String		title;		// 상품명
	private String		user_name;	// 사용자명
	private String		user_mail;	// 메일주소
}
