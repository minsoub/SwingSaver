package com.swing.saver.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class SCScoreInfoPK implements Serializable{
	private static final long serialVersionUID = -1965345556605480716L;
	
	private String visit_date;			// 방문일자 : yyyyMMdd
	private String countryclub_id;		// 골프장 ID
	private String teeup_time;          // Teeup Time
	private int    user_id;             // 사용자 아이디
}
