package com.swing.saver.web.entity;

/**
 * 골프자 FAR 정보 클래스
 * 
 * @author hist
 *
 */
public class FarVo {
	String country_id;
	String zone_id;
	String countryclub_id;		// 골프장 Key
	String course;				// 코스순서
	int hole1 = 0;
	int hole2 = 0;
	int hole3 = 0;
	int hole4 = 0;
	int hole5 = 0;
	int hole6 = 0;
	int hole7 = 0;
	int hole8 = 0;
	int hole9 = 0;
	int sum = 0;
	String course_nm;			// 코스명
	String dateinserted;
	
	boolean result;
	String error;
	
	
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
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
	public String getCountryclub_id() {
		return countryclub_id;
	}
	public void setCountryclub_id(String countryclub_id) {
		this.countryclub_id = countryclub_id;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getHole1() {
		return hole1;
	}
	public void setHole1(int hole1) {
		this.hole1 = hole1;
	}
	public int getHole2() {
		return hole2;
	}
	public void setHole2(int hole2) {
		this.hole2 = hole2;
	}
	public int getHole3() {
		return hole3;
	}
	public void setHole3(int hole3) {
		this.hole3 = hole3;
	}
	public int getHole4() {
		return hole4;
	}
	public void setHole4(int hole4) {
		this.hole4 = hole4;
	}
	public int getHole5() {
		return hole5;
	}
	public void setHole5(int hole5) {
		this.hole5 = hole5;
	}
	public int getHole6() {
		return hole6;
	}
	public void setHole6(int hole6) {
		this.hole6 = hole6;
	}
	public int getHole7() {
		return hole7;
	}
	public void setHole7(int hole7) {
		this.hole7 = hole7;
	}
	public int getHole8() {
		return hole8;
	}
	public void setHole8(int hole8) {
		this.hole8 = hole8;
	}
	public int getHole9() {
		return hole9;
	}
	public void setHole9(int hole9) {
		this.hole9 = hole9;
	}

	public String getCourse_nm() {
		return course_nm;
	}
	public void setCourse_nm(String course_nm) {
		this.course_nm = course_nm;
	}
	public String getDateinserted() {
		return dateinserted;
	}
	public void setDateinserted(String dateinserted) {
		this.dateinserted = dateinserted;
	}
	
	
}
