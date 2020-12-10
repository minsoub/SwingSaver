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
@IdClass(AreaInfoPK.class)
@Table(name="scareainfo")
public class AreaInfo {

	@Id
	@Column(name="country_id", nullable=false, length=4, columnDefinition="국가코드")
	private String country_id;
	
	@Id
	@Column(name="zone_id", nullable=false, length=4, columnDefinition="지역코드")
	private String zone_id;
	
	@Column(name="zone_nm", nullable=true, length=100, columnDefinition="지역명")
	private String zone_nm;
	
	@Column(name="address", nullable=true, length=300, columnDefinition="주소")
	private String address;
	
	@Column(name="phone", nullable=true, length=20, columnDefinition="전화번호")
	private String phone;
	
	@Column(name="email", nullable=true, length=100, columnDefinition="메일주소")
	private String email;
	
	@Column(name="description", nullable=true, length=1000, columnDefinition="설명")
	private String description;
	
	private Timestamp dateinserted;
	
	@Column(name="user_name", nullable=true, length=100, columnDefinition="사용자명")
	private String user_name;
}
