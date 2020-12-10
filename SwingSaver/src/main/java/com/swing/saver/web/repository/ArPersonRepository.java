package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.swing.saver.web.domain.ArPerson;

/**
 * 개인회원 구매내역 Repository Interface 
 * @author jms
 *
 */
public interface ArPersonRepository extends JpaRepository <ArPerson, Integer>{
	
}
