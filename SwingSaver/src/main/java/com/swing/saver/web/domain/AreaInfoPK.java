package com.swing.saver.web.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class AreaInfoPK implements Serializable{
	private static final long serialVersionUID = 6418615669104075052L;
	private String country_id;
	private String zone_id;
}
