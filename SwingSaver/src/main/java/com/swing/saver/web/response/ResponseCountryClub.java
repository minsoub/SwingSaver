package com.swing.saver.web.response;


import java.sql.Date;

import com.swing.saver.web.domain.CountryclubInfo;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Response CountryClub
 * 
 * @author JMS
 *
 */
@Data
@NoArgsConstructor
public class ResponseCountryClub {
	public final static long SECOND_MILLIS = 1000;
    public final static long MINUTE_MILLIS = SECOND_MILLIS*60;
    public final static long HOUR_MILLIS = MINUTE_MILLIS*60;
    public final static long DAY_MILLIS = HOUR_MILLIS*24;
    public final static long YEAR_MILLIS = DAY_MILLIS*365;
    
	private String country_id;		// 국가코드
	private String zone_id;			// 지역코드
	private String countryclub_id;		// 골프장 코드
	private String countryclub_nm;		// 골프장 이름
	private int hole_value;				// 홀수
	private String image;			// 기본 이미지 경로
	private String logo_image;		// 가로 이미지
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
	private String logo_image_url;   // 이미지 가로 경로
	private String assets_url;		// 저장이미지 경로
	private String simage_url;		// 스코어 이미지 경로
	private String fdata_url;
	private String qr_cnt;
	
	private String mode;			// 검색구분 : "" or ALL 전체, REC : 추천
	private String word;			// 검색단어
	
	private String pay_chk;         // 결제여부 (Y, N)
	private int pay_dt;             // 남은유효기간
		
	
	@Builder
	public ResponseCountryClub(CountryclubInfo info)
	{
		this.country_id = info.getCountry_id();
		this.countryclub_id = info.getCountryclub_id();
		this.countryclub_nm = info.getCountryclub_nm();
		this.zone_id = info.getZone_id();
		this.hole_value = info.getHole_value();
		this.image = info.getImage();
		this.logo_image = info.getLogo_image();
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
		
		if (info.getAssets() != null && info.getAssets().length() > 0)
		{
			this.assets_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+info.getAssets();
		}
		if (info.getImage() != null && info.getImage().length() > 0)
		{
			this.image_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+info.getImage();
		}
		if (info.getLogo_image() != null && info.getLogo_image().length() > 0)
		{
			this.logo_image_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+info.getLogo_image();
		}		
	}
	
	public ResponseCountryClub(String country_id, String zone_id, String zone_nm, String countryclub_id, String countryclub_nm, int hole_value, String image, String logo_image, 
			String address, String phone, String email, String link_check, String assets, String simage, String fdata, String rsv_url, String evt_url, 
			String alliance_check, String pgm_call_param, String received, java.util.Date duedate)
	{
		this.country_id = country_id;
		this.zone_id = zone_id;
		this.zone_nm = zone_nm;
		this.countryclub_id = countryclub_id;
		this.countryclub_nm = countryclub_nm;
		this.hole_value = hole_value;
		this.image = image;
		this.logo_image = logo_image;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.link_check = link_check;
		this.assets = assets;
		this.simage = simage;
		this.fdata = fdata;
		this.rsv_url = rsv_url;
		this.evt_url = evt_url;
		this.alliance_check = alliance_check;
		this.pgm_call_param = pgm_call_param;
		this.pay_chk = (received == null) ? "N" : received;
		
		if (duedate == null) this.pay_dt = 0;
		else {
			Date today = new java.sql.Date( (System.currentTimeMillis()/DAY_MILLIS)*DAY_MILLIS);
			this.pay_dt = (int)( ( duedate.getTime()/DAY_MILLIS ) - ( today.getTime() / DAY_MILLIS) );
		}
		
		if (assets != null && assets.length() > 0)
		{
			this.assets_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+assets;
		}
		if (image != null && image.length() > 0)
		{
			this.image_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+image;
		}
		if (logo_image != null && logo_image.length() > 0)
		{
			this.logo_image_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+logo_image;
		}	
	}
	
	public ResponseCountryClub(String country_id, String zone_id, String zone_nm, String countryclub_id, String countryclub_nm, int hole_value, String image, String logo_image,
			String address, String phone, String email, String link_check, String assets, String simage, String fdata, String rsv_url, String evt_url, 
			String alliance_check, String pgm_call_param)
	{
		this.country_id = country_id;
		this.zone_id = zone_id;
		this.zone_nm = zone_nm;
		this.countryclub_id = countryclub_id;
		this.countryclub_nm = countryclub_nm;
		this.hole_value = hole_value;
		this.image = image;
		this.logo_image = logo_image;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.link_check = link_check;
		this.assets = assets;
		this.simage = simage;
		this.fdata = fdata;
		this.rsv_url = rsv_url;
		this.evt_url = evt_url;
		this.alliance_check = alliance_check;
		this.pgm_call_param = pgm_call_param;
		
		if (assets != null && assets.length() > 0)
		{
			this.assets_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+assets;
		}
		if (image != null && image.length() > 0)
		{
			this.image_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+image;
		}
		if (logo_image != null && logo_image.length() > 0)
		{
			this.logo_image_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+logo_image;
		}	
	}	
}
