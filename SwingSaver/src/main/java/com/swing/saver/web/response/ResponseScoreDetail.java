package com.swing.saver.web.response;

import org.springframework.util.StringUtils;

import com.swing.saver.web.domain.SCScoreDetailInfo;
import com.swing.saver.web.domain.SCScoreInfo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResponseScoreDetail {
	private String visit_date_format;   // 2020.03.02
	private String teeup_time_format;   // 13:00
	private int total_socre;			// 총 스커어 
	private String par_data;            // +, - 4
	
	private String visit_date;				// 방문일자 
	private String country_id;
	private String zone_id;
	private String countryclub_id;			// 골프장 코드
	private String countryclub_nm;			// 골프장명
	private String teeup_time;
	private String user_id;					// 사용자 순번 키
	private String start_course;				// 시작코스
	private String end_course;					// 종료코스
	
	private int fairwayon_rate;			// Fairway 안착률
	private int greenon_rate;			// Greenon 적중률
	private int pattern1;				// 퍼팅패턴 
	private int pattern2;				// 퍼팅패턴
	private int pattern3;				// 퍼팅패턴
	private int pattern4;				// 퍼팅패턴
	private int pattern5;				// 퍼팅패턴
	private int pattern6;				// 퍼팅패턴
	private int pattern7;				// 퍼팅패턴
	private int pattern8;				// 퍼팅패턴
	
	
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
	private int puttersum;

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
	
	private String greenon1_name;		// 그린적용유무
	private String greenon2_name;	
	private String greenon3_name;
	private String greenon4_name;
	private String greenon5_name;
	private String greenon6_name;
	private String greenon7_name;
	private String greenon8_name;
	private String greenon9_name;
	private String greenon10_name;
	private String greenon11_name;
	private String greenon12_name;
	private String greenon13_name;
	private String greenon14_name;
	private String greenon15_name;
	private String greenon16_name;
	private String greenon17_name;
	private String greenon18_name;
	
	private String fairwayon1_name;		// 페어웨이안착유무
	private String fairwayon2_name;
	private String fairwayon3_name;
	private String fairwayon4_name;
	private String fairwayon5_name;
	private String fairwayon6_name;
	private String fairwayon7_name;
	private String fairwayon8_name;
	private String fairwayon9_name;
	private String fairwayon10_name;
	private String fairwayon11_name;
	private String fairwayon12_name;
	private String fairwayon13_name;
	private String fairwayon14_name;
	private String fairwayon15_name;
	private String fairwayon16_name;
	private String fairwayon17_name;
	private String fairwayon18_name;
	
	@Builder
	public ResponseScoreDetail(SCScoreInfo score, SCScoreDetailInfo detail)
	{
		// date format 
		this.visit_date_format = score.getVisit_date().substring(0, 4)+"."+score.getVisit_date().substring(4,6)+"."+score.getVisit_date().substring(6);
		this.teeup_time_format = score.getTeeup_time().substring(0, 2)+":"+score.getTeeup_time().substring(2);
				
		this.visit_date = score.getVisit_date();
		this.countryclub_id = score.getCountryclub_id();
		this.teeup_time = score.getTeeup_time();
		this.user_id = score.getUser_id() == null ? null : String.valueOf(score.getUser_id());
		this.start_course = score.getStart_course() == null ? null : String.valueOf(score.getStart_course());
		this.end_course = score.getEnd_course() == null ? null : String.valueOf(score.getEnd_course());
		this.score1 = score.getScore1() == null ? null : String.valueOf(score.getScore1());
		this.score2 = score.getScore2() == null ? null : String.valueOf(score.getScore2());
		this.score3 = score.getScore3() == null ? null : String.valueOf(score.getScore3());
		this.score4 = score.getScore4() == null ? null : String.valueOf(score.getScore4());
		this.score5 = score.getScore5() == null ? null : String.valueOf(score.getScore5());
		this.score6 = score.getScore6() == null ? null : String.valueOf(score.getScore6());
		this.score7 = score.getScore7() == null ? null : String.valueOf(score.getScore7());
		this.score8 = score.getScore8() == null ? null : String.valueOf(score.getScore8());
		this.score9 = score.getScore9() == null ? null : String.valueOf(score.getScore9());
		this.score10 = score.getScore10() == null ? null : String.valueOf(score.getScore10());
		this.score11 = score.getScore11() == null ? null : String.valueOf(score.getScore11());
		this.score12 = score.getScore12() == null ? null : String.valueOf(score.getScore12());
		this.score13 = score.getScore13() == null ? null : String.valueOf(score.getScore13());
		this.score14 = score.getScore14() == null ? null : String.valueOf(score.getScore14());
		this.score15 = score.getScore15() == null ? null : String.valueOf(score.getScore15());
		this.score16 = score.getScore16() == null ? null : String.valueOf(score.getScore16());
		this.score17 = score.getScore17() == null ? null : String.valueOf(score.getScore17());
		this.score18 = score.getScore18() == null ? null : String.valueOf(score.getScore18());
		
		this.stroke1 = score.getStroke1() == null ? null : String.valueOf(score.getStroke1());
		this.stroke2 = score.getStroke2() == null ? null : String.valueOf(score.getStroke2());
		this.stroke3 = score.getStroke3() == null ? null : String.valueOf(score.getStroke3());
		this.stroke4 = score.getStroke4() == null ? null : String.valueOf(score.getStroke4());
		this.stroke5 = score.getStroke5() == null ? null : String.valueOf(score.getStroke5());
		this.stroke6 = score.getStroke6() == null ? null : String.valueOf(score.getStroke6());
		this.stroke7 = score.getStroke7() == null ? null : String.valueOf(score.getStroke7());
		this.stroke8 = score.getStroke8() == null ? null : String.valueOf(score.getStroke8());
		this.stroke9 = score.getStroke9() == null ? null : String.valueOf(score.getStroke9());
		this.stroke10 = score.getStroke10() == null ? null : String.valueOf(score.getStroke10());
		this.stroke11 = score.getStroke11() == null ? null : String.valueOf(score.getStroke11());
		this.stroke12 = score.getStroke12() == null ? null : String.valueOf(score.getStroke12());
		this.stroke13 = score.getStroke13() == null ? null : String.valueOf(score.getStroke13());
		this.stroke14 = score.getStroke14() == null ? null : String.valueOf(score.getStroke14());
		this.stroke15 = score.getStroke15() == null ? null : String.valueOf(score.getStroke15());
		this.stroke16 = score.getStroke16() == null ? null : String.valueOf(score.getStroke16());
		this.stroke17 = score.getStroke17() == null ? null : String.valueOf(score.getStroke17());
		this.stroke18 = score.getStroke18() == null ? null : String.valueOf(score.getStroke18());
		
		this.putter1 = score.getPutter1() == null ? null : String.valueOf(score.getPutter1());
		this.putter2 = score.getPutter2() == null ? null : String.valueOf(score.getPutter2());
		this.putter3 = score.getPutter3() == null ? null : String.valueOf(score.getPutter3());
		this.putter4 = score.getPutter4() == null ? null : String.valueOf(score.getPutter4());
		this.putter5 = score.getPutter5() == null ? null : String.valueOf(score.getPutter5());
		this.putter6 = score.getPutter6() == null ? null : String.valueOf(score.getPutter6());
		this.putter7 = score.getPutter7() == null ? null : String.valueOf(score.getPutter7());
		this.putter8 = score.getPutter8() == null ? null : String.valueOf(score.getPutter8());
		this.putter9 = score.getPutter9() == null ? null : String.valueOf(score.getPutter9());
		this.putter10 = score.getPutter10() == null ? null : String.valueOf(score.getPutter10());
		this.putter11 = score.getPutter11() == null ? null : String.valueOf(score.getPutter11());
		this.putter12 = score.getPutter12() == null ? null : String.valueOf(score.getPutter12());
		this.putter13 = score.getPutter13() == null ? null : String.valueOf(score.getPutter13());
		this.putter14 = score.getPutter14() == null ? null : String.valueOf(score.getPutter14());
		this.putter15 = score.getPutter15() == null ? null : String.valueOf(score.getPutter15());
		this.putter16 = score.getPutter16() == null ? null : String.valueOf(score.getPutter16());
		this.putter17 = score.getPutter17() == null ? null : String.valueOf(score.getPutter17());
		this.putter18 = score.getPutter18() == null ? null : String.valueOf(score.getPutter18());
		
		this.description = score.getDescription();
		
		// detail
		this.puterpattern1 = detail.getPuterpattern1();
		this.puterpattern2 = detail.getPuterpattern2();
		this.puterpattern3 = detail.getPuterpattern3();
		this.puterpattern4 = detail.getPuterpattern4();
		this.puterpattern5 = detail.getPuterpattern5();
		this.puterpattern6 = detail.getPuterpattern6();
		this.puterpattern7 = detail.getPuterpattern7();
		this.puterpattern8 = detail.getPuterpattern8();
		this.puterpattern9 = detail.getPuterpattern9();
		this.puterpattern10 = detail.getPuterpattern10();
		this.puterpattern11 = detail.getPuterpattern11();
		this.puterpattern12 = detail.getPuterpattern12();
		this.puterpattern13 = detail.getPuterpattern13();
		this.puterpattern14 = detail.getPuterpattern14();
		this.puterpattern15 = detail.getPuterpattern15();
		this.puterpattern16 = detail.getPuterpattern16();
		this.puterpattern17 = detail.getPuterpattern17();
		this.puterpattern18 = detail.getPuterpattern18();
		
		this.parbreak1 = detail.getParbreak1();
		this.parbreak2 = detail.getParbreak2();
		this.parbreak3 = detail.getParbreak3();
		this.parbreak4 = detail.getParbreak4();
		this.parbreak5 = detail.getParbreak5();
		this.parbreak6 = detail.getParbreak6();
		this.parbreak7 = detail.getParbreak7();
		this.parbreak8 = detail.getParbreak8();
		this.parbreak9 = detail.getParbreak9();
		this.parbreak10 = detail.getParbreak10();
		this.parbreak11 = detail.getParbreak11();
		this.parbreak12 = detail.getParbreak12();
		this.parbreak13 = detail.getParbreak13();
		this.parbreak14 = detail.getParbreak14();
		this.parbreak15 = detail.getParbreak15();
		this.parbreak16 = detail.getParbreak16();
		this.parbreak17 = detail.getParbreak17();
		this.parbreak18 = detail.getParbreak18();
		
		this.sendsave1 = detail.getSendsave1();
		this.sendsave2 = detail.getSendsave2();
		this.sendsave3 = detail.getSendsave3();
		this.sendsave4 = detail.getSendsave4();
		this.sendsave5 = detail.getSendsave5();
		this.sendsave6 = detail.getSendsave6();
		this.sendsave7 = detail.getSendsave7();
		this.sendsave8 = detail.getSendsave8();
		this.sendsave9 = detail.getSendsave9();
		this.sendsave10 = detail.getSendsave10();
		this.sendsave11 = detail.getSendsave11();
		this.sendsave12 = detail.getSendsave12();
		this.sendsave13 = detail.getSendsave13();
		this.sendsave14 = detail.getSendsave14();
		this.sendsave15 = detail.getSendsave15();
		this.sendsave16 = detail.getSendsave16();
		this.sendsave17 = detail.getSendsave17();
		this.sendsave18 = detail.getSendsave18();
		
		this.greenon1 = detail.getGreenon1();
		this.greenon2 = detail.getGreenon2();
		this.greenon3 = detail.getGreenon3();
		this.greenon4 = detail.getGreenon4();
		this.greenon5 = detail.getGreenon5();
		this.greenon6 = detail.getGreenon6();
		this.greenon7 = detail.getGreenon7();
		this.greenon8 = detail.getGreenon8();
		this.greenon9 = detail.getGreenon9();
		this.greenon10 = detail.getGreenon10();
		this.greenon11 = detail.getGreenon11();
		this.greenon12 = detail.getGreenon12();
		this.greenon13 = detail.getGreenon13();
		this.greenon14 = detail.getGreenon14();
		this.greenon15 = detail.getGreenon15();
		this.greenon16 = detail.getGreenon16();
		this.greenon17 = detail.getGreenon17();
		this.greenon18 = detail.getGreenon18();
		
		this.fairwayon1 = detail.getFairwayon1();	 // L, Y, R
		this.fairwayon2 = detail.getFairwayon2();
		this.fairwayon3 = detail.getFairwayon3();
		this.fairwayon4 = detail.getFairwayon4();
		this.fairwayon5 = detail.getFairwayon5();
		this.fairwayon6 = detail.getFairwayon6();
		this.fairwayon7 = detail.getFairwayon7();
		this.fairwayon8 = detail.getFairwayon8();
		this.fairwayon9 = detail.getFairwayon9();
		this.fairwayon10 = detail.getFairwayon10();
		this.fairwayon11 = detail.getFairwayon11();
		this.fairwayon12 = detail.getFairwayon12();
		this.fairwayon13 = detail.getFairwayon13();
		this.fairwayon14 = detail.getFairwayon14();
		this.fairwayon15 = detail.getFairwayon15();
		this.fairwayon16 = detail.getFairwayon16();
		this.fairwayon17 = detail.getFairwayon17();
		this.fairwayon18 = detail.getFairwayon18();
		
		this.fairwayon_rate = 0;		// fairway 안착률
		int fairway_cnt = 0;
		if (this.fairwayon1 != null)
		{
			if (this.fairwayon1.equals("L")) this.fairwayon1_name = "Left";
			else if (this.fairwayon1.equals("Y")) {
				this.fairwayon1_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon1.equals("R")) this.fairwayon1_name = "Right";
		}
		if (this.fairwayon2 != null)
		{
			if (this.fairwayon2.equals("L")) this.fairwayon2_name = "Left";
			else if (this.fairwayon2.equals("Y")) {
				this.fairwayon2_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon2.equals("R")) this.fairwayon2_name = "Right";
		}
		if (this.fairwayon3 != null)
		{
			if (this.fairwayon3.equals("L")) this.fairwayon3_name = "Left";
			else if (this.fairwayon3.equals("Y")) {
				this.fairwayon3_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon3.equals("R")) this.fairwayon3_name = "Right";
		}
		if (this.fairwayon4 != null)
		{
			if (this.fairwayon4.equals("L")) this.fairwayon4_name = "Left";
			else if (this.fairwayon4.equals("Y")) {
				this.fairwayon4_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon4.equals("R")) this.fairwayon4_name = "Right";
		}
		if (this.fairwayon5 != null)
		{
			if (this.fairwayon5.equals("L")) this.fairwayon5_name = "Left";
			else if (this.fairwayon5.equals("Y")) {
				this.fairwayon5_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon5.equals("R")) this.fairwayon5_name = "Right";
		}
		if (this.fairwayon6 != null)
		{
			if (this.fairwayon6.equals("L")) this.fairwayon6_name = "Left";
			else if (this.fairwayon6.equals("Y")) {
				this.fairwayon6_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon6.equals("R")) this.fairwayon6_name = "Right";
		}
		if (this.fairwayon7 != null)
		{
			if (this.fairwayon7.equals("L")) this.fairwayon7_name = "Left";
			else if (this.fairwayon7.equals("Y")) {
				this.fairwayon7_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon7.equals("R")) this.fairwayon7_name = "Right";
		}
		if (this.fairwayon8 != null)
		{
			if (this.fairwayon8.equals("L")) this.fairwayon8_name = "Left";
			else if (this.fairwayon8.equals("Y")) {
				this.fairwayon8_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon8.equals("R")) this.fairwayon8_name = "Right";
		}
		if (this.fairwayon9 != null)
		{
			if (this.fairwayon9.equals("L")) this.fairwayon9_name = "Left";
			else if (this.fairwayon9.equals("Y")) {
				this.fairwayon9_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon9.equals("R")) this.fairwayon9_name = "Right";
		}
		if (this.fairwayon10 != null)
		{
			if (this.fairwayon10.equals("L")) this.fairwayon10_name = "Left";
			else if (this.fairwayon10.equals("Y")) {
				this.fairwayon10_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon10.equals("R")) this.fairwayon10_name = "Right";
		}
		if (this.fairwayon11 != null)
		{
			if (this.fairwayon11.equals("L")) this.fairwayon11_name = "Left";
			else if (this.fairwayon11.equals("Y")) {
				this.fairwayon11_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon11.equals("R")) this.fairwayon11_name = "Right";
		}
		if (this.fairwayon12 != null)
		{
			if (this.fairwayon12.equals("L")) this.fairwayon12_name = "Left";
			else if (this.fairwayon12.equals("Y")) {
				this.fairwayon12_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon12.equals("R")) this.fairwayon12_name = "Right";
		}
		if (this.fairwayon13 != null)
		{
			if (this.fairwayon13.equals("L")) this.fairwayon13_name = "Left";
			else if (this.fairwayon13.equals("Y")) {
				this.fairwayon13_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon13.equals("R")) this.fairwayon13_name = "Right";
		}
		if (this.fairwayon14 != null)
		{
			if (this.fairwayon14.equals("L")) this.fairwayon14_name = "Left";
			else if (this.fairwayon14.equals("Y")) {
				this.fairwayon14_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon14.equals("R")) this.fairwayon14_name = "Right";
		}
		if (this.fairwayon15 != null)
		{
			if (this.fairwayon15.equals("L")) this.fairwayon15_name = "Left";
			else if (this.fairwayon15.equals("Y")) {
				this.fairwayon15_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon15.equals("R")) this.fairwayon15_name = "Right";
		}
		if (this.fairwayon16 != null)
		{
			if (this.fairwayon16.equals("L")) this.fairwayon16_name = "Left";
			else if (this.fairwayon16.equals("Y")) {
				this.fairwayon16_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon16.equals("R")) this.fairwayon16_name = "Right";
		}
		if (this.fairwayon17 != null)
		{
			if (this.fairwayon17.equals("L")) this.fairwayon17_name = "Left";
			else if (this.fairwayon17.equals("Y")) {
				this.fairwayon17_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon17.equals("R")) this.fairwayon17_name = "Right";
		}
		if (this.fairwayon18 != null)
		{
			if (this.fairwayon18.equals("L")) this.fairwayon18_name = "Left";
			else if (this.fairwayon18.equals("Y")) {
				this.fairwayon18_name = "OK";
				fairway_cnt++;
			}
			else if (this.fairwayon18.equals("R")) this.fairwayon18_name = "Right";
		}
		if (fairway_cnt > 0) {
			this.fairwayon_rate = fairway_cnt;  // (int) Math.round(fairway_cnt / 18.0);
		}
		
		this.greenon_rate = 0;			// 그린 적중률
		int greenon_cnt = 0;
		if (this.greenon1 != null)
		{
			if (this.greenon1.equals("N")) this.greenon1_name = "NO";
			else if (this.greenon1.equals("Y")) {
				this.greenon1_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon2 != null)
		{
			if (this.greenon2.equals("N")) this.greenon2_name = "NO";
			else if (this.greenon2.equals("Y")) {
				this.greenon2_name = "OK";
				greenon_cnt++;
			}
		}		
		if (this.greenon3 != null)
		{
			if (this.greenon3.equals("N")) this.greenon3_name = "NO";
			else if (this.greenon3.equals("Y")) {
				this.greenon3_name = "OK";
				greenon_cnt++;
			}
		}		
		if (this.greenon4 != null)
		{
			if (this.greenon4.equals("N")) this.greenon4_name = "NO";
			else if (this.greenon4.equals("Y")) {
				this.greenon4_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon5 != null)
		{
			if (this.greenon5.equals("N")) this.greenon5_name = "NO";
			else if (this.greenon5.equals("Y")) {
				this.greenon5_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon6 != null)
		{
			if (this.greenon6.equals("N")) this.greenon6_name = "NO";
			else if (this.greenon6.equals("Y")) {
				this.greenon6_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon7 != null)
		{
			if (this.greenon7.equals("N")) this.greenon7_name = "NO";
			else if (this.greenon7.equals("Y")) {
				this.greenon7_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon8 != null)
		{
			if (this.greenon8.equals("N")) this.greenon8_name = "NO";
			else if (this.greenon8.equals("Y")) {
				this.greenon8_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon9 != null)
		{
			if (this.greenon9.equals("N")) this.greenon9_name = "NO";
			else if (this.greenon9.equals("Y")) {
				this.greenon9_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon10 != null)
		{
			if (this.greenon10.equals("N")) this.greenon10_name = "NO";
			else if (this.greenon10.equals("Y")) {
				this.greenon10_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon11 != null)
		{
			if (this.greenon11.equals("N")) this.greenon11_name = "NO";
			else if (this.greenon11.equals("Y")) {
				this.greenon11_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon12 != null)
		{
			if (this.greenon12.equals("N")) this.greenon12_name = "NO";
			else if (this.greenon12.equals("Y")) {
				this.greenon12_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon13 != null)
		{
			if (this.greenon13.equals("N")) this.greenon13_name = "NO";
			else if (this.greenon13.equals("Y")) {
				this.greenon13_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon14 != null)
		{
			if (this.greenon14.equals("N")) this.greenon14_name = "NO";
			else if (this.greenon14.equals("Y")) {
				this.greenon14_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon15 != null)
		{
			if (this.greenon15.equals("N")) this.greenon15_name = "NO";
			else if (this.greenon15.equals("Y")) {
				this.greenon15_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon16 != null)
		{
			if (this.greenon16.equals("N")) this.greenon16_name = "NO";
			else if (this.greenon16.equals("Y")) {
				this.greenon16_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon17 != null)
		{
			if (this.greenon17.equals("N")) this.greenon17_name = "NO";
			else if (this.greenon17.equals("Y")) {
				this.greenon17_name = "OK";
				greenon_cnt++;
			}
		}
		if (this.greenon18 != null)
		{
			if (this.greenon18.equals("N")) this.greenon18_name = "NO";
			else if (this.greenon18.equals("Y")) {
				this.greenon18_name = "OK";
				greenon_cnt++;
			}
		}
		
		if (greenon_cnt > 0) {
			this.greenon_rate = greenon_cnt;  // (int) Math.round(greenon_cnt / 18.0);
		}
		
		this.total_socre = 0;	// stroke 친 개수
		if (score.getStroke1() != null) this.total_socre += score.getStroke1();
		if (score.getStroke2() != null) this.total_socre += score.getStroke2();
		if (score.getStroke3() != null) this.total_socre += score.getStroke3();
		if (score.getStroke4() != null) this.total_socre += score.getStroke4();
		if (score.getStroke5() != null) this.total_socre += score.getStroke5();
		if (score.getStroke6() != null) this.total_socre += score.getStroke6();
		if (score.getStroke7() != null) this.total_socre += score.getStroke7();
		if (score.getStroke8() != null) this.total_socre += score.getStroke8();
		if (score.getStroke9() != null) this.total_socre += score.getStroke9();
		if (score.getStroke10() != null) this.total_socre += score.getStroke10();
		if (score.getStroke11() != null) this.total_socre += score.getStroke11();
		if (score.getStroke12() != null) this.total_socre += score.getStroke12();
		if (score.getStroke13() != null) this.total_socre += score.getStroke13();
		if (score.getStroke14() != null) this.total_socre += score.getStroke14();
		if (score.getStroke15() != null) this.total_socre += score.getStroke15();
		if (score.getStroke16() != null) this.total_socre += score.getStroke16();
		if (score.getStroke17() != null) this.total_socre += score.getStroke17();
		if (score.getStroke18() != null) this.total_socre += score.getStroke18();
		
		// par data
		this.par_data = "";
		int par = 0;
		if (score.getScore1() != null) par += score.getScore1();
		if (score.getScore2() != null) par += score.getScore2();
		if (score.getScore3() != null) par += score.getScore3();
		if (score.getScore4() != null) par += score.getScore4();
		if (score.getScore5() != null) par += score.getScore5();
		if (score.getScore6() != null) par += score.getScore6();
		if (score.getScore7() != null) par += score.getScore7();
		if (score.getScore8() != null) par += score.getScore8();
		if (score.getScore9() != null) par += score.getScore9();
		if (score.getScore10() != null) par += score.getScore10();
		if (score.getScore11() != null) par += score.getScore11();
		if (score.getScore12() != null) par += score.getScore12();
		if (score.getScore13() != null) par += score.getScore13();
		if (score.getScore14() != null) par += score.getScore14();
		if (score.getScore15() != null) par += score.getScore15();
		if (score.getScore16() != null) par += score.getScore16();
		if (score.getScore17() != null) par += score.getScore17();
		if (score.getScore18() != null) par += score.getScore18();
		
		System.out.println("par : " + par);
		
		if (par > 0) this.par_data = "+"+String.valueOf(par);
		else this.par_data = "-"+String.valueOf(Math.abs(par));		
		
		this.puttersum = 0;	// stroke 친 개수
		if (score.getPutter1() != null) this.puttersum += score.getPutter1();
		if (score.getPutter2() != null) this.puttersum += score.getPutter2();
		if (score.getPutter3() != null) this.puttersum += score.getPutter3();
		if (score.getPutter4() != null) this.puttersum += score.getPutter4();
		if (score.getPutter5() != null) this.puttersum += score.getPutter5();
		if (score.getPutter6() != null) this.puttersum += score.getPutter6();
		if (score.getPutter7() != null) this.puttersum += score.getPutter7();
		if (score.getPutter8() != null) this.puttersum += score.getPutter8();
		if (score.getPutter9() != null) this.puttersum += score.getPutter9();
		if (score.getPutter10() != null) this.puttersum += score.getPutter10();
		if (score.getPutter11() != null) this.puttersum += score.getPutter11();
		if (score.getPutter12() != null) this.puttersum += score.getPutter12();
		if (score.getPutter13() != null) this.puttersum += score.getPutter13();
		if (score.getPutter14() != null) this.puttersum += score.getPutter14();
		if (score.getPutter15() != null) this.puttersum += score.getPutter15();
		if (score.getPutter16() != null) this.puttersum += score.getPutter16();
		if (score.getPutter17() != null) this.puttersum += score.getPutter17();
		if (score.getPutter18() != null) this.puttersum += score.getPutter18();	
		
		// 퍼팅 패턴 카운트
		this.pattern1 = 0;
		this.pattern2 = 0;
		this.pattern3 = 0;
		this.pattern4 = 0;
		this.pattern5 = 0;
		this.pattern6 = 0;
		this.pattern7 = 0;
		this.pattern8 = 0;
		
		if (detail.getPuterpattern1() != null) puterPatternCheck(detail.getPuterpattern1());
		if (detail.getPuterpattern2() != null) puterPatternCheck(detail.getPuterpattern2());
		if (detail.getPuterpattern3() != null) puterPatternCheck(detail.getPuterpattern3());
		if (detail.getPuterpattern4() != null) puterPatternCheck(detail.getPuterpattern4());
		if (detail.getPuterpattern5() != null) puterPatternCheck(detail.getPuterpattern5());
		if (detail.getPuterpattern6() != null) puterPatternCheck(detail.getPuterpattern6());
		if (detail.getPuterpattern7() != null) puterPatternCheck(detail.getPuterpattern7());
		if (detail.getPuterpattern8() != null) puterPatternCheck(detail.getPuterpattern8());
		if (detail.getPuterpattern9() != null) puterPatternCheck(detail.getPuterpattern9());
		if (detail.getPuterpattern10() != null) puterPatternCheck(detail.getPuterpattern10());
		if (detail.getPuterpattern11() != null) puterPatternCheck(detail.getPuterpattern11());
		if (detail.getPuterpattern12() != null) puterPatternCheck(detail.getPuterpattern12());
		if (detail.getPuterpattern13() != null) puterPatternCheck(detail.getPuterpattern13());
		if (detail.getPuterpattern14() != null) puterPatternCheck(detail.getPuterpattern14());
		if (detail.getPuterpattern15() != null) puterPatternCheck(detail.getPuterpattern15());
		if (detail.getPuterpattern16() != null) puterPatternCheck(detail.getPuterpattern16());
		if (detail.getPuterpattern17() != null) puterPatternCheck(detail.getPuterpattern17());
		if (detail.getPuterpattern18() != null) puterPatternCheck(detail.getPuterpattern18());
	}
	/**
	 * 퍼팅 패턴 카운터
	 * @param pattern
	 */
	private void puterPatternCheck(String pattern)
	{
		if (StringUtils.isEmpty(pattern)) return;
		char s = pattern.charAt(0);
		
		if (pattern.equals("SL")) {
			this.pattern1++;
		}else if (pattern.equals("SR")) {
			this.pattern2++;
		}else if (pattern.equals("SS")) {
			this.pattern3++;
		}else if(pattern.equals("JL")) {
			this.pattern4++;
		}else if(pattern.equals("JR")) {
			this.pattern5++;
		}else if(pattern.equals("OL")) {
			this.pattern6++;
		}else if(pattern.equals("OS")) {
			this.pattern7++;
		}else if(pattern.equals("OL")) {
			this.pattern8++;
		}
	}
}
