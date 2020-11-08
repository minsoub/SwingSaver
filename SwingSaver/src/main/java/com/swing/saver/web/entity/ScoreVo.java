package com.swing.saver.web.entity;

import lombok.Getter;
import lombok.Setter;


/**
 * 개인별 스코어 정보
 * Table Name : SCSCOREINFO
 * @author minso
 *
 */
@Getter
@Setter
public class ScoreVo {
	private String visit_date;				// 방문일자 
	private String contryclub_id;			// 골프장 코드
	private int seq_no;
	private int user_id;					// 사용자 순번 키
	private int start_course;				// 시작코스
	private int end_course;					// 종료코스
	private int score1;
	private int score2;
	private int score3;
	private int score4;
	private int score5;
	private int score6;
	private int score7;
	private int score8;
	private int score9;
	private int sum1;  // 스코어 1 합계
	private int sum2;  // 스코어 2 합계 
	private int score10;
	private int score11;
	private int score12;
	private int score13;
	private int score14;
	private int score15;
	private int score16;
	private int score17;
	private int score18;
	private int score_sum;
	private int score_plus_sum;
	private int stroke1;
	private int stroke2;
	private int stroke3;
	private int stroke4;
	private int stroke5;
	private int stroke6;
	private int stroke7;
	private int stroke8;
	private int stroke9;
	private int stroke10;
	private int stroke11;
	private int stroke12;
	private int stroke13;
	private int stroke14;
	private int stroke15;
	private int stroke16;
	private int stroke17;
	private int stroke18;	
	private int strokesum1;
	private int strokesum2;
	private int putter1;
	private int putter2;
	private int putter3;
	private int putter4;
	private int putter5;
	private int putter6;
	private int putter7;
	private int putter8;
	private int putter9;
	private int putter10;
	private int putter11;
	private int putter12;
	private int putter13;
	private int putter14;
	private int putter15;
	private int putter16;
	private int putter17;
	private int putter18;
	private String description;
	private String dateinserted;
	
	private String error;			// QR 파라미터가 잘 못 넘어왔을 때 해당 에러를 여기에 저장한다.
	private boolean result;
	
	private int scorechk1;
	private int scorechk2;
	private int scorechk3;
	private int scorechk4;
	private int scorechk5;
	private int scorechk6;
	private int scorechk7;
	private int scorechk8;
	private int scorechk9;
	private int scorechk10;
	private int scorechk11;
	private int scorechk12;
	private int scorechk13;
	private int scorechk14;
	private int scorechk15;
	private int scorechk16;
	private int scorechk17;
	private int scorechk18;	
	private int scorechksum1;
	private int scorechksum2;	
}
