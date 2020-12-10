package com.swing.saver.web.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * QR를 통해서 넘어오는 파라미터 정보를 맵핑한다.
 * @author minso
 *
 */
@Data
@NoArgsConstructor
public class QRInfoVo {
	private String country_id;		// 국가코드
	private String zone_id;			// 지역코드
	private String countryclub_id;	// 골프장 코드
	private String startcourse;		// out 시작코스 (2자리)
	private String endcourse;		// in 종료코스 (2자리)
	private String username;		// 사용자명
	private String score;			// 사용자점수
	private String othername1;		// 동반자 1
	private String score1;			// 동반자 1의 점수
	private String othername2;		// 동반자 2
	private String score2;			// 동반자 2의 점수
	private String othername3;		// 동반자 3
	private String score3;			// 동반자 3의 점수
	
	private String othername4;		// 동반자 4
	private String score4;			// 동반자 4의 점수
	
	private String utime;			// 티업타임 13:50
	private String visit_date;		// 2020-12-30
}
