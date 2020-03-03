package com.swing.saver.web.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
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
	
	public static final String naverReturUrl = "https://localhost:8443/naverLoginReturn";
	public static final String naverClientId = "HU7BlUDoiX1K80yIxsVP";
	public static final String naverKey = "9vEYPAM0l3";
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
	
	public static String getCurrentFromatDate()
	{
		Date now = new Date();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		return format.format(now);
	}
	
	public static String naverGetProfile(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	 }

	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }

	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
	
	
}
