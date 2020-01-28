package com.swing.saver.web.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.AreaVo;
import com.swing.saver.web.entity.FarVo;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.entity.GroupVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.ScoreMaster;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * Created by mycom on 2019-05-29.
 */
public interface RestService {

    public LoginVo loginProcess(LoginVo loginVo, HttpSession session) throws ApiException, IOException;
    public String emailList(UserVo userVo) throws ApiException, IOException;
    public String oAuthToken();
    public String join(Map<String,String> joinMap) throws ApiException, JsonProcessingException;

    public UserVo getMemberInfo(long userId) throws ApiException, IOException;

    public String modify(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String emailConfirm(String key) throws JsonProcessingException, ApiException;

    public GroupVo getUserGroupInfo(String groupId) throws ApiException, IOException;

    public String groupCreate(Map<String, String> params) throws JsonProcessingException, ApiException;
    public String groupDelete(Map<String, String> params) throws JsonProcessingException, ApiException;
    
    public String grpMemberCreate(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String groupModify(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String getGroupMember(String groupId) throws ApiException;

    public String getSubGroup(String groupId) throws ApiException;

    public String getSubGroupMembers(String sid) throws ApiException;

    public String subGroupInsert(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String subGroupUpdate(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String subGroupDelete(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String subGroupUserDelete(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String subGroupUserMove(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String groupUserDelete(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String passwordReset(Map<String, String> params) throws JsonProcessingException, ApiException;

    public String passwordProcess(Map<String, String> params) throws JsonProcessingException, ApiException;
    
    public String imgProfileInsert(Map<String,String> params) throws JsonProcessingException, ApiException;
    
    public String groupMemberAcceptCancel(Map<String,String> params) throws JsonProcessingException, ApiException;
    
    // 관리자 기능 
    public AdminVo adminLoginProcess(AdminVo loginVo, HttpSession session) throws ApiException, IOException;   // admin login process service
    public String getGroupList() throws ApiException;   				// 그룹 리스트 조회
    public String getGroupAdminList() throws ApiException;				// 그룹관리자로 등록할 회원리스트 조회
    public GroupVo getGroupInfo(long groupid) throws ApiException, IOException;					// 그룹 상세정보 조회
    public String getCodeList(String groupType) throws ApiException;	// 코드 리스트 조회
    public String groupUpdate(Map<String, String> params) throws JsonProcessingException, ApiException;
    
    public String getAreaList() throws ApiException;					// 지역정보 조회 
    public String getAreaList(String country_id) throws ApiException;					// 지역정보 조회 
    public String areaCreate(Map<String, String> params) throws JsonProcessingException, ApiException;	// 지역정보 신규 등록
    public String areaDelete(Map<String, String> params) throws JsonProcessingException, ApiException;  // 지역정보 삭제
    public AreaVo getAreaInfo(String country_id, String zone_id) throws ApiException, IOException;		// 지역정보 상세보기	
    public String areaUpdate(Map<String, String> params) throws JsonProcessingException, ApiException;  // 지역정보 수정
    
    // 골프장정보
    public String getGolfList() throws ApiException;													// 골프장정보 조회
    public String getGolfList(String country_id, String zone_id) throws ApiException;					// 골프장정보 조회
    public String golfCreate(Map<String, String> params) throws JsonProcessingException, ApiException;	// 골프장정보 신규 등록
    public String golfDelete(Map<String, String> params) throws JsonProcessingException, ApiException;  // 골프장정보 삭제
    public GolfVo getGolfInfo(String country_id, String zone_id, String countryclub_id) throws ApiException, IOException;		// 골프장정보 상세보기
    public String getGolfDetail(String country_id, String zone_id, String countryclub_id) throws ApiException, IOException;		// 골프장정보 상세보기
    public String golfUpdate(Map<String, String> params) throws JsonProcessingException, ApiException;  // 골프장정보 수정
    public String getParList(String countryclub_id) throws ApiException;								// Par 정보 조회 
    public String getParList(String country_id, String zone_id, String countryclub_id) throws ApiException;								// Par List정보 조회
    public String parCreate(Map<String, String> params) throws JsonProcessingException, ApiException;	// 골프장 Par 정보 신규 등록
    public FarVo getParInfo(String country_id, String zone_id, String countryclub_id, String course) throws ApiException, IOException;		// 골프장 Par 정보 상세보기
    public String getParDetail(String country_id, String zone_id, String countryclub_id, String course) throws ApiException, IOException;		// 골프장 Par 정보 상세보기
    public String parDelete(Map<String, String> params) throws JsonProcessingException, ApiException;  // 골프장 Par 삭제
    public String parUpdate(Map<String, String> params) throws JsonProcessingException, ApiException;  // 골프장 Par 정보 수정
    
    // 스코어 정보 저장 
    public String scoreCreate(Map<String, String> params) throws JsonProcessingException, ApiException;	        // 스코어정보 개인별 신규 등록
    public String scoreDetailCreate(Map<String, String> params) throws JsonProcessingException, ApiException;	// 스코어정보 개인별 상세 신규 등록
    public String scoreList(String user_id, String stdate, String etdate, String country_id, String zone_id, String countryclub_id) throws ApiException, IOException;		// 스코어정보 리스트 조회
    public ScoreMaster getScoreInfo(String visit_date, String countryclub_id, String seq_no, String user_id) throws ApiException, IOException;		// 스코어정보 상세보기
} 
