package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScoreRequest {
	private String visit_date;				// 방문일자 
	private String country_id;
	private String zone_id;
	private String countryclub_id;			// 골프장 코드
	private String countryclub_nm;			// 골프장명
	private String seq_no;
	private String user_id;					// 사용자 순번 키
	private String start_course;				// 시작코스
	private String end_course;					// 종료코스
	private String score1;
	private String score2;
	private String score3;
	private String score4;
	private String score5;
	private String score6;
	private String score7;
	private String score8;
	private String score9;
	private String score10;
	private String score11;
	private String score12;
	private String score13;
	private String score14;
	private String score15;
	private String score16;
	private String score17;
	private String score18;
	private String scoresum1;
	private String scoresum2;

	private String stroke1;
	private String stroke2;
	private String stroke3;
	private String stroke4;
	private String stroke5;
	private String stroke6;
	private String stroke7;
	private String stroke8;
	private String stroke9;
	private String stroke10;
	private String stroke11;
	private String stroke12;
	private String stroke13;
	private String stroke14;
	private String stroke15;
	private String stroke16;
	private String stroke17;
	private String stroke18;	
	private String strokesum1;
	private String strokesum2;
	private String putter1;
	private String putter2;
	private String putter3;
	private String putter4;
	private String putter5;
	private String putter6;
	private String putter7;
	private String putter8;
	private String putter9;
	private String putter10;
	private String putter11;
	private String putter12;
	private String putter13;
	private String putter14;
	private String putter15;
	private String putter16;
	private String putter17;
	private String putter18;
	private String puttersum1;
	private String puttersum2;
	private String description;
	private String dateinserted;
	
	private String error;			// QR 파라미터가 잘 못 넘어왔을 때 해당 에러를 여기에 저장한다.
	private boolean result;

	private String puterpattern1;			// 퍼팅패턴 (8가지중 1개)
	private String puterpattern2;
	private String puterpattern3;
	private String puterpattern4;
	private String puterpattern5;
	private String puterpattern6;
	private String puterpattern7;
	private String puterpattern8;
	private String puterpattern9;
	private String puterpattern10;
	private String puterpattern11;
	private String puterpattern12;
	private String puterpattern13;
	private String puterpattern14;
	private String puterpattern15;
	private String puterpattern16;
	private String puterpattern17;
	private String puterpattern18;
	
	private String parbreak1;		// 파브레이크유무 y/n
	private String parbreak2;
	private String parbreak3;
	private String parbreak4;
	private String parbreak5;
	private String parbreak6;
	private String parbreak7;
	private String parbreak8;
	private String parbreak9;
	private String parbreak10;
	private String parbreak11;
	private String parbreak12;
	private String parbreak13;
	private String parbreak14;
	private String parbreak15;
	private String parbreak16;
	private String parbreak17;
	private String parbreak18;
	
	private String sendsavechk1;		// 샌드세이브 유무 0/y/n 빠녔으면 Y, 탈출했으면 N
	private String sendsavechk2;
	private String sendsavechk3;
	private String sendsavechk4;
	private String sendsavechk5;
	private String sendsavechk6;
	private String sendsavechk7;
	private String sendsavechk8;
	private String sendsavechk9;
	private String sendsavechk10;
	private String sendsavechk11;
	private String sendsavechk12;
	private String sendsavechk13;
	private String sendsavechk14;
	private String sendsavechk15;
	private String sendsavechk16;
	private String sendsavechk17;
	private String sendsavechk18;
	
	private String sendsave1;		// 샌드세이브 유무 0/y/n 빠녔으면 Y, 탈출했으면 N
	private String sendsave2;
	private String sendsave3;
	private String sendsave4;
	private String sendsave5;
	private String sendsave6;
	private String sendsave7;
	private String sendsave8;
	private String sendsave9;
	private String sendsave10;
	private String sendsave11;
	private String sendsave12;
	private String sendsave13;
	private String sendsave14;
	private String sendsave15;
	private String sendsave16;
	private String sendsave17;
	private String sendsave18;
	
	private String greenon1;		// 그린적용유무
	private String greenon2;	
	private String greenon3;
	private String greenon4;
	private String greenon5;
	private String greenon6;
	private String greenon7;
	private String greenon8;
	private String greenon9;
	private String greenon10;
	private String greenon11;
	private String greenon12;
	private String greenon13;
	private String greenon14;
	private String greenon15;
	private String greenon16;
	private String greenon17;
	private String greenon18;
	
	private String fairwayon1;		// 페어웨이안착유무
	private String fairwayon2;
	private String fairwayon3;
	private String fairwayon4;
	private String fairwayon5;
	private String fairwayon6;
	private String fairwayon7;
	private String fairwayon8;
	private String fairwayon9;
	private String fairwayon10;
	private String fairwayon11;
	private String fairwayon12;
	private String fairwayon13;
	private String fairwayon14;
	private String fairwayon15;
	private String fairwayon16;
	private String fairwayon17;
	private String fairwayon18;
	
	
	// 검색 조건
	private String search_visit_date;
	private String search_seq_no;
	private String search_countryclub_id;
	private String stdate;
	private String etdate;
}
