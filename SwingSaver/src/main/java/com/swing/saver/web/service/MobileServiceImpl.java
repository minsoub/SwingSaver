package com.swing.saver.web.service;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swing.saver.web.exception.ApiException;

/**
 * Mobile Restfull Service API 구현 Class
 * 
 * @author hist
 *
 */

@Service
public class MobileServiceImpl implements MobileService {

	private final static Logger LOGGER = LoggerFactory.getLogger(MobileServiceImpl.class);
	
	@Autowired
    private SendMessage sendMessage;
	
    @Value("${oAuth.grant_type}")
    private String grantType;

    @Resource(name = "uploadPath")
    private String uploadPath;
    
    /**
     * 골프장 추천리스트 조회한다.
     */
    public String golfRecommandList() throws JsonProcessingException, ApiException
    {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/golf","GET", "application/json",true);

        LOGGER.debug("골프장 추천리스트 조회 :응답:{}", rtnJson);

        return rtnJson;
    }
    /**
     * 골프장 리스트 조회 (검색조건 : zone_id, alliance_check)
     * 
     */
    public String getGolfList(Map<String, String> params) throws JsonProcessingException, ApiException
    {
    	ObjectMapper mapper = new ObjectMapper();
    	String rtnJson = "";
    	rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params),"/ords/swing/saver/golflist","POST", "application/json",true);
    	LOGGER.debug("골프장 리스트 조회 :응답:{}", rtnJson);
    	
    	return rtnJson;
    }
}
