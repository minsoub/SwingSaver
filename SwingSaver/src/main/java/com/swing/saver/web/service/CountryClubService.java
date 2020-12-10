package com.swing.saver.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swing.saver.web.domain.CountryclubInfo;
import com.swing.saver.web.domain.CountryclubInfoPK;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.repository.CountryClubInfoRepository;
import com.swing.saver.web.response.ResponseCountryClub;
import com.swing.saver.web.response.ResponseCountryClubData;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CountryClubService {

	private final static Logger LOGGER = LoggerFactory.getLogger(CountryClubService.class);
	
	@Autowired
	private CountryClubInfoRepository repository;
	
	@Autowired
	private EntityManagerFactory emf;	
	
	/**
	 * countryclub_id를 가지고 골프장 상세 정보를 조회한다. 
	 * 
	 * @param countryclub_id
	 * @return
	 */
	public ResponseCountryClub findByCountryClub(String countryclub_id)
	{
		CountryclubInfo info =  repository.findByCountryClub(countryclub_id);
		
		ResponseCountryClub club = ResponseCountryClub.builder().info(info).build();		
		return club;
	}
	
	/**
	 * Key로 데이터를 찾아서 리턴한다. 
	 * 
	 * @param country_id
	 * @param zone_id
	 * @param countryclub_id
	 * @return
	 */
	public ResponseCountryClub findById(String country_id, String zone_id, String countryclub_id)
	{
		CountryclubInfoPK pk = CountryclubInfoPK.builder()
								.country_id(country_id)
								.zone_id(zone_id)
								.countryclub_id(countryclub_id)
								.build();
		LOGGER.debug("pk => " + pk.toString());
		CountryclubInfo info = repository.findOne(pk);
		
		ResponseCountryClub club = ResponseCountryClub.builder().info(info).build();		
		return club;
	}
	
	
	
	/**
	 * 골프장 리스트를 이름으로 검색해서 리턴한다. 
	 * 
	 * @param countryclub_nm
	 * @return
	 */
	// public List<ResponseCountryClubData> findByLikeName(String countryclub_nm) throws JsonProcessingException, ParseException
	public String findByLikeName(String countryclub_nm) throws JsonProcessingException, ParseException
	{
		List<CountryclubInfo> list = repository.findByLikeName(countryclub_nm);
		List<ResponseCountryClubData> resList = new ArrayList<ResponseCountryClubData>();
		
		for (CountryclubInfo info: list)
		{
			ResponseCountryClubData data = ResponseCountryClubData.builder().data(info).build();
			resList.add(data);
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(resList);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(json);
		JSONArray jsonObj = (JSONArray) obj;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", jsonObj);

		JSONObject jsonObject1 = new JSONObject();
		jsonObject1.put("more", false);
		map.put("pagination", jsonObject1);
		
		String result = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		
		return result;		
	}
	/**
	 * 골프장 제휴 리스트를 조회한다. 
	 * 
	 * @return
	 * @throws JsonProcessingException
	 * @throws ParseException
	 */
	public List<ResponseCountryClub> findByAllianceCountryClub() 
	{
		List<CountryclubInfo> list = repository.findByAllianceCountryClub();
		
		List<ResponseCountryClub> clubList = new ArrayList<ResponseCountryClub>();
		
		for (CountryclubInfo info : list)
		{
			ResponseCountryClub club = ResponseCountryClub.builder().info(info).build();
			clubList.add(club);
		}
		return clubList;
	}	
	/**
	 * 골프장 전체 리스트 조회
	 * 
	 * @return
	 */
	public List<ResponseCountryClub> findAll()
	{
		List<CountryclubInfo> list = repository.findAll();
		
		List<ResponseCountryClub> clubList = new ArrayList<ResponseCountryClub>();
		
		for (CountryclubInfo info : list)
		{
			ResponseCountryClub club = ResponseCountryClub.builder().info(info).build();
			clubList.add(club);
		}
		return clubList;
	}
	/**
	 * 데이터베이스에 골프장 정보를 저장한다. 
	 * 
	 * @param info
	 * @return
	 */
	@Transactional
	public CountryclubInfo save(GolfVo data) {	
		
		// 신규 생성이므로 key를 생성해야 한다. 
		LOGGER.debug("countryclub_id : " + data.getCountryclub_id());
		if (data.getCountryclub_id() == null || data.getCountryclub_id().length() == 0)
		{
			String key = repository.findNextKey();
			LOGGER.debug("countryclub_id : " + key);
			data.setCountryclub_id(key);
		}
		CountryclubInfo entity = CountryclubInfo.builder().data(data).build();	
		
		return repository.save(entity);
	}
	
	/**
	 * 버디야 Find 페이지 검색 
	 * 
	 * @param param
	 * @return
	 */
	public List<ResponseCountryClub> findByAreaySearch(Map<String, String> param)
	{
		EntityManager em = emf.createEntityManager();
		
		TypedQuery <ResponseCountryClub> query = em.createQuery(
				" select                                                               " +
				"       new com.swing.saver.web.response.ResponseCountryClub (         " +
				"        a.country_id, a.zone_id, b.zone_nm, a.countryclub_id, a.countryclub_nm, " +
				"        a.hole_value, a.image, a.address, a.phone, a.email, a.link_check, " +
				"        a.assets, a.simage, a.fdata, a.rsv_url, a.evt_url, a.alliance_check, a.pgm_call_param, c.received, c.duedate "+
				"   ) " +
				"  from CountryclubInfo a, AreaInfo b  LEFT JOIN a.arPerson c " +
				// "       on a.country_id=c.country_id and a.zone_id = c.zone_id and a.countryclub_id = c.countryclub_id and c.p_type='A' and c.received='Y' and c.userid=:userid  " +
				"       on c.p_type='A' and c.received='Y' and c.userid=:userid  " +
				" where                                                                " +
				"       a.country_id = b.country_id                                    " +
				"   and a.zone_id    = b.zone_id                                       " +
				"   and (:alliance_check is null or a.alliance_check = :alliance_check )                            " +
				"   and (:zone_id is null or a.zone_id    = :zone_id  )                                      " +
				" order by a.countryclub_nm asc                                        "
				,
				ResponseCountryClub.class);
		
		query.setParameter("userid",  Integer.parseInt(param.get("userid").toString()));
		query.setParameter("alliance_check", param.get("alliance_check"));
		query.setParameter("zone_id",  param.get("zone_id"));
		
		List<ResponseCountryClub> list = query.getResultList();
		em.close();
		
		return list;
	}
	
	/**
	 * 버디야 Find 페이지 검색 
	 * 
	 * @param param
	 * @return
	 */
	public List<ResponseCountryClub> findByBookmarkSearch(Map<String, String> param)
	{
		EntityManager em = emf.createEntityManager();
		
		TypedQuery <ResponseCountryClub> query = em.createQuery(
				" select                                                               " +
				"       new com.swing.saver.web.response.ResponseCountryClub (         " +
				"        a.country_id, a.zone_id, b.zone_nm, a.countryclub_id, a.countryclub_nm, " +
				"        a.hole_value, a.image, a.address, a.phone, a.email, a.link_check, " +
				"        a.assets, a.simage, a.fdata, a.rsv_url, a.evt_url, a.alliance_check, a.pgm_call_param "+
				"   ) " +
				"  from CountryclubInfo a, AreaInfo b   " +
				" where                                                                " +
				"       a.country_id = b.country_id                                    " +
				"   and a.zone_id    = b.zone_id                                       " +
				"   and (:alliance_check is null or a.alliance_check = :alliance_check )                            " +
				"   and (:zone_id is null or a.zone_id    = :zone_id  )                                      " +
				" order by a.countryclub_nm asc                                        "
				,
				ResponseCountryClub.class);
		
		query.setParameter("alliance_check", param.get("alliance_check"));
		query.setParameter("zone_id",  param.get("zone_id"));
		
		List<ResponseCountryClub> list = query.getResultList();
		em.close();
		
		return list;
	}
}
