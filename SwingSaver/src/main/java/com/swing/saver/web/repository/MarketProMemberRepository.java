package com.swing.saver.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.swing.saver.web.domain.MarketProMember;
import com.swing.saver.web.domain.MarketProMemberPK;

public interface MarketProMemberRepository  extends JpaRepository <MarketProMember, MarketProMemberPK> {

	/**
	 * 사용자 Key로 마켓프로 멤버 정보를 조회한다. 
	 * 
	 * @param userid
	 * @return
	 */
	@Query("select a from MarketProMember a where a.userid=:userid and a.use_yn='Y'")
	MarketProMember findByProMember(@Param("userid") Integer userid);
}
