package com.swing.saver.web.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swing.saver.web.exception.ApiException;


/**
 * 결제 관련 연동 서비스 
 * 
 * @author jms
 *
 */
@Service
public class PayService {

	private final static Logger LOGGER = LoggerFactory.getLogger(ItemService.class);
    @Autowired
    private SendMessage sendMessage;
    
    /**
     * 사용자 결제 신청한 상품 정보를 가져온다. 
     * 
     * @param artype
     * @param arid
     * @return
     * @throws ApiException
     */
    public String getBuyItemById(String artype, String arid) throws ApiException
    {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/pay/"+artype+"/"+arid, "GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("용자 결제 신청한 상품 정보 조회 응답:{}",rtnJson);

        return rtnJson;
    }
    
	/**
	 * 결제 완료 등록
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String paymentUpdate(Map<String, String> params) throws JsonProcessingException, ApiException
	{
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/payment", "POST", "application/json", true);

        LOGGER.debug("결제 완료 등록 :{},응답:{}",params.toString(), rtnJson);

        return rtnJson;
	}
	
	/**
	 * 결제 완료 History 등록
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String paymentRegister(Map<String, String> params) throws JsonProcessingException, ApiException
	{
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/pay", "POST", "application/json", true);

        LOGGER.debug("결제 완료 등록 :{},응답:{}",params.toString(), rtnJson);

        return rtnJson;
	}	
	
	/**
	 * Asset 다운로드 전 결제 초기 시작 - 미리 상품 정보 등록해야 한다. 
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String saveAsst(Map<String, Object> params) throws JsonProcessingException, ApiException
	{
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/payasset", "POST", "application/json", true);

        LOGGER.debug("결제 완료 등록 :{},응답:{}",params.toString(), rtnJson);

        return rtnJson;
	}
	
}
