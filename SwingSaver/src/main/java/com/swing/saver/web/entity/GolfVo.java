package com.swing.saver.web.entity;
import org.springframework.web.multipart.*;

import lombok.Getter;
import lombok.Setter;
/**
 * 골프장 정보 클래스
 * @author hist
 *
 */
@Getter
@Setter
public class GolfVo {
	String country_id;		// 국가코드
	String zone_id;			// 지역코드
	String countryclub_id;		// 골프장 코드
	String countryclub_nm;		// 골프장 이름
	int hole_value;				// 홀수
	String image;			// 기본 이미지 경로
	String logo_image;			// 가로 이미지 경로
	String address;			// 골프장 주소
	String phone;			// 연락처
	String email;			// 담당자 메일
	String assets;			// 저장경로
	String simage;			// 스코어 이미지 경로
	String fdata;			// Assets 파일 경로
	String description;		// 비고
	String link_check;		// 링크여부
	String alliance_check;	// 제휴여부
	String pgm_call_param;  // 프로그램 호출인자
	String dateinserted;
	String rsv_url;			// 예약 URL
	String evt_url;			// 이벤트  URL
	boolean result;
	String error;
	String country_nm;		// 국가코드명
	String zone_nm;			// 지역명
	String image_url;		// 이미지 경로
	String logo_image_url;		// 이미지 경로(가로)
	String assets_url;		// 저장이미지 경로
	String simage_url;		// 스코어 이미지 경로
	String fdata_url;
	String qr_cnt;
	
	String mode;			// 검색구분 : "" or ALL 전체, REC : 추천
	String word;			// 검색단어
	
	String pay_chk;         // 결제여부 (Y, N)
	int pay_dt;             // 남은유효기간
	
	MultipartFile imageFile;
	MultipartFile logo_imageFile;
	MultipartFile assetsFile;
	MultipartFile simageFile;
	MultipartFile fdataFile;
	
}
