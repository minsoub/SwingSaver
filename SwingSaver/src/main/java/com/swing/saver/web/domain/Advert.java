package com.swing.saver.web.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			
@NoArgsConstructor
@Table(name="swadvert")
public class Advert {
	@Id
	@Column(name="seq", nullable=false, columnDefinition="순번")
	private Integer seq;
	
	@Column(name="site_name", length=100, columnDefinition="사이트명")
	private String site_name;
	
	@Column(name="site_url", length=200, columnDefinition="사이트 URL")
	private String site_url;
	
	@Column(name="log_image", length=200, columnDefinition="사이트 이미지")
	private String log_image;
	
	@Column(name="order_no", columnDefinition="정렬순서")
	private Integer order_no;
	
	@Column(name="use_yn", length=1, columnDefinition="사용여부")
	private String use_yn;
	
	@Column(name="description", length=1000, columnDefinition="사이트 설명")
	private String description;
	
	@Column(name="reg_dt", columnDefinition="등록일자")
	private Timestamp reg_dt;
}
