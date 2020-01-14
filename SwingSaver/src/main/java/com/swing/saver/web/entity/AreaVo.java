package com.swing.saver.web.entity;

/**
 * 지역정보 클래스 
 * @author minso
 *
 */
public class AreaVo {
	String country_id;		// 국가코드
	String zone_id;			// 지역코드 
	String zone_nm;			// 지역명
	String user_name;		// 지역담당자명 
	String address;			// 지역담당자 주소
	String phone;			// 지역담당자 연락처
	String email;			// 지역담당자 메일
	String description;		// 비고
	String dateinserted;		// 등록일자 
	String error;
	boolean result;
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getZone_nm() {
		return zone_nm;
	}
	public void setZone_nm(String zone_nm) {
		this.zone_nm = zone_nm;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) { 
		this.user_name = user_name;
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
	
	
}
