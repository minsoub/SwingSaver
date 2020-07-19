<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
    <nav id="header">
        <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo">${golfInfo.countryclub_nm}</div>
        <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
    </nav>
    
	<section id="contents">

		<div class="">
        	<!-- img src="/mobile/image/golf-main-bn.png"width="100%"  -->
        	<img src="<c:url value='${golfInfo.assets_url}'/>" width="100%">
		</div>
		
    	<div class="golf-main"> 
   			<div class="golf-info">
        		<img src="/mobile/image/like-on.svg" class="list-like" width="100%">
        		<p>${golfInfo.zone_nm}</p>
        		<h2>${golfInfo.countryclub_nm}</h2>
   			</div>
   			<div class="main-btn gfmain-btn">
        		<a href="#" class="">
        		<img src="/mobile/image/main-reserve.png" width="100%">
        		<p>골프장예약</p>
        		</a>
        
        		<a href="#" class="">
        		<img src="/mobile/image/main-event.png" width="100%">
        		<p>이벤트</p>
        		</a>
    		</div>
    		<div class="play-btn">
        		<a class=""  href="javascript:CallApp('${golfInfo.countryclub_id}');">PLAY</a>
    		</div>
    	</div>

	</section>
	
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>