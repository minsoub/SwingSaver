package com.swing.saver.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swing.saver.web.repository.ParInfoRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ParInfoService {

	@Autowired
	private ParInfoRepository repository;
	
	
	
}
