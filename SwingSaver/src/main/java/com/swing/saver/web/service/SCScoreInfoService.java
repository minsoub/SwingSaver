package com.swing.saver.web.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swing.saver.web.domain.SCScoreDetailInfo;
import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.domain.SCScoreInfoPK;
import com.swing.saver.web.entity.ScoreRequest;
import com.swing.saver.web.repository.SCScoreInfoDetailRepository;
import com.swing.saver.web.repository.SCScoreInfoRepository;
import com.swing.saver.web.response.ResponseScore;
import com.swing.saver.web.response.ResponseScoreSts;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SCScoreInfoService {

	@Autowired
	private SCScoreInfoRepository repository;
	
	@Autowired
	private SCScoreInfoDetailRepository detailRepository;
	
	@Autowired
	private EntityManagerFactory emf;
	
	/**
	 * 상세 데이터 조회
	 * @param countryclub_id
	 * @param visit_date
	 * @param teeup_time
	 * @param user_id
	 * @return
	 */
	public SCScoreInfo findByKey(String countryclub_id, String visit_date, String teeup_time, int user_id)
	{
		SCScoreInfoPK pk = new SCScoreInfoPK();
		pk.setCountryclub_id(countryclub_id);
		pk.setVisit_date(visit_date);
		pk.setTeeup_time(teeup_time);
		pk.setUser_id(user_id);
		SCScoreInfo request = repository.findOne(pk);
		
		return request;
	}
	
	/**
	 * 상세 데이터 조회
	 * @param countryclub_id
	 * @param visit_date
	 * @param teeup_time
	 * @param user_id
	 * @return
	 */
	public SCScoreDetailInfo findDetailByKey(String countryclub_id, String visit_date, String teeup_time, int user_id)
	{
		SCScoreInfoPK pk = new SCScoreInfoPK();
		pk.setCountryclub_id(countryclub_id);
		pk.setVisit_date(visit_date);
		pk.setTeeup_time(teeup_time);
		pk.setUser_id(user_id);
		SCScoreDetailInfo request = detailRepository.findOne(pk);
		
		return request;
	}	
	
	/**
	 * Score register
	 * 
	 * @param dto
	 * @return
	 */
	@Transactional
	public SCScoreInfo save(ScoreRequest dto)
	{
		SCScoreInfo request = SCScoreInfo.builder().scoreVo(dto).build();
		
		return repository.save(request);
	}
	
	/**
	 * Score detail register 
	 * 
	 * @param dto
	 * @return
	 */
	@Transactional
	public SCScoreDetailInfo saveDetail(ScoreRequest dto)
	{
		SCScoreDetailInfo request = SCScoreDetailInfo.builder().scoreVo(dto).build();
		
		return detailRepository.save(request);
	}
	
	/**
	 * 스코어 리스트 리턴
	 * @param userId
	 * @param fromDt
	 * @param toDt
	 * @return
	 */
	public ResponseScoreSts getScoreInfoList(long userId, String fromDt, String toDt)
	{
		List<SCScoreInfo> infolist =  repository.findByList(Long.valueOf(userId).intValue(), fromDt, toDt);
		List<SCScoreDetailInfo> detailList = detailRepository.findByList(Long.valueOf(userId).intValue(), fromDt, toDt);
		 
		ResponseScoreSts sts = ResponseScoreSts.builder()
									.score(infolist)
									.detail(detailList)
									.build();
		
		return sts;
	}
	
	/**
	 * 사용자 쿼리 결과를 리턴한다. 
	 * 
	 * @param userId
	 * @param fromDt
	 * @param toDt
	 * @return
	 */
	public List<ResponseScore> getScoreList(long userId, String fromDt, String toDt)
	{
		EntityManager em = emf.createEntityManager();
		
		TypedQuery <ResponseScore> query = em.createQuery(
		        "select 	" +        	
						" new com.swing.saver.web.response.ResponseScore(to_char(to_date(a.visit_date, 'yyyyMMdd'), 'yyyy.MM.dd') as visit_date,   " + 
						"a.countryclub_id,   " +
						"a.teeup_time,         " +
						"a.user_id,             " +
						"b.countryclub_nm,         "+
						"(nvl(a.score1, 0) + nvl(a.score2, 0) + nvl(a.score3, 0) + nvl(a.score4,0) + nvl(a.score5,0) + nvl(a.score6,0) + nvl(a.score7,0) + nvl(a.score8,0) + nvl(a.score9,0) )+   "+
						"( nvl(a.score10, 0) + nvl(a.score11,0) + nvl(a.score12,0) + nvl(a.score13,0) + nvl(a.score14,0) + nvl(a.score15,0) + nvl(a.score16,0) + nvl(a.score17,0) + nvl(a.score18,0)) as score_sum, "+
						"(nvl(a.stroke1, 0) + nvl(a.stroke2, 0) + nvl(a.stroke3, 0) + nvl(a.stroke4, 0) + nvl(a.stroke5,0) + nvl(a.stroke6,0) + nvl(a.stroke7,0) + nvl(a.stroke8,0) + nvl(a.stroke9,0) )+   "+
						"( nvl(a.stroke10, 0) + nvl(a.stroke11,0) + nvl(a.stroke12,0) + nvl(a.stroke13,0) + nvl(a.stroke14,0) + nvl(a.stroke15,0) + nvl(a.stroke16,0) + nvl(a.stroke17,0) + nvl(a.stroke18,0)) as stroke_sum, "+						
						" a.start_course,  a.end_course  " + 
						" ) "+            
				"from SCScoreInfo a, CountryclubInfo b  "+
				"where  "+
				"	  a.user_id = :user_id   "+
				"  and a.countryclub_id = b.countryclub_id  "+ 
				"  and a.visit_date between replace(:fromDt, '.', '') and replace(:toDt, '.', '')  "+
				" order by a.visit_date desc, a.teeup_time desc   				 "
		, ResponseScore.class);
		query.setParameter("user_id", Long.valueOf(userId).intValue());
		query.setParameter("fromDt",  fromDt);
		query.setParameter("toDt",    toDt);
		
		List<ResponseScore> list = query.getResultList();   // 1 row => getSingleResult
		
		System.out.println("list size : " + list.size());
		
		em.close();
		
		return list;
	}
}
