package com.swing.saver.web.entity;

public class ScoreMaster {
	private String visit_date;				// 방문일자 
	private String country_id;
	private String zone_id;
	private String countryclub_id;			// 골프장 코드
	private String countryclub_nm;			// 골프장명
	private int seq_no;
	private int user_id;					// 사용자 순번 키
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
	
	
	
	public String getCountry_id() {
		return country_id;
	}
	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}
	public String getZone_id() {
		return zone_id;
	}
	public void setZone_id(String zone_id) {
		this.zone_id = zone_id;
	}
	public String getCountryclub_nm() {
		return countryclub_nm;
	}
	public void setCountryclub_nm(String countryclub_nm) {
		this.countryclub_nm = countryclub_nm;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}

	public String getCountryclub_id() {
		return countryclub_id;
	}
	public void setCountryclub_id(String countryclub_id) {
		this.countryclub_id = countryclub_id;
	}
	public int getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getStart_course() {
		return start_course;
	}
	public void setStart_course(String start_course) {
		this.start_course = start_course;
	}
	public String getEnd_course() {
		return end_course;
	}
	public void setEnd_course(String end_course) {
		this.end_course = end_course;
	}
	public String getScore1() {
		return score1;
	}
	public void setScore1(String score1) {
		this.score1 = score1;
	}
	public String getScore2() {
		return score2;
	}
	public void setScore2(String score2) {
		this.score2 = score2;
	}
	public String getScore3() {
		return score3;
	}
	public void setScore3(String score3) {
		this.score3 = score3;
	}
	public String getScore4() {
		return score4;
	}
	public void setScore4(String score4) {
		this.score4 = score4;
	}
	public String getScore5() {
		return score5;
	}
	public void setScore5(String score5) {
		this.score5 = score5;
	}
	public String getScore6() {
		return score6;
	}
	public void setScore6(String score6) {
		this.score6 = score6;
	}
	public String getScore7() {
		return score7;
	}
	public void setScore7(String score7) {
		this.score7 = score7;
	}
	public String getScore8() {
		return score8;
	}
	public void setScore8(String score8) {
		this.score8 = score8;
	}
	public String getScore9() {
		return score9;
	}
	public void setScore9(String score9) {
		this.score9 = score9;
	}
	public String getScore10() {
		return score10;
	}
	public void setScore10(String score10) {
		this.score10 = score10;
	}
	public String getScore11() {
		return score11;
	}
	public void setScore11(String score11) {
		this.score11 = score11;
	}
	public String getScore12() {
		return score12;
	}
	public void setScore12(String score12) {
		this.score12 = score12;
	}
	public String getScore13() {
		return score13;
	}
	public void setScore13(String score13) {
		this.score13 = score13;
	}
	public String getScore14() {
		return score14;
	}
	public void setScore14(String score14) {
		this.score14 = score14;
	}
	public String getScore15() {
		return score15;
	}
	public void setScore15(String score15) {
		this.score15 = score15;
	}
	public String getScore16() {
		return score16;
	}
	public void setScore16(String score16) {
		this.score16 = score16;
	}
	public String getScore17() {
		return score17;
	}
	public void setScore17(String score17) {
		this.score17 = score17;
	}
	public String getScore18() {
		return score18;
	}
	public void setScore18(String score18) {
		this.score18 = score18;
	}
	public String getScoresum1() {
		return scoresum1;
	}
	public void setScoresum1(String scoresum1) {
		this.scoresum1 = scoresum1;
	}
	public String getScoresum2() {
		return scoresum2;
	}
	public void setScoresum2(String scoresum2) {
		this.scoresum2 = scoresum2;
	}
	public String getStroke1() {
		return stroke1;
	}
	public void setStroke1(String stroke1) {
		this.stroke1 = stroke1;
	}
	public String getStroke2() {
		return stroke2;
	}
	public void setStroke2(String stroke2) {
		this.stroke2 = stroke2;
	}
	public String getStroke3() {
		return stroke3;
	}
	public void setStroke3(String stroke3) {
		this.stroke3 = stroke3;
	}
	public String getStroke4() {
		return stroke4;
	}
	public void setStroke4(String stroke4) {
		this.stroke4 = stroke4;
	}
	public String getStroke5() {
		return stroke5;
	}
	public void setStroke5(String stroke5) {
		this.stroke5 = stroke5;
	}
	public String getStroke6() {
		return stroke6;
	}
	public void setStroke6(String stroke6) {
		this.stroke6 = stroke6;
	}
	public String getStroke7() {
		return stroke7;
	}
	public void setStroke7(String stroke7) {
		this.stroke7 = stroke7;
	}
	public String getStroke8() {
		return stroke8;
	}
	public void setStroke8(String stroke8) {
		this.stroke8 = stroke8;
	}
	public String getStroke9() {
		return stroke9;
	}
	public void setStroke9(String stroke9) {
		this.stroke9 = stroke9;
	}
	public String getStroke10() {
		return stroke10;
	}
	public void setStroke10(String stroke10) {
		this.stroke10 = stroke10;
	}
	public String getStroke11() {
		return stroke11;
	}
	public void setStroke11(String stroke11) {
		this.stroke11 = stroke11;
	}
	public String getStroke12() {
		return stroke12;
	}
	public void setStroke12(String stroke12) {
		this.stroke12 = stroke12;
	}
	public String getStroke13() {
		return stroke13;
	}
	public void setStroke13(String stroke13) {
		this.stroke13 = stroke13;
	}
	public String getStroke14() {
		return stroke14;
	}
	public void setStroke14(String stroke14) {
		this.stroke14 = stroke14;
	}
	public String getStroke15() {
		return stroke15;
	}
	public void setStroke15(String stroke15) {
		this.stroke15 = stroke15;
	}
	public String getStroke16() {
		return stroke16;
	}
	public void setStroke16(String stroke16) {
		this.stroke16 = stroke16;
	}
	public String getStroke17() {
		return stroke17;
	}
	public void setStroke17(String stroke17) {
		this.stroke17 = stroke17;
	}
	public String getStroke18() {
		return stroke18;
	}
	public void setStroke18(String stroke18) {
		this.stroke18 = stroke18;
	}
	public String getStrokesum1() {
		return strokesum1;
	}
	public void setStrokesum1(String strokesum1) {
		this.strokesum1 = strokesum1;
	}
	public String getStrokesum2() {
		return strokesum2;
	}
	public void setStrokesum2(String strokesum2) {
		this.strokesum2 = strokesum2;
	}
	public String getPutter1() {
		return putter1;
	}
	public void setPutter1(String putter1) {
		this.putter1 = putter1;
	}
	public String getPutter2() {
		return putter2;
	}
	public void setPutter2(String putter2) {
		this.putter2 = putter2;
	}
	public String getPutter3() {
		return putter3;
	}
	public void setPutter3(String putter3) {
		this.putter3 = putter3;
	}
	public String getPutter4() {
		return putter4;
	}
	public void setPutter4(String putter4) {
		this.putter4 = putter4;
	}
	public String getPutter5() {
		return putter5;
	}
	public void setPutter5(String putter5) {
		this.putter5 = putter5;
	}
	public String getPutter6() {
		return putter6;
	}
	public void setPutter6(String putter6) {
		this.putter6 = putter6;
	}
	public String getPutter7() {
		return putter7;
	}
	public void setPutter7(String putter7) {
		this.putter7 = putter7;
	}
	public String getPutter8() {
		return putter8;
	}
	public void setPutter8(String putter8) {
		this.putter8 = putter8;
	}
	public String getPutter9() {
		return putter9;
	}
	public void setPutter9(String putter9) {
		this.putter9 = putter9;
	}
	public String getPutter10() {
		return putter10;
	}
	public void setPutter10(String putter10) {
		this.putter10 = putter10;
	}
	public String getPutter11() {
		return putter11;
	}
	public void setPutter11(String putter11) {
		this.putter11 = putter11;
	}
	public String getPutter12() {
		return putter12;
	}
	public void setPutter12(String putter12) {
		this.putter12 = putter12;
	}
	public String getPutter13() {
		return putter13;
	}
	public void setPutter13(String putter13) {
		this.putter13 = putter13;
	}
	public String getPutter14() {
		return putter14;
	}
	public void setPutter14(String putter14) {
		this.putter14 = putter14;
	}
	public String getPutter15() {
		return putter15;
	}
	public void setPutter15(String putter15) {
		this.putter15 = putter15;
	}
	public String getPutter16() {
		return putter16;
	}
	public void setPutter16(String putter16) {
		this.putter16 = putter16;
	}
	public String getPutter17() {
		return putter17;
	}
	public void setPutter17(String putter17) {
		this.putter17 = putter17;
	}
	public String getPutter18() {
		return putter18;
	}
	public void setPutter18(String putter18) {
		this.putter18 = putter18;
	}
	public String getPuttersum1() {
		return puttersum1;
	}
	public void setPuttersum1(String puttersum1) {
		this.puttersum1 = puttersum1;
	}
	public String getPuttersum2() {
		return puttersum2;
	}
	public void setPuttersum2(String puttersum2) {
		this.puttersum2 = puttersum2;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDateinserted() {
		return dateinserted;
	}
	public void setDateinserted(String dateinserted) {
		this.dateinserted = dateinserted;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getPuterpattern1() {
		return puterpattern1;
	}
	public void setPuterpattern1(String puterpattern1) {
		this.puterpattern1 = puterpattern1;
	}
	public String getPuterpattern2() {
		return puterpattern2;
	}
	public void setPuterpattern2(String puterpattern2) {
		this.puterpattern2 = puterpattern2;
	}
	public String getPuterpattern3() {
		return puterpattern3;
	}
	public void setPuterpattern3(String puterpattern3) {
		this.puterpattern3 = puterpattern3;
	}
	public String getPuterpattern4() {
		return puterpattern4;
	}
	public void setPuterpattern4(String puterpattern4) {
		this.puterpattern4 = puterpattern4;
	}
	public String getPuterpattern5() {
		return puterpattern5;
	}
	public void setPuterpattern5(String puterpattern5) {
		this.puterpattern5 = puterpattern5;
	}
	public String getPuterpattern6() {
		return puterpattern6;
	}
	public void setPuterpattern6(String puterpattern6) {
		this.puterpattern6 = puterpattern6;
	}
	public String getPuterpattern7() {
		return puterpattern7;
	}
	public void setPuterpattern7(String puterpattern7) {
		this.puterpattern7 = puterpattern7;
	}
	public String getPuterpattern8() {
		return puterpattern8;
	}
	public void setPuterpattern8(String puterpattern8) {
		this.puterpattern8 = puterpattern8;
	}
	public String getPuterpattern9() {
		return puterpattern9;
	}
	public void setPuterpattern9(String puterpattern9) {
		this.puterpattern9 = puterpattern9;
	}
	public String getPuterpattern10() {
		return puterpattern10;
	}
	public void setPuterpattern10(String puterpattern10) {
		this.puterpattern10 = puterpattern10;
	}
	public String getPuterpattern11() {
		return puterpattern11;
	}
	public void setPuterpattern11(String puterpattern11) {
		this.puterpattern11 = puterpattern11;
	}
	public String getPuterpattern12() {
		return puterpattern12;
	}
	public void setPuterpattern12(String puterpattern12) {
		this.puterpattern12 = puterpattern12;
	}
	public String getPuterpattern13() {
		return puterpattern13;
	}
	public void setPuterpattern13(String puterpattern13) {
		this.puterpattern13 = puterpattern13;
	}
	public String getPuterpattern14() {
		return puterpattern14;
	}
	public void setPuterpattern14(String puterpattern14) {
		this.puterpattern14 = puterpattern14;
	}
	public String getPuterpattern15() {
		return puterpattern15;
	}
	public void setPuterpattern15(String puterpattern15) {
		this.puterpattern15 = puterpattern15;
	}
	public String getPuterpattern16() {
		return puterpattern16;
	}
	public void setPuterpattern16(String puterpattern16) {
		this.puterpattern16 = puterpattern16;
	}
	public String getPuterpattern17() {
		return puterpattern17;
	}
	public void setPuterpattern17(String puterpattern17) {
		this.puterpattern17 = puterpattern17;
	}
	public String getPuterpattern18() {
		return puterpattern18;
	}
	public void setPuterpattern18(String puterpattern18) {
		this.puterpattern18 = puterpattern18;
	}
	public String getParbreak1() {
		return parbreak1;
	}
	public void setParbreak1(String parbreak1) {
		this.parbreak1 = parbreak1;
	}
	public String getParbreak2() {
		return parbreak2;
	}
	public void setParbreak2(String parbreak2) {
		this.parbreak2 = parbreak2;
	}
	public String getParbreak3() {
		return parbreak3;
	}
	public void setParbreak3(String parbreak3) {
		this.parbreak3 = parbreak3;
	}
	public String getParbreak4() {
		return parbreak4;
	}
	public void setParbreak4(String parbreak4) {
		this.parbreak4 = parbreak4;
	}
	public String getParbreak5() {
		return parbreak5;
	}
	public void setParbreak5(String parbreak5) {
		this.parbreak5 = parbreak5;
	}
	public String getParbreak6() {
		return parbreak6;
	}
	public void setParbreak6(String parbreak6) {
		this.parbreak6 = parbreak6;
	}
	public String getParbreak7() {
		return parbreak7;
	}
	public void setParbreak7(String parbreak7) {
		this.parbreak7 = parbreak7;
	}
	public String getParbreak8() {
		return parbreak8;
	}
	public void setParbreak8(String parbreak8) {
		this.parbreak8 = parbreak8;
	}
	public String getParbreak9() {
		return parbreak9;
	}
	public void setParbreak9(String parbreak9) {
		this.parbreak9 = parbreak9;
	}
	public String getParbreak10() {
		return parbreak10;
	}
	public void setParbreak10(String parbreak10) {
		this.parbreak10 = parbreak10;
	}
	public String getParbreak11() {
		return parbreak11;
	}
	public void setParbreak11(String parbreak11) {
		this.parbreak11 = parbreak11;
	}
	public String getParbreak12() {
		return parbreak12;
	}
	public void setParbreak12(String parbreak12) {
		this.parbreak12 = parbreak12;
	}
	public String getParbreak13() {
		return parbreak13;
	}
	public void setParbreak13(String parbreak13) {
		this.parbreak13 = parbreak13;
	}
	public String getParbreak14() {
		return parbreak14;
	}
	public void setParbreak14(String parbreak14) {
		this.parbreak14 = parbreak14;
	}
	public String getParbreak15() {
		return parbreak15;
	}
	public void setParbreak15(String parbreak15) {
		this.parbreak15 = parbreak15;
	}
	public String getParbreak16() {
		return parbreak16;
	}
	public void setParbreak16(String parbreak16) {
		this.parbreak16 = parbreak16;
	}
	public String getParbreak17() {
		return parbreak17;
	}
	public void setParbreak17(String parbreak17) {
		this.parbreak17 = parbreak17;
	}
	public String getParbreak18() {
		return parbreak18;
	}
	public void setParbreak18(String parbreak18) {
		this.parbreak18 = parbreak18;
	}
	public String getSendsavechk1() {
		return sendsavechk1;
	}
	public void setSendsavechk1(String sendsavechk1) {
		if (sendsavechk1 == null) this.sendsavechk1 = "N";
		else this.sendsavechk1 = sendsavechk1;
	}
	public String getSendsavechk2() {
		return sendsavechk2;
	}
	public void setSendsavechk2(String sendsavechk2) {
		if (sendsavechk2 == null) this.sendsavechk2 = "N";
		else this.sendsavechk2 = sendsavechk2;
	}
	public String getSendsavechk3() {
		return sendsavechk3;
	}
	public void setSendsavechk3(String sendsavechk3) {
		if (sendsavechk3 == null) this.sendsavechk3 = "N";
		else this.sendsavechk3 = sendsavechk3;
	}
	public String getSendsavechk4() {
		return sendsavechk4;
	}
	public void setSendsavechk4(String sendsavechk4) {
		if (sendsavechk4 == null) this.sendsavechk4 = "N";
		else this.sendsavechk4 = sendsavechk4;
	}
	public String getSendsavechk5() {
		return sendsavechk5;
	}
	public void setSendsavechk5(String sendsavechk5) {
		if (sendsavechk5 == null) this.sendsavechk5 = "N";
		else this.sendsavechk5 = sendsavechk5;
	}
	public String getSendsavechk6() {
		return sendsavechk6;
	}
	public void setSendsavechk6(String sendsavechk6) {
		if (sendsavechk6 == null) this.sendsavechk6 = "N";
		else this.sendsavechk6 = sendsavechk6;
	}
	public String getSendsavechk7() {
		return sendsavechk7;
	}
	public void setSendsavechk7(String sendsavechk7) {
		if (sendsavechk7 == null) this.sendsavechk7 = "N";
		else this.sendsavechk7 = sendsavechk7;
	}
	public String getSendsavechk8() {
		return sendsavechk8;
	}
	public void setSendsavechk8(String sendsavechk8) {
		if (sendsavechk8 == null) this.sendsavechk8 = "N";
		else this.sendsavechk8 = sendsavechk8;
	}
	public String getSendsavechk9() {
		return sendsavechk9;
	}
	public void setSendsavechk9(String sendsavechk9) {
		if (sendsavechk9 == null) this.sendsavechk9 = "N";
		else this.sendsavechk9 = sendsavechk9;
	}
	public String getSendsavechk10() {
		return sendsavechk10;
	}
	public void setSendsavechk10(String sendsavechk10) {
		if (sendsavechk10 == null) this.sendsavechk10 = "N";
		else this.sendsavechk10 = sendsavechk10;
	}
	public String getSendsavechk11() {
		return sendsavechk11;
	}
	public void setSendsavechk11(String sendsavechk11) {
		if (sendsavechk11 == null) this.sendsavechk11 = "N";
		else this.sendsavechk11 = sendsavechk11;
	}
	public String getSendsavechk12() {
		return sendsavechk12;
	}
	public void setSendsavechk12(String sendsavechk12) {
		if (sendsavechk12 == null) this.sendsavechk12 = "N";
		else this.sendsavechk12 = sendsavechk12;
	}
	public String getSendsavechk13() {
		return sendsavechk13;
	}
	public void setSendsavechk13(String sendsavechk13) {
		if (sendsavechk13 == null) this.sendsavechk13 = "N";
		else this.sendsavechk13 = sendsavechk13;
	}
	public String getSendsavechk14() {
		return sendsavechk14;
	}
	public void setSendsavechk14(String sendsavechk14) {
		if (sendsavechk14 == null) this.sendsavechk14 = "N";
		else this.sendsavechk14 = sendsavechk14;
	}
	public String getSendsavechk15() {
		return sendsavechk15;
	}
	public void setSendsavechk15(String sendsavechk15) {
		if (sendsavechk15 == null) this.sendsavechk15 = "N";
		else this.sendsavechk15 = sendsavechk15;
	}
	public String getSendsavechk16() {
		return sendsavechk16;
	}
	public void setSendsavechk16(String sendsavechk16) {
		if (sendsavechk16 == null) this.sendsavechk16 = "N";
		else this.sendsavechk16 = sendsavechk16;
	}
	public String getSendsavechk17() {
		return sendsavechk17;
	}
	public void setSendsavechk17(String sendsavechk17) {
		if (sendsavechk17 == null) this.sendsavechk17 = "N";
		else this.sendsavechk17 = sendsavechk17;
	}
	public String getSendsavechk18() {
		return sendsavechk18;
	}
	public void setSendsavechk18(String sendsavechk18) {
		if (sendsavechk18 == null) this.sendsavechk18 = "N";
		else this.sendsavechk18 = sendsavechk18;
	}
	public String getSendsave1() {
		return sendsave1;
	}
	public void setSendsave1(String sendsave1) {
		this.sendsave1 = sendsave1;
	}
	public String getSendsave2() {
		return sendsave2;
	}
	public void setSendsave2(String sendsave2) {
		this.sendsave2 = sendsave2;
	}
	public String getSendsave3() {
		return sendsave3;
	}
	public void setSendsave3(String sendsave3) {
		this.sendsave3 = sendsave3;
	}
	public String getSendsave4() {
		return sendsave4;
	}
	public void setSendsave4(String sendsave4) {
		this.sendsave4 = sendsave4;
	}
	public String getSendsave5() {
		return sendsave5;
	}
	public void setSendsave5(String sendsave5) {
		this.sendsave5 = sendsave5;
	}
	public String getSendsave6() {
		return sendsave6;
	}
	public void setSendsave6(String sendsave6) {
		this.sendsave6 = sendsave6;
	}
	public String getSendsave7() {
		return sendsave7;
	}
	public void setSendsave7(String sendsave7) {
		this.sendsave7 = sendsave7;
	}
	public String getSendsave8() {
		return sendsave8;
	}
	public void setSendsave8(String sendsave8) {
		this.sendsave8 = sendsave8;
	}
	public String getSendsave9() {
		return sendsave9;
	}
	public void setSendsave9(String sendsave9) {
		this.sendsave9 = sendsave9;
	}
	public String getSendsave10() {
		return sendsave10;
	}
	public void setSendsave10(String sendsave10) {
		this.sendsave10 = sendsave10;
	}
	public String getSendsave11() {
		return sendsave11;
	}
	public void setSendsave11(String sendsave11) {
		this.sendsave11 = sendsave11;
	}
	public String getSendsave12() {
		return sendsave12;
	}
	public void setSendsave12(String sendsave12) {
		this.sendsave12 = sendsave12;
	}
	public String getSendsave13() {
		return sendsave13;
	}
	public void setSendsave13(String sendsave13) {
		this.sendsave13 = sendsave13;
	}
	public String getSendsave14() {
		return sendsave14;
	}
	public void setSendsave14(String sendsave14) {
		this.sendsave14 = sendsave14;
	}
	public String getSendsave15() {
		return sendsave15;
	}
	public void setSendsave15(String sendsave15) {
		this.sendsave15 = sendsave15;
	}
	public String getSendsave16() {
		return sendsave16;
	}
	public void setSendsave16(String sendsave16) {
		this.sendsave16 = sendsave16;
	}
	public String getSendsave17() {
		return sendsave17;
	}
	public void setSendsave17(String sendsave17) {
		this.sendsave17 = sendsave17;
	}
	public String getSendsave18() {
		return sendsave18;
	}
	public void setSendsave18(String sendsave18) {
		this.sendsave18 = sendsave18;
	}
	public String getGreenon1() {
		return greenon1;
	}
	public void setGreenon1(String greenon1) {
		this.greenon1 = greenon1;
	}
	public String getGreenon2() {
		return greenon2;
	}
	public void setGreenon2(String greenon2) {
		this.greenon2 = greenon2;
	}
	public String getGreenon3() {
		return greenon3;
	}
	public void setGreenon3(String greenon3) {
		this.greenon3 = greenon3;
	}
	public String getGreenon4() {
		return greenon4;
	}
	public void setGreenon4(String greenon4) {
		this.greenon4 = greenon4;
	}
	public String getGreenon5() {
		return greenon5;
	}
	public void setGreenon5(String greenon5) {
		this.greenon5 = greenon5;
	}
	public String getGreenon6() {
		return greenon6;
	}
	public void setGreenon6(String greenon6) {
		this.greenon6 = greenon6;
	}
	public String getGreenon7() {
		return greenon7;
	}
	public void setGreenon7(String greenon7) {
		this.greenon7 = greenon7;
	}
	public String getGreenon8() {
		return greenon8;
	}
	public void setGreenon8(String greenon8) {
		this.greenon8 = greenon8;
	}
	public String getGreenon9() {
		return greenon9;
	}
	public void setGreenon9(String greenon9) {
		this.greenon9 = greenon9;
	}
	public String getGreenon10() {
		return greenon10;
	}
	public void setGreenon10(String greenon10) {
		this.greenon10 = greenon10;
	}
	public String getGreenon11() {
		return greenon11;
	}
	public void setGreenon11(String greenon11) {
		this.greenon11 = greenon11;
	}
	public String getGreenon12() {
		return greenon12;
	}
	public void setGreenon12(String greenon12) {
		this.greenon12 = greenon12;
	}
	public String getGreenon13() {
		return greenon13;
	}
	public void setGreenon13(String greenon13) {
		this.greenon13 = greenon13;
	}
	public String getGreenon14() {
		return greenon14;
	}
	public void setGreenon14(String greenon14) {
		this.greenon14 = greenon14;
	}
	public String getGreenon15() {
		return greenon15;
	}
	public void setGreenon15(String greenon15) {
		this.greenon15 = greenon15;
	}
	public String getGreenon16() {
		return greenon16;
	}
	public void setGreenon16(String greenon16) {
		this.greenon16 = greenon16;
	}
	public String getGreenon17() {
		return greenon17;
	}
	public void setGreenon17(String greenon17) {
		this.greenon17 = greenon17;
	}
	public String getGreenon18() {
		return greenon18;
	}
	public void setGreenon18(String greenon18) {
		this.greenon18 = greenon18;
	}
	public String getFairwayon1() {
		return fairwayon1;
	}
	public void setFairwayon1(String fairwayon1) {
		this.fairwayon1 = fairwayon1;
	}
	public String getFairwayon2() {
		return fairwayon2;
	}
	public void setFairwayon2(String fairwayon2) {
		this.fairwayon2 = fairwayon2;
	}
	public String getFairwayon3() {
		return fairwayon3;
	}
	public void setFairwayon3(String fairwayon3) {
		this.fairwayon3 = fairwayon3;
	}
	public String getFairwayon4() {
		return fairwayon4;
	}
	public void setFairwayon4(String fairwayon4) {
		this.fairwayon4 = fairwayon4;
	}
	public String getFairwayon5() {
		return fairwayon5;
	}
	public void setFairwayon5(String fairwayon5) {
		this.fairwayon5 = fairwayon5;
	}
	public String getFairwayon6() {
		return fairwayon6;
	}
	public void setFairwayon6(String fairwayon6) {
		this.fairwayon6 = fairwayon6;
	}
	public String getFairwayon7() {
		return fairwayon7;
	}
	public void setFairwayon7(String fairwayon7) {
		this.fairwayon7 = fairwayon7;
	}
	public String getFairwayon8() {
		return fairwayon8;
	}
	public void setFairwayon8(String fairwayon8) {
		this.fairwayon8 = fairwayon8;
	}
	public String getFairwayon9() {
		return fairwayon9;
	}
	public void setFairwayon9(String fairwayon9) {
		this.fairwayon9 = fairwayon9;
	}
	public String getFairwayon10() {
		return fairwayon10;
	}
	public void setFairwayon10(String fairwayon10) {
		this.fairwayon10 = fairwayon10;
	}
	public String getFairwayon11() {
		return fairwayon11;
	}
	public void setFairwayon11(String fairwayon11) {
		this.fairwayon11 = fairwayon11;
	}
	public String getFairwayon12() {
		return fairwayon12;
	}
	public void setFairwayon12(String fairwayon12) {
		this.fairwayon12 = fairwayon12;
	}
	public String getFairwayon13() {
		return fairwayon13;
	}
	public void setFairwayon13(String fairwayon13) {
		this.fairwayon13 = fairwayon13;
	}
	public String getFairwayon14() {
		return fairwayon14;
	}
	public void setFairwayon14(String fairwayon14) {
		this.fairwayon14 = fairwayon14;
	}
	public String getFairwayon15() {
		return fairwayon15;
	}
	public void setFairwayon15(String fairwayon15) {
		this.fairwayon15 = fairwayon15;
	}
	public String getFairwayon16() {
		return fairwayon16;
	}
	public void setFairwayon16(String fairwayon16) {
		this.fairwayon16 = fairwayon16;
	}
	public String getFairwayon17() {
		return fairwayon17;
	}
	public void setFairwayon17(String fairwayon17) {
		this.fairwayon17 = fairwayon17;
	}
	public String getFairwayon18() {
		return fairwayon18;
	}
	public void setFairwayon18(String fairwayon18) {
		this.fairwayon18 = fairwayon18;
	}

	
	
}

