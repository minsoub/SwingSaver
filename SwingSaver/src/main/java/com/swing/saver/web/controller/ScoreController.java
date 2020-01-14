package com.swing.saver.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.AreaVo;
import com.swing.saver.web.entity.CodeVo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.FarVo;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.entity.GroupVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.QRInfoVo;
import com.swing.saver.web.entity.ScoreVo;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.RestService;
import com.swing.saver.web.util.CommonUtil;
import com.swing.saver.web.util.UploadFileUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.*;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

@Controller
@RequestMapping(Constant.SCORE_PREFIX)
public class ScoreController {
	private final static Logger LOGGER = LoggerFactory.getLogger(ScoreController.class);
	
	// dispatcher-servlet.xml에 정의
    @Resource(name = "uploadDataPath")
    private String uploadPath;
    
    @Inject
    RestService restService;
    
    /**
     * QR로 넘어 왔을 때 호출되는 메소드로 사용자 스코어 정보를 출력한다.
     * 현재 상태는 데이터베이스에 저장되지 않은 상태이다. 
     * 
     * @param qrVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/qradd")
    public ModelAndView qrAdd(QRInfoVo qrVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== ScoreController qrAdd Start : ===================");
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;	
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
       
        
    	// 골프장 Par 정보를 얻는다.
    	String country_id = "KR";
    	FarVo parInfo1 =  restService.getParInfo(country_id, qrVo.getZone_id(), qrVo.getCountryclub_id(), qrVo.getStartcourse());   // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	FarVo parInfo2 =  restService.getParInfo(country_id, qrVo.getZone_id(), qrVo.getCountryclub_id(), qrVo.getEndcourse());     // 골프장 Par 정보 상세 정보 조회 (End Course)
    	
    	// PAR에 대한 SUM 합계
    	parInfo1.setSum(parInfo1.getHole1()+parInfo1.getHole2()+parInfo1.getHole3()+parInfo1.getHole4()+parInfo1.getHole5()+parInfo1.getHole6()
    					+parInfo1.getHole7()+parInfo1.getHole8()+parInfo1.getHole9());
    	parInfo2.setSum(parInfo2.getHole1()+parInfo2.getHole2()+parInfo2.getHole3()+parInfo2.getHole4()+parInfo2.getHole5()+parInfo2.getHole6()
		+parInfo2.getHole7()+parInfo2.getHole8()+parInfo2.getHole9());
    	
    	// 개인별 스코어 세부정보  VO에 저장
    	ScoreVo scoreVo = new ScoreVo();
    	scoreVo.setVisit_date(CommonUtil.getCurrentDate());	 				// 골프친 날짜(당일)
    	scoreVo.setContryclub_id(qrVo.getCountryclub_id()); 				// 골프장 코드
    	scoreVo.setStart_course(Integer.parseInt(qrVo.getStartcourse()));	// out 시작 코스
    	scoreVo.setEnd_course(Integer.parseInt(qrVo.getEndcourse()));  		// in 종료 코스
    	
    	String score = qrVo.getScore();		// 현재 형식 1:2:3:4 ~~ 형식으로 되어 있다.
    	String[] scoreList = score.split(":");
    	if (scoreList.length == 18)
    	{
    		scoreVo.setUser_id((new Long(userId)).intValue());
    		scoreVo.setScore1(Integer.parseInt(scoreList[0]));
    		scoreVo.setScore2(Integer.parseInt(scoreList[1]));
    		scoreVo.setScore3(Integer.parseInt(scoreList[2]));
    		scoreVo.setScore4(Integer.parseInt(scoreList[3]));
    		scoreVo.setScore5(Integer.parseInt(scoreList[4]));
    		scoreVo.setScore6(Integer.parseInt(scoreList[5]));
    		scoreVo.setScore7(Integer.parseInt(scoreList[6]));
    		scoreVo.setScore8(Integer.parseInt(scoreList[7]));
    		scoreVo.setScore9(Integer.parseInt(scoreList[8]));
    		scoreVo.setScore10(Integer.parseInt(scoreList[9]));
    		scoreVo.setScore11(Integer.parseInt(scoreList[10]));
    		scoreVo.setScore12(Integer.parseInt(scoreList[11]));
    		scoreVo.setScore13(Integer.parseInt(scoreList[12]));
    		scoreVo.setScore14(Integer.parseInt(scoreList[13]));
    		scoreVo.setScore15(Integer.parseInt(scoreList[14]));
    		scoreVo.setScore16(Integer.parseInt(scoreList[15]));
    		scoreVo.setScore17(Integer.parseInt(scoreList[16]));
    		scoreVo.setScore18(Integer.parseInt(scoreList[17]));
    		
    	}else {
    		scoreVo.setError("스코어 정보 개수 에러 :" + scoreList.length);
    	}
    	 
    	mv.addObject("scoreVo", scoreVo);			// Score 정보
    	mv.addObject("qrInfo", qrVo);
    	mv.addObject("parInfo1", parInfo1);
    	mv.addObject("parInfo2", parInfo2);
    	LOGGER.debug("==================== ScoreController qrAdd end : ===================");
    	mv.setViewName("web/score/screen_01");
    	return mv;
    }
    
    /**
     * QR에서 넘어왔을 때 저장하려고 하면 세션에 저장되어 있는 지 확인하고 저장되어 있지 않으면 로그인을 하게 한다.
     * 로그인을 할 때 prev_url을 등록하여 로그인 후 다음 URL로 넘겨갈 수 있도록  한다.
     * 
     * @param qrVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/loginForm")
    public ModelAndView loginForm(QRInfoVo qrVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {    
    	//session = request.getSession(true);
    	session.setAttribute("qrInfo", qrVo);
    	
    	LOGGER.debug(qrVo.getCountryclub_id());
    	LOGGER.debug(qrVo.getZone_id());
    	
    	QRInfoVo vo = (QRInfoVo) session.getAttribute("qrInfo");
    	LOGGER.debug(vo.getCountryclub_id());
    	LOGGER.debug(vo.getZone_id());
    	
    	mv.addObject("prev_url", "redirect:/score/scoreRegister");
    	mv.setViewName("web/log_01_01");
    	
    	return mv;
    }
    
    /**
     * QR에서 넘어온 후 로그인 했을 때 스코어 등록 화면으로 이동한다. 
     * 
     * @param qrVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @RequestMapping(value="/scoreRegister")
    public ModelAndView scoreRegister(@ModelAttribute(value="qrVo")QRInfoVo qrVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== ScoreController scoreRegister Start : ===================");
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
    	// 골프장 Par 정보를 얻는다.
    	String country_id = "KR";
    	FarVo parInfo1 =  restService.getParInfo(country_id, qrVo.getZone_id(), qrVo.getCountryclub_id(), qrVo.getStartcourse());   // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	FarVo parInfo2 =  restService.getParInfo(country_id, qrVo.getZone_id(), qrVo.getCountryclub_id(), qrVo.getEndcourse());     // 골프장 Par 정보 상세 정보 조회 (End Course)
    	
    	// PAR에 대한 SUM 합계
    	parInfo1.setSum(parInfo1.getHole1()+parInfo1.getHole2()+parInfo1.getHole3()+parInfo1.getHole4()+parInfo1.getHole5()+parInfo1.getHole6()
    					+parInfo1.getHole7()+parInfo1.getHole8()+parInfo1.getHole9());
    	parInfo2.setSum(parInfo2.getHole1()+parInfo2.getHole2()+parInfo2.getHole3()+parInfo2.getHole4()+parInfo2.getHole5()+parInfo2.getHole6()
		+parInfo2.getHole7()+parInfo2.getHole8()+parInfo2.getHole9());
    	
    	// 개인별 스코어 세부정보  VO에 저장
    	ScoreVo scoreVo = new ScoreVo();
    	scoreVo.setVisit_date(CommonUtil.getCurrentDate());	 				// 골프친 날짜(당일)
    	scoreVo.setContryclub_id(qrVo.getCountryclub_id()); 				// 골프장 코드
    	scoreVo.setStart_course(Integer.parseInt(qrVo.getStartcourse()));	// out 시작 코스
    	scoreVo.setEnd_course(Integer.parseInt(qrVo.getEndcourse()));  		// in 종료 코스
    	
    	String score = qrVo.getScore();		// 현재 형식 1:2:3:4 ~~ 형식으로 되어 있다.
    	String[] scoreList = score.split(":");
    	if (scoreList.length == 18)
    	{
    		scoreVo.setUser_id((new Long(userId)).intValue());
    		scoreVo.setScore1(Integer.parseInt(scoreList[0]));
    		scoreVo.setScore2(Integer.parseInt(scoreList[1]));
    		scoreVo.setScore3(Integer.parseInt(scoreList[2]));
    		scoreVo.setScore4(Integer.parseInt(scoreList[3]));
    		scoreVo.setScore5(Integer.parseInt(scoreList[4]));
    		scoreVo.setScore6(Integer.parseInt(scoreList[5]));
    		scoreVo.setScore7(Integer.parseInt(scoreList[6]));
    		scoreVo.setScore8(Integer.parseInt(scoreList[7]));
    		scoreVo.setScore9(Integer.parseInt(scoreList[8]));
    		scoreVo.setScore10(Integer.parseInt(scoreList[9]));
    		scoreVo.setScore11(Integer.parseInt(scoreList[10]));
    		scoreVo.setScore12(Integer.parseInt(scoreList[11]));
    		scoreVo.setScore13(Integer.parseInt(scoreList[12]));
    		scoreVo.setScore14(Integer.parseInt(scoreList[13]));
    		scoreVo.setScore15(Integer.parseInt(scoreList[14]));
    		scoreVo.setScore16(Integer.parseInt(scoreList[15]));
    		scoreVo.setScore17(Integer.parseInt(scoreList[16]));
    		scoreVo.setScore18(Integer.parseInt(scoreList[17]));
    		
    	}else {
    		scoreVo.setError("스코어 정보 개수 에러 :" + scoreList.length);
    	}
    	
    	String rtnJson = restService.getAreaList();   // 관리자가 지역 정보 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<AreaVo> areaList = mapper.convertValue(map.get("areaList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AreaVo.class));
    	
    	mv.addObject("areaList", areaList); 
    	mv.addObject("scoreVo", scoreVo);			// Score 정보
    	mv.addObject("qrInfo", qrVo);
    	mv.addObject("parInfo1", parInfo1);
    	mv.addObject("parInfo2", parInfo2);
    	LOGGER.debug("==================== scoreRegister qrAdd end : ===================");
    	mv.setViewName("web/score/score_01_1");
    	return mv;
    }
    
    @GetMapping(value="/scoreAdd")
    public ModelAndView scoreAddForm(HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== ScoreController scoreAdd Start : ===================");
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
        // 국가 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        // 지역 조회
        List<AreaVo> areaList = getAreaList("KR");	// Default KR
        mv.addObject("areaList", areaList); 
        

    	LOGGER.debug("==================== scoreRegister scoreAdd end : ===================");
    	mv.setViewName("web/score/score_01_2");
    	return mv;
    }    
    
    /**
     * 내 스코어 관리
     * @param params
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/scoreList")
    public ModelAndView  scoreList(@RequestBody Map<String, String> params, HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ScoreController memberjoin Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
        // 내 스코어 리스트 조회
        
        mv.setViewName("web/score/score_01");
        LOGGER.debug("==================== ScoreController scoreList end : ===================={}");
        return mv;
    }
    @GetMapping(value="/scoreList")
    public ModelAndView  scoreGetList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ScoreController memberjoin Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
        // 내 스코어 리스트 조회
        
        mv.setViewName("web/score/score_01");
        LOGGER.debug("==================== ScoreController scoreList end : ===================={}");
        return mv;
    }   
    /**
     * 내스코어 통계
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/statList")
    public ModelAndView  statList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ScoreController statList Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
        // 내 스코어 리스트 조회
        
        mv.setViewName("web/score/data_01");
        LOGGER.debug("==================== ScoreController statList end : ===================={}");
        return mv;
    }   
    
    /**
     * 지역정보 리스트 출력
     * @param request
     * @return
     */
    @GetMapping("/golfList/{country_id}/{zone_id}")
    public ModelAndView golfList(HttpServletRequest request,@PathVariable String country_id, @PathVariable String zone_id)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	String rtnJson=  restService.getGolfList(country_id, zone_id);   // 골프장 리스트 조회
    	
        mv.addObject("data", rtnJson);
        mv.setViewName("jsonView");
        
    	return mv;
    }    
    
    /**
     * 지역정보 리스트 출력
     * @param request
     * @return
     */
    @GetMapping("/parList/{country_id}/{zone_id}/{countryclub_id}")
    public ModelAndView parList(HttpServletRequest request,@PathVariable String country_id, @PathVariable String zone_id, @PathVariable String countryclub_id)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	String rtnJson=  restService.getParList(country_id, zone_id, countryclub_id);   // 골프장 Par 리스트 조회
    	
        mv.addObject("data", rtnJson);
        mv.setViewName("jsonView");
        
    	return mv;
    }      
    
    /**
     * 국가에 해당하는 지역 리스트를 출력 한다.
     * 
     * @param country_id
     * @return
     * @throws ApiException
     * @throws IOException
     */
    private List<AreaVo> getAreaList(String country_id) throws ApiException, IOException {
    	String rtnJson = restService.getAreaList(country_id);   
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<AreaVo> areaList = mapper.convertValue(map.get("areaList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AreaVo.class));

        return areaList;
    }
    
    /**
     * 코드 정보를 조회해서 리턴한다.
     * 
     * @param groupType
     * @return
     * @throws IOException
     * @throws ApiException
     */
    private List<CodeVo> getCodeList(String groupType) throws IOException, ApiException {

    	String rtnJson = restService.getCodeList(groupType);   // 코드 정보 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<CodeVo> codeList = mapper.convertValue(map.get("codeList"), TypeFactory.defaultInstance().constructCollectionType(List.class,CodeVo.class));

        return codeList;
    }    
}
