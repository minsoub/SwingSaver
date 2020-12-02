package com.swing.saver.web.response;

import java.io.Serializable;

import com.swing.saver.web.domain.CountryclubInfo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResponseCountryClubData implements Serializable{
	private static final long serialVersionUID = -4922048016283666086L;
	private String country_id;		// 국가코드
	private String zone_id;			// 지역코드
	private String id;		// 골프장 코드
	private String text;		// 골프장 이름
	
	@Builder
	public ResponseCountryClubData(CountryclubInfo data)
	{
		this.country_id = data.getCountry_id();
		this.zone_id = data.getZone_id();
		this.id = data.getCountryclub_id();
		this.text = data.getCountryclub_nm();
	}
}
