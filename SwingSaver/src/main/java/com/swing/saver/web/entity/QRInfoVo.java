package com.swing.saver.web.entity;

/**
 * QR를 통해서 넘어오는 파라미터 정보를 맵핑한다.
 * @author minso
 *
 */
public class QRInfoVo {
	private String country_id;		// 국가코드
	private String zone_id;			// 지역코드
	private String countryclub_id;	// 골프장 코드
	private String startcourse;		// out 시작코스 (2자리)
	private String endcourse;		// in 종료코스 (2자리)
	private String username;		// 사용자명
	private String score;			// 사용자점수
	private String othername1;		// 동반자 1
	private String score1;			// 동반자 1의 점수
	private String othername2;		// 동반자 2
	private String score2;			// 동반자 2의 점수
	private String othername3;		// 동반자 3
	private String score3;			// 동반자 3의 점수
	
	
	
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
	public String getStartcourse() {
		return startcourse;
	}
	public void setStartcourse(String startcourse) {
		this.startcourse = startcourse;
	}
	public String getEndcourse() {
		return endcourse;
	}
	public void setEndcourse(String endcourse) {
		this.endcourse = endcourse;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getOthername1() {
		return othername1;
	}
	public void setOthername1(String othername1) {
		this.othername1 = othername1;
	}
	public String getScore1() {
		return score1;
	}
	public void setScore1(String score1) {
		this.score1 = score1;
	}
	public String getOthername2() {
		return othername2;
	}
	public void setOthername2(String othername2) {
		this.othername2 = othername2;
	}
	public String getScore2() {
		return score2;
	}
	public void setScore2(String score2) {
		this.score2 = score2;
	}
	public String getOthername3() {
		return othername3;
	}
	public void setOthername3(String othername3) {
		this.othername3 = othername3;
	}
	public String getScore3() {
		return score3;
	}
	public void setScore3(String score3) {
		this.score3 = score3;
	}
	
	
	
}
