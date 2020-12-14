package com.swing.saver.web.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.swing.saver.web.domain.CountryclubInfo;
import com.swing.saver.web.domain.CountryclubInfoPK;
import com.swing.saver.web.response.ResponseCountryClub;

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
	
	/**
	 * 제휴 골프장 리스트 조회
	 * @return
	 */
	@Query(value="select a from CountryclubInfo a where a.alliance_check='Y'")
	List<CountryclubInfo> findByAllianceCountryClub();
	
	@Query(value="select 'C'|| LPAD(NVL(MAX(TO_NUMBER(SUBSTR(a.countryclub_id, 3,2))), 0)+1, 3, '0') from sccountryclubinfo a ", nativeQuery = true)
	String findNextKey();
	
	/**
	 * 모바일 골프장 상세 내용을 조회한다. 
	 * 
	 * @param country_id
	 * @param zone_id
	 * @param countryclub_id
	 * @return
	 */
	@Query(value=" select                                                               " +
				"       new com.swing.saver.web.response.ResponseCountryClub (         " +
				"        a.country_id, a.zone_id, b.zone_nm, a.countryclub_id, a.countryclub_nm, " +
				"        a.hole_value, a.image, a.logo_image, a.address, a.phone, a.email, a.link_check, " +
				"        a.assets, a.simage, a.fdata, a.rsv_url, a.evt_url, a.alliance_check, a.pgm_call_param "+
				"   ) " +
				"  from CountryclubInfo a, AreaInfo b   " +
				" where                                                                " +
				"       a.country_id = b.country_id                                    " +
				"   and a.zone_id    = b.zone_id                                       " +
				"   and a.zone_id    = :zone_id                                        " +
				"   and a.countryclub_id    = :countryclub_id                                        " +
				"   and a.country_id    = :country_id                                        ")
	ResponseCountryClub findByDetail(@Param("country_id") String country_id, @Param("zone_id") String zone_id, @Param("countryclub_id") String countryclub_id);

	/**
	 * 파라미터 5개(검색조건)를 통한 데이터 조회 
	 * 
	 * @param zone_id
	 * @param country_id
	 * @param countryclub_id
	 * @param alliance_check
	 * @param word
	 * @return
	 */
	@Query(value=
			" select                                                               " +
					"       new com.swing.saver.web.response.ResponseCountryClub (         " +
					"        a.country_id, a.zone_id, b.zone_nm, a.countryclub_id, a.countryclub_nm, " +
					"        a.hole_value, a.image, a.logo_image, a.address, a.phone, a.email, a.link_check, " +
					"        a.assets, a.simage, a.fdata, a.rsv_url, a.evt_url, a.alliance_check, a.pgm_call_param "+
					"   ) " +
					"  from CountryclubInfo a, AreaInfo b   " +
					" where                                                                " +
					"       a.country_id = b.country_id                                    " +
					"   and a.zone_id    = b.zone_id                                       " +
					"   and (:zone_id is null or a.zone_id    = :zone_id  )                                      " +
					"   and (:country_id is null or a.country_id = :country_id )           " +
					"   and (:countryclub_id is null or a.countryclub_id = :countryclub_id )           " +
					"   and (:alliance_check is null or a.alliance_check = :alliance_check )                     " +					
					"   and (:word is null or a.countryclub_nm  like CONCAT(CONCAT('%',:word),'%')  )            " +
					" order by a.countryclub_nm asc                                        "
			)
	List<ResponseCountryClub> findBySearch(@Param("zone_id") String zone_id,
			@Param("country_id") String country_id, @Param("countryclub_id") String countryclub_id,
			@Param("alliance_check") String alliance_check, @Param("word") String word
			);
}
