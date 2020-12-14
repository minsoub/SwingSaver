package com.swing.saver.web.domain;

import java.io.Serializable;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ParInfoPK implements Serializable {
	private static final long serialVersionUID = -8852611545793774605L;
	
	private String countryclub_id;
	private	int course;
	
	@Builder
	public ParInfoPK(String countryclub_id, int course)
	{
		this.countryclub_id = countryclub_id;
		this.course = course;
	}
}
