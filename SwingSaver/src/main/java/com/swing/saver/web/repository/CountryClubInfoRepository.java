package com.swing.saver.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.CountryclubInfo;
import com.swing.saver.web.domain.CountryclubInfoPK;

/**
 * 골프장 정보 Repository
 * 
 * @author JMS
 *
 */
@Repository
public interface CountryClubInfoRepository  extends JpaRepository <CountryclubInfo, CountryclubInfoPK>{
	/**
	 * 아이디를 가지고 골프장 상세 정보를 조회한다. 
	 * 
	 * @param countryclub_id
	 * @return
	 */
	@Query(value="select a from CountryclubInfo a where  a.countryclub_id = :countryclub_id")
	CountryclubInfo findByCountryClub(@Param("countryclub_id") String countryclub_id);
	
	/**
	 * 골프장명으로 골프장 리스트를 검색한다. 
	 * 
	 * @param countryclub_nm
	 * @return
	 */
	@Query(value="select a from CountryclubInfo a where a.countryclub_nm like CONCAT(CONCAT('%',:countryclub_nm),'%')")
	List<CountryclubInfo> findByLikeName(@Param("countryclub_nm") String countryclub_nm); 
}
