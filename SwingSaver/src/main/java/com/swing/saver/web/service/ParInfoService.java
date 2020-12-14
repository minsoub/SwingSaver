package com.swing.saver.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swing.saver.web.domain.ParInfo;
import com.swing.saver.web.domain.ParInfoPK;
import com.swing.saver.web.repository.ParInfoRepository;
import com.swing.saver.web.response.ResponseParInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ParInfoService {

	@Autowired
	private ParInfoRepository repository;
	
	/**
	 * Par 상세정보를 조회한다. 
	 * 
	 * @param countryclub_id
	 * @param course
	 * @return
	 */
	public ResponseParInfo getParInfo(String countryclub_id, int course)
	{
		ParInfoPK pk = ParInfoPK.builder().countryclub_id(countryclub_id)
						.course(course)
						.build();
		ParInfo data = repository.findOne(pk);
		ResponseParInfo result = ResponseParInfo.builder().info(data).build();
		
		return result;
	}
	
	
}
