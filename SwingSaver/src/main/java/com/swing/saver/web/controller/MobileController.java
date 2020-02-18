package com.swing.saver.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.MobileService;
import com.swing.saver.web.service.RestService;

/**
 * Buddya 모바일 홈페이지 Controller Class
 * 
 * @author minso
 *
 */
@Controller
@RequestMapping(Constant.MOBILE_PREFIX)
public class MobileController {
	private final static Logger LOGGER = LoggerFactory.getLogger(MobileController.class);
	
	// dispatcher-servlet.xml에 정의
    @Resource(name = "uploadDataPath")
    private String uploadPath;
    
    @Inject
    MobileService restService;
    
    @Inject
    RestService service;
    
    /**
     * Mobile Index Page
     * 골프장 추천 리스트를 조회해서 출력한다. 
     * 
     * @param request
     * @return
     */
    @GetMapping("/home")
    public ModelAndView mobileHomeForm(HttpServletRequest request) throws IOException, ApiException {    	
    	ModelAndView mv = new ModelAndView();
    	
    	String rtnJson = restService.golfRecommandList();
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
    	
    	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
    	
    	List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class, GolfVo.class));
    	mv.addObject("golfList", golfList);
    	mv.setViewName("mobile/home");
    	
    	
        return mv;
    }
    
    /**
     * 검색하기 페이지 호출
     * 
     * @param request
     * @return
     */
    @GetMapping("/search")
    public String mobileSearchForm(HttpServletRequest request) {
        return "mobile/search";
    }
    
    /**
     * 골프장 상세 정보 페이지
     * 
     * @param request
     * @return
     */
    @PostMapping("/detail")
    public ModelAndView mobileDetailForm(GolfVo vo, HttpServletRequest request,HttpSession session,ModelAndView mv,RedirectAttributes redirectAttributes) throws ApiException, IOException {    	
    	// 넘어온 키값을 골프장 상세정보를 조회한다.
    	GolfVo golfInfo = service.getGolfInfo(vo.getCountry_id(), vo.getZone_id(), vo.getCountryclub_id());  	
    	
    	mv.addObject("golfInfo", golfInfo);
    	mv.setViewName("mobile/detail");
        
    	return mv;
    }  
    
    /**
     * 버디야 즐겨찾기 
     * 
     * @param request
     * @return
     */
    @GetMapping("/bookmark")
    public String mobileBookMarkForm(HttpServletRequest request) {
        return "mobile/bookmark";
    } 
    
    
    /**
     * 버디야 둘러보기 
     * 
     * @param request
     * @return
     */
    @GetMapping("/golflist")
    public String mobileGolfList(HttpServletRequest request) {
        return "mobile/golflist";
    }    
    
    /**
     * 이미지 URL을 호출 받아서 이미지를 읽어서 리턴한다. 
     * 
     * @param request
     * @return
     * @throws IOException
     */
    @GetMapping(value="/getImage", produces=MediaType.IMAGE_JPEG_VALUE)
    public @ResponseBody byte[] getImage(HttpServletRequest request) throws IOException {
    	InputStream in = null;   // 이미지 read
    	String imageName = request.getParameter("fileName");
    	String filePath = uploadPath + File.separator + imageName;
    	
    	System.out.println("filePath : " + filePath);
    	in = new FileInputStream(filePath);
    	
    	return IOUtils.toByteArray(in);
    }
}
