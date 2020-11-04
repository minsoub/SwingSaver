package com.swing.saver.web.interceptor;

import com.swing.saver.web.entity.LoginVo;
import com.swing.saver.web.exception.ApiException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

/**
 * Created by mycom on 2019-06-06.
 */
public class SessionCheckInterceptor extends HandlerInterceptorAdapter {
    private static final Logger LOGGER = LoggerFactory.getLogger(SessionCheckInterceptor.class);

    // 인증 체크가 필요한 URL 리스트
    List<String> urlList;
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public void setUrlList(List urlList) {
        this.urlList = urlList;
    }  

    // 로그인 이후 접속 불가 URL 리스트
    List<String> loginAfterUrlLit;
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public void setLoginAfterUrlLit(List loginAfterUrlLit) {
        this.loginAfterUrlLit = loginAfterUrlLit;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ApiException, IOException {
        LOGGER.debug("======================  Intercepter url is no session check  ======================");
        LOGGER.debug("preHandler Start");
        LOGGER.debug("== URL : {} ",request.getRequestURI());
        String ajaxCall = (String) request.getHeader("AJAX");
        boolean authPass = false;
        try {
            // 로그인 후 접속 불가 url
            if(loginAfterUrlLit != null && loginAfterUrlLit.size() > 0) {
            	
            	if(request.getRequestURI().indexOf("admin") == -1) 
            	{
            		if ( request.getSession().getAttribute("login") != null ) {
            			for(String url : loginAfterUrlLit) {
            				if(request.getRequestURI().indexOf(url) >-1) {
            					/*
									로그인 되어있는 경우 메인으로 이동 (url 직접 입력할 경우)
									ex) 로그인 화면 등..
            					 */
            					response.sendRedirect("/");
            					return false;
            				}
            			}
            		}
            	} else if(request.getSession().getAttribute("adminlogin") != null) {
            		for(String url : loginAfterUrlLit) {
            			if(request.getRequestURI().indexOf(url) >-1) {
            				/*
								로그인 되어있는 경우 메인으로 이동 (url 직접 입력할 경우)
								ex) 로그인 화면 등..
            				 */
            				response.sendRedirect("/admin");
            				return false;
            			}
            		}
            	}
            }
            
            // 로그인 체크하는 url
            if(urlList != null && urlList.size() != 0){
                boolean loginChkType = false;

                for(String url : urlList) {
                    if(request.getRequestURI().indexOf(url) >-1) {
                        // LOGGER.info("=== 로그인 체크하는 url ===", url);
                        loginChkType = true;
                        break;
                    }
                }
				
                if(loginChkType) {
                    if(request.getSession().getAttribute("login") == null && request.getSession().getAttribute("adminlogin") == null) {
                    	LOGGER.debug("Session is not found....");
                        if(ajaxCall != null && Boolean.parseBoolean(ajaxCall)) {
                            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                        }else {
                            // 로그인 시
                        	if (request.getRequestURI().indexOf("/admin") >-1) {
                        		response.sendRedirect("/admin");
                        	}else {
                        		// TODO : 호출 페이지가 무엇인지 파악해서 로그인 후 다시 그 호출 페이지로 갈 수 있도록 해야 한다.
                        		// 모바일에서 넘어오는 경우가 이런 부분이 처리되어야 한다. 
                        		// 해당 로직은 Score 관리쪽에 적용되어 있다.
                        		// 세션에 호출 URL을 저장해야 한다.
                        		System.out.println("call path : " + request.getRequestURI());
                        		HttpSession session = request.getSession();
                        		session.setAttribute("redirectUrl", request.getRequestURI());
                        		response.sendRedirect("/loginForm");
                        	}
                        }
                        return false;
                    }else {
                    	// 관리자 모드로 접속했을 경우 관리자 URL인지 확인 해야 한다.
                    	if (request.getRequestURI().indexOf("/admin") >-1 && request.getSession().getAttribute("adminlogin") != null) {
                    		return true;
                    	}else if(request.getSession().getAttribute("login") != null) {	// 사용자 로긴
                    		LOGGER.debug("login check interceptor.........");
                    		
                    		try
                    		{
                    			LoginVo loginVo = (LoginVo) request.getSession().getAttribute("login");
                    			LOGGER.debug("== loginVo. : {}", loginVo.toString()+" ============================");

                    			String adminYN = loginVo.getGroupadmin();
                    			long userID = loginVo.getUserid();

                    		// GroupAdmin
                    			if(!adminYN.equals("Y") && request.getRequestURI().indexOf("/web/group") >-1) {
                    				response.sendRedirect("/?isApply="+authPass);
                    				return false;
                    			}else {
                    				return true;
                    			}
                    		}
                    		catch(Exception ex)
                    		{
                    			LOGGER.debug("== error. : {}",ex.toString());
                    			HttpSession session = request.getSession();
                    			session.invalidate();
                    			response.sendRedirect("/loginForm");
                    			return false;
                    		}
                    	}
                    }
                }
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception arg3)
            throws ApiException {
        // TODO Auto-generated method stub
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView arg3)
            throws ApiException {
        // TODO Auto-generated method stub
    }
}
