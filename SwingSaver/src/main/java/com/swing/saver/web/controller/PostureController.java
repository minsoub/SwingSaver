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
import com.swing.saver.web.service.MobileService;
import com.swing.saver.web.service.RestService;

@Controller
@RequestMapping(Constant.POSTURE_PREFIX)
public class PostureController {
	private final static Logger LOGGER = LoggerFactory.getLogger(PostureController.class);
	
	// dispatcher-servlet.xml에 정의
    @Resource(name = "uploadDataPath")
    private String uploadPath;
    
    @Inject
    MobileService restService;
    
    @Inject
    RestService service;
    
    /**
     * Posture Main
     * @param request
     * @return
     */
    @GetMapping("/golf")
    public String adminLoginForm(HttpServletRequest request) {
    
    
    
        return "mobile/posture/main";
    }
}
