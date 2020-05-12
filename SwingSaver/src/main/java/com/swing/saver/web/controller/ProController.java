package com.swing.saver.web.controller;

import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.ItemVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.ProVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.ItemService;
import com.swing.saver.web.service.RestService;

@Controller
@RequestMapping(Constant.MARKET_PREFIX)
public class ProController {
	private final static Logger LOGGER = LoggerFactory.getLogger(ProController.class);
	
    @Inject
    RestService restService;
    
    @Inject
    ItemService itemService;
    
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
    	//LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
        /*회원정보 조회*/
    	//userVo = restService.getMemberInfo(AdminVo);
        //mv.addObject("userInfo",userVo);
        
    	String rtnJson1 = restService.proList("0");   // 마켓 프로 리스트 조회
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson1, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<ProVo> proList1 = mapper.convertValue(map.get("proList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ProVo.class));
        mv.addObject("proList1", proList1);
        mv.addObject("proCount1", proList1.size());
        
        
    	String rtnJson2 = restService.proList("1");   // 마켓 프로 리스트 조회
        ObjectMapper mapper2 = new ObjectMapper();
        Map<String, Object> map2 = mapper2.readValue(rtnJson2, new TypeReference<Map<String, Object>>(){});

        mapper2.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<ProVo> proList2 = mapper2.convertValue(map2.get("proList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ProVo.class));
        mv.addObject("proList2", proList2);
        mv.addObject("proCount2", proList2.size());
                
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
        //LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
    	ProVo proVo = restService.getProDetail(id);
    	
    	mv.addObject("proVo", proVo);
        mv.setViewName("web/pro/pro_02");
        LOGGER.debug("==================== ProController proDetail end : ===================={}");
        return mv;
    }
    
    
    /**
     * 프로의 마켓 상품관리 리스트를 조회한다.
     * 
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/itemList")
    public ModelAndView  itemList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ProController itemList Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
        // 현재 회원수와 등록가능회원수 조회 : 용도에 대한 정의 필요
    	
    	// 등록한 상품 리스트 조회
    	String rtnJson1 = itemService.getItemListById(loginVo.getUserid());

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson1, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<ItemVo> itemList = mapper.convertValue(map.get("itemList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ItemVo.class));
        mv.addObject("proList1", itemList);
                
        mv.setViewName("web/market/item_list");
        LOGGER.debug("==================== ProController itemList end : ===================={}");
        return mv;
    } 
    
    /**
     * 상품 등록 폼
     * 
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/itemAddform")
    public ModelAndView  itemAddForm(HttpServletRequest request, HttpSession session) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ProController itemAddform Strart : ===================={}");
        
        // 그룹 아이디와 서브그룹 아이디를 구해야 한다. 
        LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
        String groupid = loginVo.getGroupid();
        
        mv.setViewName("web/market/item_reg");
        LOGGER.debug("==================== ProController itemAddform end : ===================={}");
        return mv;
    }
    
    /**
     * 상품신규 저장
     * 
     * @param itemVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/item/save")
    public ModelAndView itemAdd(ItemVo itemVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes)  throws ApiException, IOException {
        LOGGER.debug("==================== ItemController markerProAdd Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
    	Map<String, String> proParams = new HashMap<String, String>();
    	proParams.put("proid",       String.valueOf(itemVo.getProid()));	// 현재 사용자의 마켓 프로  Key (DB에서 구해야 한다)
    	proParams.put("title",       itemVo.getTitle());
    	proParams.put("description", itemVo.getDescription());
    	proParams.put("price",       String.valueOf(itemVo.getPrice()));    	
    	proParams.put("item_type",   itemVo.getItem_type());    	
    	proParams.put("expiryperiod",      String.valueOf(itemVo.getExpiryperiod()));    	
    	proParams.put("lessoncount", String.valueOf(itemVo.getLessoncount()));
    	proParams.put("status",      itemVo.getStatus());
    	
    	// 월정액 레슨상품/아카데미인 경우 그룹아이디/서브그룹아이디가 필요한다.
    	proParams.put("groupid",         itemVo.getGroupid());
    	proParams.put("subgroupid",      itemVo.getSubgroupid());
//    	////////////////////////////////////////////////////////////////
//    	String rtnJson = service.itemCreate(proParams);
//    	LOGGER.debug(rtnJson);
//        ObjectMapper mapper = new ObjectMapper();
//        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
//        
//        String result = map.get("result").toString();
//        if (result.equals("true"))
//        {
//        	itemVo.setResult(true);
//        }else {
//        	itemVo.setResult(false);
//        }
//    	mv.addObject("result", itemVo);
//        mv.setViewName("web/admin/item/item_result");
        LOGGER.debug("==================== ItemController markerProAdd end : ===================={}");
        return mv;
    }
}
