package com.swing.saver.web.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.domain.SCScoreInfoPK;

@Repository
public interface SCScoreInfoRepository  extends JpaRepository <SCScoreInfo, SCScoreInfoPK>{
	//@PersistenceContext    // EntityManagerFactory가 DI 할 수 있도록 어노테이션 설정
    //private EntityManager em;
}
