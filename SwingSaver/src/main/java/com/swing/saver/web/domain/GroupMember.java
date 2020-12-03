package com.swing.saver.web.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			// Insert시 null 필드 제외  @DynamicUpdate => update시 null인 필드 제외
@NoArgsConstructor
@IdClass(GroupMemberPK.class)
@Table(name="swgroupmember")
public class GroupMember { 
	@Id
	@Column(name="groupid", nullable=false, length=4, insertable = false, updatable = false)
	private String groupid;
	
	@Id
	@Column(name="memberid", nullable=false, insertable = false, updatable = false)
	private Integer memberid;
	
	@Column(name="membertype", nullable=true, length=1)
	private String membertype;
	
	@Column(name="status", nullable=true, length=1)
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "groupid")
	GroupInfo groupinfo;
}
