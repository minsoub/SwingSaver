package com.swing.saver.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.ProVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.RestService;

@Controller
@RequestMapping(Constant.MARKET_PREFIX)
public class ProController {
	private final static Logger LOGGER = LoggerFactory.getLogger(ProController.class);
	
    @Inject
    RestService restService;
    
    /**
     * 마켓 프로 리스트를 조회한다.
     * 
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/proList")
    public ModelAndView  proList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ProController proList Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
        /*회원정보 조회*/
    	//userVo = restService.getMemberInfo(AdminVo);
        //mv.addObject("userInfo",userVo);
        
    	String rtnJson = restService.proList();   // 마켓 프로 리스트 조회
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<ProVo> proList = mapper.convertValue(map.get("proList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ProVo.class));
        mv.addObject("proList", proList);
                
        mv.setViewName("web/pro/pro_01");
        LOGGER.debug("==================== ProController proList end : ===================={}");
        return mv;
    } 
    
    /**
     * 마켓 프로 세부사항을 출력 한다
     * 
     * @param id
     * @param request
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/proDetail/{id}")
    public ModelAndView proDetail(@PathVariable String id, HttpServletRequest request, HttpSession session) throws IOException, ApiException {
        LOGGER.debug("==================== ProController proDetail Strart : ===================={}");
        ModelAndView mv = new ModelAndView();
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
    	ProVo proVo = restService.getProDetail(id);
    	
    	mv.addObject("proVo", proVo);
        mv.setViewName("web/pro/pro_02");
        LOGGER.debug("==================== ProController proDetail end : ===================={}");
        return mv;
    }
}
