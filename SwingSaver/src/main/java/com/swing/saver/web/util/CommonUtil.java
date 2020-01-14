package com.swing.saver.web.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.CodeVo;
import com.swing.saver.web.exception.ApiException;

/**
 * 공통 유틸 클래스 정의 
 * 
 * @author minso
 *
 */
public class CommonUtil {
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonUtil.class);
	
	/**
	 * 현재 날짜를 yyyyMMdd 형식으로 리턴한다.
	 * @return
	 */
	public static String getCurrentDate()
	{
		Date now = new Date();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		return format.format(now);
	}
}
