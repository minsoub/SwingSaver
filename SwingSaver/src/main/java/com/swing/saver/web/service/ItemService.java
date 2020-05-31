package com.swing.saver.web.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swing.saver.web.exception.ApiException;

@Service
public class ItemService {
	private final static Logger LOGGER = LoggerFactory.getLogger(ItemService.class);
    @Autowired
    private SendMessage sendMessage;
    
    /**
     * 프로가 등록한 상품 리스트를 조회한다. 
     * 
     * @param id
     * @return
     * @throws ApiException
     */
    public String getItemListById(long id) throws ApiException
    {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/itemlist/"+id, "GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("프로가 등록한 상품 리스트를 조회 응답:{}",rtnJson);

        return rtnJson;
    }
	/**
	 * 상품 리스트 조회
	 * 
	 * @return
	 * @throws ApiException
	 */
	public String getItemList() throws ApiException
	{
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/itemlist", "GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("상품 등록 리스트 조회 응답:{}",rtnJson);

        return rtnJson;
	}
	
	/**
	 * 상품 신규 등록
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String itemCreate(Map<String, String> params) throws JsonProcessingException, ApiException
	{
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/itemlist", "POST", "application/json", true);

        LOGGER.debug("상품 가입 파라미터:{},응답:{}",params.toString(), rtnJson);

        return rtnJson;
	}
	
	/**
	 * 상품 수정하기
	 * 
	 * @param params
	 * @return
	 * @throws JsonProcessingException
	 * @throws ApiException
	 */
	public String itemUpdate(Map<String, String> params) throws JsonProcessingException, ApiException
	{
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/itemlist", "PUT", "application/json", true);

        LOGGER.debug("상품 수정  파라미터:{},응답:{}",params.toString(), rtnJson);

        return rtnJson;
	}	
	
	/**
	 * 상품 상세 정보 조회
	 * 
	 * @param id
	 * @param item_type (1:월정액, 2:원포인트 상품)
	 * @return
	 * @throws ApiException
	 * @throws IOException
	 */
    public String itemDetail(int id, String item_type) throws ApiException, IOException
    {
    	 ObjectMapper mapper = new ObjectMapper();
    	 
         String rtnJson= "";

         rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/itemlist/"+item_type+"/"+id, "GET", "application/json", true);
         LOGGER.debug("상품 상세 정보 조회 파라미터:{},응답:{}", id, rtnJson);


         return rtnJson;
    }
    
    /**
     * 상품 삭제 - 개별/일괄 삭제 포함
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    public String itemDelete(Map<String, String> params) throws JsonProcessingException, ApiException
    {
        ObjectMapper mapper = new ObjectMapper();
        String rtnJson = "";
        if(params.get("id").indexOf(",") == -1) {
            rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(params), "/ords/swing/saver/itemlist", "DELETE", "application/json", true);
        }else{
            String[] subgrpList = params.get("id").split(",");
            Map<String,String> sendMap = new HashMap<String, String>();
            int i=0;
            for (String str: subgrpList) {
                sendMap.clear();
                sendMap.put("id",str);
                i++;
                rtnJson = sendMessage.sendHttpsStr(mapper.writeValueAsString(sendMap), "/ords/swing/saver/itemlist", "DELETE", "application/json", true);
            }
        }
        LOGGER.debug("상품 삭제 파라미터:{},응답:{}",params.toString(),rtnJson);

        return rtnJson;
    }
    
    /**
     * 프로가 등록한 클래스 리스트를 조회한다. 
     * 
     * @param id
     * @param groupid
     * @return
     * @throws ApiException
     */
    public String getClassList(long id, String groupid) throws JsonProcessingException, ApiException
    {
        String rtnJson = "";
        ObjectMapper mapper = new ObjectMapper();
        Map<String,String> sendMap = new HashMap<String, String>();
        sendMap.put("id", String.valueOf(id));
        sendMap.put("groupid", groupid);
        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/classlist/"+groupid+"/"+id, "GET", "application/json",true);

        LOGGER.debug("프로가 등록한 상품 리스트를 조회 응답:{}",rtnJson);

        return rtnJson;
    }   
    
    /**
     * 클래스에 속한 멤버 리스트를 조회한다. 
     * 
     * @param subgroupId
     * @return
     * @throws ApiException
     */
    public String getGroupMember(String subgroupId) throws ApiException {
        String rtnJson = "";

        rtnJson = sendMessage.sendHttpsStr("/ords/swing/saver/subgroupmembers/"+subgroupId,"GET", "application/x-www-form-urlencoded",true);

        LOGGER.debug("서브그룹 멤버 조회 파라미터:{},응답:{}",subgroupId.toString(),rtnJson);

        return rtnJson;
    }
    
}
