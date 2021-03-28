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
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swing.saver.web.domain.SCScoreDetailInfo;
import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.QRInfoVo;
import com.swing.saver.web.entity.ScoreRequest;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.response.ResponseAdvert;
import com.swing.saver.web.response.ResponseAreaInfo;
import com.swing.saver.web.response.ResponseCountryClub;
import com.swing.saver.web.response.ResponseParInfo;
import com.swing.saver.web.response.ResponseScore;
import com.swing.saver.web.response.ResponseScoreAnalysys;
import com.swing.saver.web.response.ResponseScoreDetail;
import com.swing.saver.web.response.ResponseScoreSts;
import com.swing.saver.web.service.AdvertService;
import com.swing.saver.web.service.AreaInfoService;
import com.swing.saver.web.service.CountryClubService;
import com.swing.saver.web.service.ParInfoService;
import com.swing.saver.web.service.RestService;
import com.swing.saver.web.service.SCScoreInfoService;
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
    RestService service;
    
    @Inject
    SCScoreInfoService scoreService;
    
    @Inject
    CountryClubService countryclubService;		// 골프장 
    
    @Inject
    ParInfoService parInfoService;
    
    @Inject
    AdvertService advertService;				// 광고 제휴 사이트 서비스
    
    @Inject
    AreaInfoService areaService;
    
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
    	
    	List<ResponseCountryClub> golfList = countryclubService.findByAllianceCountryClub();   // 골프장 제휴 리스트 조회
    	mv.addObject("golfList", golfList);
    	
    	List<ResponseAdvert> advertList = advertService.findByAdvertAll();
    	mv.addObject("advList", advertList);
    	
        mv.addObject("setMenu", "home");
        mv.setViewName("mobile/home");
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
        	
        	List<ResponseCountryClub> golfList = countryclubService.findBySearch(params);
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
    	
    	ResponseCountryClub golfInfo = countryclubService.findByDetail(params);
    	mv.addObject("golfInfo",golfInfo);
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
        //List<AreaVo> areaList = getAreaList("KR");	// Default KR
        List<ResponseAreaInfo> areaList = areaService.findByAreaList();	
        mv.addObject("areaList", areaList); 
    	
    	// 파라미터 : zone_id, alliance_check
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("zone_id", 		 "");
    	params.put("country_id",     "");
    	params.put("countryclub_id", "");
    	params.put("alliance_check", "Y");		// 제휴 리스트만 출력
    	params.put("word",           "");
    	
    	List<ResponseCountryClub> golfList = countryclubService.findBySearch(params);
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
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	LOGGER.debug("Login userID : " + userId);
    	
    	List<ResponseAreaInfo> areaList = areaService.findByAreaList();		// 지역코드 조회
    	// 지역 코드 조회
        mv.addObject("areaList", areaList); 
    	
    	// 파라미터 : zone_id, alliance_check
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("zone_id", vo.getZone_id());
    	params.put("country_id",     "");
    	params.put("countryclub_id", "");
    	params.put("alliance_check", vo.getAlliance_check());
    	params.put("userid", String.valueOf(userId));
    	params.put("word", vo.getWord());
    	
    	List<ResponseCountryClub> golfList = countryclubService.findByAreaySearch(params);

    	mv.addObject("golfList", golfList);
        mv.addObject("alliance_check", vo.getAlliance_check());		// 검색조건
        mv.addObject("zone_id", vo.getZone_id());					// 검색조건
        mv.addObject("word", vo.getWord());
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

    	List<ResponseScore> scoreList = scoreService.getScoreList(userId, fromDt, toDt);
    	
    	mv.addObject("scoreList",      scoreList);
    	mv.addObject("search_period",  search_period);
    	mv.addObject("m",              param);
    	mv.addObject("setMenu",        "score");
    	mv.setViewName("mobile/score/score_list");
    	
        return mv;
    }
    
    /**
     * Mobile 통계 페이지 
     * 모바일 통계 페이지 출력
     * 1개월, 2개월, 3개월, 월별 리스트 데이터를 가져온다. 
     * parameter : m=1, m=2, m=3, m=list
     * 
     * @param request
     * @return
     */
    @GetMapping("/score_sts")
    public ModelAndView scoreStsForm(HttpServletRequest request, HttpSession session) throws IOException, ApiException {    	
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
    	
    	
    	ResponseScoreSts scoreList = scoreService.getScoreInfoList(userId, fromDt, toDt);
    	
    	mv.addObject("sts", scoreList);
    	mv.addObject("search_period",  search_period);
    	mv.addObject("m",              param);
        mv.setViewName("mobile/score/score_sts");
        
        return mv;
    }
    
    
    /**
     * 버이야 스코어 추가 초기 화면 
     * 골프장 이름, Out코스, In 코스 선택 화면 
     * 
     * @param request
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/score-add")
    public ModelAndView scoreAddForm(HttpServletRequest request, HttpSession session) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	LOGGER.debug("Login userID : " + userId);

    	mv.addObject("setMenu",        "score");
    	mv.setViewName("mobile/score/score_add_form");
    	
        return mv;
    }
    

    /**
     * 스코어 등록을 위한 골프장 정보를 조회한다. 
     * 
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @RequestMapping(value="/countryclub-search")
    @ResponseBody
    public String countryclubSearch(HttpServletRequest request) throws ApiException, IOException, ParseException {
    	LOGGER.debug("==================== MobileController countryclubSearch Strart : ===================={}");
    	//String jsonData = restService.getCountryclubList(URLEncoder.encode(request.getParameter("countryclub_nm").toString(), "UTF-8"));		// 골프장 조회
    	String jsonData = countryclubService.findByLikeName(request.getParameter("countryclub_nm").toString()); // URLEncoder.encode(request.getParameter("countryclub_nm").toString(), "UTF-8"));
    	LOGGER.debug(jsonData);
    	
    	LOGGER.debug("==================== MobileController countryclubSearch end : ===================={}");
    	return jsonData;
    }    
    
    /**
     * Par 리스트 출력
     * @param request
     * @return
     */
    @GetMapping("/parList/{countryclub_id}")
    @ResponseBody
    public String parList(HttpServletRequest request, @PathVariable String countryclub_id)  throws IOException, ApiException 
    {
    	//ModelAndView mv = new ModelAndView();
    	String rtnJson=  service.getParList(countryclub_id);   // 골프장 Par 리스트 조회
    	
        //mv.addObject("data", rtnJson);
        //mv.setViewName("jsonView");
        
    	return rtnJson;
    }   
    
    /**
     * 골프장 아이디, out코스, in코스 정보를 받아서 상세 정보를 입력하는 폼을 출력하낟. 
     * 
     * @param request
     * @param countryclub_id
     * @param start_couse
     * @param end_course
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/score-add/{countryclub_id}/{start_course}/{end_course}")
    public ModelAndView scoreAddDetailForm(HttpServletRequest request, @PathVariable String countryclub_id, 
    		@PathVariable String start_course, @PathVariable String end_course, 
    		HttpSession session) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	// visit_date, teeup_time parameter
    	String visit_date = request.getParameter("visit_date").toString();
    	String teeup_time = request.getParameter("teeup_time").toString();
    	
    	if (visit_date == null || teeup_time == null)
    	{
    		mv.setViewName("redirect:/m/score");
        	
            return mv;
    	}
    	
    	
    	LOGGER.debug("Login userID : " + userId);
    	
    	ResponseCountryClub golfVo = countryclubService.findByCountryClub(countryclub_id);
    	
        // Hole에 대한 PAR 정보를 조회
    	ResponseParInfo parInfo1 = parInfoService.getParInfo(countryclub_id, Integer.parseInt(start_course));  // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	ResponseParInfo parInfo2 = parInfoService.getParInfo(countryclub_id, Integer.parseInt(end_course));   // 골프장 Par 정보 상세 정보 조회 (End Course)

        mv.addObject("parInfo1", parInfo1);
        mv.addObject("parInfo2", parInfo2);        
        mv.addObject("golfInfo", golfVo); 
        mv.addObject("visit_date", visit_date);
        mv.addObject("teeup_time", teeup_time);
    	mv.addObject("scoreInfo",      null);
    	mv.addObject("setMenu",        "score");
    	mv.setViewName("mobile/score/score_add");
    	
        return mv;
    }
    
    /**
     * QR에서 넘어왔을 때 처리하는 로직
     * 
     * @param qrVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @RequestMapping("/score/scoreRegister")
    public ModelAndView scoreRegister(@ModelAttribute(value="qrVo")QRInfoVo qrVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws IOException, ApiException {    	
    	
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	// visit_date:2020-12-08 , teeup_time=10:28
    	// countryclub_id, start_course, end_course
    	
    	// visit_date, teeup_time parameter
    	String visit_date = qrVo.getVisit_date();  //   request.getParameter("visit_date").toString();
    	String teeup_time = qrVo.getUtime();      //    request.getParameter("teeup_time").toString();
    	
    	if (visit_date == null || teeup_time == null)
    	{
    		mv.setViewName("redirect:/m/score");
        	
            return mv;
    	}
    	
    	
    	LOGGER.debug("Login userID : " + userId);
    	
    	ResponseCountryClub golfVo = countryclubService.findByCountryClub(qrVo.getCountryclub_id());
    	
        // Hole에 대한 PAR 정보를 조회
    	ResponseParInfo parInfo1 = parInfoService.getParInfo(qrVo.getCountryclub_id(), Integer.parseInt(qrVo.getStartcourse()));  // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	ResponseParInfo parInfo2 = parInfoService.getParInfo(qrVo.getCountryclub_id(), Integer.parseInt(qrVo.getEndcourse()));   // 골프장 Par 정보 상세 정보 조회 (End Course)
       	// 개인별 스코어 세부정보  VO에 저장

    	SCScoreInfo scoreVo = new SCScoreInfo();  // scoreService.save(scoreVo);
    	scoreVo.setVisit_date(qrVo.getVisit_date());	 				// 골프친 날짜(당일)
    	scoreVo.setCountryclub_id(qrVo.getCountryclub_id()); 				// 골프장 코드
    	scoreVo.setStart_course(Integer.parseInt(qrVo.getStartcourse()));	// out 시작 코스
    	scoreVo.setEnd_course(Integer.parseInt(qrVo.getEndcourse()));  		// in 종료 코스
    	scoreVo.setTeeup_time(qrVo.getUtime());   
    	
    	SCScoreDetailInfo detailInfo = new SCScoreDetailInfo();
    	detailInfo.setVisit_date(qrVo.getVisit_date());	 				// 골프친 날짜(당일)
    	detailInfo.setCountryclub_id(qrVo.getCountryclub_id()); 				// 골프장 코드
    	detailInfo.setTeeup_time(qrVo.getUtime());   
    	
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
    		    		
    		// 스코어 계산
    		if (scoreVo.getScore1() != null) scoreVo.setStroke1(scoreVo.getScore1() - parInfo1.getHole1());
    		if (scoreVo.getScore2() != null) scoreVo.setStroke2(scoreVo.getScore2() - parInfo1.getHole2());
    		if (scoreVo.getScore3() != null) scoreVo.setStroke3(scoreVo.getScore3() - parInfo1.getHole3());
    		if (scoreVo.getScore4() != null) scoreVo.setStroke4(scoreVo.getScore4() - parInfo1.getHole4());
    		if (scoreVo.getScore5() != null) scoreVo.setStroke5(scoreVo.getScore5() - parInfo1.getHole5());
    		if (scoreVo.getScore6() != null) scoreVo.setStroke6(scoreVo.getScore6() - parInfo1.getHole6());
    		if (scoreVo.getScore7() != null) scoreVo.setStroke7(scoreVo.getScore7() - parInfo1.getHole7());
    		if (scoreVo.getScore8() != null) scoreVo.setStroke8(scoreVo.getScore8() - parInfo1.getHole8());
    		if (scoreVo.getScore9() != null) scoreVo.setStroke9(scoreVo.getScore9() - parInfo1.getHole9());
    		if (scoreVo.getScore10() != null) scoreVo.setStroke10(scoreVo.getScore10() - parInfo2.getHole1());
    		if (scoreVo.getScore11() != null) scoreVo.setStroke11(scoreVo.getScore11() - parInfo2.getHole2());
    		if (scoreVo.getScore12() != null) scoreVo.setStroke12(scoreVo.getScore12() - parInfo2.getHole3());
    		if (scoreVo.getScore13() != null) scoreVo.setStroke13(scoreVo.getScore13() - parInfo2.getHole4());
    		if (scoreVo.getScore14() != null) scoreVo.setStroke14(scoreVo.getScore14() - parInfo2.getHole5());
    		if (scoreVo.getScore15() != null) scoreVo.setStroke15(scoreVo.getScore15() - parInfo2.getHole6());
    		if (scoreVo.getScore16() != null) scoreVo.setStroke16(scoreVo.getScore16() - parInfo2.getHole7());
    		if (scoreVo.getScore17() != null) scoreVo.setStroke17(scoreVo.getScore17() - parInfo2.getHole8());
    		if (scoreVo.getScore18() != null) scoreVo.setStroke18(scoreVo.getScore18() - parInfo2.getHole9());    		
    	}else {
    		//scoreVo.setError("스코어 정보 개수 에러 :" + scoreList.length);
    	}    	
    	
    	scoreVo.setTeeup_time(scoreVo.getTeeup_time().replace(":", ""));
    	scoreVo.setVisit_date(scoreVo.getVisit_date().replace("-", "").replace("-", ""));
    	ResponseScoreDetail scoreInfo = ResponseScoreDetail.builder()
				.score(scoreVo)
				.detail(detailInfo)
				.build();
    	
    	
    	
        mv.addObject("parInfo1", parInfo1);
        mv.addObject("parInfo2", parInfo2);        
        mv.addObject("golfInfo", golfVo); 
        mv.addObject("visit_date", visit_date);
        mv.addObject("teeup_time", teeup_time);
    	mv.addObject("scoreInfo",      scoreInfo);
    	mv.addObject("setMenu",        "score");
    	mv.setViewName("mobile/score/score_add");
    	
        return mv;
    }
    
    
    /**
     * 스코어 등록 화면에서 데이터를 받아와서 저장한다. 
     * 
     * @param scoreVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/score/scoreSave")
    public ModelAndView scoreSave(ScoreRequest scoreVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException 
    {
    	LOGGER.debug("==================== MobileController scoreSave Start : ===================");
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	scoreVo.setUser_id(String.valueOf(userId));	// 사용자 ID
    	
    	scoreVo.setTeeup_time(scoreVo.getTeeup_time().replace(":", ""));
    	scoreVo.setVisit_date(scoreVo.getVisit_date().replace("-", "").replace("-", ""));
    	
    	SCScoreInfo info = scoreService.save(scoreVo);
    	SCScoreDetailInfo detailInfo = scoreService.saveDetail(scoreVo);
    	
    	ResponseScoreDetail scoreInfo = ResponseScoreDetail.builder()
				.score(info)
				.detail(detailInfo)
				.build();

    	ResponseCountryClub golfVo = countryclubService.findByCountryClub(scoreVo.getCountryclub_id());
        // Hole에 대한 PAR 정보를 조회
    	ResponseParInfo parInfo1 = parInfoService.getParInfo(scoreVo.getCountryclub_id(), Integer.parseInt(scoreVo.getStart_course()));  // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	ResponseParInfo parInfo2 = parInfoService.getParInfo(scoreVo.getCountryclub_id(), Integer.parseInt(scoreVo.getEnd_course()));   // 골프장 Par 정보 상세 정보 조회 (End Course)  	    	

        mv.addObject("parInfo1", parInfo1);
        mv.addObject("parInfo2", parInfo2); 
        
        mv.addObject("golfInfo", golfVo);
    	mv.addObject("scoreInfo",      scoreInfo);
    	mv.addObject("setMenu",        "score");
    	mv.addObject("message",        "저장을 완료하였습니다!!!");
    	mv.setViewName("mobile/score/score_add");
    	
    	LOGGER.debug("==================== MobileController scoreSave End : ===================");
    	return mv;
    }
    
    /**
     * 스코어 분석
     * @param scoreVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/score/scoreAnalysis")
    public ModelAndView scoreAnalysis(ScoreRequest scoreVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException 
    {
    	LOGGER.debug("==================== MobileController scoreAnaysis Start : ===================");
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	scoreVo.setUser_id(String.valueOf(userId));	// 사용자 ID
    	
    	scoreVo.setTeeup_time(scoreVo.getTeeup_time().replace(":", ""));
    	scoreVo.setVisit_date(scoreVo.getVisit_date().replace("-", "").replace("-", ""));
    	
    	String teeup_time = scoreVo.getTeeup_time();
    	String countryclub_id = scoreVo.getCountryclub_id();
    	String visit_date = scoreVo.getVisit_date();
    	String start_course = scoreVo.getStart_course();
    	String end_course = scoreVo.getEnd_course();
    	
    	
    	SCScoreInfo info = scoreService.findByKey(countryclub_id, visit_date, teeup_time, Long.valueOf(userId).intValue());
    	SCScoreDetailInfo detail = scoreService.findDetailByKey(countryclub_id, visit_date, teeup_time, Long.valueOf(userId).intValue());
    	
    	ResponseScoreAnalysys scoreAnalysys = ResponseScoreAnalysys.builder()
    											.score(info)
    											.detail(detail)
    											.build();
    	
    	ResponseCountryClub golfVo = countryclubService.findByCountryClub(scoreVo.getCountryclub_id());
    	
    	mv.addObject("golfInfo", golfVo);
    	mv.addObject("scoreAnalysys", scoreAnalysys);
    	mv.addObject("visit_date", scoreVo.getVisit_date());
    	mv.addObject("teeup_time", scoreVo.getTeeup_time());
    	mv.addObject("countryclub_id", scoreVo.getCountryclub_id());
    	mv.addObject("start_course", scoreVo.getStart_course());
    	mv.addObject("end_course", scoreVo.getEnd_course());
    	mv.addObject("setMenu",        "score");
    	mv.setViewName("mobile/score/score_analysis");
    	LOGGER.debug("==================== MobileController scoreAnaysis End : ===================");
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
    @GetMapping("/scoredetail")
    public ModelAndView scoreDetail(HttpServletRequest request, HttpSession session) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	
    	LOGGER.debug("Login userID : " + userId);
    	
    	String teeup_time = request.getParameter("teeup_time");
    	String countryclub_id = request.getParameter("countryclub_id");
    	String visit_date = request.getParameter("visit_date").replace(".", "").replace(".", "");
    	String start_course = request.getParameter("start_course");
    	String end_course = request.getParameter("end_course");
    	
    	
    	SCScoreInfo info = scoreService.findByKey(countryclub_id, visit_date, teeup_time, Long.valueOf(userId).intValue());
    	SCScoreDetailInfo detail = scoreService.findDetailByKey(countryclub_id, visit_date, teeup_time, Long.valueOf(userId).intValue());
    	
    	ResponseScoreDetail scoreInfo = ResponseScoreDetail.builder()
    										.score(info)
    										.detail(detail)
    										.build();
    	
    	ResponseCountryClub golfVo = countryclubService.findByCountryClub(countryclub_id);
        // Hole에 대한 PAR 정보를 조회
    	ResponseParInfo parInfo1 = parInfoService.getParInfo(countryclub_id, Integer.parseInt(start_course));  // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	ResponseParInfo parInfo2 = parInfoService.getParInfo(countryclub_id, Integer.parseInt(end_course));   // 골프장 Par 정보 상세 정보 조회 (End Course)
    	
        mv.addObject("parInfo1", parInfo1);
        mv.addObject("parInfo2", parInfo2);
        
        mv.addObject("golfInfo", golfVo); 
    	mv.addObject("scoreInfo",      scoreInfo);
    	mv.addObject("setMenu",        "score");
    	mv.setViewName("mobile/score/score_add");
    	
        return mv;
    }
    
    
//    /**
//     * Mobile 스코어 등록 (Not used)
//     * 
//     * @param request
//     * @return
//     */
//    @GetMapping("/score_add")
//    public ModelAndView scorAddForm(HttpServletRequest request) throws IOException, ApiException {    	
//    	ModelAndView mv = new ModelAndView();
//    	
//    	String rtnJson = restService.golfRecommandList();
//    	ObjectMapper mapper = new ObjectMapper();
//    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
//    	
//    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
//    	
//    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
//    	mv.addObject("golfList", golfList);
//    	mv.setViewName("mobile/score/score_add");
//    	mv.addObject("setMenu", "score");
//    	    	    	
//    	rtnJson = restService.getAdvList();   //  광고관리 정보 조회 (use_yn이 Y인 것에 대해서만 화면상에 보여 주어야 한다)
//    	ObjectMapper mapp= new ObjectMapper();
//        Map<String, Object> mapAd = mapp.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
//        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
//        List<AdverVo> advList = mapp.convertValue(mapAd.get("advList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AdverVo.class));
//        mv.addObject("advList", advList);
//    	
//        return mv;
//    }
    
    
  
    
    /**
     * Aicoach Form
     * 
     * @param request
     * @return
     */
    @GetMapping("/aicoach")
    public ModelAndView aicoachForm(HttpServletRequest request) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();

    	mv.setViewName("mobile/aicoach");
    	mv.addObject("setMenu", "aicoach");
    	
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
    
    /**
     * 파일  URL을 호출 받아서 이미지를 읽어서 리턴한다. 
     * 
     * @param request
     * @return
     * @throws IOException
     */
    @GetMapping(value="/getFile", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)  // .IMAGE_JPEG_VALUE)
    public @ResponseBody byte[] getFile(HttpServletRequest request) throws IOException {
    	InputStream in = null;   // 이미지 read
    	String imageName = request.getParameter("fileName");
    	String filePath = uploadPath + File.separator + imageName;
    	
    	System.out.println("filePath : " + filePath);
    	in = new FileInputStream(filePath);
    	
    	return IOUtils.toByteArray(in);
    }
}
