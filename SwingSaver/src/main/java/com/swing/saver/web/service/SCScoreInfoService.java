package com.swing.saver.web.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.entity.ScoreRequest;
import com.swing.saver.web.repository.SCScoreInfoRepository;
import com.swing.saver.web.response.ResponseScore;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SCScoreInfoService {

	@Autowired
	private SCScoreInfoRepository repository;
	
	@Autowired
	private EntityManagerFactory emf;
	
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
						"a.seq_no,         " +
						"a.user_id,             " +
						"b.countryclub_nm,         "+
						"(a.score1 + a.score2 + a.score3 + a.score4 + a.score5 + a.score6 + a.score7 + a.score8 + a.score9)+   "+
						"(a.score10 + a.score11 + a.score12 + a.score13 + a.score14 + a.score15 + a.score16 + a.score17 + a.score18) as score_sum, "+
						" a.start_course,  a.end_course  )"+            
				"from SCScoreInfo a, CountryclubInfo b  "+
				"where  "+
				"	  a.user_id = :user_id   "+
				"  and a.countryclub_id = b.countryclub_id  "+ 
				"  and a.visit_date between replace(:fromDt, '.', '') and replace(:toDt, '.', '')  "+
				" order by a.seq_no desc   				 "
		, ResponseScore.class);
		query.setParameter("user_id", Long.valueOf(userId).intValue());
		query.setParameter("fromDt",  fromDt);
		query.setParameter("toDt",    toDt);
		
		List<ResponseScore> list = query.getResultList();   // 1 row => getSingleResult
		
		em.close();
		
		return list;
	}
}
