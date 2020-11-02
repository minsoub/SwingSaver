package com.swing.saver.web.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 공통 유틸 클래스 정의 
 * 
 * @author minso
 *
 */
public class CommonUtil {
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonUtil.class);
	
	public static final String naverReturUrl = "https://www.swingsaver.co.kr/naverLoginReturn";  // "https://localhost:8443/naverLoginReturn";
	public static final String naverClientId = "HU7BlUDoiX1K80yIxsVP";
	public static final String naverKey = "9vEYPAM0l3";
	
	public static final String kakaoReturnUrl = "https://www.swingsaver.co.kr/kakaoLoginReturn";  // https://localhost:8443/kakaoLoginReturn";
	public static final String kakaoClientId = "21ca63a0efd9cb05762db8191f2b8761";
	public static final String kakaoApiKey = "2pub5fZbTBSXhHTfiJQ7KI812J04XtAh";
	
	public static final String facebookReturnUrl = "https://www.swingsaver.co.kr/facebookLoginReturn";   // "https://localhost:8443/facebookLoginReturn";
	public static final String facebookClientId = "187211659375164";
	public static final String facebookKey = "a163d69ecb147510993e83943a46db58";
	
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
	/**
	 * 현재 날짜에서 주어진 월을 뺀 날짜의 포멧을 리턴한다. 
	 * 
	 * @param m
	 * @param fmt
	 * @return
	 */
	public static String getDiffDate(int m, String fmt)
	{
		Date now = new Date();
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(now);
		cal.add(Calendar.MONTH, -m);

			
		SimpleDateFormat format = new SimpleDateFormat(fmt);
		
		return format.format(cal.getTime());
	}
	
	/**
	 * 주어진 포멧으로 날짜를 리턴한다.
	 * 
	 * @param fmt
	 * @return
	 */
	public static String getCurrentFromatDate(String fmt)
	{
		Date now = new Date();
		
		SimpleDateFormat format = new SimpleDateFormat(fmt);
		
		return format.format(now);
	}
	
	public static String commonSnsGetProfile(String apiUrl, Map<String, String> requestHeaders){
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

	    private static String readBody(InputStream body) throws UnsupportedEncodingException{
	        InputStreamReader streamReader = new InputStreamReader(body, "UTF-8");

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
