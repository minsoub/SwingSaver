package com.swing.saver.web.service;

import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.swing.saver.web.exception.ApiException;

/**
 * Mobile Restful API Service Interface class
 * 
 * @author hist
 *
 */
public interface MobileService {
    
    // Mobile
	/**
	 * 골프장 추천 리스트 조회
	 * 
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
    public String golfRecommandList() throws JsonProcessingException, ApiException;							// 
    
    /**
     * 골프장 리스트 조회(전체, 추천)
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    public String getGolfList(Map<String, String> params) throws JsonProcessingException, ApiException;		 
    
    /**
     * 메인 광고 이미지 리스트 조회
     * 
     * @return
     * @throws ApiException
     */
    public String getAdvList() throws ApiException;		
    
    /**
     * 주어진 일자로 골프장 스코어 리스트를 조회한다. 
     * 
     * @param userId
     * @param fromDt
     * @param toDt
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    public String getScoreList(long userId, String fromDt, String toDt)  throws JsonProcessingException, ApiException;	
    
    /**
     * 스코어 상세 정보를 조회한다. 
     * 
     * @param visit_date
     * @param countryclub_id
     * @param seq_no
     * @param user_id
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    public String getScoreDetail(String visit_date, String countryclub_id, String seq_no, String user_id) throws JsonProcessingException, ApiException;
    
    /**
     * 골프장 리스트를 검색한다. [ 골프장 명칭으로 ] 
     * @param countryclub_nm
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    public String getCountryclubList(String countryclub_nm) throws JsonProcessingException, ApiException;
}
