package com.swing.saver.web.service;

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
    public String golfRecommandList() throws JsonProcessingException, ApiException;			// 골프장 추천 리스트 조회
}
