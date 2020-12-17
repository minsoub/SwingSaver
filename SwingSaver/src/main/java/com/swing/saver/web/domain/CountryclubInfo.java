package com.swing.saver.web.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import com.swing.saver.web.entity.GolfVo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			
@NoArgsConstructor
@IdClass(CountryclubInfoPK.class)
@Table(name="sccountryclubinfo")
public class CountryclubInfo {
	@Id
	@Column(name="country_id", nullable=false, length=4)
	private String country_id;
	
	@Id
	@Column(name="zone_id", nullable=false, length=4)
	private String zone_id;
	
	@Id
	@Column(name="countryclub_id", nullable=false, length=4)
	private String countryclub_id;
	
	@Column(name="countryclub_nm", nullable=true, length=50)
	private String countryclub_nm;
	
	Integer hole_value;
	
	@Column(name="image", length=100)
	private String image;
	
	@Column(name="logo_image", length=100, columnDefinition="로고 가로 이미지")
	private String logo_image;
	
	@Column(name="address", length=300)
	private String address;
	
	@Column(name="phone", length=20)
	private String phone;
	
	@Column(name="email", length=20)
	private String email;
	
	@Column(name="link_check", length=1)
	private String link_check;	
	
	@Column(name="assets", length=100)
	private String assets;		
	
	@Column(name="simage", length=100)
	private String simage;	
	
	@Column(name="fdata", length=100)
	private String fdata;	
	
	@Column(name="rsv_url", length=200)
	private String rsv_url;	
	
	@Column(name="evt_url", length=200)
	private String evt_url;	
	
	@Column(name="description", length=1000)
	private String description;	
	
	private Timestamp dateinserted;	
	
	@Column(name="alliance_check", length=1)
	private String alliance_check;	
	
	@Column(name="pgm_call_param", length=200)
	private String pgm_call_param;	
	
	@OneToOne(mappedBy="countryclubInfo", fetch=FetchType.LAZY)
	private ArPerson arPerson;
	
	@Builder
	public CountryclubInfo(GolfVo data) {
		this.country_id = data.getCountry_id();
		this.zone_id = data.getZone_id();
		this.countryclub_id = data.getCountryclub_id();
		this.countryclub_nm = data.getCountryclub_nm();
		this.hole_value = data.getHole_value();
		this.image = data.getImage();
		this.logo_image = data.getLogo_image();
		this.address = data.getAddress();
		this.phone = data.getPhone();
		this.email = data.getEmail();
		this.link_check = data.getLink_check();
		this.assets = data.getAssets();
		this.simage = data.getSimage();
		this.fdata = data.getFdata();
		this.rsv_url= data.getRsv_url();
		this.evt_url = data.getEvt_url();
		this.description = data.getDescription();
		this.alliance_check = data.getAlliance_check();
		this.pgm_call_param = data.getPgm_call_param();
		this.dateinserted = new Timestamp(System.currentTimeMillis()); 
	}
}
