package com.swing.saver.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.domain.SCScoreInfoPK;
import com.swing.saver.web.response.ResponseScore;

@Repository
public interface SCScoreInfoRepository  extends JpaRepository <SCScoreInfo, SCScoreInfoPK>{
	//@PersistenceContext    // EntityManagerFactory가 DI 할 수 있도록 어노테이션 설정
    //private EntityManager em;
	
}
