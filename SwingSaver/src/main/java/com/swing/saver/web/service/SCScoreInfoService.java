package com.swing.saver.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.entity.ScoreRequest;
import com.swing.saver.web.repository.SCScoreInfoRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SCScoreInfoService {

	@Autowired
	private SCScoreInfoRepository repository;
	
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
}
