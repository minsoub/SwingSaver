package com.swing.saver.web.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseScore {
	
	private String visit_date;
	private String countryclub_id;
	private int seq_no;
	private int user_id;
	private String countryclub_nm;
	private Integer score_sum;
	private Integer start_course;
	private Integer end_course;
	
	public ResponseScore(
				String visit_date,
				String countryclub_id,
				int seq_no,
				int user_id,
				String countryclub_nm,
				Integer score_sum,
				Integer start_course,
				Integer end_course
			) 
	{
		this.visit_date = visit_date;
		this.countryclub_id = countryclub_id;
		this.seq_no = seq_no;
		this.user_id = user_id;
		this.countryclub_nm = countryclub_nm;
		this.score_sum = score_sum;
		this.start_course = start_course;
		this.end_course = end_course;
	}
}
