package com.swing.saver.web.response;

import com.swing.saver.web.domain.ParInfo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResponseParInfo {
	String country_id;
	String zone_id;
	String countryclub_id;		// 골프장 Key
	String course;				// 코스순서
	int hole1 = 0;
	int hole2 = 0;
	int hole3 = 0;
	int hole4 = 0;
	int hole5 = 0;
	int hole6 = 0;
	int hole7 = 0;
	int hole8 = 0;
	int hole9 = 0;
	int sum = 0;
	String course_nm;			// 코스명
	String dateinserted;
	
	boolean result;
	String error;
	
	@Builder
	public ResponseParInfo(ParInfo info)
	{
		this.countryclub_id = info.getCountryclub_id();
		this.course_nm = info.getCourse_nm();
		this.course = String.valueOf(info.getCourse());
		this.hole1 = info.getHole1();
		this.hole2 = info.getHole2();
		this.hole3 = info.getHole3();
		this.hole4 = info.getHole4();
		this.hole5 = info.getHole5();
		this.hole6 = info.getHole6();
		this.hole7 = info.getHole7();
		this.hole8 = info.getHole8();
		this.hole9 = info.getHole9();
		
		this.sum = this.hole1 + this.hole2 + this.hole3 + this.hole4 + this.hole5 + this.hole6 + this.hole7 + this.hole8 + this.hole9;
	}
}
