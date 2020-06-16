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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.swing.saver.web.entity.Constant;
import com.swing.saver.web.entity.PayVo;
import com.swing.saver.web.exception.ApiException;
import com.swing.saver.web.service.PayService;

/**
 * 결제 서비스 제공 Controller
 * 결제 서비스의 경우 모바일 앱에서 호출된다. 
 * 
 * @author jms
 *
 */
@Controller
@RequestMapping(Constant.PAY_PREFIX)
public class PayController {

	private final static Logger LOGGER = LoggerFactory.getLogger(PayController.class);
	
	 @Inject
	 PayService service;
	 
	 /**
	  * 앱에서 결제 페이지 호출 
	  * 
	  * @param artype
	  * @param arid
	  * @param request
	  * @param session
	  * @return
	  * @throws ApiException
	  * @throws IOException
	  */
	 @RequestMapping(value="/process/{artype}/{arid}")
	 public ModelAndView  payprocess(@PathVariable String artype, @PathVariable String arid, HttpServletRequest request, HttpSession session) throws ApiException, IOException {		 
		ModelAndView mv = new ModelAndView();
        LOGGER.debug("==================== PayController payprocess Strart : ===================={}");

        if (artype == null || arid == null)
        {
        	 mv.setViewName("web/pay/pay_error");
        }else {
	     
        	// 사용자 정보 및 물건 정보, 결제금액 등을 가져와야 된다. 
        	String rtnJson = service.getBuyItemById(artype, arid);   // 제품 상세 정보 조회
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> map = mapper.readValue(rtnJson, new TypeReference<Map<String, Object>>(){});

            mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
            
            List<PayVo> payList = mapper.convertValue(map.get("payList"), TypeFactory.defaultInstance().constructCollectionType(List.class,PayVo.class));
            
            if (payList != null && payList.size() != 0) {
            	PayVo pay = payList.get(0);
            	pay.setArtype(artype);
            	pay.setArid(arid);
            	mv.addObject("payInfo", pay);
            }
            
            
            /* kcp와 통신후 kcp 서버에서 전송되는 결제 요청 정보 */
            String req_tx          =  request.getParameter( "req_tx"         ) ; // 요청 종류         
            String res_cd          =  request.getParameter( "res_cd"         ) ; // 응답 코드         
            String tran_cd         =  request.getParameter( "tran_cd"        ) ; // 트랜잭션 코드     
            String ordr_idxx       =  request.getParameter( "ordr_idxx"      ) ; // 쇼핑몰 주문번호   
            String good_name       =  request.getParameter( "good_name"      ) ; // 상품명            
            String good_mny        =  request.getParameter( "good_mny"       ) ; // 결제 총금액       
            String buyr_name       =  request.getParameter( "buyr_name"      ) ; // 주문자명          
            String buyr_tel1       =  request.getParameter( "buyr_tel1"      ) ; // 주문자 전화번호   
            String buyr_tel2       =  request.getParameter( "buyr_tel2"      ) ; // 주문자 핸드폰 번호
            String buyr_mail       =  request.getParameter( "buyr_mail"      ) ; // 주문자 E-mail 주소
            String use_pay_method  =  request.getParameter( "use_pay_method" ) ; // 결제 방법          
        	String enc_info        =  request.getParameter( "enc_info"       ) ; // 암호화 정보       
            String enc_data        =  request.getParameter( "enc_data"       ) ; // 암호화 데이터     
            String cash_yn         =  request.getParameter( "cash_yn"        ) ;
            String cash_tr_code    =  request.getParameter( "cash_tr_code"   ) ;
            /* 기타 파라메터 추가 부분 - Start - */
            String param_opt_1    =  request.getParameter( "param_opt_1"     ) ; // 기타 파라메터 추가 부분
            String param_opt_2    =  request.getParameter( "param_opt_2"     ) ; // 기타 파라메터 추가 부분
            String param_opt_3    =  request.getParameter( "param_opt_3"     ) ; // 기타 파라메터 추가 부분
            /* 기타 파라메터 추가 부분 - End -   */
            
            request.setAttribute("req_tx", req_tx);
            request.setAttribute("res_cd", res_cd);
            request.setAttribute("tran_cd", tran_cd);
            request.setAttribute("ordr_idxx", ordr_idxx);
            request.setAttribute("good_name", good_name);
            request.setAttribute("good_mny", good_mny);
            request.setAttribute("buyr_name", buyr_name);
            request.setAttribute("buyr_tel1", buyr_tel1);
            request.setAttribute("buyr_tel2", buyr_tel2);
            request.setAttribute("buyr_mail", buyr_mail);
            request.setAttribute("use_pay_method", use_pay_method);
            request.setAttribute("enc_info", enc_info);
            request.setAttribute("enc_data", enc_data);
            request.setAttribute("cash_yn", cash_yn);
            request.setAttribute("cash_tr_code", cash_tr_code);
            request.setAttribute("param_opt_1", param_opt_1);
            request.setAttribute("param_opt_2", param_opt_2);
            request.setAttribute("param_opt_3", param_opt_3);
            
            
            // 결제완료 후 호출된다. 
        	mv.setViewName("web/pay/pay_process");
        }
        LOGGER.debug("==================== PayController payprocess end : ===================={}");
        return mv;
	 }
	 
	 /**
	  * 결제 정보 확인 후 결제 요청 진힝
	  * 
	  * @param request
	  * @param session
	  * @return
	  * @throws ApiException
	  * @throws IOException
	  */
	 @PostMapping(value="/process/approval")
	 public ModelAndView orderApproval(HttpServletRequest request, HttpSession session) throws ApiException, IOException {
		ModelAndView mv = new ModelAndView();
	    LOGGER.debug("==================== PayController orderApproval Strart : ===================={}");
	        
	    String siteCode      = request.getParameter( "site_cd"       );
	    String orderID       = request.getParameter( "ordr_idxx"     );
	    String paymentAmount = request.getParameter( "good_mny"      );
	    String paymentMethod = request.getParameter( "pay_method"    );
	    String productName   = request.getParameter( "good_name"     );
	    String response_type = request.getParameter( "response_type" );
	    String Ret_URL       = request.getParameter( "Ret_URL"       );
	    String escrow        = request.getParameter( "escw_used"     ) == null? "":request.getParameter( "escw_used" );
	    
	    LOGGER.debug(siteCode);
	    LOGGER.debug(response_type);
	    
	    request.setAttribute("siteCode", siteCode);
	    request.setAttribute("orderID", orderID);
	    request.setAttribute("paymentAmount", paymentAmount);
	    request.setAttribute("paymentMethod", paymentMethod);
	    request.setAttribute("productName", productName);
	    request.setAttribute("response_type", response_type);
	    request.setAttribute("Ret_URL", Ret_URL);
	    request.setAttribute("escrow", escrow);
	    
    	mv.setViewName("web/pay/order_approval");       	
    	LOGGER.debug("==================== PayController orderApproval End : ===================={}");        
    	return mv;
	 }
	 /**
	  * 결제 승인 진행 페이지 호출
	  * 
	  * @param request
	  * @param session
	  * @return
	  * @throws ApiException
	  * @throws IOException
	  */
	 @PostMapping(value="/process/payclihub")
	 public ModelAndView payCliHub(HttpServletRequest request, HttpSession session) throws ApiException, IOException {
		ModelAndView mv = new ModelAndView();
	    LOGGER.debug("==================== PayController payCliHub Strart : ===================={}");
	        
	    
	    String req_tx      	= request.getParameter( "req_tx"       );
	    String res_cd       = request.getParameter( "res_cd"     );
	    String tran_cd 		= request.getParameter( "tran_cd"      );
	    String ordr_idxx 	= request.getParameter( "ordr_idxx"    );
	    String good_mny   	= request.getParameter( "good_mny"     );
	    String good_name 	= request.getParameter( "good_name" );
	    String buyr_name    = request.getParameter( "buyr_name"       );
	    String buyr_tel1    = request.getParameter( "buyr_tel1"     );
	    String buyr_tel2    = request.getParameter( "buyr_tel2"     );
	    String buyr_mail    = request.getParameter( "buyr_mail"     );
	    String cash_yn      = request.getParameter( "cash_yn"     );
	    String enc_info     = request.getParameter( "enc_info"     );
	    String enc_data     = request.getParameter( "enc_data"     );
	    String use_pay_method = request.getParameter( "use_pay_method"     );
	    String cash_tr_code = request.getParameter( "cash_tr_code"     );
	    String param_opt_1  = request.getParameter( "param_opt_1"     );
	    String param_opt_2  = request.getParameter( "param_opt_2"     );
	    String param_opt_3  = request.getParameter( "param_opt_3"     );
	    
	    
	    LOGGER.debug(req_tx);
	    LOGGER.debug(res_cd);
	    LOGGER.debug(tran_cd);
	    
	    request.setAttribute("req_tx", req_tx);
	    request.setAttribute("res_cd", res_cd);
	    request.setAttribute("tran_cd", tran_cd);
	    request.setAttribute("ordr_idxx", ordr_idxx);
	    request.setAttribute("good_mny", good_mny);
	    request.setAttribute("good_name", good_name);
	    request.setAttribute("buyr_name", buyr_name);
	    request.setAttribute("buyr_tel1", buyr_tel1);
	    request.setAttribute("buyr_tel2", buyr_tel2);
	    request.setAttribute("buyr_mail", buyr_mail);
	    request.setAttribute("cash_yn", cash_yn);
	    request.setAttribute("enc_info", enc_info);
	    request.setAttribute("enc_data", enc_data);
	    request.setAttribute("use_pay_method", use_pay_method);
	    request.setAttribute("cash_tr_code", cash_tr_code);
	    request.setAttribute("param_opt_1", param_opt_1);
	    request.setAttribute("param_opt_2", param_opt_2);
	    request.setAttribute("param_opt_3", param_opt_3);
	    
	    
    	mv.setViewName("web/pay/pp_cli_hub");       	
    	LOGGER.debug("==================== PayController payCliHub End : ===================={}");        
    	return mv;
	 }	 
	 
	 /**
	  * 결제 완료 진행 페이지 호출
	  * 
	  * @param request
	  * @param session
	  * @return
	  * @throws ApiException
	  * @throws IOException
	  */
	 @PostMapping(value="/process/result")
	 public ModelAndView result(HttpServletRequest request, HttpSession session) throws ApiException, IOException {
		ModelAndView mv = new ModelAndView();
	    LOGGER.debug("==================== PayController result Strart : ===================={}");

        String site_cd      	= request.getParameter( "site_cd"       );        
	    String req_tx      	= request.getParameter( "req_tx"       );
	    String use_pay_method = request.getParameter( "use_pay_method"     );
	    String bSucc = request.getParameter( "bSucc"     );	    
	    String res_cd       = request.getParameter( "res_cd"     );
	    String res_msg       = request.getParameter( "res_msg"     );
	    String ordr_idxx 	= request.getParameter( "ordr_idxx"    );
	    String tno 		= request.getParameter( "tno"      );
	    String good_name 	= request.getParameter( "good_name" );
	    String buyr_name    = request.getParameter( "buyr_name"       );
	    String buyr_tel1    = request.getParameter( "buyr_tel1"     );
	    String buyr_tel2    = request.getParameter( "buyr_tel2"     );
	    String buyr_mail    = request.getParameter( "buyr_mail"     );
	    String app_time    = request.getParameter( "app_time"     );	    
	    String amount   	= request.getParameter( "amount"     );	  
	    
	    String card_cd      = request.getParameter( "card_cd"     );
	    String card_name     = request.getParameter( "card_name"     );
	    String app_no     = request.getParameter( "app_no"     );	    
	    String noinf = request.getParameter( "noinf"     );
	    String quota  = request.getParameter( "quota"     );
	    String partcanc_yn  = request.getParameter( "partcanc_yn"     );
	    String card_bin_type_01  = request.getParameter( "card_bin_type_01"     );
	    String card_bin_type_02  = request.getParameter( "card_bin_type_02"     );
	    String bank_name  = request.getParameter( "bank_name"     );
	    String bank_code  = request.getParameter( "bank_code"     );
	    String bankname  = request.getParameter( "bankname"     );
	    String depositor  = request.getParameter( "depositor"     );
	    String account  = request.getParameter( "account"     );
	    String va_date  = request.getParameter( "va_date"     );
               
	    String pnt_issue  = request.getParameter( "pnt_issue"     );
	    String pnt_app_time  = request.getParameter( "pnt_app_time"     );
	    String pnt_app_no  = request.getParameter( "pnt_app_no"     );
	    String pnt_amount  = request.getParameter( "pnt_amount"     );
	    String add_pnt  = request.getParameter( "add_pnt"     );
	    String use_pnt  = request.getParameter( "use_pnt"     );
	    String rsv_pnt  = request.getParameter( "rsv_pnt"     );
	    String commid  = request.getParameter( "commid"     );
	    String mobile_no  = request.getParameter( "mobile_no"     );
	    
	    String tk_van_code  = request.getParameter( "tk_van_code"     );
	    String tk_app_no  = request.getParameter( "tk_app_no"     );
	    String cash_yn  = request.getParameter( "cash_yn"     );
	    String cash_authno  = request.getParameter( "cash_authno"     );
	    String cash_tr_code  = request.getParameter( "cash_tr_code"     );
	    String cash_id_info  = request.getParameter( "cash_id_info"     );
	    String cash_no  = request.getParameter( "cash_no"     );
	    String param_opt_1  = request.getParameter( "param_opt_1"     );
	    String param_opt_2  = request.getParameter( "param_opt_2"     );
	    String param_opt_3  = request.getParameter( "param_opt_3"     );    
        
	    
	    LOGGER.debug(req_tx);
	    LOGGER.debug(res_cd);
	    LOGGER.debug(tno);
	    
	    if ( req_tx.equals( "pay" ) )
	    {

	    /* = -------------------------------------------------------------------------- = */
	    /* =   06-1. 승인 결과 DB 처리(res_cd == "0000")                                = */
	    /* = -------------------------------------------------------------------------- = */
	    /* =        각 결제수단을 구분하시어 DB 처리를 하시기 바랍니다.                 = */
	    /* = -------------------------------------------------------------------------- = */
	        if ( res_cd.equals( "0000" ) )
	        {
	        	
	        	// 결제 완료시 웹서비스 호출
	        	HashMap<String, String> param = new HashMap<String, String>();
	        	param.put("artype", param_opt_2);
	        	param.put("arid", param_opt_3);
	        	
	        	String result = service.paymentUpdate(param);
	        	LOGGER.debug("Result : " + result);
	        	
	        	// result == true
	        	HashMap<String, String> map = new HashMap<String, String>();
	        	map.put("site_cd", site_cd);
	        	map.put("req_tx", req_tx);
	        	map.put("use_pay_method", use_pay_method);
	        	map.put("bSucc", bSucc);
	        	map.put("res_cd", res_cd);
	        	map.put("res_msg", res_msg);
	        	map.put("ordr_idxx", ordr_idxx);
	        	map.put("tno", tno);
	        	map.put("good_name", good_name);
	        	map.put("buyr_name", buyr_name);
	        	map.put("buyr_tel1", buyr_tel1);
	        	map.put("buyr_tel2", buyr_tel2);
	        	map.put("buyr_mail", buyr_mail);
	        	map.put("app_time", app_time);
	        	map.put("amount", amount);

	        	map.put("card_cd", card_cd);
	        	map.put("card_name", card_name);
	        	map.put("app_no", app_no);
	        	map.put("noinf", noinf);
	        	map.put("quota", quota);
	        	map.put("partcanc_yn", partcanc_yn);
	        	map.put("card_bin_type_01", card_bin_type_01);
	        	map.put("card_bin_type_02", card_bin_type_02);
	        	map.put("bank_name", bank_name);
	        	map.put("bank_code", bank_code);
	        	map.put("bankname", bankname);
	        	map.put("depositor", depositor);
	        	map.put("account", account);
	        	map.put("va_date", va_date);
	        	
	        	map.put("pnt_issue", pnt_issue);
	        	map.put("pnt_app_time", pnt_app_time);
	        	map.put("pnt_app_no", pnt_app_no);
	        	map.put("pnt_amount", pnt_amount);
	        	map.put("add_pnt", add_pnt);
	        	map.put("use_pnt", use_pnt);
	        	map.put("rsv_pnt", rsv_pnt);
	        	map.put("commid", commid);
	        	map.put("mobile_no", mobile_no);
	            
	        	map.put("tk_van_code", tk_van_code);
	        	map.put("tk_app_no", tk_app_no);
	        	map.put("cash_yn", cash_yn);
	        	map.put("cash_authno", cash_authno);
	        	map.put("cash_tr_code", cash_tr_code);
	        	map.put("cash_id_info", cash_id_info);
	        	map.put("cash_no", cash_no);
	        	map.put("order_no", param_opt_1);  // order_no
	        	map.put("artype", param_opt_2);  // artype
	        	map.put("arid", param_opt_3);  // arid
	        	
	        	result = service.paymentRegister(map);
	        	LOGGER.debug("Result : " + result);
	        }

	        /* = -------------------------------------------------------------------------- = */
	        /* =   06-2. 승인 실패 DB 처리(res_cd != "0000")                                = */
	        /* = -------------------------------------------------------------------------- = */
	        if( !"0000".equals ( res_cd ) )
	        {
	        	HashMap<String, String> map = new HashMap<String, String>();
	        	map.put("site_cd", site_cd);
	        	map.put("req_tx", req_tx);
	        	map.put("use_pay_method", use_pay_method);
	        	map.put("bSucc", bSucc);
	        	map.put("res_cd", res_cd);
	        	map.put("res_msg", res_msg);
	        	map.put("ordr_idxx", ordr_idxx);
	        	map.put("tno", tno);
	        	map.put("good_name", good_name);
	        	map.put("buyr_name", buyr_name);
	        	map.put("buyr_tel1", buyr_tel1);
	        	map.put("buyr_tel2", buyr_tel2);
	        	map.put("buyr_mail", buyr_mail);
	        	map.put("app_time", app_time);
	        	map.put("amount", amount);

	        	map.put("card_cd", card_cd);
	        	map.put("card_name", card_name);
	        	map.put("app_no", app_no);
	        	map.put("noinf", noinf);
	        	map.put("quota", quota);
	        	map.put("partcanc_yn", partcanc_yn);
	        	map.put("card_bin_type_01", card_bin_type_01);
	        	map.put("card_bin_type_02", card_bin_type_02);
	        	map.put("bank_name", bank_name);
	        	map.put("bank_code", bank_code);
	        	map.put("bankname", bankname);
	        	map.put("depositor", depositor);
	        	map.put("account", account);
	        	map.put("va_date", va_date);
	        	
	        	map.put("pnt_issue", pnt_issue);
	        	map.put("pnt_app_time", pnt_app_time);
	        	map.put("pnt_app_no", pnt_app_no);
	        	map.put("pnt_amount", pnt_amount);
	        	map.put("add_pnt", add_pnt);
	        	map.put("use_pnt", use_pnt);
	        	map.put("rsv_pnt", rsv_pnt);
	        	map.put("commid", commid);
	        	map.put("mobile_no", mobile_no);
	            
	        	map.put("tk_van_code", tk_van_code);
	        	map.put("tk_app_no", tk_app_no);
	        	map.put("cash_yn", cash_yn);
	        	map.put("cash_authno", cash_authno);
	        	map.put("cash_tr_code", cash_tr_code);
	        	map.put("cash_id_info", cash_id_info);
	        	map.put("cash_no", cash_no);
	        	map.put("order_no", param_opt_1);  // order_no
	        	map.put("artype", param_opt_2);  // artype
	        	map.put("arid", param_opt_3);  // arid
	        	
	        	String result = service.paymentRegister(map);
	        	LOGGER.debug("Result : " + result);
	        }
	    }
	    
	    
	    request.setAttribute("site_cd", site_cd);
	    request.setAttribute("req_tx", req_tx);
	    request.setAttribute("use_pay_method", use_pay_method);
	    request.setAttribute("bSucc", bSucc);
	    request.setAttribute("res_cd", res_cd);
	    
	    request.setAttribute("res_msg", res_msg);
	    request.setAttribute("ordr_idxx", ordr_idxx);
	    request.setAttribute("tno", tno);
	    request.setAttribute("good_name", good_name);
	    request.setAttribute("buyr_name", buyr_name);
	    request.setAttribute("buyr_tel1", buyr_tel1);
	    request.setAttribute("buyr_tel2", buyr_tel2);
	    request.setAttribute("buyr_mail", buyr_mail);
	    request.setAttribute("app_time", app_time);
	    request.setAttribute("amount", amount);
    
	    request.setAttribute("card_cd", card_cd);
	    request.setAttribute("card_name", card_name);
	    request.setAttribute("app_no", app_no);
	    request.setAttribute("noinf", noinf);
	    request.setAttribute("quota", quota);
	    request.setAttribute("partcanc_yn", partcanc_yn);
	    request.setAttribute("card_bin_type_01", card_bin_type_01);
	    request.setAttribute("card_bin_type_02", card_bin_type_02);
	    request.setAttribute("bank_name", bank_name);
	    request.setAttribute("bank_code", bank_code);
	    request.setAttribute("bankname", bankname);
	    request.setAttribute("depositor", depositor);
	    request.setAttribute("account", account);
	    request.setAttribute("va_date", va_date);
	    
	    request.setAttribute("pnt_issue", pnt_issue);
	    request.setAttribute("pnt_app_time", pnt_app_time);
	    request.setAttribute("pnt_app_no", pnt_app_no);
	    request.setAttribute("pnt_amount", pnt_amount);
	    request.setAttribute("add_pnt", add_pnt);
	    request.setAttribute("use_pnt", use_pnt);
	    request.setAttribute("rsv_pnt", rsv_pnt);
	    request.setAttribute("commid", commid);
	    request.setAttribute("mobile_no", mobile_no);
	    
	    
	    request.setAttribute("tk_van_code", tk_van_code);
	    request.setAttribute("tk_app_no", tk_app_no);
	    request.setAttribute("cash_yn", cash_yn);
	    request.setAttribute("cash_authno", cash_authno);
	    request.setAttribute("cash_tr_code", cash_tr_code);
	    request.setAttribute("cash_id_info", cash_id_info);
	    request.setAttribute("cash_no", cash_no);
	    request.setAttribute("param_opt_1", param_opt_1);
	    request.setAttribute("param_opt_2", param_opt_2);
	    request.setAttribute("param_opt_3", param_opt_3);

	    
    	mv.setViewName("web/pay/result");       	
    	LOGGER.debug("==================== PayController result End : ===================={}");        
    	return mv;
	 }	 	 
}
