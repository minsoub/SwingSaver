package com.swing.saver.web.domain;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			// Insert시 null 필드 제외  @DynamicUpdate => update시 null인 필드 제외
@NoArgsConstructor
@Table(name="swcredentials")
public class CredentialInfo {
	@Id
	@Column(name="userid", nullable=false)
	private Integer userid;
	
	@Column(name="email", nullable=false, length=100)
	private String email;
	
	@Column(name="password", nullable=false, length=50)
	private String password;
	
	private Date modifydate;
	
}
