package com.swing.saver.web.response;

import lombok.Getter;
import lombok.Setter;

/**
 * 스코어 리스트 조회 데이터 Response 
 * 
 * @author jms
 *
 */
@Getter
@Setter
public class ResponseScore {
	
	private String visit_date;
	private String teeup_time;
	private String visit_date_format;
	private String teeup_time_format;
	private String countryclub_id;	
	private int user_id;
	private String countryclub_nm;
	private Integer score_sum;
	private String score_sum_format;
	private Integer start_course;
	private Integer end_course;
	private Integer stroke_sum;
	
	public ResponseScore(
				String visit_date,
				String countryclub_id,
				String teeup_time,
				int user_id,
				String countryclub_nm,
				Integer score_sum,
				Integer stroke_sum,
				Integer start_course,
				Integer end_course
			) 
	{
		this.visit_date = visit_date;
		this.countryclub_id = countryclub_id;
		this.teeup_time = teeup_time;
		this.user_id = user_id;
		this.countryclub_nm = countryclub_nm;
		this.score_sum = score_sum;
		this.stroke_sum = stroke_sum;
		this.start_course = start_course;
		this.end_course = end_course;
		
		if (this.score_sum > 0) score_sum_format = "+"+String.valueOf(this.score_sum);
		else if(this.score_sum == 0) score_sum_format = String.valueOf(this.score_sum);
		else score_sum_format = "-"+String.valueOf(this.score_sum);
		
		// date format 
		this.visit_date_format = visit_date; // .substring(0, 4)+"."+visit_date.substring(4,6)+"."+visit_date.substring(6);
		this.teeup_time_format = teeup_time.substring(0, 2)+":"+teeup_time.substring(2);
	}
}
