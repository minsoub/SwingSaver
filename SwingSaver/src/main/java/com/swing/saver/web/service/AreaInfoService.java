package com.swing.saver.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swing.saver.web.domain.AreaInfo;
import com.swing.saver.web.repository.AreaInfoRepository;
import com.swing.saver.web.response.ResponseAreaInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AreaInfoService {
	@Autowired
	private AreaInfoRepository repository;
	
	/**
	 * 지역 정보 리스트를 조회한다. 
	 * 
	 * @return
	 */
	public List<ResponseAreaInfo> findByAreaList()
	{
		List<AreaInfo> list = repository.findAll();
		List<ResponseAreaInfo> resultList = new ArrayList<ResponseAreaInfo>();
		
		for (AreaInfo info: list)
		{
			ResponseAreaInfo result = ResponseAreaInfo.builder().info(info).build();
			resultList.add(result);
		}
		return resultList;
	}
}
