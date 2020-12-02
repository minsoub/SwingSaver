package com.swing.saver.web.response;

import org.springframework.web.multipart.MultipartFile;

import com.swing.saver.web.domain.CountryclubInfo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Response CountryClub
 * @author JMS
 *
 */
@Data
@NoArgsConstructor
public class ResponseCountryClub {
	private String country_id;		// 국가코드
	private String zone_id;			// 지역코드
	private String countryclub_id;		// 골프장 코드
	private String countryclub_nm;		// 골프장 이름
	private int hole_value;				// 홀수
	private String image;			// 기본 이미지 경로
	private String address;			// 골프장 주소
	private String phone;			// 연락처
	private String email;			// 담당자 메일
	private String assets;			// 저장경로
	private String simage;			// 스코어 이미지 경로
	private String fdata;			// Assets 파일 경로
	private String description;		// 비고
	private String link_check;		// 링크여부
	private String alliance_check;	// 제휴여부
	private String pgm_call_param;  // 프로그램 호출인자
	private String dateinserted;
	private String rsv_url;			// 예약 URL
	private String evt_url;			// 이벤트  URL
	boolean result;
	private String error;
	private String country_nm;		// 국가코드명
	private String zone_nm;			// 지역명
	private String image_url;		// 이미지 경로
	private String assets_url;		// 저장이미지 경로
	private String simage_url;		// 스코어 이미지 경로
	private String fdata_url;
	private String qr_cnt;
	
	private String mode;			// 검색구분 : "" or ALL 전체, REC : 추천
	private String word;			// 검색단어
	
	private String pay_chk;         // 결제여부 (Y, N)
	private int pay_dt;             // 남은유효기간
	
	private MultipartFile imageFile;
	private MultipartFile assetsFile;
	private MultipartFile simageFile;
	private MultipartFile fdataFile;
	
	@Builder
	public ResponseCountryClub(CountryclubInfo info)
	{
		this.country_id = info.getCountry_id();
		this.countryclub_id = info.getCountryclub_id();
		this.countryclub_nm = info.getCountryclub_nm();
		this.zone_id = info.getZone_id();
		this.hole_value = info.getHole_value();
		this.image = info.getImage();
		this.address = info.getAddress();
		this.phone = info.getPhone();
		this.email = info.getEmail();
		this.link_check = info.getLink_check();
		this.assets = info.getAssets();
		this.simage = info.getSimage();
		this.fdata = info.getFdata();
		this.rsv_url = info.getRsv_url();
		this.evt_url = info.getEvt_url();
		this.description = info.getDescription();
		this.dateinserted = info.getDateinserted().toString();
		this.alliance_check = info.getAlliance_check();
		this.pgm_call_param = info.getPgm_call_param();
		
		
	}
}
