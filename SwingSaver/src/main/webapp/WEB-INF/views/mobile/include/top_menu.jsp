 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <nav id="header">
 	<c:choose>
        <c:when test="${not empty sessionScope.login.userid}">
    		<img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
		</c:when>
        <c:otherwise>    		
        	<a href="/loginForm">><img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%"></a>
		</c:otherwise>
	</c:choose>
    <div class="logo"><img src="/mobile/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>