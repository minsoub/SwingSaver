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
	String dateinserted;
	boolean result;
	String error;
	
	MultipartFile imageFile;
	MultipartFile assetsFile;
	
	
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
