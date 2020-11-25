package com.swing.saver.web.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

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
}
