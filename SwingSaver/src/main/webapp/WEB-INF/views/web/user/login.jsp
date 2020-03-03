<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
    
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>

<body>

    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>
    <div class="form-page">
        <form class="form-signin" id='forms1' name="forms1" method="POST">
        <input type="hidden" name="prev_url" value="${prev_url}">
            <h1 class="text-center">LOGIN</h1>
            <div class="question">
                <input type="text" id="email" name="email" required="" onchange="emailChange()" onfocus="$('#emailLabel').css('display','none');" onkeyup="emailChange()"  oninput="emailChange()">
                <label id='emailLabel'><img src="/image/id-icon.png" width="100%">아이디</label>
            </div>
            <div class="question">
                <input type="password" id="password" name="password" required="" onchange="passwordChange" onfocus="$('#passwordLabel').css('display','none');" onkeyup="passwordChange(event)"  oninput="passwordChange(event)">
                <label id='passwordLabel'><img src="/image/pw-icon.png" width="100%">비밀번호</label>
            </div>

            <button class="form-btn" type="button" id="login">로그인</button>
            <div class="id-login">
                <%--<label class="auto-log"><input type="checkbox" value="remember-me"> 자동로그인</label>--%>
                <ul class="search-login">
                    <li><a href="/web/search/email">아이디 찾기</a></li>
                    <li><a href="/web/search/pw">비밀번호 찾기</a></li>
                    <li><a href="/web/user/member"><strong>회원가입하기</strong></a></li>
                </ul>
            </div>
            <button class="form-btn naver_log" id="btnNaver"><img src="../image/naver-icon.png" style="    padding-right: 15px;border-right: 1px solid #fff;margin-right: 10px;"> 네이버로 로그인</button>
            <button class="form-btn face_log"  id="btnface"><img src="../image/facebook-icon.png" style="    padding-right: 15px;border-right: 1px solid #fff;margin-right: 10px;"> 페이스북으로 로그인</button>
            <button class="form-btn kakao_log" id="btnkakao"><img src="../image/kakao-icon.png" style="    padding-right: 15px;border-right: 1px solid #fff;margin-right: 10px;"> 카카오로 로그인</button>            
        </form>
    </div>
    <div id="naver_id_login"></div>
    <!-- Footer -->

    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

    <!-- Footer -->
	<form  id='frm' name="'frm'" method="GET"></form>
</body>
<script>

    var message = "${returnCode}";
    if(message == "9999"){
        alert("로그인에 실패하였습니다. \n Email 및 비밀번호를 확인해주세요");
    }
    console.log(message);
    $(document).ready(function(){
        $("#login").click(function(){
        	fn_login();
        });
        
    	$("#btnface").click(function(){
    		alert("준비중입니다!");
    		document.forms1.action ="";
    		return;
    	});
    	$("#btnkakao").click(function(){
    		alert("준비중입니다!");
    		document.forms1.action ="";
    		return;
    	});	
    	$("#btnNaver").click(function(){
    		document.forms1.action ="";
    		fn_naver_login();
    	});	
    });
    
    function fn_naver_login()
    {
    	var client_id = "${naverId}";  // "HU7BlUDoiX1K80yIxsVP";
    	var response_type = "code";
    	var redirect_uri = "${naverUrl}";  // encodeURIComponent("https://localhost:8443/naverLoginReturn");
    	var state = "${state}";
    	var url = "https://nid.naver.com/oauth2.0/authorize?client_id="+client_id+"&response_type="+response_type+"&redirect_uri="+redirect_uri+"&state="+state;
    	alert(url);
    	document.domain = "localhost";
    	window.open(url, "popup", "width=400, height=600, resizable=yes, scrollbars=auto");
    }
    
    function fn_login(){
    	var email = $("#email").val();
        var password=$("#password").val();

        if(email == ""){
            alert("이메일 주소를 입력하세요");
            $("#email").focus();
            return;
        }
        if(password == ""){
            alert("비밀번호를 입력하세요");
            $("#password").focus();
            return;
        }
        document.forms1.action = "/login";
        document.forms1.submit();
    }
    
    function passwordChange(event){
    	if($('#email').val().length > 0 ){
    		$('#emailLabel').css("display","none");
    	}else{
    		$('#emailLabel').css("display","block");
    	}
    	
    	if ( event.keyCode == 13){
    		fn_login();
    	}
    }
    
    function emailChange(){
    	if($('#password').val().length > 0 ){
    		$('#passwordLabel').css("display","none");
    	}else{
    		$('#passwordLabel').css("display","block");
    	}
    }
</script>
</html>
