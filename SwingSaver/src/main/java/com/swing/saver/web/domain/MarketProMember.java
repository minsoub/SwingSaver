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
@IdClass(MarketProMemberPK.class)
@Table(name="swmarketpro")
public class MarketProMember {

	@Id
	@Column(name="id", nullable=false)
	private Integer id;
	
	@Id
	@Column(name="userid", nullable=false)
	private Integer userid;
	
	@Column(name="region", nullable=false, length=2)
	private String region;
	
	private Integer lessonprice;
	private Float rating;
	private Integer prolevel;
	
	@Column(name="description", nullable=false, length=1000)
	private String description;
	
	@Column(name="profile", nullable=false, length=1000)
	private String profile;
	
	@Column(name="profile_img", nullable=false, length=200)
	private String profile_img;
	
	@Column(name="use_yn", nullable=false, length=1)
	private String use_yn;

}
