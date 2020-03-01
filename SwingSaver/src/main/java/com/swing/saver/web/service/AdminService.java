package com.swing.saver.web.service;

import java.io.IOException;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.swing.saver.web.exception.ApiException;

/**
 * Admin 권한으로 수행하는 모든 서비스에 대해서 정의한다.
 * 
 * @author hist
 *
 */
public interface AdminService {

	/**
	 * 광고 등록 리스트 조회
	 * 
	 * @return
	 * @throws ApiException
	 */
	public String getAdvList() throws ApiException;
	
	/**
	 * 광고제휴 사이트 신규 등록
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String advCreate(Map<String, String> params) throws JsonProcessingException, ApiException;	
	
	/**
	 * 광고제휴 사이트 수정
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String advUpdate(Map<String, String> params) throws JsonProcessingException, ApiException;	
	
	/**
	 * 광고제휴 사이트 상세 정보 조회 (이미지 포함)
	 * 
	 * @param seq
	 * @return
	 * @throws ApiException
	 * @throws IOException
	 */
    public String getAdvertImgIncludeDetail(String seq) throws ApiException, IOException;
    
    /**
     * 광고제휴 사이트 삭제 - 개별/일괄 삭제 포함
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    public String advertDelete(Map<String, String> params) throws JsonProcessingException, ApiException;  
    
    /**
     * 스코어  QR 접속 시 로그를 등록한다. 
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    public String scoreLog(Map<String, String> params) throws JsonProcessingException, ApiException;	
    
    /**
     * QR 접속 통계현황을 조회한다.
     * 
     * @param stdate
     * @param etdate
     * @param country_id
     * @param zone_id
     * @param countryclub_id
     * @return
     * @throws ApiException
     * @throws IOException
     */
    public String stsList(String stdate, String etdate, String country_id, String zone_id, String countryclub_id) throws ApiException, IOException;		// 스코어정보 리스트 조회
}
