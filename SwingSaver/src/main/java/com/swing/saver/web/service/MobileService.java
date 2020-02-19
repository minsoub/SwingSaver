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
    public String golfRecommandList() throws JsonProcessingException, ApiException;							// 골프장 추천 리스트 조회
    public String getGolfList(Map<String, String> params) throws JsonProcessingException, ApiException;		// 골프장 리스트 조회(전체, 추천)
}
