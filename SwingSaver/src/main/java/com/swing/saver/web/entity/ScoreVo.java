package com.swing.saver.web.entity;

/**
 * 개인별 스코어 정보
 * Table Name : SCSCOREINFO
 * @author minso
 *
 */
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
	
	
	
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public int getScore_plus_sum() {
		return score_plus_sum;
	}
	public void setScore_plus_sum(int score_plus_sum) {
		this.score_plus_sum = score_plus_sum;
	}
	public int getScore_sum() {
		return score_sum;
	}
	public void setScore_sum(int score_sum) {
		this.score_sum = score_sum;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public String getContryclub_id() {
		return contryclub_id;
	}
	public void setContryclub_id(String contryclub_id) {
		this.contryclub_id = contryclub_id;
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

	public int getStart_course() {
		return start_course;
	}
	public void setStart_course(int start_course) {
		this.start_course = start_course;
	}
	public int getEnd_course() {
		return end_course;
	}
	public void setEnd_course(int end_course) {
		this.end_course = end_course;
	}
	public int getScore1() {
		return score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	public int getScore2() {
		return score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	public int getScore3() {
		return score3;
	}
	public void setScore3(int score3) {
		this.score3 = score3;
	}
	public int getScore4() {
		return score4;
	}
	public void setScore4(int score4) {
		this.score4 = score4;
	}
	public int getScore5() {
		return score5;
	}
	public void setScore5(int score5) {
		this.score5 = score5;
	}
	public int getScore6() {
		return score6;
	}
	public void setScore6(int score6) {
		this.score6 = score6;
	}
	public int getScore7() {
		return score7;
	}
	public void setScore7(int score7) {
		this.score7 = score7;
	}
	public int getScore8() {
		return score8;
	}
	public void setScore8(int score8) {
		this.score8 = score8;
	}
	public int getScore9() {
		return score9;
	}
	public void setScore9(int score9) {
		this.score9 = score9;
	}
	public int getScore10() {
		return score10;
	}
	public void setScore10(int score10) {
		this.score10 = score10;
	}
	public int getScore11() {
		return score11;
	}
	public void setScore11(int score11) {
		this.score11 = score11;
	}
	public int getScore12() {
		return score12;
	}
	public void setScore12(int score12) {
		this.score12 = score12;
	}
	public int getScore13() {
		return score13;
	}
	public void setScore13(int score13) {
		this.score13 = score13;
	}
	public int getScore14() {
		return score14;
	}
	public void setScore14(int score14) {
		this.score14 = score14;
	}
	public int getScore15() {
		return score15;
	}
	public void setScore15(int score15) {
		this.score15 = score15;
	}
	public int getScore16() {
		return score16;
	}
	public void setScore16(int score16) {
		this.score16 = score16;
	}
	public int getScore17() {
		return score17;
	}
	public void setScore17(int score17) {
		this.score17 = score17;
	}
	public int getScore18() {
		return score18;
	}	
	public void setScore18(int score18) {
		this.score18 = score18;
	}
	
	public int getStroke1() {
		return stroke1;
	}
	public void setStroke1(int stroke1) {
		this.stroke1 = stroke1;
	}
	public int getStroke2() {
		return stroke2;
	}
	public void setStroke2(int stroke2) {
		this.stroke2 = stroke2;
	}
	public int getStroke3() {
		return stroke3;
	}
	public void setStroke3(int stroke3) {
		this.stroke3 = stroke3;
	}
	public int getStroke4() {
		return stroke4;
	}
	public void setStroke4(int stroke4) {
		this.stroke4 = stroke4;
	}
	public int getStroke5() {
		return stroke5;
	}
	public void setStroke5(int stroke5) {
		this.stroke5 = stroke5;
	}
	public int getStroke6() {
		return stroke6;
	}
	public void setStroke6(int stroke6) {
		this.stroke6 = stroke6;
	}
	public int getStroke7() {
		return stroke7;
	}
	public void setStroke7(int stroke7) {
		this.stroke7 = stroke7;
	}
	public int getStroke8() {
		return stroke8;
	}
	public void setStroke8(int stroke8) {
		this.stroke8 = stroke8;
	}
	public int getStroke9() {
		return stroke9;
	}
	public void setStroke9(int stroke9) {
		this.stroke9 = stroke9;
	}
	public int getStroke10() {
		return stroke10;
	}
	public void setStroke10(int stroke10) {
		this.stroke10 = stroke10;
	}
	public int getStroke11() {
		return stroke11;
	}
	public void setStroke11(int stroke11) {
		this.stroke11 = stroke11;
	}
	public int getStroke12() {
		return stroke12;
	}
	public void setStroke12(int stroke12) {
		this.stroke12 = stroke12;
	}
	public int getStroke13() {
		return stroke13;
	}
	public void setStroke13(int stroke13) {
		this.stroke13 = stroke13;
	}
	public int getStroke14() {
		return stroke14;
	}
	public void setStroke14(int stroke14) {
		this.stroke14 = stroke14;
	}
	public int getStroke15() {
		return stroke15;
	}
	public void setStroke15(int stroke15) {
		this.stroke15 = stroke15;
	}
	public int getStroke16() {
		return stroke16;
	}
	public void setStroke16(int stroke16) {
		this.stroke16 = stroke16;
	}
	public int getStroke17() {
		return stroke17;
	}
	public void setStroke17(int stroke17) {
		this.stroke17 = stroke17;
	}
	public int getStroke18() {
		return stroke18;
	}
	public void setStroke18(int stroke18) {
		this.stroke18 = stroke18;
	}
	public int getPutter1() {
		return putter1;
	}
	public void setPutter1(int putter1) {
		this.putter1 = putter1;
	}
	public int getPutter2() {
		return putter2;
	}
	public void setPutter2(int putter2) {
		this.putter2 = putter2;
	}
	public int getPutter3() {
		return putter3;
	}
	public void setPutter3(int putter3) {
		this.putter3 = putter3;
	}
	public int getPutter4() {
		return putter4;
	}
	public void setPutter4(int putter4) {
		this.putter4 = putter4;
	}
	public int getPutter5() {
		return putter5;
	}
	public void setPutter5(int putter5) {
		this.putter5 = putter5;
	}
	public int getPutter6() {
		return putter6;
	}
	public void setPutter6(int putter6) {
		this.putter6 = putter6;
	}
	public int getPutter7() {
		return putter7;
	}
	public void setPutter7(int putter7) {
		this.putter7 = putter7;
	}
	public int getPutter8() {
		return putter8;
	}
	public void setPutter8(int putter8) {
		this.putter8 = putter8;
	}
	public int getPutter9() {
		return putter9;
	}
	public void setPutter9(int putter9) {
		this.putter9 = putter9;
	}
	public int getPutter10() {
		return putter10;
	}
	public void setPutter10(int putter10) {
		this.putter10 = putter10;
	}
	public int getPutter11() {
		return putter11;
	}
	public void setPutter11(int putter11) {
		this.putter11 = putter11;
	}
	public int getPutter12() {
		return putter12;
	}
	public void setPutter12(int putter12) {
		this.putter12 = putter12;
	}
	public int getPutter13() {
		return putter13;
	}
	public void setPutter13(int putter13) {
		this.putter13 = putter13;
	}
	public int getPutter14() {
		return putter14;
	}
	public void setPutter14(int putter14) {
		this.putter14 = putter14;
	}
	public int getPutter15() {
		return putter15;
	}
	public void setPutter15(int putter15) {
		this.putter15 = putter15;
	}
	public int getPutter16() {
		return putter16;
	}
	public void setPutter16(int putter16) {
		this.putter16 = putter16;
	}
	public int getPutter17() {
		return putter17;
	}
	public void setPutter17(int putter17) {
		this.putter17 = putter17;
	}
	public int getPutter18() {
		return putter18;
	}
	public void setPutter18(int putter18) {
		this.putter18 = putter18;
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
	
	
	
}
