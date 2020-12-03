package com.swing.saver.web.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swing.saver.web.domain.GroupMember;
import com.swing.saver.web.domain.MarketProMember;
import com.swing.saver.web.domain.UserInfo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.repository.GroupMemberRepository;
import com.swing.saver.web.repository.MarketProMemberRepository;
import com.swing.saver.web.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class LoginService {
	@Autowired
	private UserInfoRepository userRepository;
	
	@Autowired
	private GroupMemberRepository groupRepoistory;
	
	@Autowired
	private MarketProMemberRepository marketRepository;
	
	
	/**
	 * 사용자 로그인 세션 처리
	 * 
	 * @param loginVo
	 * @param session
	 * @return
	 */
	public LoginVo loginProcess(LoginVo loginVo, HttpSession session)
	{
		
		LoginVo userLoginInfo = new LoginVo();
		UserInfo user = userRepository.findByUser(loginVo.getEmail(), loginVo.getPassword());
		if (user == null) {
			userLoginInfo.setResult("로그인 에러 발생 : 사용자 정보를 찾을 수가 없습니다!!!");
		}else {
			userLoginInfo.setUserid(user.getId());
			userLoginInfo.setResult("true");
			// 그룹관리자, 그룹멤버 등 체크
			GroupMember gMember = groupRepoistory.findByAcademyGroupAuth((int) userLoginInfo.getUserid());
			if (gMember != null) {
				userLoginInfo.setGroupadmin("Y");
			}else {
				userLoginInfo.setGroupadmin("N");
			}
			
			GroupMember pMember = groupRepoistory.findByProGroupAuth((int) userLoginInfo.getUserid());
			if (pMember != null) {
				userLoginInfo.setGrouppro("Y");
				userLoginInfo.setGroupmember("Y");
				userLoginInfo.setGroupid(pMember.getGroupid());
			}else {
				userLoginInfo.setGrouppro("N");
			}
			
			MarketProMember proMember = marketRepository.findByProMember((int) userLoginInfo.getUserid());
			if (proMember != null) {
				userLoginInfo.setMarket_pro_chk("Y");
			}else {
				userLoginInfo.setMarket_pro_chk("N");
			}
		}
		return userLoginInfo;
	}
	
	/**
	 * 사용자 로그인 세션 처리 - SNS 로그인
	 * 해당 호출은 SNS에 로그인 한 후에 호출된다. 
	 * 
	 * @param loginVo
	 * @param session
	 * @return
	 */
	public LoginVo loginSnsProcess(LoginVo loginVo, HttpSession session)
	{
		
		LoginVo userLoginInfo = new LoginVo();
		UserInfo user = userRepository.findBySnsUser(loginVo.getEmail());
		if (user == null) {
			UserInfo insertUser = new UserInfo();
			insertUser.setEmail(loginVo.getEmail());
			insertUser.setFirstname(loginVo.getUsername());
						
			userRepository.save(insertUser);
			loginVo.setResult("false");  // 가입등록 후 재로그인 신청
			return loginVo;
		}else {
			userLoginInfo.setUserid(user.getId());
			userLoginInfo.setResult("true");
			// 그룹관리자, 그룹멤버 등 체크
			GroupMember gMember = groupRepoistory.findByAcademyGroupAuth((int) userLoginInfo.getUserid());
			if (gMember != null) {
				userLoginInfo.setGroupadmin("Y");
			}else {
				userLoginInfo.setGroupadmin("N");
			}
			
			GroupMember pMember = groupRepoistory.findByProGroupAuth((int) userLoginInfo.getUserid());
			if (pMember != null) {
				userLoginInfo.setGrouppro("Y");
				userLoginInfo.setGroupmember("Y");
				userLoginInfo.setGroupid(pMember.getGroupid());
			}else {
				userLoginInfo.setGrouppro("N");
			}
			
			MarketProMember proMember = marketRepository.findByProMember((int) userLoginInfo.getUserid());
			if (proMember != null) {
				userLoginInfo.setMarket_pro_chk("Y");
			}else {
				userLoginInfo.setMarket_pro_chk("N");
			}
		}
		return userLoginInfo;
	}
}
