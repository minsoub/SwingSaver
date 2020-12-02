package com.swing.saver.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ParInfoPK implements Serializable {
	private static final long serialVersionUID = -8852611545793774605L;
	
	private String countryclub_id;
	private	int course;
}
