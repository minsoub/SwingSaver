package com.swing.saver.web.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.AdminVo;
import com.swing.saver.web.entity.AreaVo;
import com.swing.saver.web.entity.CodeVo;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.FarVo;
import com.swing.saver.web.entity.GolfVo;
import com.swing.saver.web.entity.GroupVo;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.RestService;

import com.swing.saver.web.util.UploadFileUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.*;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

/**
 * Admin Controller classs
 * 
 * @author JMS
 *
 */
@Controller
@RequestMapping(Constant.ADMIN_PREFIX)
public class AdminController {
	private final static Logger LOGGER = LoggerFactory.getLogger(AdminController.class);
	
	// dispatcher-servlet.xml에 정의
    @Resource(name = "uploadDataPath")
    private String uploadPath;
    
    @Inject
    RestService restService;
    
    /**
     * Admin Login Form display
     * @param request
     * @return
     */
    @GetMapping("")
    public String adminLoginForm(HttpServletRequest request) {
        return "web/admin/adm_log";
    }
    /**
     * implement Admin login process.
     * @param loginVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/adminLogin")
    public ModelAndView adminLogin(AdminVo loginVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController adminLogin Start : ===================");
    	String rtnUrl = "";
    	session = request.getSession(true);
    	session.setAttribute("adminCheck", true);
    	
    	boolean authCheck = (Boolean)request.getSession().getAttribute("adminCheck");
    	if (!authCheck)
    	{
    		redirectAttributes.addFlashAttribute("adminCheck", !authCheck);
    		rtnUrl = "redirect:/admin";
    	}else {
    		loginVo = restService.adminLoginProcess(loginVo, session);
    		if (loginVo != null && "true".contentEquals(loginVo.getResult()))
    		{
    			LOGGER.debug("Admin Login success ID:{}", loginVo.getUserid());
    			session.setAttribute("login", loginVo);
    			rtnUrl = "redirect:/admin/groupList";
    		}else {
    			LOGGER.debug("Login fail : {}", loginVo.getResult());
    			
    			redirectAttributes.addFlashAttribute("returnCode", "9999");
    			rtnUrl = "redirect:/admin";
    		}
    	}
    	
    	mv.setViewName(rtnUrl);
    	LOGGER.debug("==================== AdminController adminLogin End :"+rtnUrl+" ====================");
    	return mv;
    }    
    /**
     * 그룹 리스트 조회
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/groupList")
    public ModelAndView groupList(HttpSession session)  throws IOException, ApiException {
    	LOGGER.debug("==================== AdminController groupList Start : ===================");
    	ModelAndView mv = new ModelAndView();
    	AdminVo loginVo = (AdminVo) session.getAttribute("login");
    	// 그룹관리 정보 조회
    	String rtnJson = restService.getGroupList();   // 관리자가 그룹 관리 정보 조회
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<GroupVo> groupList = mapper.convertValue(map.get("groupList"), TypeFactory.defaultInstance().constructCollectionType(List.class,GroupVo.class));

        mv.addObject("groupList", groupList);
        mv.setViewName("web/admin/adm_01");
        LOGGER.debug("==================== AdminController groupList end : ===================");
        return mv;
    }

    /**
     * 그룹 등록 화면 출력
     * @param request
     * @return
     */
    @GetMapping("/group/addform")
    public ModelAndView groupForm(HttpServletRequest request)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	// 멤버리스트 조회
    	String rtnJson = restService.getGroupAdminList();   // 등록을 위한 회원리스트 조회 (성명(메일주소), 멤버ID)
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<UserVo> memList = mapper.convertValue(map.get("memList"), TypeFactory.defaultInstance().constructCollectionType(List.class,UserVo.class));

        mv.addObject("memList", memList);
        
        // 그룹타입 코드 조회
        List<CodeVo> groupTypeList = getCodeList("gtp");
        mv.addObject("grpTypList", groupTypeList);
        
        // 1인사용 코드 조회
        List<CodeVo> useList = getCodeList("use");
        mv.addObject("useList", useList);
        
        mv.setViewName("web/admin/adm_01_01");
        
    	return mv;
    }
    /**
     * 그룹 등록 화면 출력
     * @param request
     * @return
     */
    @PostMapping("/group/modify")
    public ModelAndView modifyForm(GroupVo groupVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException 
    {
    	// 멤버리스트 조회
    	String rtnJson = restService.getGroupAdminList();   // 등록을 위한 회원리스트 조회 (성명(메일주소), 멤버ID)
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<UserVo> memList = mapper.convertValue(map.get("memList"), TypeFactory.defaultInstance().constructCollectionType(List.class,UserVo.class));

        mv.addObject("memList", memList);
        
        // 그룹타입 코드 조회
        List<CodeVo> groupTypeList = getCodeList("gtp");
        mv.addObject("grpTypList", groupTypeList);
        
        // 1인사용 코드 조회
        List<CodeVo> useList = getCodeList("use");
        mv.addObject("useList", useList);
        
        GroupVo groupInfo =  restService.getGroupInfo(Long.parseLong(groupVo.getGroupid()));   // 그룹 상세 정보 조회
        
        mv.addObject("groupInfo", groupInfo);
        
        mv.setViewName("web/admin/adm_01_02_01");
        
    	return mv;
    }    
    /**
     * 그룹 상세 정보 출력 
     * @param request
     * @return
     */
    @GetMapping("/group/{groupid}")
    public ModelAndView groupDetail(HttpServletRequest request,@PathVariable String groupid)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
        GroupVo groupInfo =  restService.getGroupInfo(Long.parseLong(groupid));   // 그룹 상세 정보 조회
        mv.addObject("groupInfo", groupInfo);
               
        mv.setViewName("web/admin/adm_01_02");
        
    	return mv;
    }
    /**
     * 그룹 등록을 처리한다.
     * 
     * @param groupVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/group/add")
    public ModelAndView groupAdd(GroupVo groupVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController groupAdd Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("groupname", groupVo.getGroupname());
    	params.put("grouptype", groupVo.getGrouptype());
    	params.put("quota",     String.valueOf(groupVo.getQuota()));
    	params.put("storagespace", String.valueOf(groupVo.getStoragespace()));
    	params.put("address", groupVo.getAddress());
    	params.put("phone", groupVo.getPhone());
    	params.put("userid", groupVo.getUserid());
    	
    	String rtnJson = restService.groupCreate(params);
    	
    	LOGGER.debug(rtnJson);
    	LOGGER.debug("==================== AdminController groupAdd end : ===================");
    	mv.setViewName("web/admin/adm_01_01_01");
    	return mv;
    }
    /**
     * 그룹 정보를 수정한다. 
     * 
     * @param groupVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/group/update")
    public ModelAndView groupUpdate(GroupVo groupVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController groupUpdate Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("id", groupVo.getGroupid());
    	params.put("groupname", groupVo.getGroupname());
    	params.put("grouptype", groupVo.getGrouptype());
    	params.put("quota",     String.valueOf(groupVo.getQuota()));
    	params.put("storagespace", String.valueOf(groupVo.getStoragespace()));
    	params.put("address", groupVo.getAddress());
    	params.put("phone", groupVo.getPhone());
    	params.put("userid", groupVo.getUserid());
    	
    	String rtnJson = restService.groupUpdate(params);
    	
    	LOGGER.debug(rtnJson);
    	
    	LOGGER.debug("==================== AdminController groupUpdate end : ===================");
    	mv.setViewName("web/admin/adm_01_01_01");
    	return mv;
    }    
    /**
     * 생성된 그룹을 삭제한다. 
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    @PostMapping("/group/deleteGroup")
    public ModelAndView deleteGroup(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("AdminController deleteGroup 시작");
        String rtn = restService.groupDelete(params);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("AdminController deleteGroup 종료");
        return mv;
    }    
    
    /**
     * 지역정보 리스트 조회
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/areaList")
    public ModelAndView areaList(HttpSession session)  throws IOException, ApiException {
    	LOGGER.debug("==================== AdminController areaList Start : ===================");
    	ModelAndView mv = new ModelAndView();
    	AdminVo loginVo = (AdminVo) session.getAttribute("login");
    	// 그룹관리 정보 조회
    	String rtnJson = restService.getAreaList();   // 관리자가 지역 정보 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<AreaVo> areaList = mapper.convertValue(map.get("areaList"), TypeFactory.defaultInstance().constructCollectionType(List.class,AreaVo.class));

        mv.addObject("areaList", areaList);
        mv.setViewName("web/admin/adm_03");
        LOGGER.debug("==================== AdminController areaList end : ===================");
        return mv;
    }
    /**
     * 지역정보 등록 화면 출력
     * @param request
     * @return
     */
    @GetMapping("/area/addform")
    public ModelAndView areaForm(HttpServletRequest request)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
        // 국가코드 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        mv.setViewName("web/admin/adm_03_01");
        
    	return mv;
    }  
    
    /**
     * 지역정보 신규 등록을 처리한다.
     * 
     * @param areaVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/area/add")
    public ModelAndView areaAdd(AreaVo areaVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController areaAdd Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("country_id", areaVo.getCountry_id());
    	params.put("zone_id", areaVo.getZone_id());
    	params.put("zone_nm",     areaVo.getZone_nm());
    	params.put("user_name", areaVo.getUser_name());
    	params.put("address", areaVo.getAddress());
    	params.put("phone", areaVo.getPhone());
    	params.put("email", areaVo.getEmail());
    	params.put("description", areaVo.getDescription());
    	
    	String rtnJson = restService.areaCreate(params);
    	
    	// 결과값에 대해서 리턴한다.
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        // key : result, error
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	areaVo.setResult(true);        	
        }else {
        	areaVo.setResult(false);
        	areaVo.setError(map.get("error").toString());
        }
        
        mv.addObject("result", areaVo);
    	LOGGER.debug("==================== AdminController areaAdd end : ===================");
    	mv.setViewName("web/admin/adm_03_01_01");
    	return mv;
    } 
    
    /**
     * 생성된 지역정보를 삭제한다. 
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    @PostMapping("/area/deleteArea")
    public ModelAndView deleteArea(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("AdminController deleteArea 시작");
        String rtn = restService.areaDelete(params);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("AdminController deleteArea 종료");
        return mv;
    }     
    /**
     * 지역정보 상세 정보 출력 
     * @param request
     * @return
     */
    @GetMapping("/area/{country_id}/{zone_id}")
    public ModelAndView areaDetail(HttpServletRequest request,@PathVariable String country_id, @PathVariable String zone_id)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	AreaVo areaInfo =  restService.getAreaInfo(country_id, zone_id);   // 지역정보 상세 정보 조회
        mv.addObject("areaInfo", areaInfo);
               
        mv.setViewName("web/admin/adm_03_02");
        
    	return mv;
    }
    
    /**
     * 지역정보 등록 화면 출력 (수정화면)
     * @param request
     * @return
     */
    @PostMapping("/area/modify")
    public ModelAndView areaModifyForm(AreaVo areaVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException 
    {
        // 국가코드 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        AreaVo areaInfo =  restService.getAreaInfo(areaVo.getCountry_id(), areaVo.getZone_id());   // 그룹 상세 정보 조회
        
        mv.addObject("areaInfo", areaInfo);
        
        mv.setViewName("web/admin/adm_03_02_01");
        
    	return mv;
    }  
    
    /**
     * 그룹 정보를 수정한다. 
     * 
     * @param groupVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/area/update")
    public ModelAndView areaUpdate(AreaVo areaVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController areaUpdate Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("country_id", areaVo.getCountry_id());
    	params.put("zone_id", areaVo.getZone_id());
    	params.put("zone_nm",     areaVo.getZone_nm());
    	params.put("user_name", areaVo.getUser_name());
    	params.put("address", areaVo.getAddress());
    	params.put("phone", areaVo.getPhone());
    	params.put("email", areaVo.getEmail());
    	params.put("description", areaVo.getDescription());
    	
    	String rtnJson = restService.areaUpdate(params);
    	
    	LOGGER.debug(rtnJson);
    	
    	LOGGER.debug("==================== AdminController areaUpdate end : ===================");
    	mv.setViewName("web/admin/adm_03_01_01");
    	return mv;
    }    
        
    /**
     * 골프장 정보 리스트 조회
     * @param session
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/golfList")
    public ModelAndView golfList(HttpSession session)  throws IOException, ApiException {
    	LOGGER.debug("==================== AdminController golfList Start : ===================");
    	ModelAndView mv = new ModelAndView();
    	AdminVo loginVo = (AdminVo) session.getAttribute("login");

    	String rtnJson = restService.getGolfList();   // 관리자가 골프장 정보 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
        
        // groupList => RestFul Service에서 등록한 명
        List<GolfVo> golfList = mapper.convertValue(map.get("golfList"), TypeFactory.defaultInstance().constructCollectionType(List.class,GolfVo.class));

        mv.addObject("golfList", golfList);
        mv.setViewName("web/admin/adm_04");
        LOGGER.debug("==================== AdminController golfList end : ===================");
        return mv;
    }    
    
    /**
     * 골프장 등록 화면 출력
     * @param request
     * @return
     */
    @GetMapping("/golf/addform")
    public ModelAndView golfForm(HttpServletRequest request)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
        // 국가코드 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        mv.setViewName("web/admin/adm_04_01");
        
    	return mv;
    }   
    
    /**
     * 지역정보 리스트 출력
     * @param request
     * @return
     */
    @GetMapping("/area/areaList/{country_id}")
    public ModelAndView areaCountryList(HttpServletRequest request,@PathVariable String country_id)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	String rtnJson=  restService.getAreaList(country_id);   // 지역정보 상세 정보 조회
    	
        mv.addObject("data", rtnJson);
        mv.setViewName("jsonView");
        
    	return mv;
    }
    
    /**
     * 골프장정보 신규 등록을 처리한다.
     * 
     * @param golfVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/golf/add")
    public ModelAndView golfAdd(GolfVo golfVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController golfAdd Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("country_id", golfVo.getCountry_id());
    	params.put("zone_id", golfVo.getZone_id());
    	params.put("countryclub_id", golfVo.getCountryclub_id());
    	params.put("countryclub_nm", golfVo.getCountryclub_nm());
    	params.put("image", "");  // file
    	params.put("assets", ""); // file
    	params.put("hole_value", String.valueOf(golfVo.getHole_value()));
    	params.put("address", golfVo.getAddress());
    	params.put("phone", golfVo.getPhone());
    	params.put("email", golfVo.getEmail());
    	params.put("description", golfVo.getDescription());
    	
    	LOGGER.debug(golfVo.getImageFile().getOriginalFilename());
    	if (!golfVo.getImageFile().isEmpty())
    	{
    		String orginFileName = golfVo.getImageFile().getOriginalFilename();
    		int index = orginFileName.lastIndexOf(".");
		    String fileExt = orginFileName.substring(index + 1);
	        String savedName = UploadFileUtils.getTimeStamp()+"."+fileExt;
	        String filePath = uploadPath + File.separator + savedName;
	        golfVo.getImageFile().transferTo(new File(filePath));
	    	String paramName = golfVo.getImageFile().getName();  // 파라미터명
	    	params.put("image", savedName);
    	}
    	if (!golfVo.getAssetsFile().isEmpty())
    	{
    		String orginFileName = golfVo.getAssetsFile().getOriginalFilename();
    		int index = orginFileName.lastIndexOf(".");
		    String fileExt = orginFileName.substring(index + 1);
	        String savedName = UploadFileUtils.getTimeStamp()+"."+fileExt;
	        String filePath = uploadPath + File.separator + savedName;
	        golfVo.getAssetsFile().transferTo(new File(filePath));
	    	String paramName = golfVo.getAssetsFile().getName();  // 파라미터명
	    	params.put("assets", savedName);
    	}

    	String rtnJson = restService.golfCreate(params);
    	
    	// 결과값에 대해서 리턴한다.
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        // key : result, error
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	golfVo.setResult(true);
        }else {
        	golfVo.setResult(false);
        	golfVo.setError(map.get("error").toString());
        }
                
        mv.addObject("result", golfVo);
    	LOGGER.debug("==================== AdminController golfAdd end : ===================");
    	mv.setViewName("web/admin/adm_04_01_01");
    	return mv;
    }   
    
    /**
     * 생성된 골프장정보를 삭제한다. 
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    @PostMapping("/golf/deleteGolf")
    public ModelAndView deleteGolf(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("AdminController deleteGolf 시작");
        String rtn = restService.golfDelete(params);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("AdminController deleteGolf 종료");
        return mv;
    } 
    
    /**
     * 골프장 상세정보 화면 출력 (수정화면)
     * @param request
     * @return
     */
    @PostMapping("/golf/modify")
    public ModelAndView golfModifyForm(GolfVo golfVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException 
    {
    	LOGGER.debug("countyry_id : " + golfVo.getCountry_id());
    	LOGGER.debug("zone_id : " + golfVo.getZone_id());
    	LOGGER.debug("countryclub_id : " + golfVo.getCountryclub_id());
    	
    	GolfVo golfInfo =  restService.getGolfInfo(golfVo.getCountry_id().trim(), golfVo.getZone_id(), golfVo.getCountryclub_id());   // 골프장정보 상세 정보 조회
        mv.addObject("golfInfo", golfInfo);

        // 국가코드 조회
        List<CodeVo> countryList = getCodeList("ctry");
        mv.addObject("countryList", countryList);
        
        mv.setViewName("web/admin/adm_04_02_01");
        
    	return mv;
    }  
    
    /**
     * 골프장  정보를 수정한다. 
     * 
     * @param golfVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/golf/update")
    public ModelAndView golfUpdate(GolfVo golfVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController golfUpdate Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("country_id", golfVo.getCountry_id());
    	params.put("zone_id", golfVo.getZone_id());
    	params.put("countryclub_id", golfVo.getCountryclub_id());
    	params.put("countryclub_nm", golfVo.getCountryclub_nm());
    	params.put("image", golfVo.getImage());
    	params.put("assets", golfVo.getAssets());
    	params.put("hole_value", String.valueOf(golfVo.getHole_value()));
    	params.put("address", golfVo.getAddress());
    	params.put("phone", golfVo.getPhone());
    	params.put("email", golfVo.getEmail());
    	params.put("description", golfVo.getDescription());
    	
    	if (!golfVo.getImageFile().isEmpty())
    	{
    		String orginFileName = golfVo.getImageFile().getOriginalFilename();
    		int index = orginFileName.lastIndexOf(".");
		    String fileExt = orginFileName.substring(index + 1);
	        String savedName = UploadFileUtils.getTimeStamp()+"."+fileExt;
	        String filePath = uploadPath + File.separator + savedName;
	        golfVo.getImageFile().transferTo(new File(filePath));
	    	String paramName = golfVo.getImageFile().getName();  // 파라미터명
	    	params.put("image", savedName);
    	}
    	if (!golfVo.getAssetsFile().isEmpty())
    	{
    		String orginFileName = golfVo.getAssetsFile().getOriginalFilename();
    		int index = orginFileName.lastIndexOf(".");
		    String fileExt = orginFileName.substring(index + 1);
	        String savedName = UploadFileUtils.getTimeStamp()+"."+fileExt;
	        String filePath = uploadPath + File.separator + savedName;
	        golfVo.getAssetsFile().transferTo(new File(filePath));
	    	String paramName = golfVo.getAssetsFile().getName();  // 파라미터명
	    	params.put("assets", savedName);
    	}
    	
    	String rtnJson = restService.golfUpdate(params);
    	
    	LOGGER.debug(rtnJson);
    	
    	LOGGER.debug("==================== golfUpdate areaUpdate end : ===================");
    	mv.setViewName("web/admin/adm_04_01_01");
    	return mv;
    }      
    
    /**
     * 골프장정보 상세 정보 출력 
     * @param request
     * @return
     */
    @GetMapping("/golf/{country_id}/{zone_id}/{countryclub_id}")
    public ModelAndView golfDetail(HttpServletRequest request,@PathVariable String country_id, @PathVariable String zone_id, @PathVariable String countryclub_id)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	GolfVo golfInfo =  restService.getGolfInfo(country_id, zone_id, countryclub_id);   // 골프장정보 상세 정보 조회
        mv.addObject("golfInfo", golfInfo);
        
    	String rtnJson = restService.getParList(countryclub_id);   // 관리자가 PAR 정보 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<FarVo> parList = mapper.convertValue(map.get("parList"), TypeFactory.defaultInstance().constructCollectionType(List.class,FarVo.class));
        mv.addObject("parList", parList);
               
        mv.setViewName("web/admin/adm_04_02");
        
    	return mv;
    }    
    
    /**
     * 골프장 Par 등록 화면 출력
     * @param request
     * @return
     */
    @GetMapping("/par/addform/{country_id}/{zone_id}/{countryclub_id}")
    public ModelAndView parForm(HttpServletRequest request, @PathVariable String country_id, @PathVariable String zone_id, @PathVariable String countryclub_id)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("country_id", country_id);
    	mv.addObject("zone_id", zone_id);
        mv.addObject("countryclub_id", countryclub_id);
        
        mv.setViewName("web/admin/adm_04_03");
        
    	return mv;
    } 
    
    /**
     * 골프장 Par 신규 등록을 처리한다.
     * 
     * @param parVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/par/add")
    public ModelAndView parAdd(FarVo parVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController parAdd Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("countryclub_id", parVo.getCountryclub_id());
    	params.put("course", parVo.getCourse());
    	params.put("course_nm", parVo.getCourse_nm());
    	params.put("hole1", String.valueOf(parVo.getHole1()));
    	params.put("hole2", String.valueOf(parVo.getHole2()));
    	params.put("hole3", String.valueOf(parVo.getHole3()));
    	params.put("hole4", String.valueOf(parVo.getHole4()));
    	params.put("hole5", String.valueOf(parVo.getHole5()));
    	params.put("hole6", String.valueOf(parVo.getHole6()));
    	params.put("hole7", String.valueOf(parVo.getHole7()));
    	params.put("hole8", String.valueOf(parVo.getHole8()));
    	params.put("hole9", String.valueOf(parVo.getHole9()));
    	    	
    	String rtnJson = restService.parCreate(params);
    	
    	// 결과값에 대해서 리턴한다.
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        // key : result, error
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	parVo.setResult(true);
        }else {
        	parVo.setResult(false);
        	parVo.setError(map.get("error").toString());
        }
        mv.addObject("result", parVo);

    	GolfVo golfInfo =  restService.getGolfInfo(parVo.getCountry_id(), parVo.getZone_id(), parVo.getCountryclub_id());   // 골프장정보 상세 정보 조회
        mv.addObject("golfInfo", golfInfo);
        
    	rtnJson = restService.getParList(parVo.getCountryclub_id());   // 관리자가 PAR 정보 조회
    	LOGGER.debug(rtnJson);
        mapper = new ObjectMapper();
        Map<String, Object> map2 = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<FarVo> parList = mapper.convertValue(map2.get("parList"), TypeFactory.defaultInstance().constructCollectionType(List.class,FarVo.class));
        mv.addObject("parList", parList);
        
    	LOGGER.debug("==================== AdminController parAdd end : ===================");
    	mv.setViewName("web/admin/adm_04_02");
    	return mv;
    }  
    
    /**
     * 골프장 Par 수정 화면 출력
     * @param request
     * @return
     */
    @GetMapping("/par/{country_id}/{zone_id}/{countryclub_id}/{course}")
    public ModelAndView parModifyForm(HttpServletRequest request, @PathVariable String country_id, @PathVariable String zone_id, @PathVariable String countryclub_id, @PathVariable String course)  throws IOException, ApiException 
    {
    	ModelAndView mv = new ModelAndView();
    	
    	FarVo parInfo =  restService.getParInfo(country_id, zone_id, countryclub_id, course);   // 골프장 Par 정보 상세 정보 조회
        mv.addObject("parInfo", parInfo);

        mv.setViewName("web/admin/adm_04_04");
        
    	return mv;
    } 
    
    /**
     * 생성된 코스정보를 삭제한다. 
     * 
     * @param params
     * @return
     * @throws JsonProcessingException
     * @throws ApiException
     */
    @PostMapping("/par/deletePar")
    public ModelAndView deletePar(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("AdminController deletePar 시작");
        String rtn = restService.parDelete(params);
        LOGGER.debug(rtn);
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("AdminController deletePar 종료");
        return mv;
    }  
    
    /**
     * 골프장  코스 정보를 수정한다. 
     * 
     * @param golfVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value="/par/update")
    public ModelAndView parUpdate( FarVo parVo, HttpServletRequest request, HttpSession session, ModelAndView mv, RedirectAttributes redirectAttributes) throws ApiException, IOException
    {
    	LOGGER.debug("==================== AdminController parUpdate Start : ===================");
    	Map<String, String> params = new HashMap<String, String>();    	
    	params.put("countryclub_id", parVo.getCountryclub_id());
    	params.put("course", parVo.getCourse());
    	params.put("course_nm", parVo.getCourse_nm());
    	params.put("hole1", String.valueOf(parVo.getHole1()));
    	params.put("hole2", String.valueOf(parVo.getHole2()));
    	params.put("hole3", String.valueOf(parVo.getHole3()));
    	params.put("hole4", String.valueOf(parVo.getHole4()));
    	params.put("hole5", String.valueOf(parVo.getHole5()));
    	params.put("hole6", String.valueOf(parVo.getHole6()));
    	params.put("hole7", String.valueOf(parVo.getHole7()));
    	params.put("hole8", String.valueOf(parVo.getHole8()));
    	params.put("hole9", String.valueOf(parVo.getHole9()));
    	
    	String rtnJson = restService.parUpdate(params);
    	
    	// 결과값에 대해서 리턴한다.
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        // key : result, error
        String result = map.get("result").toString();
        if (result.equals("true"))
        {
        	parVo.setResult(true);
        }else {
        	parVo.setResult(false);
        	parVo.setError(map.get("error").toString());
        }
        mv.addObject("result", parVo);

    	GolfVo golfInfo =  restService.getGolfInfo(parVo.getCountry_id(), parVo.getZone_id(), parVo.getCountryclub_id());   // 골프장정보 상세 정보 조회
        mv.addObject("golfInfo", golfInfo);
        
    	rtnJson = restService.getParList(parVo.getCountryclub_id());   // 관리자가 PAR 정보 조회
    	LOGGER.debug(rtnJson);
        mapper = new ObjectMapper();
        Map<String, Object> map2 = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<FarVo> parList = mapper.convertValue(map2.get("parList"), TypeFactory.defaultInstance().constructCollectionType(List.class,FarVo.class));
        mv.addObject("parList", parList);
        
    	LOGGER.debug("==================== AdminController parUpdate end : ===================");
    	mv.setViewName("web/admin/adm_04_02");
    	return mv;
    }       
    
    /**
     * 코드 정보를 조회해서 리턴한다.
     * 
     * @param groupType
     * @return
     * @throws IOException
     * @throws ApiException
     */
    private List<CodeVo> getCodeList(String groupType) throws IOException, ApiException {

    	String rtnJson = restService.getCodeList(groupType);   // 코드 정보 조회
    	LOGGER.debug(rtnJson);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);        
        // groupList => RestFul Service에서 등록한 명
        List<CodeVo> codeList = mapper.convertValue(map.get("codeList"), TypeFactory.defaultInstance().constructCollectionType(List.class,CodeVo.class));

        return codeList;
    }
    
     
    
}
