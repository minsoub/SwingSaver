package com.swing.saver.web.entity;
import org.springframework.web.multipart.*;
/**
 * 골프장 정보 클래스
 * @author hist
 *
 */
public class GolfVo {
	String country_id;		// 국가코드
	String zone_id;			// 지역코드
	String countryclub_id;		// 골프장 코드
	String countryclub_nm;		// 골프장 이름
	int hole_value;				// 홀수
	String image;			// 기본 이미지 경로
	String address;			// 골프장 주소
	String phone;			// 연락처
	String email;			// 담당자 메일
	String assets;			// 저장경로
	String description;		// 비고
	String alliance_check;	// 제휴여부
	String pgm_call_param;  // 프로그램 호출인자
	String dateinserted;
	boolean result;
	String error;
	String country_nm;		// 국가코드명
	String zone_nm;			// 지역명
	String image_url;		// 이미지 경로
	String assets_url;		// 저장이미지 경로
	
	MultipartFile imageFile;
	MultipartFile assetsFile;
	
	
	
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getAssets_url() {
		return assets_url;
	}
	public void setAssets_url(String assets_url) {
		this.assets_url = assets_url;
	}
	public String getCountry_nm() {
		return country_nm;
	}
	public void setCountry_nm(String country_nm) {
		this.country_nm = country_nm;
	}
	public String getZone_nm() {
		return zone_nm;
	}
	public void setZone_nm(String zone_nm) {
		this.zone_nm = zone_nm;
	}
	public String getAlliance_check() {
		return alliance_check;
	}
	public void setAlliance_check(String alliance_check) {
		this.alliance_check = alliance_check;
	}
	public String getPgm_call_param() {
		return pgm_call_param;
	}
	public void setPgm_call_param(String pgm_call_param) {
		this.pgm_call_param = pgm_call_param;
	}
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	public MultipartFile getAssetsFile() {
		return assetsFile;
	}
	public void setAssetsFile(MultipartFile assetsFile) {
		this.assetsFile = assetsFile;
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
	public String getDateinserted() {
		return dateinserted;
	}
	public void setDateinserted(String dateinserted) {
		this.dateinserted = dateinserted;
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
	public String getCountryclub_nm() {
		return countryclub_nm;
	}
	public void setCountryclub_nm(String countryclub_nm) {
		this.countryclub_nm = countryclub_nm;
	}
	public int getHole_value() {
		return hole_value;
	}
	public void setHole_value(int hole_value) {
		this.hole_value = hole_value;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	public String getAssets() {
		return assets;
	}
	public void setAssets(String assets) {
		this.assets = assets;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
