 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <script language="javascript">
    function logout() {
    	
    	if(confirm("정말로 로그아웃하시겠습니까?")) {
    		location.href="/birdialoginForm";
    	}
    }
 </script>
 <nav id="header">
 	<c:choose>
        <c:when test="${not empty sessionScope.login.userid}">
    		<a href="/birdieya_logout"><img src="/image/logout.png" class="gnb-log" width="100%"></a>
		</c:when>
        <c:otherwise>    		
        	<a href="javascript:logout();"><img src="/image/logout.png" class="gnb-log" width="100%"></a>
		</c:otherwise>
	</c:choose>
    <div class="logo"><img src="/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/golflist.do"><img src="/mobile/image/h-find.png" class="gnb-ser" width="100%"></a>
 </nav>