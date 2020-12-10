package com.swing.saver.web.domain;

import java.io.Serializable;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CountryclubInfoPK implements Serializable{
	private String country_id;
	private String zone_id;
	private String countryclub_id;
	
	@Builder
	public CountryclubInfoPK(String country_id, String zone_id, String countryclub_id)
	{
		this.country_id = country_id;
		this.zone_id = zone_id;
		this.countryclub_id = countryclub_id;
	}
}
