package com.swing.saver.web.response;

import com.swing.saver.web.domain.AreaInfo;

import lombok.Builder;
import lombok.Data;

@Data
public class ResponseAreaInfo {
	String country_id;		// 국가코드
	String zone_id;			// 지역코드 
	String zone_nm;			// 지역명
	String user_name;		// 지역담당자명 
	String address;			// 지역담당자 주소
	String phone;			// 지역담당자 연락처
	String email;			// 지역담당자 메일
	String description;		// 비고
	String dateinserted;		// 등록일자 
	
	@Builder
	public ResponseAreaInfo(AreaInfo info)
	{
		this.country_id = info.getCountry_id();
		this.zone_id = info.getZone_id();
		this.zone_nm = info.getZone_nm();
		this.user_name = info.getUser_name();
		this.address = info.getAddress();
		this.phone = info.getPhone();
		this.email = info.getEmail();
		this.description = info.getDescription();
		this.dateinserted = info.getDateinserted().toString();
	}
}
