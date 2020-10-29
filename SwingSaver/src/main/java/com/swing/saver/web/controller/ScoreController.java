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
import com.swing.saver.web.entity.ScoreDetailVo;
import com.swing.saver.web.entity.ScoreListVo;
import com.swing.saver.web.entity.ScoreMaster;
import com.swing.saver.web.entity.ScoreVo;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.AdminService;
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
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.multipart.*;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
    
    @Inject
    AdminService adminService;
    
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
    		
    		// 스코어 합계
    		scoreVo.setScore_sum(scoreVo.getScore1()+scoreVo.getScore2()+scoreVo.getScore3()+scoreVo.getScore4()
    						+scoreVo.getScore5() + scoreVo.getScore6() + scoreVo.getScore7()+scoreVo.getScore8()
    						+scoreVo.getScore9() + scoreVo.getScore10() + scoreVo.getScore11() + scoreVo.getScore12()
    						+scoreVo.getScore13() + scoreVo.getScore14() + scoreVo.getScore15() + scoreVo.getScore16()
    						+scoreVo.getScore17() + scoreVo.getScore18()
    				);
    		scoreVo.setScore_plus_sum(scoreVo.getScore_sum() - (parInfo1.getSum()+parInfo2.getSum()));
    		
    		// 스코어 계산
    		if (scoreVo.getScore1() == 0)
    		{
    			scoreVo.setScorechk1(0);
    		}else {
    			scoreVo.setScorechk1(scoreVo.getScore1() - parInfo1.getHole1());
    		}
    		if (scoreVo.getScore2() == 0)
    		{
    			scoreVo.setScorechk2(0);
    		}else {
    			scoreVo.setScorechk2(scoreVo.getScore2() - parInfo1.getHole2());
    		}
    		if (scoreVo.getScore3() == 0)
    		{
    			scoreVo.setScorechk3(0);
    		}else {
    			scoreVo.setScorechk3(scoreVo.getScore3() - parInfo1.getHole3());
    		}
    		if (scoreVo.getScore4() == 0)
    		{
    			scoreVo.setScorechk4(0);
    		}else {
    			scoreVo.setScorechk4(scoreVo.getScore4() - parInfo1.getHole4());
    		}
    		if (scoreVo.getScore5() == 0)
    		{
    			scoreVo.setScorechk5(0);
    		}else {
    			scoreVo.setScorechk5(scoreVo.getScore5() - parInfo1.getHole5());
    		}
    		if (scoreVo.getScore6() == 0)
    		{
    			scoreVo.setScorechk6(0);
    		}else {
    			scoreVo.setScorechk6(scoreVo.getScore6() - parInfo1.getHole6());
    		}
    		if (scoreVo.getScore7() == 0)
    		{
    			scoreVo.setScorechk7(0);
    		}else {
    			scoreVo.setScorechk7(scoreVo.getScore7() - parInfo1.getHole7());
    		}
    		if (scoreVo.getScore8() == 0)
    		{
    			scoreVo.setScorechk8(0);
    		}else {
    			scoreVo.setScorechk8(scoreVo.getScore8() - parInfo1.getHole8());
    		}  
    		if (scoreVo.getScore9() == 0)
    		{
    			scoreVo.setScorechk9(0);
    		}else {
    			scoreVo.setScorechk9(scoreVo.getScore9() - parInfo1.getHole9());
    		}     		
    		/////////////////////////////////////////////////////////////////////
    		if (scoreVo.getScore10() == 0)
    		{
    			scoreVo.setScorechk10(0);
    		}else {
    			scoreVo.setScorechk10(scoreVo.getScore10() - parInfo2.getHole1());
    		}
    		if (scoreVo.getScore11() == 0)
    		{
    			scoreVo.setScorechk11(0);
    		}else {
    			scoreVo.setScorechk11(scoreVo.getScore11() - parInfo2.getHole2());
    		}
    		if (scoreVo.getScore12() == 0)
    		{
    			scoreVo.setScorechk12(0);
    		}else {
    			scoreVo.setScorechk12(scoreVo.getScore12() - parInfo2.getHole3());
    		}
    		if (scoreVo.getScore13() == 0)
    		{
    			scoreVo.setScorechk13(0);
    		}else {
    			scoreVo.setScorechk13(scoreVo.getScore13() - parInfo2.getHole4());
    		}
    		if (scoreVo.getScore14() == 0)
    		{
    			scoreVo.setScorechk14(0);
    		}else {
    			scoreVo.setScorechk14(scoreVo.getScore14() - parInfo2.getHole5());
    		}
    		if (scoreVo.getScore15() == 0)
    		{
    			scoreVo.setScorechk15(0);
    		}else {
    			scoreVo.setScorechk15(scoreVo.getScore15() - parInfo2.getHole6());
    		}
    		if (scoreVo.getScore16() == 0)
    		{
    			scoreVo.setScorechk16(0);
    		}else {
    			scoreVo.setScorechk16(scoreVo.getScore16() - parInfo2.getHole7());
    		}
    		if (scoreVo.getScore17() == 0)
    		{
    			scoreVo.setScorechk17(0);
    		}else {
    			scoreVo.setScorechk17(scoreVo.getScore17() - parInfo2.getHole8());
    		}  
    		if (scoreVo.getScore18() == 0)
    		{
    			scoreVo.setScorechk18(0);
    		}else {
    			scoreVo.setScorechk18(scoreVo.getScore18() - parInfo2.getHole9());
    		} 
    		
    		// sum
    		scoreVo.setScorechksum1(scoreVo.getScorechk1()+scoreVo.getScorechk2()+scoreVo.getScorechk3()+scoreVo.getScorechk4()+scoreVo.getScorechk5()
    						+scoreVo.getScorechk6() + scoreVo.getScorechk7() + scoreVo.getScorechk8() + scoreVo.getScorechk9());
    		scoreVo.setScorechksum2(scoreVo.getScorechk10()+scoreVo.getScorechk11()+scoreVo.getScorechk12()+scoreVo.getScorechk13()+scoreVo.getScorechk14()
			+scoreVo.getScorechk15() + scoreVo.getScorechk16() + scoreVo.getScorechk17() + scoreVo.getScorechk18());
    		
    	}else {
    		scoreVo.setError("스코어 정보 개수 에러 :" + scoreList.length);
    	}
    	
    	// 동반자 스코어 점수
    	ScoreVo scoreVo2 = new ScoreVo();
    	scoreVo2.setVisit_date(CommonUtil.getCurrentDate());	 				// 골프친 날짜(당일)
    	scoreVo2.setContryclub_id(qrVo.getCountryclub_id()); 				// 골프장 코드
    	scoreVo2.setStart_course(Integer.parseInt(qrVo.getStartcourse()));	// out 시작 코스
    	scoreVo2.setEnd_course(Integer.parseInt(qrVo.getEndcourse()));  		// in 종료 코스
    	
    	String score2 = qrVo.getScore1();		// 현재 형식 1:2:3:4 ~~ 형식으로 되어 있다.
    	if (score2 != null)
    	{
    		String[] scoreList2 = score2.split(":");
    		scoreVo2.setUser_id((new Long(userId)).intValue());
    		scoreVo2.setScore1(Integer.parseInt(scoreList2[0]));
    		scoreVo2.setScore2(Integer.parseInt(scoreList2[1]));
    		scoreVo2.setScore3(Integer.parseInt(scoreList2[2]));
    		scoreVo2.setScore4(Integer.parseInt(scoreList2[3]));
    		scoreVo2.setScore5(Integer.parseInt(scoreList2[4]));
    		scoreVo2.setScore6(Integer.parseInt(scoreList2[5]));
    		scoreVo2.setScore7(Integer.parseInt(scoreList2[6]));
    		scoreVo2.setScore8(Integer.parseInt(scoreList2[7]));
    		scoreVo2.setScore9(Integer.parseInt(scoreList2[8]));
    		scoreVo2.setScore10(Integer.parseInt(scoreList2[9]));
    		scoreVo2.setScore11(Integer.parseInt(scoreList2[10]));
    		scoreVo2.setScore12(Integer.parseInt(scoreList2[11]));
    		scoreVo2.setScore13(Integer.parseInt(scoreList2[12]));
    		scoreVo2.setScore14(Integer.parseInt(scoreList2[13]));
    		scoreVo2.setScore15(Integer.parseInt(scoreList2[14]));
    		scoreVo2.setScore16(Integer.parseInt(scoreList2[15]));
    		scoreVo2.setScore17(Integer.parseInt(scoreList2[16]));
    		scoreVo2.setScore18(Integer.parseInt(scoreList2[17]));
    		
    		// 스코어 합계
    		scoreVo2.setScore_sum(scoreVo2.getScore1()+scoreVo2.getScore2()+scoreVo2.getScore3()+scoreVo2.getScore4()
    						+scoreVo2.getScore5() + scoreVo2.getScore6() + scoreVo2.getScore7()+scoreVo2.getScore8()
    						+scoreVo2.getScore9() + scoreVo2.getScore10() + scoreVo2.getScore11() + scoreVo2.getScore12()
    						+scoreVo2.getScore13() + scoreVo2.getScore14() + scoreVo2.getScore15() + scoreVo2.getScore16()
    						+scoreVo2.getScore17() + scoreVo2.getScore18()
    				);
    		scoreVo2.setScore_plus_sum(scoreVo2.getScore_sum() - (parInfo1.getSum()+parInfo2.getSum()));
    		
    		// 스코어 계산
    		if (scoreVo2.getScore1() == 0)
    		{
    			scoreVo2.setScorechk1(0);
    		}else {
    			scoreVo2.setScorechk1(scoreVo2.getScore1() - parInfo1.getHole1());
    		}
    		if (scoreVo2.getScore2() == 0)
    		{
    			scoreVo2.setScorechk2(0);
    		}else {
    			scoreVo2.setScorechk2(scoreVo2.getScore2() - parInfo1.getHole2());
    		}
    		if (scoreVo2.getScore3() == 0)
    		{
    			scoreVo2.setScorechk3(0);
    		}else {
    			scoreVo2.setScorechk3(scoreVo2.getScore3() - parInfo1.getHole3());
    		}
    		if (scoreVo2.getScore4() == 0)
    		{
    			scoreVo2.setScorechk4(0);
    		}else {
    			scoreVo2.setScorechk4(scoreVo2.getScore4() - parInfo1.getHole4());
    		}
    		if (scoreVo2.getScore5() == 0)
    		{
    			scoreVo2.setScorechk5(0);
    		}else {
    			scoreVo2.setScorechk5(scoreVo2.getScore5() - parInfo1.getHole5());
    		}
    		if (scoreVo2.getScore6() == 0)
    		{
    			scoreVo2.setScorechk6(0);
    		}else {
    			scoreVo2.setScorechk6(scoreVo2.getScore6() - parInfo1.getHole6());
    		}
    		if (scoreVo2.getScore7() == 0)
    		{
    			scoreVo2.setScorechk7(0);
    		}else {
    			scoreVo2.setScorechk7(scoreVo2.getScore7() - parInfo1.getHole7());
    		}
    		if (scoreVo2.getScore8() == 0)
    		{
    			scoreVo2.setScorechk8(0);
    		}else {
    			scoreVo2.setScorechk8(scoreVo2.getScore8() - parInfo1.getHole8());
    		}  
    		if (scoreVo2.getScore9() == 0)
    		{
    			scoreVo2.setScorechk9(0);
    		}else {
    			scoreVo2.setScorechk9(scoreVo2.getScore9() - parInfo1.getHole9());
    		}     		
    		/////////////////////////////////////////////////////////////////////
    		if (scoreVo2.getScore10() == 0)
    		{
    			scoreVo2.setScorechk10(0);
    		}else {
    			scoreVo2.setScorechk10(scoreVo2.getScore10() - parInfo2.getHole1());
    		}
    		if (scoreVo2.getScore11() == 0)
    		{
    			scoreVo2.setScorechk11(0);
    		}else {
    			scoreVo2.setScorechk11(scoreVo2.getScore11() - parInfo2.getHole2());
    		}
    		if (scoreVo2.getScore12() == 0)
    		{
    			scoreVo2.setScorechk12(0);
    		}else {
    			scoreVo2.setScorechk12(scoreVo2.getScore12() - parInfo2.getHole3());
    		}
    		if (scoreVo2.getScore13() == 0)
    		{
    			scoreVo2.setScorechk13(0);
    		}else {
    			scoreVo2.setScorechk13(scoreVo2.getScore13() - parInfo2.getHole4());
    		}
    		if (scoreVo2.getScore14() == 0)
    		{
    			scoreVo2.setScorechk14(0);
    		}else {
    			scoreVo2.setScorechk14(scoreVo2.getScore14() - parInfo2.getHole5());
    		}
    		if (scoreVo2.getScore15() == 0)
    		{
    			scoreVo2.setScorechk15(0);
    		}else {
    			scoreVo2.setScorechk15(scoreVo2.getScore15() - parInfo2.getHole6());
    		}
    		if (scoreVo2.getScore16() == 0)
    		{
    			scoreVo2.setScorechk16(0);
    		}else {
    			scoreVo2.setScorechk16(scoreVo2.getScore16() - parInfo2.getHole7());
    		}
    		if (scoreVo2.getScore17() == 0)
    		{
    			scoreVo2.setScorechk17(0);
    		}else {
    			scoreVo2.setScorechk17(scoreVo2.getScore17() - parInfo2.getHole8());
    		}  
    		if (scoreVo2.getScore18() == 0)
    		{
    			scoreVo2.setScorechk18(0);
    		}else {
    			scoreVo2.setScorechk18(scoreVo2.getScore18() - parInfo2.getHole9());
    		} 
    		
    		// sum
    		scoreVo2.setScorechksum1(scoreVo2.getScorechk1()+scoreVo2.getScorechk2()+scoreVo2.getScorechk3()+scoreVo2.getScorechk4()+scoreVo2.getScorechk5()
    						+scoreVo2.getScorechk6() + scoreVo2.getScorechk7() + scoreVo2.getScorechk8() + scoreVo2.getScorechk9());
    		scoreVo2.setScorechksum2(scoreVo2.getScorechk10()+scoreVo2.getScorechk11()+scoreVo2.getScorechk12()+scoreVo2.getScorechk13()+scoreVo2.getScorechk14()
			+scoreVo2.getScorechk15() + scoreVo2.getScorechk16() + scoreVo2.getScorechk17() + scoreVo2.getScorechk18());
    		
    	}else {
    		scoreVo2.setError("NO");
    	}
    	
    	ScoreVo scoreVo3 = new ScoreVo();
    	scoreVo3.setVisit_date(CommonUtil.getCurrentDate());	 				// 골프친 날짜(당일)
    	scoreVo3.setContryclub_id(qrVo.getCountryclub_id()); 				// 골프장 코드
    	scoreVo3.setStart_course(Integer.parseInt(qrVo.getStartcourse()));	// out 시작 코스
    	scoreVo3.setEnd_course(Integer.parseInt(qrVo.getEndcourse()));  		// in 종료 코스
    	
    	String score3 = qrVo.getScore2();		// 현재 형식 1:2:3:4 ~~ 형식으로 되어 있다.
    	
    	if (score3 != null)
    	{
    		String[] scoreList3 = score3.split(":");
    		scoreVo3.setUser_id((new Long(userId)).intValue());
    		scoreVo3.setScore1(Integer.parseInt(scoreList3[0]));
    		scoreVo3.setScore2(Integer.parseInt(scoreList3[1]));
    		scoreVo3.setScore3(Integer.parseInt(scoreList3[2]));
    		scoreVo3.setScore4(Integer.parseInt(scoreList3[3]));
    		scoreVo3.setScore5(Integer.parseInt(scoreList3[4]));
    		scoreVo3.setScore6(Integer.parseInt(scoreList3[5]));
    		scoreVo3.setScore7(Integer.parseInt(scoreList3[6]));
    		scoreVo3.setScore8(Integer.parseInt(scoreList3[7]));
    		scoreVo3.setScore9(Integer.parseInt(scoreList3[8]));
    		scoreVo3.setScore10(Integer.parseInt(scoreList3[9]));
    		scoreVo3.setScore11(Integer.parseInt(scoreList3[10]));
    		scoreVo3.setScore12(Integer.parseInt(scoreList3[11]));
    		scoreVo3.setScore13(Integer.parseInt(scoreList3[12]));
    		scoreVo3.setScore14(Integer.parseInt(scoreList3[13]));
    		scoreVo3.setScore15(Integer.parseInt(scoreList3[14]));
    		scoreVo3.setScore16(Integer.parseInt(scoreList3[15]));
    		scoreVo3.setScore17(Integer.parseInt(scoreList3[16]));
    		scoreVo3.setScore18(Integer.parseInt(scoreList3[17]));
    		
    		// 스코어 합계
    		scoreVo3.setScore_sum(scoreVo3.getScore1()+scoreVo3.getScore2()+scoreVo3.getScore3()+scoreVo3.getScore4()
    						+scoreVo3.getScore5() + scoreVo3.getScore6() + scoreVo3.getScore7()+scoreVo3.getScore8()
    						+scoreVo3.getScore9() + scoreVo3.getScore10() + scoreVo3.getScore11() + scoreVo3.getScore12()
    						+scoreVo3.getScore13() + scoreVo3.getScore14() + scoreVo3.getScore15() + scoreVo3.getScore16()
    						+scoreVo3.getScore17() + scoreVo3.getScore18()
    				);
    		scoreVo3.setScore_plus_sum(scoreVo3.getScore_sum() - (parInfo1.getSum()+parInfo2.getSum()));
    		
    		// 스코어 계산
    		if (scoreVo3.getScore1() == 0)
    		{
    			scoreVo3.setScorechk1(0);
    		}else {
    			scoreVo3.setScorechk1(scoreVo3.getScore1() - parInfo1.getHole1());
    		}
    		if (scoreVo3.getScore2() == 0)
    		{
    			scoreVo3.setScorechk2(0);
    		}else {
    			scoreVo3.setScorechk2(scoreVo3.getScore2() - parInfo1.getHole2());
    		}
    		if (scoreVo3.getScore3() == 0)
    		{
    			scoreVo3.setScorechk3(0);
    		}else {
    			scoreVo3.setScorechk3(scoreVo3.getScore3() - parInfo1.getHole3());
    		}
    		if (scoreVo3.getScore4() == 0)
    		{
    			scoreVo3.setScorechk4(0);
    		}else {
    			scoreVo3.setScorechk4(scoreVo3.getScore4() - parInfo1.getHole4());
    		}
    		if (scoreVo3.getScore5() == 0)
    		{
    			scoreVo3.setScorechk5(0);
    		}else {
    			scoreVo3.setScorechk5(scoreVo3.getScore5() - parInfo1.getHole5());
    		}
    		if (scoreVo3.getScore6() == 0)
    		{
    			scoreVo3.setScorechk6(0);
    		}else {
    			scoreVo3.setScorechk6(scoreVo3.getScore6() - parInfo1.getHole6());
    		}
    		if (scoreVo3.getScore7() == 0)
    		{
    			scoreVo3.setScorechk7(0);
    		}else {
    			scoreVo3.setScorechk7(scoreVo3.getScore7() - parInfo1.getHole7());
    		}
    		if (scoreVo3.getScore8() == 0)
    		{
    			scoreVo3.setScorechk8(0);
    		}else {
    			scoreVo3.setScorechk8(scoreVo3.getScore8() - parInfo1.getHole8());
    		}  
    		if (scoreVo3.getScore9() == 0)
    		{
    			scoreVo3.setScorechk9(0);
    		}else {
    			scoreVo3.setScorechk9(scoreVo3.getScore9() - parInfo1.getHole9());
    		}     		
    		/////////////////////////////////////////////////////////////////////
    		if (scoreVo3.getScore10() == 0)
    		{
    			scoreVo3.setScorechk10(0);
    		}else {
    			scoreVo3.setScorechk10(scoreVo3.getScore10() - parInfo2.getHole1());
    		}
    		if (scoreVo3.getScore11() == 0)
    		{
    			scoreVo3.setScorechk11(0);
    		}else {
    			scoreVo3.setScorechk11(scoreVo3.getScore11() - parInfo2.getHole2());
    		}
    		if (scoreVo3.getScore12() == 0)
    		{
    			scoreVo3.setScorechk12(0);
    		}else {
    			scoreVo3.setScorechk12(scoreVo3.getScore12() - parInfo2.getHole3());
    		}
    		if (scoreVo3.getScore13() == 0)
    		{
    			scoreVo3.setScorechk13(0);
    		}else {
    			scoreVo3.setScorechk13(scoreVo3.getScore13() - parInfo2.getHole4());
    		}
    		if (scoreVo3.getScore14() == 0)
    		{
    			scoreVo3.setScorechk14(0);
    		}else {
    			scoreVo3.setScorechk14(scoreVo3.getScore14() - parInfo2.getHole5());
    		}
    		if (scoreVo3.getScore15() == 0)
    		{
    			scoreVo3.setScorechk15(0);
    		}else {
    			scoreVo3.setScorechk15(scoreVo3.getScore15() - parInfo2.getHole6());
    		}
    		if (scoreVo3.getScore16() == 0)
    		{
    			scoreVo3.setScorechk16(0);
    		}else {
    			scoreVo3.setScorechk16(scoreVo3.getScore16() - parInfo2.getHole7());
    		}
    		if (scoreVo3.getScore17() == 0)
    		{
    			scoreVo3.setScorechk17(0);
    		}else {
    			scoreVo3.setScorechk17(scoreVo3.getScore17() - parInfo2.getHole8());
    		}  
    		if (scoreVo3.getScore18() == 0)
    		{
    			scoreVo3.setScorechk18(0);
    		}else {
    			scoreVo3.setScorechk18(scoreVo3.getScore18() - parInfo2.getHole9());
    		} 
    		
    		// sum
    		scoreVo3.setScorechksum1(scoreVo3.getScorechk1()+scoreVo3.getScorechk2()+scoreVo3.getScorechk3()+scoreVo3.getScorechk4()+scoreVo3.getScorechk5()
    						+scoreVo3.getScorechk6() + scoreVo3.getScorechk7() + scoreVo3.getScorechk8() + scoreVo3.getScorechk9());
    		scoreVo3.setScorechksum2(scoreVo3.getScorechk10()+scoreVo3.getScorechk11()+scoreVo3.getScorechk12()+scoreVo3.getScorechk13()+scoreVo3.getScorechk14()
			+scoreVo3.getScorechk15() + scoreVo3.getScorechk16() + scoreVo3.getScorechk17() + scoreVo3.getScorechk18());
    		    		
    	}else {
    		scoreVo3.setError("NO");
    	}    	
    	
    	ScoreVo scoreVo4 = new ScoreVo();
    	scoreVo4.setVisit_date(CommonUtil.getCurrentDate());	 				// 골프친 날짜(당일)
    	scoreVo4.setContryclub_id(qrVo.getCountryclub_id()); 				// 골프장 코드
    	scoreVo4.setStart_course(Integer.parseInt(qrVo.getStartcourse()));	// out 시작 코스
    	scoreVo4.setEnd_course(Integer.parseInt(qrVo.getEndcourse()));  		// in 종료 코스
    	
    	String score4 = qrVo.getScore3();		// 현재 형식 1:2:3:4 ~~ 형식으로 되어 있다.
    	
    	if (score4 != null)
    	{
    		String[] scoreList4 = score4.split(":");
    		scoreVo4.setUser_id((new Long(userId)).intValue());
    		scoreVo4.setScore1(Integer.parseInt(scoreList4[0]));
    		scoreVo4.setScore2(Integer.parseInt(scoreList4[1]));
    		scoreVo4.setScore3(Integer.parseInt(scoreList4[2]));
    		scoreVo4.setScore4(Integer.parseInt(scoreList4[3]));
    		scoreVo4.setScore5(Integer.parseInt(scoreList4[4]));
    		scoreVo4.setScore6(Integer.parseInt(scoreList4[5]));
    		scoreVo4.setScore7(Integer.parseInt(scoreList4[6]));
    		scoreVo4.setScore8(Integer.parseInt(scoreList4[7]));
    		scoreVo4.setScore9(Integer.parseInt(scoreList4[8]));
    		scoreVo4.setScore10(Integer.parseInt(scoreList4[9]));
    		scoreVo4.setScore11(Integer.parseInt(scoreList4[10]));
    		scoreVo4.setScore12(Integer.parseInt(scoreList4[11]));
    		scoreVo4.setScore13(Integer.parseInt(scoreList4[12]));
    		scoreVo4.setScore14(Integer.parseInt(scoreList4[13]));
    		scoreVo4.setScore15(Integer.parseInt(scoreList4[14]));
    		scoreVo4.setScore16(Integer.parseInt(scoreList4[15]));
    		scoreVo4.setScore17(Integer.parseInt(scoreList4[16]));
    		scoreVo4.setScore18(Integer.parseInt(scoreList4[17]));
    		
    		// 스코어 합계
    		scoreVo4.setScore_sum(scoreVo4.getScore1()+scoreVo4.getScore2()+scoreVo4.getScore3()+scoreVo4.getScore4()
    						+scoreVo4.getScore5() + scoreVo4.getScore6() + scoreVo4.getScore7()+scoreVo4.getScore8()
    						+scoreVo4.getScore9() + scoreVo4.getScore10() + scoreVo4.getScore11() + scoreVo4.getScore12()
    						+scoreVo4.getScore13() + scoreVo4.getScore14() + scoreVo4.getScore15() + scoreVo4.getScore16()
    						+scoreVo4.getScore17() + scoreVo4.getScore18()
    				);
    		scoreVo4.setScore_plus_sum(scoreVo4.getScore_sum() - (parInfo1.getSum()+parInfo2.getSum()));
    		
    		// 스코어 계산
    		if (scoreVo4.getScore1() == 0)
    		{
    			scoreVo4.setScorechk1(0);
    		}else {
    			scoreVo4.setScorechk1(scoreVo4.getScore1() - parInfo1.getHole1());
    		}
    		if (scoreVo4.getScore2() == 0)
    		{
    			scoreVo4.setScorechk2(0);
    		}else {
    			scoreVo4.setScorechk2(scoreVo4.getScore2() - parInfo1.getHole2());
    		}
    		if (scoreVo4.getScore3() == 0)
    		{
    			scoreVo4.setScorechk3(0);
    		}else {
    			scoreVo4.setScorechk3(scoreVo4.getScore3() - parInfo1.getHole3());
    		}
    		if (scoreVo4.getScore4() == 0)
    		{
    			scoreVo4.setScorechk4(0);
    		}else {
    			scoreVo4.setScorechk4(scoreVo4.getScore4() - parInfo1.getHole4());
    		}
    		if (scoreVo4.getScore5() == 0)
    		{
    			scoreVo4.setScorechk5(0);
    		}else {
    			scoreVo4.setScorechk5(scoreVo4.getScore5() - parInfo1.getHole5());
    		}
    		if (scoreVo4.getScore6() == 0)
    		{
    			scoreVo4.setScorechk6(0);
    		}else {
    			scoreVo4.setScorechk6(scoreVo4.getScore6() - parInfo1.getHole6());
    		}
    		if (scoreVo4.getScore7() == 0)
    		{
    			scoreVo4.setScorechk7(0);
    		}else {
    			scoreVo4.setScorechk7(scoreVo4.getScore7() - parInfo1.getHole7());
    		}
    		if (scoreVo4.getScore8() == 0)
    		{
    			scoreVo4.setScorechk8(0);
    		}else {
    			scoreVo4.setScorechk8(scoreVo4.getScore8() - parInfo1.getHole8());
    		}  
    		if (scoreVo4.getScore9() == 0)
    		{
    			scoreVo4.setScorechk9(0);
    		}else {
    			scoreVo4.setScorechk9(scoreVo4.getScore9() - parInfo1.getHole9());
    		}     		
    		/////////////////////////////////////////////////////////////////////
    		if (scoreVo4.getScore10() == 0)
    		{
    			scoreVo4.setScorechk10(0);
    		}else {
    			scoreVo4.setScorechk10(scoreVo4.getScore10() - parInfo2.getHole1());
    		}
    		if (scoreVo4.getScore11() == 0)
    		{
    			scoreVo4.setScorechk11(0);
    		}else {
    			scoreVo4.setScorechk11(scoreVo4.getScore11() - parInfo2.getHole2());
    		}
    		if (scoreVo4.getScore12() == 0)
    		{
    			scoreVo4.setScorechk12(0);
    		}else {
    			scoreVo4.setScorechk12(scoreVo4.getScore12() - parInfo2.getHole3());
    		}
    		if (scoreVo4.getScore13() == 0)
    		{
    			scoreVo4.setScorechk13(0);
    		}else {
    			scoreVo4.setScorechk13(scoreVo4.getScore13() - parInfo2.getHole4());
    		}
    		if (scoreVo4.getScore14() == 0)
    		{
    			scoreVo4.setScorechk14(0);
    		}else {
    			scoreVo4.setScorechk14(scoreVo4.getScore14() - parInfo2.getHole5());
    		}
    		if (scoreVo4.getScore15() == 0)
    		{
    			scoreVo4.setScorechk15(0);
    		}else {
    			scoreVo4.setScorechk15(scoreVo4.getScore15() - parInfo2.getHole6());
    		}
    		if (scoreVo4.getScore16() == 0)
    		{
    			scoreVo4.setScorechk16(0);
    		}else {
    			scoreVo4.setScorechk16(scoreVo4.getScore16() - parInfo2.getHole7());
    		}
    		if (scoreVo4.getScore17() == 0)
    		{
    			scoreVo4.setScorechk17(0);
    		}else {
    			scoreVo4.setScorechk17(scoreVo4.getScore17() - parInfo2.getHole8());
    		}  
    		if (scoreVo4.getScore18() == 0)
    		{
    			scoreVo4.setScorechk18(0);
    		}else {
    			scoreVo4.setScorechk18(scoreVo4.getScore18() - parInfo2.getHole9());
    		} 
    		
    		// sum
    		scoreVo4.setScorechksum1(scoreVo4.getScorechk1()+scoreVo4.getScorechk2()+scoreVo4.getScorechk3()+scoreVo4.getScorechk4()+scoreVo4.getScorechk5()
    						+scoreVo4.getScorechk6() + scoreVo4.getScorechk7() + scoreVo4.getScorechk8() + scoreVo4.getScorechk9());
    		scoreVo4.setScorechksum2(scoreVo4.getScorechk10()+scoreVo4.getScorechk11()+scoreVo4.getScorechk12()+scoreVo4.getScorechk13()+scoreVo4.getScorechk14()
			+scoreVo4.getScorechk15() + scoreVo4.getScorechk16() + scoreVo4.getScorechk17() + scoreVo4.getScorechk18());
    	    		
    	}else {
    		scoreVo4.setError("NO");
    	}    
    	
    	mv.addObject("scoreVo", scoreVo);			// Score 정보
    	mv.addObject("scoreVo2", scoreVo2);			// Score 정보
    	mv.addObject("scoreVo3", scoreVo3);			// Score 정보
    	mv.addObject("scoreVo4", scoreVo4);			// Score 정보
    	
    	mv.addObject("qrInfo", qrVo);
    	mv.addObject("parInfo1", parInfo1);
    	mv.addObject("parInfo2", parInfo2);
    	
    	// 골프장 정보 (이미지 포함)
   	 	ObjectMapper mapper = new ObjectMapper();
   	 	String resultJson = restService.getGolfImgIncludeDetail(country_id, qrVo.getZone_id(), qrVo.getCountryclub_id());  // 이미지 포함 골프장 정보 조회
   	 	Map<String, Object> goflMap = mapper.readValue(resultJson, new TypeReference<Map<String, Object>>(){});
   	 	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false); 
   	 	List<GolfVo> mapList = mapper.convertValue(goflMap.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class,GolfVo.class));    	
   	 	mv.addObject("golfInfo", mapList.get(0));
       
    	/////////////////////////////////////////////////////////////////////////////////////
    	// qr 접속 정보를 로그에 등록한다. 
    	Map<String, String> scoreParams = new HashMap<String, String>();
    	// 파라미터 등록 
    	scoreParams.put("visit_date",       scoreVo.getVisit_date().replaceAll("-", ""));
    	scoreParams.put("countryclub_id",   scoreVo.getContryclub_id());
    	scoreParams.put("user_id",          String.valueOf(userId));
    	scoreParams.put("user_name",        qrVo.getUsername());
    	////////////////////////////////////////////////////////////////
    	String rtnJson = adminService.scoreLog(scoreParams);
    	LOGGER.debug(rtnJson);
    	/////////////////////////////////////////////////////////////////////////////////////
    	LOGGER.debug("==================== ScoreController qrAdd end : ===================");
    	// mv.setViewName("web/score/screen_02");
    	mv.setViewName("web/score/screen_03");
    	return mv;
    }

    
    /**
     * 스코어 점수를 이미지로 만든다.
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
    @PostMapping(value="/imageMake")
    public ModelAndView imageMake(QRInfoVo qrVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== ScoreController imageMake Start : ===================");
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
    		

    		// score : 친개수 - PAR    		
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
    	LOGGER.debug("==================== ScoreController imageMake end : ===================");
    	mv.setViewName("web/score/screen_02");
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
    	
    	mv.setViewName("web/user/login");
    	
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
    		
    		// stroke : 친 개수
    		scoreVo.setStroke1(Integer.parseInt(scoreList[0]));
    		scoreVo.setStroke2(Integer.parseInt(scoreList[1]));
    		scoreVo.setStroke3(Integer.parseInt(scoreList[2]));
    		scoreVo.setStroke4(Integer.parseInt(scoreList[3]));
    		scoreVo.setStroke5(Integer.parseInt(scoreList[4]));
    		scoreVo.setStroke6(Integer.parseInt(scoreList[5]));
    		scoreVo.setStroke7(Integer.parseInt(scoreList[6]));
    		scoreVo.setStroke8(Integer.parseInt(scoreList[7]));
    		scoreVo.setStroke9(Integer.parseInt(scoreList[8]));
    		scoreVo.setStrokesum1(scoreVo.getStroke1()+scoreVo.getStroke2() + scoreVo.getStroke3() + scoreVo.getStroke4()+scoreVo.getStroke5()+scoreVo.getStroke6()
    							+ scoreVo.getStroke7() + scoreVo.getStroke8() + scoreVo.getStroke9());
    		scoreVo.setStroke10(Integer.parseInt(scoreList[9]));
    		scoreVo.setStroke11(Integer.parseInt(scoreList[10]));
    		scoreVo.setStroke12(Integer.parseInt(scoreList[11]));
    		scoreVo.setStroke13(Integer.parseInt(scoreList[12]));
    		scoreVo.setStroke14(Integer.parseInt(scoreList[13]));
    		scoreVo.setStroke15(Integer.parseInt(scoreList[14]));
    		scoreVo.setStroke16(Integer.parseInt(scoreList[15]));
    		scoreVo.setStroke17(Integer.parseInt(scoreList[16]));
    		scoreVo.setStroke18(Integer.parseInt(scoreList[17]));
    		scoreVo.setStrokesum2(scoreVo.getStroke10()+scoreVo.getStroke11() + scoreVo.getStroke12() + scoreVo.getStroke13()+scoreVo.getStroke14()+scoreVo.getStroke15()
			+ scoreVo.getStroke16() + scoreVo.getStroke17() + scoreVo.getStroke18());
    		
    		
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
    	
    	String rtnJson = restService.getAreaList();   // 관리자가 지역 리스트 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        List<AreaVo> areaList = mapper.convertValue(map.get("areaList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AreaVo.class));
        
        // 국가 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        // 골프장 리스트 조회 (그 지역에 포함된)
        List<GolfVo> golfList = getGolfList(country_id, qrVo.getZone_id());
        // 골프장에 포함된 코스 정보 조회
        List<FarVo> parList = getParList(qrVo.getCountryclub_id());
                   	
        QRInfoVo qrVo2 = new QRInfoVo();
        
        qrVo2.setCountry_id(country_id);
        qrVo2.setZone_id(qrVo.getZone_id());
        qrVo2.setCountryclub_id(qrVo.getCountryclub_id());
        qrVo2.setStartcourse(qrVo.getStartcourse());
        qrVo2.setEndcourse(qrVo.getEndcourse());
        qrVo2.setUsername(qrVo.getUsername());
        qrVo2.setScore(qrVo.getScore());
        qrVo2.setOthername1(qrVo.getOthername1());
        qrVo2.setScore1(qrVo.getScore1());
        qrVo2.setOthername2(qrVo.getOthername2());
        qrVo2.setScore2(qrVo.getScore2());
        qrVo2.setOthername3(qrVo.getOthername3());
        qrVo2.setScore3(qrVo.getScore3());
        
    	mv.addObject("areaList", areaList); 
    	mv.addObject("scoreVo", scoreVo);			// Score 정보
    	mv.addObject("qrInfo", qrVo2);
    	mv.addObject("parInfo1", parInfo1);
    	mv.addObject("parInfo2", parInfo2);
    	mv.addObject("golfList", golfList);			// 지역에 속한 골프장 리스트
    	mv.addObject("parList", parList);			// 골프장에 속한 Par List 정보 
    	LOGGER.debug("==================== scoreRegister qrAdd end : ===================");
    	mv.setViewName("web/score/score_01_1");
    	return mv;
    }
    /**
     * QR이 아닌 일반 회원으로 접속해서 등록 화면으로 간 경우
     * 
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
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
     * 스코어 정보를 저장한다.
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
    @PostMapping(value="/scoreSave")
    public ModelAndView socreSave(@ModelAttribute(value="scoreVo")ScoreMaster scoreVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	//@ModelAttribute(value="qrVo")QRInfoVo qrVo,
    	LOGGER.debug("==================== ScoreController scoreSave Start : ===================");
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
    	// 개인별 스코어 정보 등록
    	Map<String, String> scoreParams = new HashMap<String, String>();
    	// 파라미터 등록 
    	scoreParams.put("visit_date",       scoreVo.getVisit_date().replaceAll("-", ""));
    	scoreParams.put("countryclub_id",    scoreVo.getCountryclub_id());
    	// seq_no => DB에서 신규 생성
    	scoreParams.put("user_id",          String.valueOf(userId));
    	scoreParams.put("start_course",     String.valueOf(scoreVo.getStart_course()));
    	scoreParams.put("end_course",       String.valueOf(scoreVo.getEnd_course()));
    	scoreParams.put("score1",           String.valueOf(scoreVo.getScore1()));
    	scoreParams.put("score2",           String.valueOf(scoreVo.getScore2()));
    	scoreParams.put("score3",           String.valueOf(scoreVo.getScore3()));
    	scoreParams.put("score4",           String.valueOf(scoreVo.getScore4()));
    	scoreParams.put("score5",           String.valueOf(scoreVo.getScore5()));
    	scoreParams.put("score6",           String.valueOf(scoreVo.getScore6()));
    	scoreParams.put("score7",           String.valueOf(scoreVo.getScore7()));
    	scoreParams.put("score8",           String.valueOf(scoreVo.getScore8()));
    	scoreParams.put("score9",           String.valueOf(scoreVo.getScore9()));
    	scoreParams.put("score10",          String.valueOf(scoreVo.getScore10()));
    	scoreParams.put("score11",          String.valueOf(scoreVo.getScore11()));
    	scoreParams.put("score12",          String.valueOf(scoreVo.getScore12()));
    	scoreParams.put("score13",          String.valueOf(scoreVo.getScore13()));
    	scoreParams.put("score14",          String.valueOf(scoreVo.getScore14()));
    	scoreParams.put("score15",          String.valueOf(scoreVo.getScore15()));
    	scoreParams.put("score16",          String.valueOf(scoreVo.getScore16()));
    	scoreParams.put("score17",          String.valueOf(scoreVo.getScore17()));
    	scoreParams.put("score18",          String.valueOf(scoreVo.getScore18()));
    	
    	scoreParams.put("stroke1",          String.valueOf(scoreVo.getStroke1()));
    	scoreParams.put("stroke2",          String.valueOf(scoreVo.getStroke2()));
    	scoreParams.put("stroke3",          String.valueOf(scoreVo.getStroke3()));
    	scoreParams.put("stroke4",          String.valueOf(scoreVo.getStroke4()));
    	scoreParams.put("stroke5",          String.valueOf(scoreVo.getStroke5()));
    	scoreParams.put("stroke6",          String.valueOf(scoreVo.getStroke6()));
    	scoreParams.put("stroke7",          String.valueOf(scoreVo.getStroke7()));
    	scoreParams.put("stroke8",          String.valueOf(scoreVo.getStroke8()));
    	scoreParams.put("stroke9",          String.valueOf(scoreVo.getStroke9()));
    	scoreParams.put("stroke10",         String.valueOf(scoreVo.getStroke10()));
    	scoreParams.put("stroke11",         String.valueOf(scoreVo.getStroke11()));
    	scoreParams.put("stroke12",         String.valueOf(scoreVo.getStroke12()));
    	scoreParams.put("stroke13",         String.valueOf(scoreVo.getStroke13()));
    	scoreParams.put("stroke14",         String.valueOf(scoreVo.getStroke14()));
    	scoreParams.put("stroke15",         String.valueOf(scoreVo.getStroke15()));
    	scoreParams.put("stroke16",         String.valueOf(scoreVo.getStroke16()));
    	scoreParams.put("stroke17",         String.valueOf(scoreVo.getStroke17()));
    	scoreParams.put("stroke18",         String.valueOf(scoreVo.getStroke18()));
    	
    	scoreParams.put("putter1",          String.valueOf(scoreVo.getPutter1()));
    	scoreParams.put("putter2",          String.valueOf(scoreVo.getPutter2()));
    	scoreParams.put("putter3",          String.valueOf(scoreVo.getPutter3()));
    	scoreParams.put("putter4",          String.valueOf(scoreVo.getPutter4()));
    	scoreParams.put("putter5",          String.valueOf(scoreVo.getPutter5()));
    	scoreParams.put("putter6",          String.valueOf(scoreVo.getPutter6()));
    	scoreParams.put("putter7",          String.valueOf(scoreVo.getPutter7()));
    	scoreParams.put("putter8",          String.valueOf(scoreVo.getPutter8()));
    	scoreParams.put("putter9",          String.valueOf(scoreVo.getPutter9()));
    	scoreParams.put("putter10",         String.valueOf(scoreVo.getPutter10()));
    	scoreParams.put("putter11",         String.valueOf(scoreVo.getPutter11()));
    	scoreParams.put("putter12",         String.valueOf(scoreVo.getPutter12()));
    	scoreParams.put("putter13",         String.valueOf(scoreVo.getPutter13()));
    	scoreParams.put("putter14",         String.valueOf(scoreVo.getPutter14()));
    	scoreParams.put("putter15",         String.valueOf(scoreVo.getPutter15()));
    	scoreParams.put("putter16",         String.valueOf(scoreVo.getPutter16()));
    	scoreParams.put("putter17",         String.valueOf(scoreVo.getPutter17()));
    	scoreParams.put("putter18",         String.valueOf(scoreVo.getPutter18()));
    	////////////////////////////////////////////////////////////////
    	String rtnJson = restService.scoreCreate(scoreParams);
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	scoreVo.setResult(true);
        }else {
        	scoreVo.setResult(false);
        	scoreVo.setError(map.get("error").toString());
        }
    	
    	// 개인별 스코어 세부정보 등록 
    	Map<String, String> scoreDetailParams = new HashMap<String, String>();
        // 파라미터 등록 
    	scoreDetailParams.put("visit_date",       scoreVo.getVisit_date().replaceAll("-", ""));
    	scoreDetailParams.put("countryclub_id",    scoreVo.getCountryclub_id());
    	// seq_no => DB에서 신규 생성
    	scoreDetailParams.put("seq_no",           map.get("seq_no").toString());
    	scoreDetailParams.put("user_id",          String.valueOf(userId));
    	
    	scoreDetailParams.put("puterpattern1",    scoreVo.getPuterpattern1());
    	scoreDetailParams.put("puterpattern2",    scoreVo.getPuterpattern2());
    	scoreDetailParams.put("puterpattern3",    scoreVo.getPuterpattern3());
    	scoreDetailParams.put("puterpattern4",    scoreVo.getPuterpattern4());
    	scoreDetailParams.put("puterpattern5",    scoreVo.getPuterpattern5());
    	scoreDetailParams.put("puterpattern6",    scoreVo.getPuterpattern6());
    	scoreDetailParams.put("puterpattern7",    scoreVo.getPuterpattern7());
    	scoreDetailParams.put("puterpattern8",    scoreVo.getPuterpattern8());
    	scoreDetailParams.put("puterpattern9",    scoreVo.getPuterpattern9());
    	scoreDetailParams.put("puterpattern10",   scoreVo.getPuterpattern10());
    	scoreDetailParams.put("puterpattern11",   scoreVo.getPuterpattern11());
    	scoreDetailParams.put("puterpattern12",   scoreVo.getPuterpattern12());
    	scoreDetailParams.put("puterpattern13",   scoreVo.getPuterpattern13());
    	scoreDetailParams.put("puterpattern14",   scoreVo.getPuterpattern14());
    	scoreDetailParams.put("puterpattern15",   scoreVo.getPuterpattern15());
    	scoreDetailParams.put("puterpattern16",   scoreVo.getPuterpattern16());
    	scoreDetailParams.put("puterpattern17",   scoreVo.getPuterpattern17());
    	scoreDetailParams.put("puterpattern18",   scoreVo.getPuterpattern18());
    	
    	scoreDetailParams.put("parbreak1",        scoreVo.getParbreak1());
    	scoreDetailParams.put("parbreak2",        scoreVo.getParbreak2());
    	scoreDetailParams.put("parbreak3",        scoreVo.getParbreak3());
    	scoreDetailParams.put("parbreak4",        scoreVo.getParbreak4());
    	scoreDetailParams.put("parbreak5",        scoreVo.getParbreak5());
    	scoreDetailParams.put("parbreak6",        scoreVo.getParbreak6());
    	scoreDetailParams.put("parbreak7",        scoreVo.getParbreak7());
    	scoreDetailParams.put("parbreak8",        scoreVo.getParbreak8());
    	scoreDetailParams.put("parbreak9",        scoreVo.getParbreak9());
    	scoreDetailParams.put("parbreak10",       scoreVo.getParbreak10());
    	scoreDetailParams.put("parbreak11",       scoreVo.getParbreak11());
    	scoreDetailParams.put("parbreak12",       scoreVo.getParbreak12());
    	scoreDetailParams.put("parbreak13",       scoreVo.getParbreak13());
    	scoreDetailParams.put("parbreak14",       scoreVo.getParbreak14());
    	scoreDetailParams.put("parbreak15",       scoreVo.getParbreak15());
    	scoreDetailParams.put("parbreak16",       scoreVo.getParbreak16());
    	scoreDetailParams.put("parbreak17",       scoreVo.getParbreak17());
    	scoreDetailParams.put("parbreak18",       scoreVo.getParbreak18());
    	
    	// sendsave
    	if (scoreVo.getSendsavechk1() == null || "".equals(scoreVo.getSendsavechk1()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave1",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave1() == null || "".equals(scoreVo.getSendsave1()))
    			scoreDetailParams.put("sendsave1",    "N");
    		else 
    			scoreDetailParams.put("sendsave1",    scoreVo.getSendsave1());
    	}
    	if (scoreVo.getSendsavechk2() == null || "".equals(scoreVo.getSendsavechk2()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave2",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave2() == null || "".equals(scoreVo.getSendsave2()))
    			scoreDetailParams.put("sendsave2",    "N");
    		else 
    			scoreDetailParams.put("sendsave2",    scoreVo.getSendsave1());
    	}
    	if (scoreVo.getSendsavechk3() == null || "".equals(scoreVo.getSendsavechk3()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave3",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave3() == null || "".equals(scoreVo.getSendsave3()))
    			scoreDetailParams.put("sendsave3",    "N");
    		else 
    			scoreDetailParams.put("sendsave3",    scoreVo.getSendsave3());
    	}
    	if (scoreVo.getSendsavechk4() == null || "".equals(scoreVo.getSendsavechk4()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave4",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave4() == null || "".equals(scoreVo.getSendsave4()))
    			scoreDetailParams.put("sendsave4",    "N");
    		else 
    			scoreDetailParams.put("sendsave4",    scoreVo.getSendsave4());
    	}
    	if (scoreVo.getSendsavechk5() == null || "".equals(scoreVo.getSendsavechk5()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave5",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave5() == null || "".equals(scoreVo.getSendsave5()))
    			scoreDetailParams.put("sendsave5",    "N");
    		else 
    			scoreDetailParams.put("sendsave5",    scoreVo.getSendsave5());
    	}
    	if (scoreVo.getSendsavechk6() == null || "".equals(scoreVo.getSendsavechk6()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave6",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave6() == null || "".equals(scoreVo.getSendsave6()))
    			scoreDetailParams.put("sendsave6",    "N");
    		else 
    			scoreDetailParams.put("sendsave6",    scoreVo.getSendsave6());
    	}
    	if (scoreVo.getSendsavechk7() == null || "".equals(scoreVo.getSendsavechk7()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave7",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave7() == null || "".equals(scoreVo.getSendsave7()))
    			scoreDetailParams.put("sendsave7",    "N");
    		else 
    			scoreDetailParams.put("sendsave7",    scoreVo.getSendsave7());
    	}
    	if (scoreVo.getSendsavechk8() == null || "".equals(scoreVo.getSendsavechk8()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave8",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave8() == null || "".equals(scoreVo.getSendsave8()))
    			scoreDetailParams.put("sendsave8",    "N");
    		else 
    			scoreDetailParams.put("sendsave8",    scoreVo.getSendsave8());
    	}
    	if (scoreVo.getSendsavechk9() == null || "".equals(scoreVo.getSendsavechk9()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave9",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave9() == null || "".equals(scoreVo.getSendsave9()))
    			scoreDetailParams.put("sendsave9",    "N");
    		else 
    			scoreDetailParams.put("sendsave9",    scoreVo.getSendsave9());
    	}
    	if (scoreVo.getSendsavechk10() == null || "".equals(scoreVo.getSendsavechk10()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave10",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave10() == null || "".equals(scoreVo.getSendsave10()))
    			scoreDetailParams.put("sendsave10",    "N");
    		else 
    			scoreDetailParams.put("sendsave10",    scoreVo.getSendsave10());
    	}
    	if (scoreVo.getSendsavechk11() == null || "".equals(scoreVo.getSendsavechk11()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave11",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave11() == null || "".equals(scoreVo.getSendsave11()))
    			scoreDetailParams.put("sendsave11",    "N");
    		else 
    			scoreDetailParams.put("sendsave11",    scoreVo.getSendsave11());
    	}
    	if (scoreVo.getSendsavechk12() == null || "".equals(scoreVo.getSendsavechk12()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave12",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave12() == null || "".equals(scoreVo.getSendsave12()))
    			scoreDetailParams.put("sendsave12",    "N");
    		else 
    			scoreDetailParams.put("sendsave12",    scoreVo.getSendsave12());
    	}
    	if (scoreVo.getSendsavechk13() == null || "".equals(scoreVo.getSendsavechk13()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave13",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave13() == null || "".equals(scoreVo.getSendsave13()))
    			scoreDetailParams.put("sendsave13",    "N");
    		else 
    			scoreDetailParams.put("sendsave13",    scoreVo.getSendsave13());
    	}
    	if (scoreVo.getSendsavechk14() == null || "".equals(scoreVo.getSendsavechk14()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave14",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave14() == null || "".equals(scoreVo.getSendsave14()))
    			scoreDetailParams.put("sendsave14",    "N");
    		else 
    			scoreDetailParams.put("sendsave14",    scoreVo.getSendsave14());
    	}
    	if (scoreVo.getSendsavechk15() == null || "".equals(scoreVo.getSendsavechk15()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave15",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave15() == null || "".equals(scoreVo.getSendsave15()))
    			scoreDetailParams.put("sendsave15",    "N");
    		else 
    			scoreDetailParams.put("sendsave15",    scoreVo.getSendsave15());
    	}
    	if (scoreVo.getSendsavechk16() == null || "".equals(scoreVo.getSendsavechk16()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave16",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave16() == null || "".equals(scoreVo.getSendsave16()))
    			scoreDetailParams.put("sendsave16",    "N");
    		else 
    			scoreDetailParams.put("sendsave16",    scoreVo.getSendsave16());
    	}
    	if (scoreVo.getSendsavechk17() == null || "".equals(scoreVo.getSendsavechk17()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave17",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave17() == null || "".equals(scoreVo.getSendsave17()))
    			scoreDetailParams.put("sendsave17",    "N");
    		else 
    			scoreDetailParams.put("sendsave17",    scoreVo.getSendsave17());
    	}
    	if (scoreVo.getSendsavechk18() == null || "".equals(scoreVo.getSendsavechk18()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave18",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave18() == null || "".equals(scoreVo.getSendsave18()))
    			scoreDetailParams.put("sendsave18",    "N");
    		else 
    			scoreDetailParams.put("sendsave18",    scoreVo.getSendsave18());
    	}    	
    	
    	// greenon
    	scoreDetailParams.put("greenon1",         scoreVo.getGreenon1());
    	scoreDetailParams.put("greenon2",         scoreVo.getGreenon2());
    	scoreDetailParams.put("greenon3",         scoreVo.getGreenon3());
    	scoreDetailParams.put("greenon4",         scoreVo.getGreenon4());
    	scoreDetailParams.put("greenon5",         scoreVo.getGreenon5());
    	scoreDetailParams.put("greenon6",         scoreVo.getGreenon6());
    	scoreDetailParams.put("greenon7",         scoreVo.getGreenon7());
    	scoreDetailParams.put("greenon8",         scoreVo.getGreenon8());
    	scoreDetailParams.put("greenon9",         scoreVo.getGreenon9());
    	scoreDetailParams.put("greenon10",        scoreVo.getGreenon10());
    	scoreDetailParams.put("greenon11",        scoreVo.getGreenon11());
    	scoreDetailParams.put("greenon12",        scoreVo.getGreenon12());
    	scoreDetailParams.put("greenon13",        scoreVo.getGreenon13());
    	scoreDetailParams.put("greenon14",        scoreVo.getGreenon14());
    	scoreDetailParams.put("greenon15",        scoreVo.getGreenon15());
    	scoreDetailParams.put("greenon16",        scoreVo.getGreenon16());
    	scoreDetailParams.put("greenon17",        scoreVo.getGreenon17());
    	scoreDetailParams.put("greenon18",        scoreVo.getGreenon18());
    	
    	// fairwayon
    	scoreDetailParams.put("fairwayon1",       scoreVo.getFairwayon1());
    	scoreDetailParams.put("fairwayon2",       scoreVo.getFairwayon2());
    	scoreDetailParams.put("fairwayon3",       scoreVo.getFairwayon3());
    	scoreDetailParams.put("fairwayon4",       scoreVo.getFairwayon4());
    	scoreDetailParams.put("fairwayon5",       scoreVo.getFairwayon5());
    	scoreDetailParams.put("fairwayon6",       scoreVo.getFairwayon6());
    	scoreDetailParams.put("fairwayon7",       scoreVo.getFairwayon7());
    	scoreDetailParams.put("fairwayon8",       scoreVo.getFairwayon8());
    	scoreDetailParams.put("fairwayon9",       scoreVo.getFairwayon9());
    	scoreDetailParams.put("fairwayon10",      scoreVo.getFairwayon10());
    	scoreDetailParams.put("fairwayon11",      scoreVo.getFairwayon11());
    	scoreDetailParams.put("fairwayon12",      scoreVo.getFairwayon12());
    	scoreDetailParams.put("fairwayon13",      scoreVo.getFairwayon13());
    	scoreDetailParams.put("fairwayon14",      scoreVo.getFairwayon14());
    	scoreDetailParams.put("fairwayon15",      scoreVo.getFairwayon15());
    	scoreDetailParams.put("fairwayon16",      scoreVo.getFairwayon16());
    	scoreDetailParams.put("fairwayon17",      scoreVo.getFairwayon17());
    	scoreDetailParams.put("fairwayon18",      scoreVo.getFairwayon18());
    	
    	
    	
    	rtnJson = restService.scoreDetailCreate(scoreDetailParams);
    	LOGGER.debug(rtnJson);
    	mapper = new ObjectMapper();
    	Map<String, Object> map2 = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        result = map2.get("result").toString();
        if (result.equals("true"))
        {
        	scoreVo.setResult(true);
        }else {
        	scoreVo.setResult(false);
        	scoreVo.setError(map2.get("error").toString());
        }
        
        
    	LOGGER.debug("==================== scoreRegister scoreSave end : ===================");
    	mv.setViewName( "redirect:/score/scoreList" );
    	
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
    public ModelAndView  scoreList(@RequestParam String stdate, @RequestParam String etdate, @RequestParam String country_id, 
    		@RequestParam String zone_id, @RequestParam String countryclub_id, HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ScoreController scoreList Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	LOGGER.debug("Parameter info : ");
    	LOGGER.debug("Parameter info : " + stdate);
    	LOGGER.debug("Parameter info : " + etdate);
    	LOGGER.debug("Parameter info : " + country_id);
    	LOGGER.debug("Parameter info : " + zone_id);
    	LOGGER.debug("Parameter info : " + countryclub_id);

        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
        // 국가 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        // 지역 조회
        List<AreaVo> areaList = getAreaList("KR");	// Default KR
        mv.addObject("areaList", areaList); 
        
        // 지역에 속한 골프장 조회
        // 골프장 리스트 조회 (그 지역에 포함된)
        if (!"".equals(zone_id) && zone_id != null)
        {
        	List<GolfVo> golfList = getGolfList(country_id, zone_id);
        	mv.addObject("golfList", golfList);
        }
        
        // 내 스코어 리스트 조회
    	String rtnJson = restService.scoreList(String.valueOf(userId), stdate.replaceAll("-", ""), etdate.replaceAll("-", ""), 
    											country_id, zone_id, countryclub_id);  
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<ScoreListVo> scoreList = mapper.convertValue(map.get("scoreList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ScoreListVo.class));
        
        mv.addObject("scoreList", scoreList);
        mv.addObject("stdate", stdate.replaceAll("-", ""));
        mv.addObject("etdate", etdate.replaceAll("-", ""));
        mv.addObject("country_id", country_id);
        mv.addObject("zone_id", zone_id);
        mv.addObject("countryclub_id", countryclub_id);
        
        mv.setViewName("web/score/score_01");
        LOGGER.debug("==================== ScoreController scoreList end : ===================={}");
        return mv;
    }
    /**
     * 내 스코어 관리에서 리스트를 출력한다.
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/scoreList")
    public ModelAndView  scoreGetList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ScoreController scoreList Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
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
        
        // 내 스코어 리스트 조회
    	String rtnJson = restService.scoreList(String.valueOf(userId), CommonUtil.getCurrentDate(), CommonUtil.getCurrentDate(), "KR", null, null);    
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<ScoreListVo> scoreList = mapper.convertValue(map.get("scoreList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ScoreListVo.class));
        
        mv.addObject("scoreList", scoreList);
        mv.addObject("stdate", CommonUtil.getCurrentDate());
        mv.addObject("etdate", CommonUtil.getCurrentDate());
        mv.addObject("country_id", "KR");
        mv.addObject("zone_id", "");
        mv.addObject("countryclub_id", "");
        
        ScoreListVo scoreVo = new ScoreListVo();
        mv.addObject("scoreVo", scoreVo);
        
        mv.setViewName("web/score/score_01");
        LOGGER.debug("==================== ScoreController scoreList end : ===================={}");
        return mv;
    }   
    
    /**
     * 내 스코어 상세정보 보기
     * @param params
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @RequestMapping(value="/scoreDetail")
    public ModelAndView  scoreDetail(@RequestParam(required=false)ScoreListVo scoreVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException {

        LOGGER.debug("==================== ScoreController scoreDetail Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
    	Map<String, ? > flashMap = RequestContextUtils.getInputFlashMap(request);
    	
    	if (flashMap != null)
    	{    		
    		LOGGER.debug("flashMap is not null");
    		scoreVo = (ScoreListVo) flashMap.get("scoreVo");
    	}
    	if (scoreVo == null) LOGGER.debug("scorevo is null...");
    	
    	// 파라미터
    	String stdate = scoreVo.getStdate();
    	String etdate = scoreVo.getEtdate();
    	String country_id = scoreVo.getCountry_id();
    	String zone_id = scoreVo.getZone_id();
    	String countryclub_id = scoreVo.getCountryclub_id();
    	String search_seq_no = scoreVo.getSearch_seq_no();
    	String search_countryclub_id = scoreVo.getSearch_countryclub_id();
    	String search_visit_date = scoreVo.getSearch_visit_date();
    	
    	if (search_visit_date != null) search_visit_date = search_visit_date.replaceAll("-", "");
    	
    	LOGGER.debug("Parameter info : ");
    	LOGGER.debug("Parameter info : " + stdate);
    	LOGGER.debug("Parameter info : " + etdate);
    	LOGGER.debug("Parameter info : " + country_id);
    	LOGGER.debug("Parameter info : " + zone_id);
    	LOGGER.debug("Parameter info : " + countryclub_id);
    	LOGGER.debug("Parameter info : " + search_seq_no);
    	LOGGER.debug("Parameter info : " + search_countryclub_id);
    	LOGGER.debug("Parameter info : " + search_visit_date);
    	
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
        // 개인별 스코어 정보 조회
        ScoreMaster sm = restService.getScoreInfo(search_visit_date, search_countryclub_id, search_seq_no, String.valueOf(userId));
        
        // Hole에 대한 PAR 정보를 조회
    	FarVo parInfo1 =  restService.getParInfo(country_id, sm.getZone_id(), search_countryclub_id, sm.getStart_course());   // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	FarVo parInfo2 =  restService.getParInfo(country_id, sm.getZone_id(), search_countryclub_id, sm.getEnd_course());     // 골프장 Par 정보 상세 정보 조회 (End Course)
    	
    	// PAR에 대한 SUM 합계
    	parInfo1.setSum(parInfo1.getHole1()+parInfo1.getHole2()+parInfo1.getHole3()+parInfo1.getHole4()+parInfo1.getHole5()+parInfo1.getHole6()
    					+parInfo1.getHole7()+parInfo1.getHole8()+parInfo1.getHole9());
    	parInfo2.setSum(parInfo2.getHole1()+parInfo2.getHole2()+parInfo2.getHole3()+parInfo2.getHole4()+parInfo2.getHole5()+parInfo2.getHole6()
		+parInfo2.getHole7()+parInfo2.getHole8()+parInfo2.getHole9());
    	
        mv.addObject("scoreInfo", sm);
        mv.addObject("parInfo1", parInfo1);
        mv.addObject("parInfo2", parInfo2);
        
        // 리스트에서 넘어온 파라미터 
        mv.addObject("stdate", stdate.replaceAll("-", ""));
        mv.addObject("etdate", etdate.replaceAll("-", ""));
        mv.addObject("country_id", country_id);
        mv.addObject("zone_id", zone_id);
        mv.addObject("countryclub_id", countryclub_id);
        mv.addObject("search_seq_no", search_seq_no);
        mv.addObject("search_countryclub_id", search_countryclub_id);
        mv.addObject("search_visit_date", search_visit_date);
        
        mv.setViewName("web/score/score_02");
        LOGGER.debug("==================== ScoreController scoreDetail end : ===================={}");
        return mv;
    }
    
    /**
     * 내 스코어 상세정보 보기
     * @param params
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/scoreDetail")
    public ModelAndView  scorePostDetail(@ModelAttribute("scoreVo") ScoreListVo scoreVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException {

        LOGGER.debug("==================== ScoreController scoreDetail Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
    	Map<String, ? > flashMap = RequestContextUtils.getInputFlashMap(request);
    	
    	if (flashMap != null)
    	{    		
    		LOGGER.debug("flashMap is not null");
    		scoreVo = (ScoreListVo) flashMap.get("scoreVo");
    	}
    	if (scoreVo == null) LOGGER.debug("scorevo is null...");
    	
    	// 파라미터
    	String stdate = scoreVo.getStdate();
    	String etdate = scoreVo.getEtdate();
    	String country_id = scoreVo.getCountry_id();
    	String zone_id = scoreVo.getZone_id();
    	String countryclub_id = scoreVo.getCountryclub_id();
    	String search_seq_no = scoreVo.getSearch_seq_no();
    	String search_countryclub_id = scoreVo.getSearch_countryclub_id();
    	String search_visit_date = scoreVo.getSearch_visit_date();
    	
    	if (search_visit_date != null) search_visit_date = search_visit_date.replaceAll("-", "");
    	
    	LOGGER.debug("Parameter info : ");
    	LOGGER.debug("Parameter info : " + stdate);
    	LOGGER.debug("Parameter info : " + etdate);
    	LOGGER.debug("Parameter info : " + country_id);
    	LOGGER.debug("Parameter info : " + zone_id);
    	LOGGER.debug("Parameter info : " + countryclub_id);
    	LOGGER.debug("Parameter info : " + search_seq_no);
    	LOGGER.debug("Parameter info : " + search_countryclub_id);
    	LOGGER.debug("Parameter info : " + search_visit_date);
    	
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);
        
        // 개인별 스코어 정보 조회
        ScoreMaster sm = restService.getScoreInfo(search_visit_date, search_countryclub_id, search_seq_no, String.valueOf(userId));
        
        // Hole에 대한 PAR 정보를 조회
    	FarVo parInfo1 =  restService.getParInfo(country_id, sm.getZone_id(), search_countryclub_id, sm.getStart_course());   // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	FarVo parInfo2 =  restService.getParInfo(country_id, sm.getZone_id(), search_countryclub_id, sm.getEnd_course());     // 골프장 Par 정보 상세 정보 조회 (End Course)
    	
    	// PAR에 대한 SUM 합계
    	parInfo1.setSum(parInfo1.getHole1()+parInfo1.getHole2()+parInfo1.getHole3()+parInfo1.getHole4()+parInfo1.getHole5()+parInfo1.getHole6()
    					+parInfo1.getHole7()+parInfo1.getHole8()+parInfo1.getHole9());
    	parInfo2.setSum(parInfo2.getHole1()+parInfo2.getHole2()+parInfo2.getHole3()+parInfo2.getHole4()+parInfo2.getHole5()+parInfo2.getHole6()
		+parInfo2.getHole7()+parInfo2.getHole8()+parInfo2.getHole9());
    	
        mv.addObject("scoreInfo", sm);
        mv.addObject("parInfo1", parInfo1);
        mv.addObject("parInfo2", parInfo2);
        
        // 리스트에서 넘어온 파라미터 
        mv.addObject("stdate", stdate.replaceAll("-", ""));
        mv.addObject("etdate", etdate.replaceAll("-", ""));
        mv.addObject("country_id", country_id);
        mv.addObject("zone_id", zone_id);
        mv.addObject("countryclub_id", countryclub_id);
        mv.addObject("search_seq_no", search_seq_no);
        mv.addObject("search_countryclub_id", search_countryclub_id);
        mv.addObject("search_visit_date", search_visit_date);
        
        mv.setViewName("web/score/score_02");
        LOGGER.debug("==================== ScoreController scoreDetail end : ===================={}");
        return mv;
    }    
    
    /**
     * 개인별 스코어 정보를 삭제한다.
     * 
     * @param params
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/scoreDelete")
    public ModelAndView scoreDelete(@RequestBody Map<String, String> params) throws ApiException, IOException
    {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("ScoreController scoreDelete 시작");
        String rtn = restService.scoreDelete(params);
        LOGGER.debug(rtn);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("ScoreController scoreDelete 종료");
        return mv;
    }
    
    /**
     * 내 스코어 상세정보 수정화면
     * @param params
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/scoreModify")
    public ModelAndView  scoreModify(ScoreListVo scoreVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException {

        LOGGER.debug("==================== ScoreController scoreModify Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	UserVo userVo = null;		
    	long userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
    	// 파라미터
    	String stdate = scoreVo.getStdate();
    	String etdate = scoreVo.getEtdate();
    	String country_id = scoreVo.getCountry_id();
    	String zone_id = scoreVo.getZone_id();
    	String countryclub_id = scoreVo.getCountryclub_id();
    	String search_seq_no = scoreVo.getSearch_seq_no();
    	String search_countryclub_id = scoreVo.getSearch_countryclub_id();
    	String search_visit_date = scoreVo.getSearch_visit_date();
    	
    	if (search_visit_date != null) search_visit_date = search_visit_date.replaceAll("-", "");
    	
    	LOGGER.debug("Parameter info : ");
    	LOGGER.debug("Parameter info : " + stdate);
    	LOGGER.debug("Parameter info : " + etdate);
    	LOGGER.debug("Parameter info : " + country_id);
    	LOGGER.debug("Parameter info : " + zone_id);
    	LOGGER.debug("Parameter info : " + countryclub_id);
    	LOGGER.debug("Parameter info : " + search_seq_no);
    	LOGGER.debug("Parameter info : " + search_countryclub_id);
    	LOGGER.debug("Parameter info : " + search_visit_date);
    	
    	
        /*회원정보 조회*/
    	userVo = restService.getMemberInfo(userId);
        mv.addObject("userInfo",userVo);              
        
        
        // 개인별 스코어 정보 조회
        ScoreMaster sm = restService.getScoreInfo(search_visit_date, search_countryclub_id, search_seq_no, String.valueOf(userId));
        
        // Hole에 대한 PAR 정보를 조회
    	FarVo parInfo1 =  restService.getParInfo(country_id, sm.getZone_id(), search_countryclub_id, sm.getStart_course());   // 골프장 Par 정보 상세 정보 조회 (Start Course)
    	FarVo parInfo2 =  restService.getParInfo(country_id, sm.getZone_id(), search_countryclub_id, sm.getEnd_course());     // 골프장 Par 정보 상세 정보 조회 (End Course)
    	
    	// PAR에 대한 SUM 합계
    	parInfo1.setSum(parInfo1.getHole1()+parInfo1.getHole2()+parInfo1.getHole3()+parInfo1.getHole4()+parInfo1.getHole5()+parInfo1.getHole6()
    					+parInfo1.getHole7()+parInfo1.getHole8()+parInfo1.getHole9());
    	parInfo2.setSum(parInfo2.getHole1()+parInfo2.getHole2()+parInfo2.getHole3()+parInfo2.getHole4()+parInfo2.getHole5()+parInfo2.getHole6()
		+parInfo2.getHole7()+parInfo2.getHole8()+parInfo2.getHole9());
    	
        mv.addObject("scoreInfo", sm);
        mv.addObject("parInfo1", parInfo1);
        mv.addObject("parInfo2", parInfo2);
        
        
        // 국가 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        // 지역 조회
        List<AreaVo> areaList = getAreaList(sm.getCountry_id());	// Default KR
        mv.addObject("areaList", areaList); 
        
        // 지역에 속한 골프장 조회
        // 골프장 리스트 조회 (그 지역에 포함된)
       	List<GolfVo> golfList = getGolfList(sm.getCountry_id(), sm.getZone_id());
       	mv.addObject("golfList", golfList);
       	
        // 골프장에 포함된 코스 정보 조회
        List<FarVo> parList = getParList(sm.getCountryclub_id());
        mv.addObject("parList", parList);
       	       	        
                
        // 리스트에서 넘어온 파라미터 
        mv.addObject("stdate", stdate.replaceAll("-", ""));
        mv.addObject("etdate", etdate.replaceAll("-", ""));
        mv.addObject("country_id", country_id);
        mv.addObject("zone_id", zone_id);
        mv.addObject("countryclub_id", countryclub_id);
        mv.addObject("search_seq_no", search_seq_no);
        mv.addObject("search_countryclub_id", search_countryclub_id);
        mv.addObject("search_visit_date", search_visit_date);
        
        mv.setViewName("web/score/score_02_1");
        LOGGER.debug("==================== ScoreController scoreModify end : ===================={}");
        return mv;
    }    
    
    /**
     * 개인별 스코어 수정 정보를 저장한다
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
    @PostMapping(value="/scoreUpdate")
    public ModelAndView scoreUpdate(@ModelAttribute(value="scoreInfo")ScoreMaster scoreVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	//@ModelAttribute(value="qrVo")QRInfoVo qrVo,
    	LOGGER.debug("==================== ScoreController scoreUpdate Start : ===================");
    	LoginVo loginVo = (LoginVo)session.getAttribute("login");
    	UserVo userVo = null;		
    	long userId = -1;
    	
    	if (loginVo != null)
    		userId = loginVo.getUserid();
    	LOGGER.debug("Login userID : " + userId);
    	
    	// 파라미터
    	String stdate = scoreVo.getStdate();
    	String etdate = scoreVo.getEtdate();
    	String country_id = scoreVo.getCountry_id();
    	String zone_id = scoreVo.getZone_id();
    	String countryclub_id = scoreVo.getCountryclub_id();
    	String search_seq_no = scoreVo.getSearch_seq_no();
    	String search_countryclub_id = scoreVo.getSearch_countryclub_id();
    	String search_visit_date = scoreVo.getSearch_visit_date();
    	
    	if (search_visit_date != null) search_visit_date = search_visit_date.replaceAll("-", "");
    	
    	LOGGER.debug("Parameter info : ");
    	LOGGER.debug("Parameter info : " + stdate);
    	LOGGER.debug("Parameter info : " + etdate);
    	LOGGER.debug("Parameter info : " + country_id);
    	LOGGER.debug("Parameter info : " + zone_id);
    	LOGGER.debug("Parameter info : " + countryclub_id);
    	LOGGER.debug("Parameter info : " + search_seq_no);
    	LOGGER.debug("Parameter info : " + search_countryclub_id);
    	LOGGER.debug("Parameter info : " + search_visit_date);
    	
    	
    	// 개인별 스코어 정보 등록
    	Map<String, String> scoreParams = new HashMap<String, String>();
    	// 파라미터 등록 
    	scoreParams.put("visit_date",       scoreVo.getVisit_date().replaceAll("-", ""));
    	scoreParams.put("countryclub_id",    scoreVo.getCountryclub_id());
    	scoreParams.put("seq_no",           scoreVo.getSearch_seq_no());
    	scoreParams.put("user_id",          String.valueOf(userId));
    	scoreParams.put("start_course",     String.valueOf(scoreVo.getStart_course()));
    	scoreParams.put("end_course",       String.valueOf(scoreVo.getEnd_course()));
    	scoreParams.put("score1",           String.valueOf(scoreVo.getScore1()));
    	scoreParams.put("score2",           String.valueOf(scoreVo.getScore2()));
    	scoreParams.put("score3",           String.valueOf(scoreVo.getScore3()));
    	scoreParams.put("score4",           String.valueOf(scoreVo.getScore4()));
    	scoreParams.put("score5",           String.valueOf(scoreVo.getScore5()));
    	scoreParams.put("score6",           String.valueOf(scoreVo.getScore6()));
    	scoreParams.put("score7",           String.valueOf(scoreVo.getScore7()));
    	scoreParams.put("score8",           String.valueOf(scoreVo.getScore8()));
    	scoreParams.put("score9",           String.valueOf(scoreVo.getScore9()));
    	scoreParams.put("score10",          String.valueOf(scoreVo.getScore10()));
    	scoreParams.put("score11",          String.valueOf(scoreVo.getScore11()));
    	scoreParams.put("score12",          String.valueOf(scoreVo.getScore12()));
    	scoreParams.put("score13",          String.valueOf(scoreVo.getScore13()));
    	scoreParams.put("score14",          String.valueOf(scoreVo.getScore14()));
    	scoreParams.put("score15",          String.valueOf(scoreVo.getScore15()));
    	scoreParams.put("score16",          String.valueOf(scoreVo.getScore16()));
    	scoreParams.put("score17",          String.valueOf(scoreVo.getScore17()));
    	scoreParams.put("score18",          String.valueOf(scoreVo.getScore18()));
    	
    	scoreParams.put("stroke1",          String.valueOf(scoreVo.getStroke1()));
    	scoreParams.put("stroke2",          String.valueOf(scoreVo.getStroke2()));
    	scoreParams.put("stroke3",          String.valueOf(scoreVo.getStroke3()));
    	scoreParams.put("stroke4",          String.valueOf(scoreVo.getStroke4()));
    	scoreParams.put("stroke5",          String.valueOf(scoreVo.getStroke5()));
    	scoreParams.put("stroke6",          String.valueOf(scoreVo.getStroke6()));
    	scoreParams.put("stroke7",          String.valueOf(scoreVo.getStroke7()));
    	scoreParams.put("stroke8",          String.valueOf(scoreVo.getStroke8()));
    	scoreParams.put("stroke9",          String.valueOf(scoreVo.getStroke9()));
    	scoreParams.put("stroke10",         String.valueOf(scoreVo.getStroke10()));
    	scoreParams.put("stroke11",         String.valueOf(scoreVo.getStroke11()));
    	scoreParams.put("stroke12",         String.valueOf(scoreVo.getStroke12()));
    	scoreParams.put("stroke13",         String.valueOf(scoreVo.getStroke13()));
    	scoreParams.put("stroke14",         String.valueOf(scoreVo.getStroke14()));
    	scoreParams.put("stroke15",         String.valueOf(scoreVo.getStroke15()));
    	scoreParams.put("stroke16",         String.valueOf(scoreVo.getStroke16()));
    	scoreParams.put("stroke17",         String.valueOf(scoreVo.getStroke17()));
    	scoreParams.put("stroke18",         String.valueOf(scoreVo.getStroke18()));
    	
    	scoreParams.put("putter1",          String.valueOf(scoreVo.getPutter1()));
    	scoreParams.put("putter2",          String.valueOf(scoreVo.getPutter2()));
    	scoreParams.put("putter3",          String.valueOf(scoreVo.getPutter3()));
    	scoreParams.put("putter4",          String.valueOf(scoreVo.getPutter4()));
    	scoreParams.put("putter5",          String.valueOf(scoreVo.getPutter5()));
    	scoreParams.put("putter6",          String.valueOf(scoreVo.getPutter6()));
    	scoreParams.put("putter7",          String.valueOf(scoreVo.getPutter7()));
    	scoreParams.put("putter8",          String.valueOf(scoreVo.getPutter8()));
    	scoreParams.put("putter9",          String.valueOf(scoreVo.getPutter9()));
    	scoreParams.put("putter10",         String.valueOf(scoreVo.getPutter10()));
    	scoreParams.put("putter11",         String.valueOf(scoreVo.getPutter11()));
    	scoreParams.put("putter12",         String.valueOf(scoreVo.getPutter12()));
    	scoreParams.put("putter13",         String.valueOf(scoreVo.getPutter13()));
    	scoreParams.put("putter14",         String.valueOf(scoreVo.getPutter14()));
    	scoreParams.put("putter15",         String.valueOf(scoreVo.getPutter15()));
    	scoreParams.put("putter16",         String.valueOf(scoreVo.getPutter16()));
    	scoreParams.put("putter17",         String.valueOf(scoreVo.getPutter17()));
    	scoreParams.put("putter18",         String.valueOf(scoreVo.getPutter18()));
    	////////////////////////////////////////////////////////////////
    	String rtnJson = restService.scoreUpdate(scoreParams);
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	scoreVo.setResult(true);
        }else {
        	scoreVo.setResult(false);
        	scoreVo.setError(map.get("error").toString());
        }
    	
    	// 개인별 스코어 세부정보 등록 
    	Map<String, String> scoreDetailParams = new HashMap<String, String>();
        // 파라미터 등록 
    	scoreDetailParams.put("visit_date",       scoreVo.getVisit_date().replaceAll("-", ""));
    	scoreDetailParams.put("countryclub_id",    scoreVo.getCountryclub_id());
    	// seq_no => DB에서 신규 생성
    	scoreDetailParams.put("seq_no",           scoreVo.getSearch_seq_no());
    	scoreDetailParams.put("user_id",          String.valueOf(userId));
    	
    	scoreDetailParams.put("puterpattern1",    scoreVo.getPuterpattern1());
    	scoreDetailParams.put("puterpattern2",    scoreVo.getPuterpattern2());
    	scoreDetailParams.put("puterpattern3",    scoreVo.getPuterpattern3());
    	scoreDetailParams.put("puterpattern4",    scoreVo.getPuterpattern4());
    	scoreDetailParams.put("puterpattern5",    scoreVo.getPuterpattern5());
    	scoreDetailParams.put("puterpattern6",    scoreVo.getPuterpattern6());
    	scoreDetailParams.put("puterpattern7",    scoreVo.getPuterpattern7());
    	scoreDetailParams.put("puterpattern8",    scoreVo.getPuterpattern8());
    	scoreDetailParams.put("puterpattern9",    scoreVo.getPuterpattern9());
    	scoreDetailParams.put("puterpattern10",   scoreVo.getPuterpattern10());
    	scoreDetailParams.put("puterpattern11",   scoreVo.getPuterpattern11());
    	scoreDetailParams.put("puterpattern12",   scoreVo.getPuterpattern12());
    	scoreDetailParams.put("puterpattern13",   scoreVo.getPuterpattern13());
    	scoreDetailParams.put("puterpattern14",   scoreVo.getPuterpattern14());
    	scoreDetailParams.put("puterpattern15",   scoreVo.getPuterpattern15());
    	scoreDetailParams.put("puterpattern16",   scoreVo.getPuterpattern16());
    	scoreDetailParams.put("puterpattern17",   scoreVo.getPuterpattern17());
    	scoreDetailParams.put("puterpattern18",   scoreVo.getPuterpattern18());
    	
    	scoreDetailParams.put("parbreak1",        scoreVo.getParbreak1());
    	scoreDetailParams.put("parbreak2",        scoreVo.getParbreak2());
    	scoreDetailParams.put("parbreak3",        scoreVo.getParbreak3());
    	scoreDetailParams.put("parbreak4",        scoreVo.getParbreak4());
    	scoreDetailParams.put("parbreak5",        scoreVo.getParbreak5());
    	scoreDetailParams.put("parbreak6",        scoreVo.getParbreak6());
    	scoreDetailParams.put("parbreak7",        scoreVo.getParbreak7());
    	scoreDetailParams.put("parbreak8",        scoreVo.getParbreak8());
    	scoreDetailParams.put("parbreak9",        scoreVo.getParbreak9());
    	scoreDetailParams.put("parbreak10",       scoreVo.getParbreak10());
    	scoreDetailParams.put("parbreak11",       scoreVo.getParbreak11());
    	scoreDetailParams.put("parbreak12",       scoreVo.getParbreak12());
    	scoreDetailParams.put("parbreak13",       scoreVo.getParbreak13());
    	scoreDetailParams.put("parbreak14",       scoreVo.getParbreak14());
    	scoreDetailParams.put("parbreak15",       scoreVo.getParbreak15());
    	scoreDetailParams.put("parbreak16",       scoreVo.getParbreak16());
    	scoreDetailParams.put("parbreak17",       scoreVo.getParbreak17());
    	scoreDetailParams.put("parbreak18",       scoreVo.getParbreak18());
    	
    	// sendsave
    	if (scoreVo.getSendsavechk1() == null || "".equals(scoreVo.getSendsavechk1()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave1",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave1() == null || "".equals(scoreVo.getSendsave1()))
    			scoreDetailParams.put("sendsave1",    "N");
    		else 
    			scoreDetailParams.put("sendsave1",    scoreVo.getSendsave1());
    	}
    	if (scoreVo.getSendsavechk2() == null || "".equals(scoreVo.getSendsavechk2()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave2",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave2() == null || "".equals(scoreVo.getSendsave2()))
    			scoreDetailParams.put("sendsave2",    "N");
    		else 
    			scoreDetailParams.put("sendsave2",    scoreVo.getSendsave1());
    	}
    	if (scoreVo.getSendsavechk3() == null || "".equals(scoreVo.getSendsavechk3()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave3",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave3() == null || "".equals(scoreVo.getSendsave3()))
    			scoreDetailParams.put("sendsave3",    "N");
    		else 
    			scoreDetailParams.put("sendsave3",    scoreVo.getSendsave3());
    	}
    	if (scoreVo.getSendsavechk4() == null || "".equals(scoreVo.getSendsavechk4()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave4",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave4() == null || "".equals(scoreVo.getSendsave4()))
    			scoreDetailParams.put("sendsave4",    "N");
    		else 
    			scoreDetailParams.put("sendsave4",    scoreVo.getSendsave4());
    	}
    	if (scoreVo.getSendsavechk5() == null || "".equals(scoreVo.getSendsavechk5()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave5",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave5() == null || "".equals(scoreVo.getSendsave5()))
    			scoreDetailParams.put("sendsave5",    "N");
    		else 
    			scoreDetailParams.put("sendsave5",    scoreVo.getSendsave5());
    	}
    	if (scoreVo.getSendsavechk6() == null || "".equals(scoreVo.getSendsavechk6()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave6",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave6() == null || "".equals(scoreVo.getSendsave6()))
    			scoreDetailParams.put("sendsave6",    "N");
    		else 
    			scoreDetailParams.put("sendsave6",    scoreVo.getSendsave6());
    	}
    	if (scoreVo.getSendsavechk7() == null || "".equals(scoreVo.getSendsavechk7()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave7",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave7() == null || "".equals(scoreVo.getSendsave7()))
    			scoreDetailParams.put("sendsave7",    "N");
    		else 
    			scoreDetailParams.put("sendsave7",    scoreVo.getSendsave7());
    	}
    	if (scoreVo.getSendsavechk8() == null || "".equals(scoreVo.getSendsavechk8()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave8",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave8() == null || "".equals(scoreVo.getSendsave8()))
    			scoreDetailParams.put("sendsave8",    "N");
    		else 
    			scoreDetailParams.put("sendsave8",    scoreVo.getSendsave8());
    	}
    	if (scoreVo.getSendsavechk9() == null || "".equals(scoreVo.getSendsavechk9()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave9",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave9() == null || "".equals(scoreVo.getSendsave9()))
    			scoreDetailParams.put("sendsave9",    "N");
    		else 
    			scoreDetailParams.put("sendsave9",    scoreVo.getSendsave9());
    	}
    	if (scoreVo.getSendsavechk10() == null || "".equals(scoreVo.getSendsavechk10()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave10",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave10() == null || "".equals(scoreVo.getSendsave10()))
    			scoreDetailParams.put("sendsave10",    "N");
    		else 
    			scoreDetailParams.put("sendsave10",    scoreVo.getSendsave10());
    	}
    	if (scoreVo.getSendsavechk11() == null || "".equals(scoreVo.getSendsavechk11()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave11",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave11() == null || "".equals(scoreVo.getSendsave11()))
    			scoreDetailParams.put("sendsave11",    "N");
    		else 
    			scoreDetailParams.put("sendsave11",    scoreVo.getSendsave11());
    	}
    	if (scoreVo.getSendsavechk12() == null || "".equals(scoreVo.getSendsavechk12()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave12",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave12() == null || "".equals(scoreVo.getSendsave12()))
    			scoreDetailParams.put("sendsave12",    "N");
    		else 
    			scoreDetailParams.put("sendsave12",    scoreVo.getSendsave12());
    	}
    	if (scoreVo.getSendsavechk13() == null || "".equals(scoreVo.getSendsavechk13()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave13",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave13() == null || "".equals(scoreVo.getSendsave13()))
    			scoreDetailParams.put("sendsave13",    "N");
    		else 
    			scoreDetailParams.put("sendsave13",    scoreVo.getSendsave13());
    	}
    	if (scoreVo.getSendsavechk14() == null || "".equals(scoreVo.getSendsavechk14()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave14",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave14() == null || "".equals(scoreVo.getSendsave14()))
    			scoreDetailParams.put("sendsave14",    "N");
    		else 
    			scoreDetailParams.put("sendsave14",    scoreVo.getSendsave14());
    	}
    	if (scoreVo.getSendsavechk15() == null || "".equals(scoreVo.getSendsavechk15()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave15",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave15() == null || "".equals(scoreVo.getSendsave15()))
    			scoreDetailParams.put("sendsave15",    "N");
    		else 
    			scoreDetailParams.put("sendsave15",    scoreVo.getSendsave15());
    	}
    	if (scoreVo.getSendsavechk16() == null || "".equals(scoreVo.getSendsavechk16()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave16",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave16() == null || "".equals(scoreVo.getSendsave16()))
    			scoreDetailParams.put("sendsave16",    "N");
    		else 
    			scoreDetailParams.put("sendsave16",    scoreVo.getSendsave16());
    	}
    	if (scoreVo.getSendsavechk17() == null || "".equals(scoreVo.getSendsavechk17()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave17",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave17() == null || "".equals(scoreVo.getSendsave17()))
    			scoreDetailParams.put("sendsave17",    "N");
    		else 
    			scoreDetailParams.put("sendsave17",    scoreVo.getSendsave17());
    	}
    	if (scoreVo.getSendsavechk18() == null || "".equals(scoreVo.getSendsavechk18()))  // Not check .equals("Y"))	// 빠졌는데 벗어 났는지 
    	{
    		scoreDetailParams.put("sendsave18",   "0");		// 빠진적 없다.    		
    	}else {
    		if (scoreVo.getSendsave18() == null || "".equals(scoreVo.getSendsave18()))
    			scoreDetailParams.put("sendsave18",    "N");
    		else 
    			scoreDetailParams.put("sendsave18",    scoreVo.getSendsave18());
    	}    	
    	
    	// greenon
    	scoreDetailParams.put("greenon1",         scoreVo.getGreenon1());
    	scoreDetailParams.put("greenon2",         scoreVo.getGreenon2());
    	scoreDetailParams.put("greenon3",         scoreVo.getGreenon3());
    	scoreDetailParams.put("greenon4",         scoreVo.getGreenon4());
    	scoreDetailParams.put("greenon5",         scoreVo.getGreenon5());
    	scoreDetailParams.put("greenon6",         scoreVo.getGreenon6());
    	scoreDetailParams.put("greenon7",         scoreVo.getGreenon7());
    	scoreDetailParams.put("greenon8",         scoreVo.getGreenon8());
    	scoreDetailParams.put("greenon9",         scoreVo.getGreenon9());
    	scoreDetailParams.put("greenon10",        scoreVo.getGreenon10());
    	scoreDetailParams.put("greenon11",        scoreVo.getGreenon11());
    	scoreDetailParams.put("greenon12",        scoreVo.getGreenon12());
    	scoreDetailParams.put("greenon13",        scoreVo.getGreenon13());
    	scoreDetailParams.put("greenon14",        scoreVo.getGreenon14());
    	scoreDetailParams.put("greenon15",        scoreVo.getGreenon15());
    	scoreDetailParams.put("greenon16",        scoreVo.getGreenon16());
    	scoreDetailParams.put("greenon17",        scoreVo.getGreenon17());
    	scoreDetailParams.put("greenon18",        scoreVo.getGreenon18());
    	
    	// fairwayon
    	scoreDetailParams.put("fairwayon1",       scoreVo.getFairwayon1());
    	scoreDetailParams.put("fairwayon2",       scoreVo.getFairwayon2());
    	scoreDetailParams.put("fairwayon3",       scoreVo.getFairwayon3());
    	scoreDetailParams.put("fairwayon4",       scoreVo.getFairwayon4());
    	scoreDetailParams.put("fairwayon5",       scoreVo.getFairwayon5());
    	scoreDetailParams.put("fairwayon6",       scoreVo.getFairwayon6());
    	scoreDetailParams.put("fairwayon7",       scoreVo.getFairwayon7());
    	scoreDetailParams.put("fairwayon8",       scoreVo.getFairwayon8());
    	scoreDetailParams.put("fairwayon9",       scoreVo.getFairwayon9());
    	scoreDetailParams.put("fairwayon10",      scoreVo.getFairwayon10());
    	scoreDetailParams.put("fairwayon11",      scoreVo.getFairwayon11());
    	scoreDetailParams.put("fairwayon12",      scoreVo.getFairwayon12());
    	scoreDetailParams.put("fairwayon13",      scoreVo.getFairwayon13());
    	scoreDetailParams.put("fairwayon14",      scoreVo.getFairwayon14());
    	scoreDetailParams.put("fairwayon15",      scoreVo.getFairwayon15());
    	scoreDetailParams.put("fairwayon16",      scoreVo.getFairwayon16());
    	scoreDetailParams.put("fairwayon17",      scoreVo.getFairwayon17());
    	scoreDetailParams.put("fairwayon18",      scoreVo.getFairwayon18());
    	
    	
    	
    	rtnJson = restService.scoreDetailUpdate(scoreDetailParams);
    	LOGGER.debug(rtnJson);
    	mapper = new ObjectMapper();
    	Map<String, Object> map2 = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        result = map2.get("result").toString();
        if (result.equals("true"))
        {
        	scoreVo.setResult(true);
        }else {
        	scoreVo.setResult(false);
        	scoreVo.setError(map2.get("error").toString());
        }
        
        
        // 리스트에서 넘어온 파라미터 
        ScoreListVo vo = new ScoreListVo();
        vo.setStdate(stdate.replaceAll("-", ""));
        vo.setEtdate(etdate.replaceAll("-", ""));
        vo.setCountry_id(country_id);
        vo.setZone_id(zone_id);
        vo.setSearch_countryclub_id(search_countryclub_id);
        vo.setSearch_seq_no(search_seq_no);
        vo.setSearch_visit_date(search_visit_date);

        redirectAttributes.addFlashAttribute("scoreVo", vo);
    	LOGGER.debug("==================== scoreRegister scoreUpdate end : ===================");
    	mv.setViewName( "redirect:/score/scoreDetail" );
    	
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
     * 골프장 리스트 출력
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
     * 골프장정보 상세 정보 출력 
     * @param request
     * @return
     */
    @GetMapping("/parDetail/{country_id}/{zone_id}/{countryclub_id}/{course}")
    public ModelAndView parDetail(HttpServletRequest request,@PathVariable String country_id, @PathVariable String zone_id, @PathVariable String countryclub_id, @PathVariable String course)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	String rtn =  restService.getParDetail(country_id, zone_id, countryclub_id, course);   // Par 상세 정보 조회
 
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("ScoreController parDetail 종료");
        return mv;
    }    
    
    /**
     * Par 리스트 출력
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
    /***
     * 그 지역에 속한 골프장 리스트를 리턴한다.
     * 
     * @param country_id
     * @param zone_id
     * @return
     * @throws ApiException
     * @throws IOException
     */
    private List<GolfVo> getGolfList(String country_id, String zone_id) throws ApiException, IOException {
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
    /***
     * 골프장에 속한 Par 정보 리스트를 리턴한다.
     * 
     * @param countryclub_id
     * @return
     * @throws ApiException
     * @throws IOException
     */
    private List<FarVo> getParList(String countryclub_id) throws ApiException, IOException {
    	String rtnJson = restService.getParList(countryclub_id);
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<FarVo> parList = mapper.convertValue(map.get("parList"), TypeFactory.defaultInstance().constructCollectionType(List.class,FarVo.class));

        return parList;
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
