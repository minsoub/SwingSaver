package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.domain.SCScoreInfoPK;

public interface SCScoreInfoRepository extends JpaRepository <SCScoreInfo, SCScoreInfoPK>{

}
