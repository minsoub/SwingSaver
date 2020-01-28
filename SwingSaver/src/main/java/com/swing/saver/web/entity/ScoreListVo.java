package com.swing.saver.web.entity;

/**
 * 내스코어 관리에서 리스트 객체 클래스
 * @author minso
 *
 */
public class ScoreListVo {
	private String visit_date;
	private String countryclub_id;
	private int seq_no;
	private int user_id;
	private String countryclub_nm;
	private String start_course;
	private String end_course;
	private int par_sum;
	private int score_sum;
	private int start_sum;
	private int end_sum;
		
	// 검색 조건
	private String search_visit_date;
	private String search_seq_no;
	private String search_countryclub_id;
	private String stdate;
	private String etdate;
	private String country_id;
	private String zone_id;
	
	
	
	public String getStdate() {
		return stdate;
	}
	public void setStdate(String stdate) {
		this.stdate = stdate;
	}
	public String getEtdate() {
		return etdate;
	}
	public void setEtdate(String etdate) {
		this.etdate = etdate;
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
	public String getSearch_visit_date() {
		return search_visit_date;
	}
	public void setSearch_visit_date(String search_visit_date) {
		this.search_visit_date = search_visit_date;
	}
	public String getSearch_seq_no() {
		return search_seq_no;
	}
	public void setSearch_seq_no(String search_seq_no) {
		this.search_seq_no = search_seq_no;
	}
	public String getSearch_countryclub_id() {
		return search_countryclub_id;
	}
	public void setSearch_countryclub_id(String search_countryclub_id) {
		this.search_countryclub_id = search_countryclub_id;
	}
	public int getStart_sum() {
		return start_sum;
	}
	public void setStart_sum(int start_sum) {
		this.start_sum = start_sum;
	}
	public int getEnd_sum() {
		return end_sum;
	}
	public void setEnd_sum(int end_sum) {
		this.end_sum = end_sum;
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
	public String getCountryclub_nm() {
		return countryclub_nm;
	}
	public void setCountryclub_nm(String countryclub_nm) {
		this.countryclub_nm = countryclub_nm;
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
	public int getPar_sum() {
		return par_sum;
	}
	public void setPar_sum(int par_sum) {
		this.par_sum = par_sum;
	}
	public int getScore_sum() {
		return score_sum;
	}
	public void setScore_sum(int score_sum) {
		this.score_sum = score_sum;
	}
	
	
	
}
