package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;



/**
 * 결제 현황 정보
 * - 마켓 프로 상품 결제 현황 정보
 * - 그룹 결제 현황 정보
 * - 개인 결제 현황 정보 
 * 
 * @author jms
 *
 */
@Getter
@Setter
public class PayInfoVo {

	private int		id;
	private int		proid;
	private int		pro_name;
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
	
	private String  user_name;  // 구매자명
	private int     amount;		// 결제금액
	private String  received;   // 결제상태
	private String  pay_dt;     // 결제일자
	private String  duedate;    // 만기일자
	
}
