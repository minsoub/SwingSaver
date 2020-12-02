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
@IdClass(ParInfoPK.class)
@Table(name="scparinfo")
public class ParInfo {

	@Id
	@Column(name="countryclub_id", nullable=false, length=4)
	private String countryclub_id;
	
	@Id
	@Column(name="course", nullable=false)
	private Integer course;
	
	@Column(name="course_nm", length=50)
	private String course_nm;
	
	private Integer hole1;
	private Integer hole2;
	private Integer hole3;
	private Integer hole4;
	private Integer hole5;
	private Integer hole6;
	private Integer hole7;
	private Integer hole8;
	private Integer hole9;
	
	private Timestamp dateinserted;	
}
