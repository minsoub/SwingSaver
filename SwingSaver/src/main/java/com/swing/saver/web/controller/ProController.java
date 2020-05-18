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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.ItemVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.ProVo;
import com.swing.saver.web.entity.SubGroupVo;
import com.swing.saver.web.entity.UserVo;
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
    @GetMapping(value="/item/list")
    public ModelAndView  itemList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ProController itemList Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");	// 세션에 그룹아이디가 포함되어 있다.
    	
        // 현재 회원수와 등록가능회원수 조회 : 용도에 대한 정의 필요
    	
    	// 등록한 상품 리스트 조회
    	String rtnJson1 = itemService.getItemListById(loginVo.getUserid());

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson1, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<ItemVo> itemList = mapper.convertValue(map.get("itemList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ItemVo.class));
        mv.addObject("itemList", itemList);
                
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
    @GetMapping(value="/item/Addform")
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
        LOGGER.debug("==================== ItemController save Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
    	Map<String, String> proParams = new HashMap<String, String>();
    	proParams.put("proid",       String.valueOf(itemVo.getProid()));	// 현재 사용자의 마켓 프로  Key (DB에서 구해야 한다)
    	proParams.put("title",       itemVo.getTitle());
    	proParams.put("description", itemVo.getDescription());
    	proParams.put("price",       String.valueOf(itemVo.getPrice()));    	
    	proParams.put("item_type",   itemVo.getItem_type());
    	proParams.put("status",      "Y");
    	proParams.put("userid",      String.valueOf(loginVo.getUserid()));  
    	proParams.put("lessoncount", String.valueOf(itemVo.getLessoncount()));    	
    	if (itemVo.getItem_type().equals("1"))
    	{
        	proParams.put("quota",      String.valueOf(itemVo.getQuota()));
        	proParams.put("startdate",   itemVo.getStartdate().replace("-", "").replace("-", ""));
        	proParams.put("enddate",      itemVo.getEnddate().replace("-", "").replace("-", ""));       		
    	}else {
        	proParams.put("expiryperiod",      String.valueOf(itemVo.getExpiryperiod()));    	
        		
    	}
 	
    	// 월정액 레슨상품/아카데미인 경우 그룹아이디/서브그룹아이디가 필요한다.
    	proParams.put("groupid",         itemVo.getGroupid());
    	proParams.put("subgroupid",      itemVo.getSubgroupid());
    	////////////////////////////////////////////////////////////////
    	String rtnJson = itemService.itemCreate(proParams);
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	itemVo.setResult(true);
        }else {
        	itemVo.setResult(false);
        }
    	//mv.addObject("result", itemVo);
        mv.setViewName("redirect:/market/item/list");
        LOGGER.debug("==================== ItemController save end : ===================={}");
        return mv;
    }
    
    /**
     * 상품 세부사항을 출력 한다
     * 
     * @param id
     * @param request
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/item/detail")
    public ModelAndView itemDetail(ItemVo itemVo, HttpServletRequest request, HttpSession session) throws IOException, ApiException {
        LOGGER.debug("==================== ProController itemDetail Strart : ===================={}");
        ModelAndView mv = new ModelAndView();
        LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
    	// 등록한 상품 리스트 조회
    	String rtnJson = itemService.itemDetail(itemVo.getId(), itemVo.getItem_type());

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        ItemVo item = mapper.readValue(rtnJson, ItemVo.class);

        mv.addObject("info", item);
        
        mv.setViewName("web/market/item_detail");
        LOGGER.debug("==================== ProController itemDetail end : ===================={}");
        return mv;
    }
    
    /**
     * 제품 삭제
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    @PostMapping("/item/delete")
    public ModelAndView deleteItem(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("ItemController deleteItem 시작");
        String rtn = itemService.itemDelete(params);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("ItemController deleteItem 종료");
        return mv;
    } 
    
    /**
     * 상품 수정폼을 보여준다.
     * 
     * @param id
     * @param request
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @PostMapping("/item/modify")
    public ModelAndView itemModify(ItemVo itemVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws IOException, ApiException {
        LOGGER.debug("==================== ProController modify Strart : ===================={}");        
        LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
    	// 등록한 상품 리스트 조회
    	String rtnJson = itemService.itemDetail(itemVo.getId(), itemVo.getItem_type());

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        ItemVo item = mapper.readValue(rtnJson, ItemVo.class);

        mv.addObject("info", item);
        
        mv.setViewName("web/market/item_modify");
        LOGGER.debug("==================== ProController modify end : ===================={}");
        return mv;
    }  
    
    /**
     * 상품 정보를 수정한다
     * 
     * @param id
     * @param request
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @PostMapping("/item/update")
    public ModelAndView itemUpdate(ItemVo itemVo, HttpServletRequest request, HttpSession session) throws IOException, ApiException {
        LOGGER.debug("==================== ProController itemUpdate Strart : ===================={}");
        ModelAndView mv = new ModelAndView();
        LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
       	Map<String, String> proParams = new HashMap<String, String>();
       	proParams.put("id",          String.valueOf(itemVo.getId()));
    	proParams.put("proid",       String.valueOf(itemVo.getProid()));	// 현재 사용자의 마켓 프로  Key (DB에서 구해야 한다)
    	proParams.put("title",       itemVo.getTitle());
    	proParams.put("description", itemVo.getDescription());
    	proParams.put("price",       String.valueOf(itemVo.getPrice()));    	
    	proParams.put("item_type",   itemVo.getItem_type());    	  	
    	proParams.put("lessoncount", String.valueOf(itemVo.getLessoncount()));
    	proParams.put("status",      itemVo.getStatus());
    	proParams.put("userid",      String.valueOf(loginVo.getUserid()));
    	if (itemVo.getItem_type().equals("1"))
    	{
        	proParams.put("quota",      String.valueOf(itemVo.getQuota()));
        	proParams.put("startdate",   itemVo.getStartdate().replace("-", "").replace("-", ""));
        	proParams.put("enddate",      itemVo.getEnddate().replace("-", "").replace("-", ""));       		
    	}else {
        	proParams.put("expiryperiod",      String.valueOf(itemVo.getExpiryperiod()));    	        	   		
    	}
    	// 월정액 레슨상품/아카데미인 경우 그룹아이디/서브그룹아이디가 필요한다.
    	proParams.put("groupid",         itemVo.getGroupid());
    	proParams.put("subgroupid",      itemVo.getSubgroupid());
    	////////////////////////////////////////////////////////////////
    	String rtnJson = itemService.itemUpdate(proParams);
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	itemVo.setResult(true);
        }else {
        	itemVo.setResult(false);
        }
    	//mv.addObject("result", itemVo);
        mv.setViewName("redirect:/market/item/list");
        LOGGER.debug("==================== ItemController save end : ===================={}");
        return mv;
    }     
    
    /**
     * 프로의 마켓  클래스 리스트를 조회한다.
     * 
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping(value="/class/list")
    public ModelAndView  classList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ProController classList Strart : ===================={}");
    	LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");	// 세션에 그룹아이디가 포함되어 있다.
    	
        // 현재 회원수와 등록가능회원수 조회 : 용도에 대한 정의 필요
    	
    	// 등록한 상품 리스트 조회
    	String rtnJson1 = itemService.getClassList(loginVo.getUserid(), loginVo.getGroupid());

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson1, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<SubGroupVo> classList = mapper.convertValue(map.get("classList"), TypeFactory.defaultInstance().constructCollectionType(List.class,SubGroupVo.class));
        mv.addObject("classList", classList);
                
        mv.setViewName("web/market/class_list");
        LOGGER.debug("==================== ProController classList end : ===================={}");
        return mv;
    }  
    
    /**
     * 클래스 상세 정보를 본다. (멤버 포함)
     * 
     * @param id
     * @param request
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/class/detail")
    public ModelAndView classDetail(SubGroupVo itemVo, HttpServletRequest request, HttpSession session) throws IOException, ApiException {
        LOGGER.debug("==================== ProController itemDetail Strart : ===================={}");
        ModelAndView mv = new ModelAndView();
        LoginVo loginVo = (LoginVo)request.getSession().getAttribute("login");
    	
        ObjectMapper mapper = new ObjectMapper();

        /*서브그룹 정보 및 멤버 정보 조회*/
        String rtnJson2 = restService.getSubGroupMembers(itemVo.getId());
        Map<String, Object> map2 = mapper.readValue(rtnJson2, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);  
        
        LOGGER.debug("GroupController Map : {}",map2.toString());
        mv.addObject("subGroupInfo",map2);

        mv.setViewName("web/market/class_detail");
        LOGGER.debug("==================== ProController itemDetail end : ===================={}");
        return mv;
    }
        
}
