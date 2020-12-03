package com.swing.saver.web.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@DynamicInsert			// Insert시 null 필드 제외  @DynamicUpdate => update시 null인 필드 제외
@NoArgsConstructor
@Table(name="swgroup")
public class GroupInfo {
	@Id
	@Column(name="id", nullable=false, length=4)
	private String id;
	
	@Column(name="region", nullable=true, length=2)
	private String region;
	
	@Column(name="groupname", nullable=true, length=100)
	private String groupname;
	
	@Column(name="grouptype", nullable=true, length=1)
	private String grouptype;
	
	@Column(name="address", nullable=true, length=100)
	private String address;
	
	@Column(name="phone", nullable=true, length=50)
	private String phone;
		
	private Integer quota;
	private Integer storagespace;
	
	@Column(name="status", nullable=true, length=1)
	private String status;
	
	private Date startdate;
	private Date enddate;
	private Integer groupadminid;
	private Date registerdate;
	
	@Column(name="del_yn", nullable=true, length=1)
	private String del_yn;
	
	@OneToMany(mappedBy="groupinfo", fetch = FetchType.LAZY)
	private List<GroupMember> books = new ArrayList<GroupMember>();

}
