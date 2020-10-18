package com.swing.saver.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AdverVo;
import com.swing.saver.web.entity.AreaVo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.ScoreListVo;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.MobileService;
import com.swing.saver.web.service.RestService;
import com.swing.saver.web.util.CommonUtil;

/**
 * Buddya 모바일 홈페이지 Controller Class
 * 
 * @author minso
 *
 */
@Controller
@RequestMapping(Constant.MOBILE_PREFIX)
public class MobileController extends CommonController {
	private final static Logger LOGGER = LoggerFactory.getLogger(MobileController.class);
	
	// dispatcher-servlet.xml에 정의
    @Resource(name = "uploadDataPath")
    private String uploadPath;
    
    @Inject
    MobileService restService;
    
    @Inject
    RestService service;
    
    /**
     * Mobile Index Page
     * 골프장 추천 리스트를 조회해서 출력한다. 
     * 
     * @param request
     * @return
     */
    @GetMapping("/home")
    public ModelAndView mobileHomeForm(HttpServletRequest request) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	String rtnJson = restService.golfRecommandList();
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfList", golfList);
    	mv.setViewName("mobile/home");
    	mv.addObject("setMenu", "home");
    	    	    	
    	rtnJson = restService.getAdvList();   //  광고관리 정보 조회 (use_yn이 Y인 것에 대해서만 화면상에 보여 주어야 한다)
    	ObjectMapper mapp= new ObjectMapper();
        Map<String, Object> mapAd = mapp.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        List<AdverVo> advList = mapp.convertValue(mapAd.get("advList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AdverVo.class));
        mv.addObject("advList", advList);
    	
        return mv;
    }
    
    /**
     * 검색하기 페이지 호출
     * 
     * @param request
     * @return
     */
    @RequestMapping("/search")
    public ModelAndView mobileSearchForm(GolfVo vo, HttpServletRequest request,HttpSession session,ModelAndView mv,RedirectAttributes redirectAttributes) throws ApiException, IOException {
    	if (vo.getWord()!= null)
    	{    	
        	// 파라미터 : zone_id, alliance_check
        	Map<String, String> params = new HashMap<String, String>();
        	params.put("zone_id", "");
        	params.put("country_id",     "");
        	params.put("countryclub_id", "");
        	params.put("alliance_check", "");
        	params.put("word",  vo.getWord());
        	
        	String rtnJson = restService.getGolfList(params);
        	ObjectMapper mapper = new ObjectMapper();
        	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});    	
        	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);    	
        	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
        	mv.addObject("golfList", golfList);
    		
    		mv.addObject("word", vo.getWord());
    	}       	
    	mv.addObject("setMenu", "search");
        mv.setViewName("mobile/search");
        return mv;
    }
    
    /**
     * 골프장 상세 정보 페이지
     * 
     * @param request
     * @return
     */
    @PostMapping("/detail")
    public ModelAndView mobileDetailForm(GolfVo vo, HttpServletRequest request,HttpSession session,ModelAndView mv,RedirectAttributes redirectAttributes) throws ApiException, IOException {    	
    	// 넘어온 키값을 골프장 상세정보를 조회한다.
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("zone_id",        vo.getZone_id());
    	params.put("country_id",     vo.getCountry_id());
    	params.put("countryclub_id", vo.getCountryclub_id());
    	params.put("alliance_check", "");
    	params.put("word",           "");
    	
    	String rtnJson = restService.getGolfList(params);
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfInfo", golfList.get(0));
    	mv.setViewName("mobile/detail");
    	mv.addObject("setMenu", "detail");
    	return mv;
    }  
    
    /**
     * 버디야 즐겨찾기 
     * 제휴된 리스트만 출력한다. 
     * 
     * @param request
     * @return
     */
    @GetMapping("/bookmark")
    public ModelAndView mobileBookMarkForm(GolfVo vo, HttpServletRequest request,HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException {
        
    	// 지역 코드 조회
        List<AreaVo> areaList = getAreaList("KR");	// Default KR
        mv.addObject("areaList", areaList); 
    	
    	// 파라미터 : zone_id, alliance_check
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("zone_id", 		 "");
    	params.put("country_id",     "");
    	params.put("countryclub_id", "");
    	params.put("alliance_check", "Y");		// 제휴 리스트만 출력
    	params.put("word",           "");
    	
    	String rtnJson = restService.getGolfList(params);
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfList", golfList);
        mv.addObject("alliance_check", vo.getAlliance_check());		// 검색조건
        mv.addObject("zone_id", vo.getZone_id());					// 검색조건
        mv.setViewName("mobile/golflist");  
    	
    	mv.setViewName("mobile/bookmark");
    	mv.addObject("setMenu", "bookmark");
    	return mv;
    } 
    
    
    /**
     * 리스트 출력하기 
     * 
     * @param request
     * @return
     */
    @GetMapping("/golflist")
    public ModelAndView mobileGolfList(GolfVo vo, HttpServletRequest request,HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException {
    	// 지역 코드 조회
        List<AreaVo> areaList = getAreaList("KR");	// Default KR
        mv.addObject("areaList", areaList); 
    	
    	// 파라미터 : zone_id, alliance_check
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("zone_id", vo.getZone_id());
    	params.put("country_id",     "");
    	params.put("countryclub_id", "");
    	params.put("alliance_check", vo.getAlliance_check());
    	params.put("word", "");
    	
    	String rtnJson = restService.getGolfList(params);
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfList", golfList);
        mv.addObject("alliance_check", vo.getAlliance_check());		// 검색조건
        mv.addObject("zone_id", vo.getZone_id());					// 검색조건
        mv.setViewName("mobile/golflist");  
        mv.addObject("setMenu", "golflist");
        return mv;
    }    
    
    
    /**
     * Mobile Index Page
     * 내가 등록한 스코어 리스트를 조회한다. 
     * 1개월, 2개월, 3개월, 월별 리스트 데이터를 가져온다. 
     * parameter : m=1, m=2, m=3, m=list
     * 
     * @param request
     * @return
     */
    @GetMapping("/score")
    public ModelAndView scoreForm(HttpServletRequest request, HttpSession session) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	LOGGER.debug("Login userID : " + userId);
    	
    	String param = request.getParameter("p");
    	LOGGER.debug(param);
    	
    	String fromDt = null;
    	String toDt = null;
    	if (param == null)
    	{
    		param = "1";
    	}
    	
    	
    	fromDt = CommonUtil.getDiffDate(Integer.parseInt(param), "yyyy.MM.dd");
    	toDt   = CommonUtil.getCurrentFromatDate("yyyy.MM.dd");
    	
    	String search_period = fromDt + " ~ " + toDt;  // 검색 기간
    	
    	// 주어진 기간으로 골프장 스코어 리스트를 조회한다. 
    	String rtnJson = restService.getScoreList(userId, fromDt, toDt);
    	
    	//String rtnJson = restService.golfRecommandList();
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
    	
    	List<ScoreListVo> scoreList = mapper.convertValue(map.get("scoreList"), TypeFactory.defaultInstance().constructCollectionType(List.class, ScoreListVo.class));
    	mv.addObject("scoreList",      scoreList);
    	mv.addObject("search_period",  search_period);
    	mv.addObject("m",              param);
    	mv.addObject("setMenu",        "score");
    	mv.setViewName("mobile/score");
    	
        return mv;
    }
    
    /**
     * Mobile 스코어 등록
     * 
     * @param request
     * @return
     */
    @GetMapping("/score_add")
    public ModelAndView scorAddForm(HttpServletRequest request) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	String rtnJson = restService.golfRecommandList();
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfList", golfList);
    	mv.setViewName("mobile/score_add");
    	mv.addObject("setMenu", "score");
    	    	    	
    	rtnJson = restService.getAdvList();   //  광고관리 정보 조회 (use_yn이 Y인 것에 대해서만 화면상에 보여 주어야 한다)
    	ObjectMapper mapp= new ObjectMapper();
        Map<String, Object> mapAd = mapp.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        List<AdverVo> advList = mapp.convertValue(mapAd.get("advList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AdverVo.class));
        mv.addObject("advList", advList);
    	
        return mv;
    }
    
    
    /**
     * Mobile 통계 페이지 
     * 모바일 통계 페이지 출력
     * 
     * @param request
     * @return
     */
    @GetMapping("/score_sts")
    public ModelAndView scoreStsForm(HttpServletRequest request) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	String rtnJson = restService.golfRecommandList();
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfList", golfList);
    	mv.setViewName("mobile/score_sts");
    	mv.addObject("setMenu", "score");
    	    	    	
    	rtnJson = restService.getAdvList();   //  광고관리 정보 조회 (use_yn이 Y인 것에 대해서만 화면상에 보여 주어야 한다)
    	ObjectMapper mapp= new ObjectMapper();
        Map<String, Object> mapAd = mapp.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        List<AdverVo> advList = mapp.convertValue(mapAd.get("advList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AdverVo.class));
        mv.addObject("advList", advList);
    	
        return mv;
    }
    
    
    /**
     * Aicoach Form
     * 
     * @param request
     * @return
     */
    @GetMapping("/aicoach")
    public ModelAndView aicoachForm(HttpServletRequest request) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	String rtnJson = restService.golfRecommandList();
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfList", golfList);
    	mv.setViewName("mobile/aicoach");
    	mv.addObject("setMenu", "aicoach");
    	    	    	
    	rtnJson = restService.getAdvList();   //  광고관리 정보 조회 (use_yn이 Y인 것에 대해서만 화면상에 보여 주어야 한다)
    	ObjectMapper mapp= new ObjectMapper();
        Map<String, Object> mapAd = mapp.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        List<AdverVo> advList = mapp.convertValue(mapAd.get("advList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AdverVo.class));
        mv.addObject("advList", advList);
    	
        return mv;
    }
    
    
    
    /**
     * 이미지 URL을 호출 받아서 이미지를 읽어서 리턴한다. 
     * 
     * @param request
     * @return
     * @throws IOException
     */
    @GetMapping(value="/getImage", produces=MediaType.IMAGE_JPEG_VALUE)
    public @ResponseBody byte[] getImage(HttpServletRequest request) throws IOException {
    	InputStream in = null;   // 이미지 read
    	String imageName = request.getParameter("fileName");
    	String filePath = uploadPath + File.separator + imageName;
    	
    	System.out.println("filePath : " + filePath);
    	in = new FileInputStream(filePath);
    	
    	return IOUtils.toByteArray(in);
    }
    
    
}
