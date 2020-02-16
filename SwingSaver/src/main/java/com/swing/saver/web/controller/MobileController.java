package com.swing.saver.web.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.swing.saver.web.entity.Constant;
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
    RestService restService;
    
    /**
     * Mobile Index Page
     * 
     * @param request
     * @return
     */
    @GetMapping("/home")
    public String mobileHomeForm(HttpServletRequest request) {
        return "mobile/home";
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
    @GetMapping("/detail")
    public String mobileDetailForm(HttpServletRequest request) {
        return "mobile/detail";
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
}
