package com.swing.saver.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class CountryclubInfoPK implements Serializable{
	private String country_id;
	private String zone_id;
	private String countryclub_id;
}
