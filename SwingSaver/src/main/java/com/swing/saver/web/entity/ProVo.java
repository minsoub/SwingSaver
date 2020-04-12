package com.swing.saver.web.entity;

import org.springframework.web.multipart.MultipartFile;

/**
 * Market Pro VO Class
 * Table Name : SWMARKETPRO
 * 
 * @author hist
 *
 */
public class ProVo {
	private String id;
	private String userid;
	private String region;
	private String lessonprice;
	private String rating;
	private String prolevel;
	private String description;
	private String profile;
	private String profile_img;
	private String email;
	private String name;
	private String region_nm;
	private String prolevel_nm;
	private boolean result;
	private String error;
	private String photo;
	MultipartFile imageFile;
	
	
	
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
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

	public String getProlevel_nm() {
		return prolevel_nm;
	}
	public void setProlevel_nm(String prolevel_nm) {
		this.prolevel_nm = prolevel_nm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion_nm() {
		return region_nm;
	}
	public void setRegion_nm(String region_nm) {
		this.region_nm = region_nm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getLessonprice() {
		return lessonprice;
	}
	public void setLessonprice(String lessonprice) {
		this.lessonprice = lessonprice;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getProlevel() {
		return prolevel;
	}
	public void setProlevel(String prolevel) {
		this.prolevel = prolevel;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
}
