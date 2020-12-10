package com.swing.saver.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swing.saver.web.repository.ArPersonRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ArPersonService {

	@Autowired
	private ArPersonRepository repository;
	
	
}
