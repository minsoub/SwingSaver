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
}
