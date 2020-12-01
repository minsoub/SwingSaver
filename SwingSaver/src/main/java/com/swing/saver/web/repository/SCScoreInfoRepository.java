package com.swing.saver.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.SCScoreDetailInfo;
import com.swing.saver.web.domain.SCScoreInfo;
import com.swing.saver.web.domain.SCScoreInfoPK;
import com.swing.saver.web.response.ResponseScore;

@Repository
public interface SCScoreInfoRepository  extends JpaRepository <SCScoreInfo, SCScoreInfoPK>{

	@Query(value="select a from SCScoreInfo a where  a.user_id = :userId and a.visit_date between replace(:fromDt, '.', '') and replace(:toDt, '.', '')  order by a.visit_date desc, a.teeup_time desc")
	List<SCScoreInfo> findByList(@Param("userId")int userId, @Param("fromDt")String fromDt, @Param("toDt")String toDt);
}
