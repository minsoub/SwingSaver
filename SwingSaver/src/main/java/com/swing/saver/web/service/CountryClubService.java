package com.swing.saver.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swing.saver.web.domain.CountryclubInfo;
import com.swing.saver.web.repository.CountryClubInfoRepository;
import com.swing.saver.web.response.ResponseCountryClub;
import com.swing.saver.web.response.ResponseCountryClubData;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CountryClubService {

	@Autowired
	private CountryClubInfoRepository repository;
	
		
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
	
}
