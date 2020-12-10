package com.swing.saver.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.Advert;

/**
 * SWADVERT(광고제휴 사이트 테이블) Repository interface
 * 
 * @author jms
 *
 */
@Repository
public interface AdvertRepository extends JpaRepository <Advert, Integer>{

	/**
	 * 광고제휴 사이트 전체 리스트를 조회한다. 
	 * @return
	 */
	@Query(value="select a from Advert a where a.use_yn = 'Y' order by a.order_no asc")
	List<Advert> findByAdvertAll();
}
