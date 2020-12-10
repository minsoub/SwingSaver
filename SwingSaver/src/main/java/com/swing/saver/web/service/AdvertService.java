package com.swing.saver.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swing.saver.web.domain.Advert;
import com.swing.saver.web.repository.AdvertRepository;
import com.swing.saver.web.response.ResponseAdvert;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdvertService {

	@Autowired
	private AdvertRepository repository;
	
	/**
	 * 광고 제휴 사이트 리스트를 조회한다. 
	 * 
	 * @return
	 */
	public List<ResponseAdvert> findByAdvertAll() {
		List<Advert> list = repository.findByAdvertAll();
		
		List<ResponseAdvert> resultList = new ArrayList<ResponseAdvert>();
		
		for(Advert info: list)
		{
			ResponseAdvert result = ResponseAdvert.builder().info(info).build();
			resultList.add(result);
		}
		return resultList;
	}
}
