package com.swing.saver.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.PayInfoVo;
import com.swing.saver.web.entity.UserVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.ItemService;
import com.swing.saver.web.service.RestService;

/**
 * Created by mycom on 2019-06-03.
 */
@Controller
@RequestMapping(Constant.WEB_PREFIX)
public class WebController {

    private final static Logger LOGGER = LoggerFactory.getLogger(WebController.class);

    @Inject
    RestService restService;
    
    @Inject
    ItemService itemService;

    @GetMapping("/mypage")
    public ModelAndView mypage(HttpSession session,ModelAndView mv) throws IOException, ApiException {
    	LOGGER.info("/mypage called..");
    	try
    	{
    		LoginVo loginVo = (LoginVo)session.getAttribute("login");
    		UserVo userVo = null;

    		String sgrpRtnJson = "";
    		long userId = loginVo.getUserid();
    		/*회원정보 조회*/
    		userVo = restService.getMemberInfo(userId);

    		mv.addObject("userInfo",userVo);

    		mv.setViewName("web/mypage_01");
    	}catch(Exception ex) {
    		ex.printStackTrace();
    		mv.setViewName("web/user/login");
    	}
        return mv;
    }
    /**
     * 개인 결제 내역 조회
     * 
     * @param session
     * @param mv
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/mypay")
    public ModelAndView mypay(HttpSession session,ModelAndView mv) throws IOException, ApiException {
    	LOGGER.info("/mypay called..");
    	try
    	{
    		LoginVo loginVo = (LoginVo)session.getAttribute("login");
    		UserVo userVo = null;

    		String sgrpRtnJson = "";
    		long userId = loginVo.getUserid();
    		
        	// 결제내역 현황 조회
        	String rtnJson1 = itemService.getPayList("P", loginVo.getUserid());  // P : 개인 회원 결제 내역 

            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> map = mapper.readValue(rtnJson1, new TypeReference<Map<String, Object>>(){});

            mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
            
            // proList => RestFul Service에서 등록한 명
            List<PayInfoVo> payList = mapper.convertValue(map.get("payList"), TypeFactory.defaultInstance().constructCollectionType(List.class,PayInfoVo.class));
            mv.addObject("payList", payList);
    		userVo = restService.getMemberInfo(userId);

    		mv.addObject("userInfo",userVo);
    		mv.setViewName("web/mypage/mypay_list");
    	}catch(Exception ex) {
    		ex.printStackTrace();
    		mv.setViewName("web/user/login");
    	}
        return mv;
    }    
    /**
     * 개인정보 보호정책
     * @param session
     * @param mv
     * @return
     * @throws IOException
     * @throws ApiException
     */
    @GetMapping("/info")
    public ModelAndView myinfo(HttpSession session,ModelAndView mv) throws IOException, ApiException {
        mv.setViewName("web/info/info01");
        return mv;
    }
    
    /**
     * 회사 정보 - 스윙세이버
     * 
     * @param session
     * @param mv
     * @return
     * @throws Exception
     */
    @GetMapping("/company")
    public ModelAndView mycompany(HttpSession session, ModelAndView mv) throws Exception {
    	mv.setViewName("web/info/company");
    	return mv;
    }
    /**
     * 골프서비스 - 서비스 소개
     * @param session
     * @param mv
     * @return
     * @throws Exception
     */
    @GetMapping("/golfService")
    public ModelAndView golfService(HttpSession session, ModelAndView mv) throws Exception {
    	mv.setViewName("web/info/golf_ser_01");;
    	return mv;
    }
    /**
     * 골프장 관제 소개
     * 
     * @param session
     * @param mv
     * @return
     * @throws Exception
     */
    @GetMapping("/golfManagement")
    public ModelAndView golfManagement(HttpSession session, ModelAndView mv) throws Exception {
    	mv.setViewName("web/info/golf");
    	return mv;
    }
    
    /**
     * 서비스 - 골프서비스 - 이용방법
     * 
     * @param session
     * @param mv
     * @return
     * @throws Exception
     */
    @GetMapping("/information")
    public ModelAndView information(HttpSession session, ModelAndView mv) throws Exception {
    	mv.setViewName("web/info/information");
    	return mv;
    }
    /**
     * 요금제 및 환불 정책
     * 
     * @param session
     * @param mv
     * @return
     * @throws Exception
     */
    @GetMapping("/fare")
    public ModelAndView fare(HttpSession session, ModelAndView mv) throws Exception {
    	mv.setViewName("web/info/fare");
    	return mv;
    }
    
    /**
     * 아이디 찾기    (/web/search/email)
     * 비밀번호 찾기 (/web/search/pw)
     * 
     * @param page
     * @return
     */
    @GetMapping("/search/{page}")
    public String search(@PathVariable String page){
        String viewPage ="";
        if(StringUtils.isEmpty(page)){
            viewPage = "index";
        }else if(page.equals("email")){			// 아이디 찾기
            viewPage = "web/user/id_search";
        }else if(page.equals("pw")){			// 비밀번호 재설정
            viewPage = "web/user/log_03_01_01";
        }else if(page.equals("pwreset")){		// 이메일 전송 완료 페이지
            viewPage = "web/user/log_03_01_02";
        }else if(page.equals("pwresetComp")){ 	// 비밀번호 재설정 완료 페이지
            viewPage = "web/user/log_03_02_02";
        }

        return viewPage;
    }
    @PostMapping("/passwordReset")
    public ModelAndView passwordReset(@RequestBody Map<String, String> params) throws JsonProcessingException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== WebController passwordReset Strart : ===================={}");
        String rtnJson = restService.passwordReset(params);
        mv.addObject("data",rtnJson);
        mv.setViewName("jsonView");
        LOGGER.debug("==================== WebController passwordReset end : ===================={}");
        return mv;
    }
    @GetMapping("/user/resetpassword/{key}")
    public ModelAndView getResetpassword(@PathVariable String key) throws IOException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== WebController getResetpassword Strart : ===================={}");
        LOGGER.debug("confirmcode : {}",key);
        LOGGER.debug("==================== WebController getResetpassword end : ===================={}");

        mv.addObject("confirmcode",key);
        mv.setViewName("web/user/log_03_02_01");

        return  mv;
    }
    @PostMapping("/user/passwordProcess")
    public ModelAndView passwordProcess(@RequestBody Map<String, String> params) throws IOException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== WebController passwordProcess Strart : ===================={}");
        String rtnJson = restService.passwordProcess(params);
        LOGGER.debug("==================== WebController passwordProcess end : ===================={}");

        mv.addObject("data",rtnJson);
        mv.setViewName("jsonView");
        return  mv;
    }
    
    /**
     * 이메일(아이디) 찾은 결과 리스트를 화면에 출력한다.
     * 
     * @param userVo
     * @param mv
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping("/emailSearch")
    public ModelAndView emailsearch(UserVo userVo, ModelAndView mv, HttpServletRequest request) throws ApiException, IOException {

        LOGGER.debug("==================== WebController emailsearch Strart : ===================={}");

        String rtnJson = restService.emailList(userVo);
        /*rtnJson="{\n" +
                "    \"emails\":[\n" +
                "        {\"email\":\"aaaa@bbb.com\"}\n" +
                "        ,{\"email\":\"aaaa3@bbb.com\"}\n" +
                "        ,{\"email\":\"aaaa4@abc.com\"}\n" +
                "    ]\n" +
                "}";*/
        LOGGER.debug("emailSearch rtn: {}",rtnJson);
        LOGGER.debug("==================== WebController emailsearch end : ===================={}");
        ObjectMapper mapper = new ObjectMapper();
        Map<Object,Object> map = new HashMap<Object, Object>();
        ArrayList list = new ArrayList();
        try {
            map = mapper.readValue(rtnJson, new TypeReference<Map<Object,Object>>(){});
            list = (ArrayList)map.get("emails");
        } catch (IOException e) {
            e.printStackTrace();
        }
        mv.addObject("emailList",list);
        mv.setViewName("web/user/id_search_result");
        return mv;
    }

    /**
     * 회원가입 페이지 연결 
     * SNS 가입과 이메일 가입을 선택할 수 있도록 한다.
     * 
     * @param loginVo
     * @param mv
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping("/user/member")
    public ModelAndView memberForm(LoginVo loginVo, ModelAndView mv, HttpServletRequest request) throws ApiException, IOException {
        mv.setViewName("web/user/prev_regForm");
        return mv;
    }
    /**
     * 사용자 등록 폼을 출력한다.
     * 
     * @param loginVo
     * @param mv
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @GetMapping("/user/register")
    public ModelAndView memberRegisterForm(LoginVo loginVo, ModelAndView mv, HttpServletRequest request) throws ApiException, IOException {
        mv.setViewName("web/user/memberRegForm");
        return mv;
    }
    
    @PostMapping("/user/join")
    public ModelAndView  memberjoin(@RequestBody Map<String, String> params) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== WebController memberjoin Strart : ===================={}");

        String rtn = restService.join(params);

        /*회원가입 메일 발송*/
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> map = mapper.readValue(rtn, new TypeReference<Map<String, String>>(){});
        if(map.get("result").equals("true") && !StringUtils.isEmpty(map.get("confirmcode"))){
            LOGGER.debug("==================== WebController emailConfirm Strart : ===================={}");
            // rtn = restService.emailConfirm(map.get("confirmcode"));
            LOGGER.debug("==================== WebController emailConfirm End : ===================={}");
        }
        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("Map Join 파라미터:{},응답:{}",params.toString(),rtn);
        LOGGER.debug("==================== WebController memberjoin end : ===================={}");
        return mv;
    }

    @GetMapping("/user/joinSuccess")
    public String  memberjoinOk() {
        return "web/user/joinResult";
    }

    /**
     * 마이페이지 정보를 수정한다. 
     * 
     * @param params
     * @param request
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping("/user/modify")
    @ResponseBody
    public ModelAndView memberModify(@RequestBody Map<String, String> params, HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== WebController memberModify Strart : ===================={}");
        LOGGER.debug("Map Join :{}",params.toString());
        String rtn = restService.modify(params);

        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("==================== WebController memberModify end : ===================={}");
        return mv;
    }

    @GetMapping("/user/emailConfirm/{key}")
    public ModelAndView emailConfirm(@PathVariable String key) throws IOException, ApiException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== WebController emailConfirm Strart : ===================={}");
        String rtn = restService.emailConfirm(key);
        LOGGER.debug("==================== WebController emailConfirm end : ===================={}");
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<String, Object>();
        map = mapper.readValue(rtn, new TypeReference<Map<String, String>>(){});

        String page = "/";
        String msg = "회원 가입이 완료 처리 되었습니다.";
        if(!"true".equals(map.get("result").toString())){
            msg = "올바른 Key값이 아닙니다.";
        }
        mv.addObject("msg",msg);
        mv.addObject("url",page);
        mv.setViewName("web/alert");

        return  mv;
    }
    
    @PostMapping("/user/profileImgInsert")
    public ModelAndView profileImgInsert(@RequestBody Map<String, String> params, HttpServletRequest request) throws ApiException, IOException {
        ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== WebController profileImgInsert Strart : ===================={}");
        LOGGER.debug("Map Join :{}",params.toString());
        String rtn = "" ;
        try {
        	rtn = restService.imgProfileInsert(params);
        }catch(Exception e) {
        	e.printStackTrace();
        }

        mv.addObject("data",rtn);
        mv.setViewName("jsonView");
        LOGGER.debug("==================== WebController profileImgInsert end : ===================={}");
        return mv;
    }
}

