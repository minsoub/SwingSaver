package com.swing.saver.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AreaVo;
import com.swing.saver.web.entity.CodeVo;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.RestService;

public abstract class CommonController {
	private final static Logger LOGGER = LoggerFactory.getLogger(CommonController.class);
	
	// dispatcher-servlet.xml에 정의
    @Resource(name = "uploadDataPath")
    private String uploadPath;
    
    @Inject
    RestService restService;
    
    /**
     * 코드 정보를 조회해서 리턴한다.
     * 
     * @param groupType
     * @return
     * @throws IOException
     * @throws ApiException
     */
    public List<CodeVo> getCodeList(String groupType) throws IOException, ApiException {

    	String rtnJson = restService.getCodeList(groupType);   // 코드 정보 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<CodeVo> codeList = mapper.convertValue(map.get("codeList"), TypeFactory.defaultInstance().constructCollectionType(List.class,CodeVo.class));

        return codeList;
    } 
    
    /**
     * 마켓 프로에 등록하지 않은 사용자 리스트를 조회한다.
     * 
     * @return
     * @throws IOException
     * @throws ApiException
     */
    public List<UserVo> getProUnUserList() throws IOException, ApiException {

    	String rtnJson = restService.proUserList();
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<UserVo> userList = mapper.convertValue(map.get("memList"), TypeFactory.defaultInstance().constructCollectionType(List.class,UserVo.class));

        return userList;
    } 
    
    /**
     * 마켓 프로에 등록하지 않은 사용자 리스트를 조회한다.
     * 검색 기능 추가
     * 
     * @return
     * @throws IOException
     * @throws ApiException
     */
    public String getProUnUserList(String id) throws IOException, ApiException {

    	String rtnJson = restService.proUserList(id);
    	LOGGER.debug(rtnJson);
    	
    	return rtnJson;
    }  
    
    /**
     * 국가에 해당하는 지역 리스트를 출력 한다.
     * 
     * @param country_id
     * @return
     * @throws ApiException
     * @throws IOException
     */
    public List<AreaVo> getAreaList(String country_id) throws ApiException, IOException {
    	String rtnJson = restService.getAreaList(country_id);   
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<AreaVo> areaList = mapper.convertValue(map.get("areaList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AreaVo.class));

        return areaList;
    }
    
    /***
     * 그 지역에 속한 골프장 리스트를 리턴한다.
     * 
     * @param country_id
     * @param zone_id
     * @return
     * @throws ApiException
     * @throws IOException
     */
    public List<GolfVo> getGolfList(String country_id, String zone_id) throws ApiException, IOException {
    	String rtnJson = restService.getGolfList(country_id, zone_id);
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        List<GolfVo> areaList = null;
        
        LOGGER.debug("map size : " + map.size());
        if (!map.containsKey("golfList"))
        {
        	areaList = new ArrayList<GolfVo>();
        	GolfVo golf = mapper.readValue(rtnJson,GolfVo.class);
        	areaList.add(golf);
        }else {
        	// groupList => RestFul Service에서 등록한 명
        	areaList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class,GolfVo.class));
        }

        return areaList;
    }
        
}
