package com.swing.saver.web.service;

import java.io.IOException;
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
 * Admin 권한으로 수행하는 모든 서비스에 대해서 정의한다.
 * 
 * @author hist
 *
 */
@Service
public class AdminServiceImpl implements AdminService {
	private final static Logger LOGGER = LoggerFactory.getLogger(AdminServiceImpl.class);
    @Autowired
    private SendMessage sendMessage;

    @Value("${oAuth.grant_type}")
    private String grantType;

    @Resource(name = "uploadPath")
    private String uploadPath;
    
    
	/**
	 * 광고 등록 리스트 조회
	 * 
	 * @return
	 * @throws ApiException
	 */
	public String getAdvList() throws ApiException
	{
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/advlist", "GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("광고 등록 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}
	
	/**
	 * 광고제휴 사이트 신규 등록
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String advCreate(Map<String, String> params) throws JsonProcessingException, ApiException
	{
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/advlist", "POST", "application/json", true);

        LOGGER.debug("광고제휴 사이트 가입 파라미터:{},응답:{}",params.toString(), rtnJson);

        return rtnJson;
	}
	
	/**
	 * 광고제휴 사이트 상세 정보 조회 (이미지 포함)
	 * 
	 * @param seq
	 * @return
	 * @throws ApiException
	 * @throws IOException
	 */
    public String getAdvertImgIncludeDetail(String seq) throws ApiException, IOException
    {
    	 ObjectMapper mapper = new ObjectMapper();
    	 
         String rtnJson= "";

         rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/advlist/detail/"+seq, "POST", "application/json", true);
         LOGGER.debug("광고제휴 사이트 상세 정보 조회 파라미터:{},응답:{}", seq, rtnJson);


         return rtnJson;
    }
}
