package com.swing.saver.web.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringRunner;

import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.repository.SCScoreInfoRepository;


@RunWith(SpringRunner.class)
class SCScoreInfoServiceTest {

	@Autowired
	SCScoreInfoRepository repository;
	
	@BeforeEach
	void setUp() throws Exception {
	}

	@After
	public void cleanup()
	{
		repository.deleteAll();
	}
	
//	@Test
//	void test() {
//		//List<SCScoreInfo> list = new ArrayList();
//		List<SCScoreInfo> list = repository.findAll();  // .forEach(e->list.add(e));
//		
//		// then 
//		SCScoreInfo data = list.get(0);
//		assertThat(data.getVisit_date()).isEqualTo("20201125");
//	}

}
