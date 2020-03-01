<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>

<body>

    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>


    <div class="form-page joinus-page">
            <h1 class="text-center">회원가입</h1>
            <button class="form-btn" id="btnReg" style="padding: 0;text-align: left;padding-left: 30px;margin-top: 5px;">이메일로 회원가입</button>            
            <button class="form-btn naver_log" id="btnNaver"><img src="/image/naver-icon.png" style="    padding-right: 15px;
    border-right: 1px solid #fff;
    margin-right: 10px;"> 네이버로 회원가입</button>
            <button class="form-btn face_log" id="btnFacebook"><img src="/image/facebook-icon.png" style="    padding-right: 15px;
    border-right: 1px solid #fff;
    margin-right: 10px;"> 페이스북으로 회원가입</button>
            <button class="form-btn kakao_log" id="btnKakao"><img src="/image/kakao-icon.png" style="    padding-right: 15px;
    border-right: 1px solid #fff;
    margin-right: 10px;"> 카카오로 회원가입</button>
    </div>
 
    <!-- Footer -->

    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
<script>
$(document).ready(function(){
	$("#btnReg").click(function(){
		location.href="/web/user/register"
	});
	$("#btnFacebook").click(function(){
		alert("준비중입니다!");
	});
	$("#btnKakao").click(function(){
		alert("준비중입니다!");
	});	
	$("#btnNaver").click(function(){
		alert("준비중입니다!");
	});		
	
});

</script>
</html>

