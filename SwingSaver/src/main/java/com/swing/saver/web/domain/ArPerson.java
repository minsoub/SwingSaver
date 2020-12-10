package com.swing.saver.web.domain;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			
@NoArgsConstructor
@Table(name="swarperson")
public class ArPerson {
	
	@Id
	@Column(name="id", nullable=false, columnDefinition="구매신청 Key")
	private Integer id;
	
	@Column(name="userid", nullable=true, columnDefinition="사용자 아이디")
	private Integer userid;
	
	@Column(name="description", nullable=true, length=200, columnDefinition="설명")
	private String description;
	
	@Column(name="amount", nullable=true, columnDefinition="금액")
	private Integer amount;
	
	@Column(name="duedate", nullable=true, columnDefinition="만기일자")
	private Date duedate;
	
	@Column(name="received", nullable=true, length=1, columnDefinition="결제완료여부(Y/N)")
	private String received;
	
	@Column(name="months", nullable=true, columnDefinition="개월수")
	private Integer months;
	
	@Column(name="p_type", nullable=true, length=1, columnDefinition="결제상품타입(A:Assets download)")
	private String p_type;
	
	@Column(name="country_id", nullable=true, length=4, columnDefinition="국가코드")
	private String country_id;

	@Column(name="zone_id", nullable=true, length=4, columnDefinition="지역코드")
	private String zone_id;
	
	@Column(name="countryclub_id", nullable=true, length=4, columnDefinition="골프장코드")
	private String countryclub_id;
	
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JoinColumns(value = {
			@JoinColumn(name = "country_id", updatable=false, insertable=false),
			@JoinColumn(name = "zone_id", updatable=false, insertable=false),
			@JoinColumn(name = "countryclub_id", updatable=false, insertable=false)
		}, foreignKey = @ForeignKey(value = ConstraintMode.NO_CONSTRAINT)
	)
	private CountryclubInfo countryclubInfo;
}
