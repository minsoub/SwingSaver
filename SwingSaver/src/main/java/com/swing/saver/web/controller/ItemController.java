package com.swing.saver.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.swing.saver.web.entity.CodeVo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.ItemVo;
import com.swing.saver.web.entity.ProVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.ItemService;
import com.swing.saver.web.service.RestService;
import com.swing.saver.web.util.UploadFileUtils;

/**
 * Item Controller classs
 * 
 * @author JMS
 *
 */
@Controller
@RequestMapping(Constant.ADMIN_PREFIX)
public class ItemController {
	private final static Logger LOGGER = LoggerFactory.getLogger(ItemController.class);
	
	@Autowired
	ItemService service;
	
	@Autowired
	RestService restService;
	
	/**
	 * 상품 등록 리스트를 조회한다. 
	 * 
	 * @param request
	 * @return
	 * @throws ApiException
	 * @throws IOException
	 */
	@GetMapping(value="/item/itemList")
	public ModelAndView  itemList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ItemController itemList Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");

    	String rtnJson = service.getItemList();
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<ItemVo> itemList = mapper.convertValue(map.get("itemList"), TypeFactory.defaultInstance().constructCollectionType(List.class, ItemVo.class));
        mv.addObject("itemList", itemList);
                
        mv.setViewName("web/admin/item/item_list");
        LOGGER.debug("==================== ItemController itemList end : ===================={}");
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
    @GetMapping(value="/item/addform")
    public ModelAndView  itemAddForm(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ItemController addform Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");

        List<ProVo> codeList = getProList();		// 프로 조회
        mv.addObject("proList", codeList);
        
        
        mv.setViewName("web/admin/item/item_reg");
        LOGGER.debug("==================== ItemController addform end : ===================={}");
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
    @PostMapping(value="/item/add")
    public ModelAndView itemAdd(ItemVo itemVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes)  throws ApiException, IOException {
        LOGGER.debug("==================== ItemController markerProAdd Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
    	Map<String, String> proParams = new HashMap<String, String>();
    	proParams.put("proid",       String.valueOf(itemVo.getProid()));
    	proParams.put("title",       itemVo.getTitle());
    	proParams.put("item_type",   itemVo.getItem_type());
    	proParams.put("price",       String.valueOf(itemVo.getPrice()));
    	//proParams.put("period",      String.valueOf(itemVo.getPeriod()));
    	proParams.put("description", itemVo.getDescription());
    	proParams.put("lessoncount", String.valueOf(itemVo.getLessoncount()));
    	proParams.put("status",      itemVo.getStatus());
    	
    	////////////////////////////////////////////////////////////////
    	String rtnJson = service.itemCreate(proParams);
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
    	mv.addObject("result", itemVo);
        mv.setViewName("web/admin/item/item_result");
        LOGGER.debug("==================== ItemController markerProAdd end : ===================={}");
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
    @GetMapping("/item/detail/{id}")
    public ModelAndView itemDetail(@PathVariable String id, HttpServletRequest request, HttpSession session) throws IOException, ApiException {
        LOGGER.debug("==================== ItemController itemDetail Strart : ===================={}");
        ModelAndView mv = new ModelAndView();
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
    	String rtnJson  = service.itemDetail(id);
        ObjectMapper mapper = new ObjectMapper();
        ItemVo item = mapper.readValue(rtnJson, ItemVo.class);
        mv.addObject("itemInfo", item);
            	
        mv.setViewName("web/admin/item/item_detail");
        LOGGER.debug("==================== ItemController itemDetail end : ===================={}");
        return mv;
    }
    
    /**
     * 제품 상세 정보 수정하기 위한 폼 호출
     * 
     * @param id
     * @param request
     * @param session
     * @param mv
     * @param redirectAttribute
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @PostMapping("/item/modify/{id}")
    public ModelAndView itemModify(@PathVariable String id, HttpServletRequest request, HttpSession session) throws IOException, ApiException {
        LOGGER.debug("==================== ItemController itemModify Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");
    	
        ModelAndView mv = new ModelAndView();
    	
    	String rtnJson  = service.itemDetail(id);
        ObjectMapper mapper = new ObjectMapper();
        ItemVo item = mapper.readValue(rtnJson, ItemVo.class);
        mv.addObject("itemInfo", item);
        
        List<ProVo> codeList = getProList();		// 프로 조회
        mv.addObject("proList", codeList);
            	
        mv.setViewName("web/admin/item/item_reg");
        LOGGER.debug("==================== ItemController itemModify end : ===================={}");
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
    @PostMapping("/item/deleteItem")
    public ModelAndView deleteItem(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("ItemController deleteItem 시작");
        String rtn = service.itemDelete(params);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("ItemController deleteItem 종료");
        return mv;
    } 
    
    /***
     * 제품 수정
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
    @PostMapping(value="/item/update")
    public ModelAndView itemUpdate(ItemVo itemVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== ItemController itemUpdate Start : ===================");
    	Map<String, String> proParams = new HashMap<String, String>();
    	proParams.put("id",          String.valueOf(itemVo.getId()));
    	proParams.put("proid",       String.valueOf(itemVo.getProid()));
    	proParams.put("title",       itemVo.getTitle());
    	proParams.put("item_type",   itemVo.getItem_type());
    	proParams.put("price",       String.valueOf(itemVo.getPrice()));
    	//proParams.put("period",      String.valueOf(itemVo.getPeriod()));
    	proParams.put("description", itemVo.getDescription());
    	proParams.put("lessoncount", String.valueOf(itemVo.getLessoncount()));
    	proParams.put("status",      itemVo.getStatus());
    	
    	String rtnJson = service.itemUpdate(proParams);
    	
    	LOGGER.debug(rtnJson);
    	
    	LOGGER.debug("==================== ItemController itemUpdate end : ===================");
    	mv.setViewName("redirect:/admin/item/itemList");
    	return mv;
    } 
    
	/**
	 * 상품 구매 리스트를 조회한다. 
	 * 
	 * @param request
	 * @return
	 * @throws ApiException
	 * @throws IOException
	 */
	@GetMapping(value="/pay/payList")
	public ModelAndView  payList(HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== ItemController payList Strart : ===================={}");
    	AdminVo loginVo = (AdminVo)request.getSession().getAttribute("login");

    	String rtnJson = service.getItemList();
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // proList => RestFul Service에서 등록한 명
        List<ItemVo> payList = mapper.convertValue(map.get("payList"), TypeFactory.defaultInstance().constructCollectionType(List.class, ItemVo.class));
        mv.addObject("payList", payList);
                
        mv.setViewName("web/admin/pay/pay_list");
        LOGGER.debug("==================== ItemController payList end : ===================={}");
        return mv;
    } 
	
    /**
     * 마켓 프로  리스트를 조회한다.
     * 
     * @return
     * @throws IOException
     * @throws ApiException
     */
    private List<ProVo> getProList() throws IOException, ApiException {

    	String rtnJson = restService.proList(); 
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<ProVo> userList = mapper.convertValue(map.get("memList"), TypeFactory.defaultInstance().constructCollectionType(List.class,ProVo.class));

        return userList;
    }
}
