package com.swing.saver.web.controller;

import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.entity.QRInfoVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.RestService;
import com.swing.saver.web.util.CommonUtil;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by mycom on 2019-06-04.
 */
@Controller
@RequestMapping(Constant.ROOT_PREFIX)
public class LoginController {
    private final static Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @Inject
    RestService restService;

    /**
     * 메인 페이지 접속 
     * 
     * @param mv
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping("/")
    public ModelAndView index(ModelAndView mv, HttpServletRequest request) throws Exception {
        LOGGER.info("==================== LoginController index Strart : ====================");
        LoginVo loginVo = (LoginVo) request.getSession().getAttribute("login");

        mv.addObject("isLogin", loginVo.getResult());
        mv.setViewName("/index");
        return mv;
    }

    /**
     * 로그인 페이지 호출
     * 
     * @param request
     * @param session
     * @return
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping("/loginForm")
    public ModelAndView loginForm(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
    	ModelAndView mv = new ModelAndView();
    	String prev_url = null;
        if (session.getAttribute("redirectUrl") != null)
        {
        	prev_url = (String) session.getAttribute("redirectUrl");
        	
        	mv.addObject("prev_url", "redirect:"+prev_url);
        	LOGGER.debug("redirectUrl is "+ prev_url);
        }else {
        	mv.addObject("prev_url", "");
        }
        
    	
    	
    	// 토큰 생성 
    	SecureRandom random = new SecureRandom();
    	String state = new BigInteger(130, random).toString(32);
    	
    	String naverUrl = URLEncoder.encode(CommonUtil.naverReturUrl, "UTF-8");
    	String kakaoUrl = URLEncoder.encode(CommonUtil.kakaoReturnUrl, "UTF-8");
    	String facebookUrl = URLEncoder.encode(CommonUtil.facebookReturnUrl, "UTF-8");
    	mv.addObject("naverUrl", naverUrl);
    	mv.addObject("kakaoUrl", kakaoUrl);
    	mv.addObject("facebookUrl", facebookUrl);
    	mv.addObject("naverId", CommonUtil.naverClientId);
    	mv.addObject("kakaoId", CommonUtil.kakaoClientId);
    	mv.addObject("facebookId", CommonUtil.facebookClientId);
    	
    	
    	mv.addObject("state", state);
    	mv.setViewName("web/user/login");
    	
    	session.setAttribute("state", state);    	
    	return mv;
    }
    /**
     * Naver Login 리턴 
     * 
     * @param request
     * @param session
     * @return
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping(value = "/naverLoginReturn")
    public ModelAndView naverLoginReturn(HttpServletRequest request,HttpSession session,ModelAndView mv,RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
        String rtnUrl = "";
        QRInfoVo qrInfo = null;
        String redirectUrl = null;
        
        //qrInfo = (QRInfoVo) session.getAttribute("qrInfo");
        if (session.getAttribute("qrInfo") == null)
        {
        	LOGGER.debug("qrInfo is null....");
        }else {
        	LOGGER.debug("qrInfo is not null....");
        	qrInfo = (QRInfoVo) request.getSession().getAttribute("qrInfo"); 
        	LOGGER.debug(qrInfo.getCountryclub_id());
        	//session.invalidate();
        }
        if (session.getAttribute("redirectUrl") != null)
        {
        	redirectUrl = "redirect:"+(String) session.getAttribute("redirectUrl");
        }   	
        
        String clientId = CommonUtil.naverClientId;		    //애플리케이션 클라이언트 아이디값";
        String clientSecret = CommonUtil.naverKey;		    //애플리케이션 클라이언트 시크릿값";
        String code  = request.getParameter("code");		//발급받은 코드
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode(CommonUtil.naverReturUrl, "UTF-8");
        String apiURL;
        apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
        apiURL += "client_id=" + clientId;
        apiURL += "&client_secret=" + clientSecret;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&code=" + code;
        apiURL += "&state=" + state;
        String access_token = "";
        String refresh_token = "";
        System.out.println("apiURL="+apiURL);
        
        try 
        {        	
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.print("responseCode="+responseCode);
            if(responseCode==200) { // 정상 호출
              br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
              br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
              res.append(inputLine);
            }
            br.close();
            if(responseCode==200) {
            	System.out.println(res.toString());            	         
            	//responseCode=200{"access_token":"AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI","refresh_token":"RisYjIIocPG08KrkUv3FMrjI0wuZv0epipRluUFV3SRiiyxN5xB6keNmqMIq0UipsnZtoMXTJisR4YJpHj0K5e83XLPLCApv5isaloCisHJ048KXWPRYI5giim2K8H4wGmsUipUsn","token_type":"bearer","expires_in":"3600"}
            	JSONParser parser = new JSONParser();
            	Object obj = parser.parse(res.toString());
            	JSONObject jsonObj = (JSONObject) obj;
            	
            	System.out.println(jsonObj.toString());
            	System.out.println(jsonObj.get("access_token"));
            	access_token = (String)jsonObj.get("access_token"); 
            	refresh_token = (String)jsonObj.get("refresh_token");
            	
            	// 사용자 정보를 가져온다.
            	String token = access_token; 		// 네이버 로그인 접근 토큰;
                String header = "Bearer " + token;  // Bearer 다음에 공백 추가

                String apiProfileURL = "https://openapi.naver.com/v1/nid/me";

                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put("Authorization", header);
                String responseBody = CommonUtil.commonSnsGetProfile(apiProfileURL, requestHeaders);
                /** apiResult json 구조
            	{"resultcode":"00",
            	"message":"success",
            	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
            	**/
                parser = new JSONParser();
                obj = parser.parse(responseBody);
                jsonObj = (JSONObject) obj;
                JSONObject response_obj = (JSONObject)jsonObj.get("response");
                String nickname = (String)response_obj.get("nickname");
                String email =  (String)response_obj.get("email");
                String name =  (String)response_obj.get("name");
                String id =  (String)response_obj.get("id");                
                System.out.println(responseBody);
                System.out.println(nickname);
                System.out.println(email);
                System.out.println(name);
                System.out.println(id);
                //System.out.println(nickname);
                /*apiURL=https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=HU7BlUDoiX1K80yIxsVP&client_secret=9vEYPAM0l3&redirect_uri=https%3A%2F%2Flocalhost%3A8443%2FnaverLoginReturn&code=W1aDEvATQZAxWbYfE2&state=7m4f4torlj2ggkh2ku9c4b198v
                	responseCode=200{"access_token":"AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI","refresh_token":"RisYjIIocPG08KrkUv3FMrjI0wuZv0epipRluUFV3SRiiyxN5xB6keNmqMIq0UipsnZtoMXTJisR4YJpHj0K5e83XLPLCApv5isaloCisHJ048KXWPRYI5giim2K8H4wGmsUipUsn","token_type":"bearer","expires_in":"3600"}
                	{"access_token":"AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI","refresh_token":"RisYjIIocPG08KrkUv3FMrjI0wuZv0epipRluUFV3SRiiyxN5xB6keNmqMIq0UipsnZtoMXTJisR4YJpHj0K5e83XLPLCApv5isaloCisHJ048KXWPRYI5giim2K8H4wGmsUipUsn","token_type":"bearer","expires_in":"3600"}
                	AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI
                	{"resultcode":"00","message":"success","response":{"id":"7589606","nickname":"min****","gender":"M","email":"minsoub@naver.com","name":"\uc815\ubbfc\uc12d","birthday":"04-23"}}
                	min****
                	minsoub@naver.com
                	정민섭
                	7589606
                */
                // 회원정보에 있는지 확인하고 없으면 등록한다.
                
                // 사용자 세션을 생성하고 리턴한다.
                LoginVo loginVo = new LoginVo();
                loginVo.setEmail(email);
                loginVo = restService.loginSnsProcess(loginVo,session);
                if(loginVo == null || "false".equals(loginVo.getResult())){
                	// 신규 등록한다.
                	
                	// 다시조회
                	loginVo = restService.loginSnsProcess(loginVo,session);
                }
                // 세션 등록 
                LOGGER.debug("로그인 성공 사용자id:{},사용자 권한:{}",loginVo.getUserid(),loginVo.getGroupadmin());
                /*session.setMaxInactiveInterval(60*60);*/
                session.setAttribute("login",loginVo);
                /*mv.addObject("isLoign",loginVo.getResult());*/
                LOGGER.debug("Prev URL : " + redirectUrl);
                if (redirectUrl != null && !"".equals(redirectUrl))
                {
                	redirectAttributes.addFlashAttribute("qrVo", qrInfo);
                	
                	rtnUrl = redirectUrl;
                }else {                		                
                	rtnUrl = "redirect:/";
                }	
                
                mv.addObject("success", "Y");   
            }else {
            	System.out.println(res.toString());
            	mv.addObject("Error", res.toString());
            	mv.addObject("success", "N");
            }
        } catch (Exception e) {
        	mv.addObject("Error", e.toString());
            System.out.println(e);
            mv.addObject("success", "N");
        }
    	mv.setViewName("web/user/sns_login_result");
    	return mv;
    }
    
    /**
     * Kakao Login 리턴 
     * 
     * @param request
     * @param session
     * @return
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping(value = "/kakaoLoginReturn")
    public ModelAndView kakaoLoginReturn(HttpServletRequest request,HttpSession session,ModelAndView mv,RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
        String rtnUrl = "";
        QRInfoVo qrInfo = null;
        String redirectUrl = null;
        
        //qrInfo = (QRInfoVo) session.getAttribute("qrInfo");
        if (session.getAttribute("qrInfo") == null)
        {
        	LOGGER.debug("qrInfo is null....");
        }else {
        	LOGGER.debug("qrInfo is not null....");
        	qrInfo = (QRInfoVo) request.getSession().getAttribute("qrInfo"); 
        	LOGGER.debug(qrInfo.getCountryclub_id());
        	//session.invalidate();
        }
        if (session.getAttribute("redirectUrl") != null)
        {
        	redirectUrl = "redirect:"+(String) session.getAttribute("redirectUrl");
        }   	
        
        String clientId = CommonUtil.kakaoClientId;		    //애플리케이션 클라이언트 아이디값";
        String clientSecret = CommonUtil.kakaoApiKey;		    //애플리케이션 클라이언트 시크릿값";
        String code  = request.getParameter("code");		//발급받은 코드
        //String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode(CommonUtil.kakaoReturnUrl, "UTF-8");
        String apiURL;
        apiURL = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code&";
        apiURL += "client_id=" + clientId;
        apiURL += "&client_secret=" + clientSecret;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&code=" + code;

        String access_token = "";
        String refresh_token = "";
        System.out.println("apiURL="+apiURL);
        
        try 
        {        	
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode="+responseCode);
            if(responseCode==200) { // 정상 호출
              br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
              br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
              res.append(inputLine);
            }
            br.close();
            if(responseCode==200) {
            	System.out.println(res.toString());            	         
            	//responseCode=200{"access_token":"PCPA24Ey11tXdyo9ZJrR2CwccgzJxCJk3Q7WVAopb1QAAAFwpZegRw","token_type":"bearer","refresh_token":"3yio_H4w5DXEPFIOgYskZqZRSImEY_dDDbbQ0wopb1QAAAFwpZegRg","expires_in":21599,"scope":"account_email profile","refresh_token_expires_in":5183999}
            	//{"access_token":"PCPA24Ey11tXdyo9ZJrR2CwccgzJxCJk3Q7WVAopb1QAAAFwpZegRw","refresh_token_expires_in":5183999,"refresh_token":"3yio_H4w5DXEPFIOgYskZqZRSImEY_dDDbbQ0wopb1QAAAFwpZegRg","scope":"account_email profile","token_type":"bearer","expires_in":21599}
            	//PCPA24Ey11tXdyo9ZJrR2CwccgzJxCJk3Q7WVAopb1QAAAFwpZegRw
            	JSONParser parser = new JSONParser();
            	Object obj = parser.parse(res.toString());
            	JSONObject jsonObj = (JSONObject) obj;
            	
            	System.out.println(jsonObj.toString());
            	System.out.println(jsonObj.get("access_token"));
            	access_token = (String)jsonObj.get("access_token"); 
            	//refresh_token = (String)jsonObj.get("refresh_token");
            	
            	// 사용자 정보를 가져온다.
            	String token = access_token; 		//  Kakao 로그인 접근 토큰;
                String header = "Bearer " + token;  // Bearer 다음에 공백 추가

                String apiProfileURL = "https://kapi.kakao.com/v2/user/me";

                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put("Authorization", header);
                String responseBody = CommonUtil.commonSnsGetProfile(apiProfileURL, requestHeaders);
                /** apiResult json 구조
            	{"id":1299094011,"connected_at":"2020-03-04T12:49:02Z","properties":{"nickname":"?젙誘쇱꽠","profile_image":"http://k.kakaocdn.net/dn/cWIGiM/btqy8gJg3Cs/nVw6OvsOI0u1vgYKRUVZqk/img_640x640.jpg","thumbnail_image":"http://k.kakaocdn.net/dn/cWIGiM/btqy8gJg3Cs/nVw6OvsOI0u1vgYKRUVZqk/img_110x110.jpg"},"kakao_account":{"profile_needs_agreement":false,"profile":{"nickname":"?젙誘쇱꽠","thumbnail_image_url":"http://k.kakaocdn.net/dn/cWIGiM/btqy8gJg3Cs/nVw6OvsOI0u1vgYKRUVZqk/img_110x110.jpg","profile_image_url":"http://k.kakaocdn.net/dn/cWIGiM/btqy8gJg3Cs/nVw6OvsOI0u1vgYKRUVZqk/img_640x640.jpg"},"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"minsoub@gmail.com","has_birthday":false,"birthday_needs_agreement":false,"has_gender":false,"gender_needs_agreement":false}}
            	**/
                System.out.println(responseBody);
                parser = new JSONParser();
                obj = parser.parse(responseBody);
                jsonObj = (JSONObject) obj;
                JSONObject response_obj = (JSONObject)jsonObj.get("properties");
                String nickname = (String)response_obj.get("nickname");
                String profile_image = (String)response_obj.get("profile_image");
                // kakao_account
                JSONObject account_obj = (JSONObject)jsonObj.get("kakao_account");
                String email =  (String)account_obj.get("email");
                String name =  nickname;
                //String id =  (String)jsonObj.get("id");                
                
                System.out.println(nickname);
                System.out.println(email);
                System.out.println(name);
                //System.out.println(id);
                //System.out.println(nickname);
                /*apiURL=https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=HU7BlUDoiX1K80yIxsVP&client_secret=9vEYPAM0l3&redirect_uri=https%3A%2F%2Flocalhost%3A8443%2FnaverLoginReturn&code=W1aDEvATQZAxWbYfE2&state=7m4f4torlj2ggkh2ku9c4b198v
                	responseCode=200{"access_token":"AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI","refresh_token":"RisYjIIocPG08KrkUv3FMrjI0wuZv0epipRluUFV3SRiiyxN5xB6keNmqMIq0UipsnZtoMXTJisR4YJpHj0K5e83XLPLCApv5isaloCisHJ048KXWPRYI5giim2K8H4wGmsUipUsn","token_type":"bearer","expires_in":"3600"}
                	{"access_token":"AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI","refresh_token":"RisYjIIocPG08KrkUv3FMrjI0wuZv0epipRluUFV3SRiiyxN5xB6keNmqMIq0UipsnZtoMXTJisR4YJpHj0K5e83XLPLCApv5isaloCisHJ048KXWPRYI5giim2K8H4wGmsUipUsn","token_type":"bearer","expires_in":"3600"}
                	AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI
                	{"resultcode":"00","message":"success","response":{"id":"7589606","nickname":"min****","gender":"M","email":"minsoub@naver.com","name":"\uc815\ubbfc\uc12d","birthday":"04-23"}}
                	min****
                	minsoub@naver.com
                	정민섭
                	7589606
                */
                // 회원정보에 있는지 확인하고 없으면 등록한다.
                
                // 사용자 세션을 생성하고 리턴한다.
                LoginVo loginVo = new LoginVo();
                loginVo.setEmail(email);
                loginVo = restService.loginSnsProcess(loginVo,session);
                if(loginVo == null || "false".equals(loginVo.getResult())){
                	// 신규 등록한다.
                	
                	// 다시조회
                	loginVo = restService.loginSnsProcess(loginVo,session);
                }
                // 세션 등록 
                LOGGER.debug("로그인 성공 사용자id:{},사용자 권한:{}",loginVo.getUserid(),loginVo.getGroupadmin());
                /*session.setMaxInactiveInterval(60*60);*/
                session.setAttribute("login",loginVo);
                /*mv.addObject("isLoign",loginVo.getResult());*/
                LOGGER.debug("Prev URL : " + redirectUrl);
                if (redirectUrl != null && !"".equals(redirectUrl))
                {
                	redirectAttributes.addFlashAttribute("qrVo", qrInfo);
                	
                	rtnUrl = redirectUrl;
                }else {                		                
                	rtnUrl = "redirect:/";
                }	
                
                mv.addObject("success", "Y");   
            }else {
            	System.out.println(res.toString());
            	mv.addObject("Error", res.toString());
            	mv.addObject("success", "N");
            }
        } catch (Exception e) {
        	mv.addObject("Error", e.toString());
            System.out.println(e);
            mv.addObject("success", "N");
        }
    	mv.setViewName("web/user/sns_login_result");
    	return mv;
    }
    
    /**
     * Facebook Login 리턴 
     * 
     * @param request
     * @param session
     * @return
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping(value = "/facebookLoginReturn")
    public ModelAndView facebookLoginReturn(HttpServletRequest request,HttpSession session,ModelAndView mv,RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
        String rtnUrl = "";
        QRInfoVo qrInfo = null;
        String redirectUrl = null;
        
        //qrInfo = (QRInfoVo) session.getAttribute("qrInfo");
        if (session.getAttribute("qrInfo") == null)
        {
        	LOGGER.debug("qrInfo is null....");
        }else {
        	LOGGER.debug("qrInfo is not null....");
        	qrInfo = (QRInfoVo) request.getSession().getAttribute("qrInfo"); 
        	LOGGER.debug(qrInfo.getCountryclub_id());
        	//session.invalidate();
        }
        if (session.getAttribute("redirectUrl") != null)
        {
        	redirectUrl = "redirect:"+(String) session.getAttribute("redirectUrl");
        }   	
        
        String clientId = CommonUtil.facebookClientId;		    //애플리케이션 클라이언트 아이디값";
        String clientSecret = CommonUtil.facebookKey;		    //애플리케이션 클라이언트 시크릿값";
        String code  = request.getParameter("code");		//발급받은 코드
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode(CommonUtil.facebookReturnUrl, "UTF-8");
        String apiURL;
        apiURL = "https://graph.facebook.com/v6.0/oauth/access_token?";
        apiURL += "client_id=" + clientId;
        apiURL += "&client_secret=" + clientSecret;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&code=" + code;
        //apiURL += "&state=" + state;
        String access_token = "";
        String refresh_token = "";
        System.out.println("apiURL="+apiURL);
        
        try 
        {        	
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode="+responseCode);
            if(responseCode==200) { // 정상 호출
              br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
              br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
              res.append(inputLine);
            }
            br.close();
            if(responseCode==200) {
            	System.out.println(res.toString());    
            	//  apiURL=https://graph.facebook.com/v6.0/oauth/access_token?client_id=187211659375164&client_secret=a163d69ecb147510993e83943a46db58&redirect_uri=https%3A%2F%2Flocalhost%3A8443%2FfacebookLoginReturn&code=AQBxhOWg469WJgws-zF0D3RjAluaapv9KYrBiQxsTAk-1kDxpj_VFFWMmZ_1hP3_GBm2jfgTnU5X8xBp_nTvzWjArXlFI9ZihQdTRZrlekdrl-q1fYCbADqZ4BoPbgzfe2-QttNZWE3NW2faNCUA5rMiWd_63rDljVlFjFtgVZpOn2_mteO6Sd71PxkLrB66hOAd_9Xp4s7YYy3B7H1XPbwudmakwkn7j22zZ10rrp7qYY-w7vjtJaFKfNRX1Wfh5oXUuy56gaVIQWBLzIFrVEM0EBLUppYqqvM-1eP2tGgu7xaRqjrY2TKlQ0bKd6bHWVa97KojrmrBvKAtKsTYG7cC
            	
            	//	responseCode=200{"access_token":"EAACqRJx0cjwBAPUqZCr2J0GhVwq5yRiVFtHTEcywGUHrpDeNTys5Nc5YVx2CzMj5lZBrLPZCqSefAvNc843F26rq5baaqlXY2pNMXfnSPIxmu8GVD0zRa93BlkodKjMLKDJ5U0iCW2wGtdzVo3fsrRXmuZARIYvsKWd4IFaJ9QZDZD","token_type":"bearer","expires_in":5183999}
            	//	{"access_token":"EAACqRJx0cjwBAPUqZCr2J0GhVwq5yRiVFtHTEcywGUHrpDeNTys5Nc5YVx2CzMj5lZBrLPZCqSefAvNc843F26rq5baaqlXY2pNMXfnSPIxmu8GVD0zRa93BlkodKjMLKDJ5U0iCW2wGtdzVo3fsrRXmuZARIYvsKWd4IFaJ9QZDZD","token_type":"bearer","expires_in":5183999}
            	//	EAACqRJx0cjwBAPUqZCr2J0GhVwq5yRiVFtHTEcywGUHrpDeNTys5Nc5YVx2CzMj5lZBrLPZCqSefAvNc843F26rq5baaqlXY2pNMXfnSPIxmu8GVD0zRa93BlkodKjMLKDJ5U0iCW2wGtdzVo3fsrRXmuZARIYvsKWd4IFaJ9QZDZD
            	//	

            	JSONParser parser = new JSONParser();
            	Object obj = parser.parse(res.toString());
            	JSONObject jsonObj = (JSONObject) obj;
            	
            	System.out.println(jsonObj.toString());
            	System.out.println(jsonObj.get("access_token"));
            	access_token = (String)jsonObj.get("access_token"); 
            	refresh_token = (String)jsonObj.get("refresh_token");
            	
            	// 사용자 정보를 가져온다.
            	String token = access_token; 		// 네이버 로그인 접근 토큰;
                String header = "Bearer " + token;  // Bearer 다음에 공백 추가

                String apiProfileURL = "https://graph.facebook.com/me?fields=name,email&access_token="+access_token;

                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put("Authorization", header);
                String responseBody = CommonUtil.commonSnsGetProfile(apiProfileURL, requestHeaders);
                /** apiResult json 구조 **/
            	//{"id":"2982599261804634","name":"Minsoub Joung"}
                System.out.println("get : " + responseBody);
                
                parser = new JSONParser();
                obj = parser.parse(responseBody);
                jsonObj = (JSONObject) obj;
                //JSONObject response_obj = (JSONObject)jsonObj.get("response");
                String nickname = (String)jsonObj.get("name");
                String email =  (String)jsonObj.get("email");
                String name =  (String)jsonObj.get("name");
                String id =  (String)jsonObj.get("id");                
                
                System.out.println(nickname);
                System.out.println(email);
                System.out.println(name);
                System.out.println(id);
                //System.out.println(nickname);
                /*apiURL=https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=HU7BlUDoiX1K80yIxsVP&client_secret=9vEYPAM0l3&redirect_uri=https%3A%2F%2Flocalhost%3A8443%2FnaverLoginReturn&code=W1aDEvATQZAxWbYfE2&state=7m4f4torlj2ggkh2ku9c4b198v
                	responseCode=200{"access_token":"AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI","refresh_token":"RisYjIIocPG08KrkUv3FMrjI0wuZv0epipRluUFV3SRiiyxN5xB6keNmqMIq0UipsnZtoMXTJisR4YJpHj0K5e83XLPLCApv5isaloCisHJ048KXWPRYI5giim2K8H4wGmsUipUsn","token_type":"bearer","expires_in":"3600"}
                	{"access_token":"AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI","refresh_token":"RisYjIIocPG08KrkUv3FMrjI0wuZv0epipRluUFV3SRiiyxN5xB6keNmqMIq0UipsnZtoMXTJisR4YJpHj0K5e83XLPLCApv5isaloCisHJ048KXWPRYI5giim2K8H4wGmsUipUsn","token_type":"bearer","expires_in":"3600"}
                	AAAAOKPDnM6r9f2-4L1EggPv_l74zvBaMiYcnGBlrvtguKUd3zB1G6cr7J1pIC-1CpA9zlL_0wmlnbWwhCB4S6pNrkI
                	{"resultcode":"00","message":"success","response":{"id":"7589606","nickname":"min****","gender":"M","email":"minsoub@naver.com","name":"\uc815\ubbfc\uc12d","birthday":"04-23"}}
                	min****
                	minsoub@naver.com
                	정민섭
                	7589606
                */
                // 회원정보에 있는지 확인하고 없으면 등록한다.
                
                // 사용자 세션을 생성하고 리턴한다.
                LoginVo loginVo = new LoginVo();
                loginVo.setEmail(email);
                loginVo = restService.loginSnsProcess(loginVo,session);
                if(loginVo == null || "false".equals(loginVo.getResult())){
                	// 신규 등록한다.
                	
                	// 다시조회
                	loginVo = restService.loginSnsProcess(loginVo,session);
                }
                // 세션 등록 
                LOGGER.debug("로그인 성공 사용자id:{},사용자 권한:{}",loginVo.getUserid(),loginVo.getGroupadmin());
                /*session.setMaxInactiveInterval(60*60);*/
                session.setAttribute("login",loginVo);
                /*mv.addObject("isLoign",loginVo.getResult());*/
                LOGGER.debug("Prev URL : " + redirectUrl);
                if (redirectUrl != null && !"".equals(redirectUrl))
                {
                	redirectAttributes.addFlashAttribute("qrVo", qrInfo);
                	
                	rtnUrl = redirectUrl;
                }else {                		                
                	rtnUrl = "redirect:/";
                }	
                
                mv.addObject("success", "Y");   
            }else {
            	System.out.println(res.toString());
            	mv.addObject("Error", res.toString());
            	mv.addObject("success", "N");
            }
        } catch (Exception e) {
        	mv.addObject("Error", e.toString());
            System.out.println(e);
            mv.addObject("success", "N");
        }
    	mv.setViewName("web/user/sns_login_result");
    	return mv;
    }    
    
    /**
     * 사용자 로그인을 수행한다.
     * 
     * @param loginVo
     * @param request
     * @param session
     * @param mv
     * @param redirectAttributes
     * @return
     * @throws ApiException
     * @throws IOException
     */
    @PostMapping(value = "/login")
    public String login(LoginVo loginVo, HttpServletRequest request,HttpSession session,ModelAndView mv,RedirectAttributes redirectAttributes) throws ApiException, IOException {
        LOGGER.debug("==================== LoginController login Strart : ====================");
        String rtnUrl = "";
        QRInfoVo qrInfo = null;
        String redirectUrl = null;
        //qrInfo = (QRInfoVo) session.getAttribute("qrInfo");
        if (session.getAttribute("qrInfo") == null)
        {
        	LOGGER.debug("qrInfo is null....");
        }else {
        	LOGGER.debug("qrInfo is not null....");
        	qrInfo = (QRInfoVo) request.getSession().getAttribute("qrInfo"); 
        	LOGGER.debug(qrInfo.getCountryclub_id());
        	//session.invalidate();
        }
        
        session = request.getSession(true);
        session.setAttribute("authCheck", true);
        String prev_url = loginVo.getPrev_url();
        
        
        boolean authCheck = (Boolean)request.getSession().getAttribute("authCheck");
        if(!authCheck){
            redirectAttributes.addFlashAttribute("authCheck", !authCheck);
            rtnUrl = "redirect:/loginForm";
        }else {

            /*로그인 호출 LoginVo 리턴*/
            loginVo = restService.loginProcess(loginVo,session);
            if(loginVo != null && "true".equals(loginVo.getResult())){
                LOGGER.debug("로그인 성공 사용자id:{},사용자 권한:{}",loginVo.getUserid(),loginVo.getGroupadmin());
                /*session.setMaxInactiveInterval(60*60);*/
                session.setAttribute("login",loginVo);
                /*mv.addObject("isLoign",loginVo.getResult());*/
                LOGGER.debug("Prev URL : " + prev_url);
                if (prev_url != null && !"".equals(prev_url))
                {
                	redirectAttributes.addFlashAttribute("qrVo", qrInfo);
                	
                	rtnUrl = prev_url;
                }else {                		                
                	rtnUrl = "redirect:/";
                }
            } else {
                LOGGER.debug("로그인 실패 : {}", loginVo.getResult());

                redirectAttributes.addFlashAttribute("returnCode", "9999");
                //redirectAttributes.addFlashAttribute("loginVo", loginVo);

                rtnUrl = "redirect:/loginForm";
            }
        }
        LOGGER.debug(rtnUrl);
        //mv.setViewName(rtnUrl);

        LOGGER.debug("==================== LoginController login End : ====================");
        return rtnUrl;
    }
    /**
     * 로그아웃
     * 
     * @param session
     * @return
     * @throws ApiException
     * @throws UnsupportedEncodingException
     */
    @GetMapping(value = "/logout")
    public String logout(HttpSession session) throws ApiException, UnsupportedEncodingException {

        LOGGER.debug("==================== LoginController logout Start: {}====================");
        if ( session.getAttribute("login") != null ){
            // 기존에 login이란 세션 값이 존재한다면
            session.invalidate(); // 세션 전체를 날려버림
        }

        LOGGER.debug("==================== LoginController logout End : {}====================");
        return "redirect:/loginForm";
    }
    /*
	 * 로그인을 완료한 사용자의 아이디를 세션에 저장하는 메소드
	 * @param session 세션 객체
	 * @param userID 사용자 아이디
	 */
    public void setSession(HttpSession session, String userId) {
        // 이순간에 Session Binding이벤트가 일어나는 시점
        // name값으로 userId, value값으로 자기자신(HttpSessionBindingListener를 구현하는 Object)
        session.setAttribute(userId, this);// login에 자기자신을 집어넣는다.
    }

}
