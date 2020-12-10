package com.swing.saver.web.response;

import com.swing.saver.web.domain.Advert;

import lombok.Builder;
import lombok.Data;

@Data
public class ResponseAdvert {
	private int seq;
	private String site_name;
	private String site_url;
	private String log_image;
	private String order_no;
	private String use_yn;
	private String description;
	private String reg_dt;
	private String error;
	private boolean result;
	private String image_url;
	
	@Builder
	public ResponseAdvert(Advert info)
	{
		this.seq = info.getSeq();
		this.site_name = info.getSite_name();
		this.site_url = info.getSite_url();
		this.log_image = info.getLog_image();
		this.order_no = String.valueOf(info.getOrder_no());
		this.use_yn =info.getUse_yn();
		this.description = info.getDescription();
		this.reg_dt = info.getReg_dt().toLocaleString();
		
		if (info.getLog_image() != null && info.getLog_image().length() > 0)
		{
			this.image_url = "https://www.swingsaver.co.kr/m/getImage?fileName="+info.getLog_image();
		}		
	}
}
