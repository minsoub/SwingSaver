package com.swing.saver.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.GroupVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.ProVo;
import com.swing.saver.web.entity.UserVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.CodeVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.RestService;

/**
 * 마켓 프로 Controller 클래스
 * 
 * @author hist
 *
 */
@Controller
@RequestMapping(Constant.ADMIN_PREFIX)
public class MarketController extends CommonController {
	private final static Logger LOGGER = LoggerFactory.getLogger(MarketController.class);
	
    @Inject
    RestService restService;
    
	/**
	 * 마켓 프로 리스트 조회
	 * 
	 * @param request
	 * @return
	 * @throws ApiException
	 * @throws IOException
	 */
    @GetMapping(value="/market/proList")
    public ModelAndView  marketProGetList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== MarketController marketProGetList Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
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
                
        mv.setViewName("web/admin/pro/adm_pro_01");
        LOGGER.debug("==================== MarketController marketProGetList end : ===================={}");
        return mv;
    } 
    /**
     * 마켓 프로 등록 폼
     * 
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/market/addform")
    public ModelAndView  marketProAddForm(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== MarketController marketProAddForm Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
        // 공통코드 조회
        List<CodeVo> codeList = getCodeList("lbl");		// 프로레벨 조회
        mv.addObject("lblList", codeList);
        
        // 사용자 정보 조회
        List<UserVo> userList = getProUnUserList();		// 사용자 조회
        mv.addObject("userList", userList);
        
        mv.setViewName("web/admin/pro/adm_pro_01_01");
        LOGGER.debug("==================== MarketController marketProAddForm end : ===================={}");
        return mv;
    }
    /**
     * 마켓 프로 저장
     * 
     * @param proVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/market/proAdd")
    public ModelAndView markerProAdd(ProVo proVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes)  throws ApiException, IOException {
        LOGGER.debug("==================== MarketController markerProAdd Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
    	Map<String, String> proParams = new HashMap<String, String>();
    	proParams.put("id", proVo.getId());
    	proParams.put("userid", proVo.getUserid());
    	proParams.put("lessonprice", proVo.getLessonprice());
    	proParams.put("level", proVo.getLevel());
    	proParams.put("profile", proVo.getProfile());
    	proParams.put("description", proVo.getDescription());
    	////////////////////////////////////////////////////////////////
    	String rtnJson = restService.marketProCreate(proParams);
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	proVo.setResult(true);
        }else {
        	proVo.setResult(false);
        }
    	
        mv.setViewName("web/admin/pro/adm_pro_01_01_01");
        LOGGER.debug("==================== MarketController markerProAdd end : ===================={}");
        return mv;
    }
    /**
     * 상세 정보를 출력한다. 
     * 
     * @param id
     * @param request
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/market/proDetail/{id}")
    public ModelAndView proDetail(@PathVariable String id, HttpServletRequest request, HttpSession session) throws IOException, ApiException {
        LOGGER.debug("==================== MarketController proDetail Strart : ===================={}");
        ModelAndView mv = new ModelAndView();
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
    	ProVo proVo = restService.getProDetail(id);
    	
    	mv.addObject("proVo", proVo);
        mv.setViewName("web/admin/pro/adm_pro_01_02");
        LOGGER.debug("==================== MarketController proDetail end : ===================={}");
        return mv;
    }
    /**
     * 마켓 프로 상세 정보 수정하기 위한 폼 호출
     * 
     * @param proVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttribute
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @PostMapping("/market/proModify")
    public ModelAndView proModify(ProVo proVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttribute) throws IOException, ApiException {
        LOGGER.debug("==================== MarketController proModify Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
    	ProVo detailVo = restService.getProDetail(proVo.getId());    	
    	mv.addObject("proVo", detailVo);
    	
        // 공통코드 조회
        List<CodeVo> codeList = getCodeList("lbl");		// 프로레벨 조회
        mv.addObject("lblList", codeList);
        
        mv.setViewName("web/admin/pro/adm_pro_01_02_01");
        LOGGER.debug("==================== MarketController proDetail end : ===================={}");
        return mv;
    }
    /**
     * 마켓 프로 삭제
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    @PostMapping("/market/deletePro")
    public ModelAndView deletePro(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("MarketController deletePro 시작");
        String rtn = restService.proDelete(params);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("MarketController deletePro 종료");
        return mv;
    } 
    /***
     * 마켓 프로 수정
     * 
     * @param proVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/market/update")
    public ModelAndView proUpdate(ProVo proVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== MarketController proUpdate Start : ===================");
    	Map<String, String> proParams = new HashMap<String, String>();
    	proParams.put("id", proVo.getId());
    	proParams.put("userid", proVo.getUserid());
    	proParams.put("lessonprice", proVo.getLessonprice());
    	proParams.put("level", proVo.getLevel());
    	proParams.put("profile", proVo.getProfile());
    	proParams.put("description", proVo.getDescription());
    	
    	String rtnJson = restService.proUpdate(proParams);
    	
    	LOGGER.debug(rtnJson);
    	
    	LOGGER.debug("==================== MarketController proUpdate end : ===================");
    	mv.setViewName("redirect:/admin/market/proList");
    	return mv;
    } 
    
}
