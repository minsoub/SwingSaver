<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
    
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    
       <style>
        .mask-te {
            margin: 20% 2% 0 2%;
        }

        .qr_adv_logo {
            text-align: center;
        }

        .ad-box-wrap {
            background-color: #fff;
            border-radius: 10px;
            margin-top: 20px;
            width: 100%;
        }

        .ad-box-left {
            width: 46%;
        }

        .qr_adv_logo h4 {
            text-align: center;
            color: #fff;
            font-size: 24px;
            margin: 0;
        }

        .qr_adv_logo img {
            width: 70%;
        }

        .ad-box-left,
        .ad-box-right {
            display: inline-block;
            vertical-align: middle;
        }

        .ad-box-right p {
            line-height: 1.3;
            margin: 0;
            padding: 10px 0;
            border-bottom: 1px solid #d5d5d5;
            font-size: 15px;
        }

        .ad-box-left img {
            padding: 10px 0 10px 10px;
        }

        .ad-box-right {
            padding: 10px;
        }

        .ad-box-right {
            width: 52%;
        }

        .ad-box-left,
        .ad-box-right {
            display: inline-block;
            vertical-align: middle;
        }

        .ad-box-bottom img {
            width: 17%;
            position: absolute;
            top: -8px;
            left: 23px;
        }

        .ad-box-bottom p {
            line-height: 1.3;
            font-size: 13px;
            display: inline-block;
            letter-spacing: -0.5;
            margin-left: 29%;
        }

        .ad-box-bottom {
            background-color: #ededed;
            padding-top: 15px;
            position: relative;
        }

        .mask-te a {
            background: #e03535;
            border: 1px solid #e03535;
            color: #fff;
            display: block;
            text-align: center;
            font-size: 17px;
            font-weight: 100;
            padding: 17px;
        }

        a:link,
        a:active,
        a:visited {
            text-decoration: none;
            /* border: 0px; */
        }

    </style>
</head>

<body>

    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>
    <div class="form-page">
        <form class="form-signin" id='forms1' name="forms1" method="POST">
        <input type="hidden" name="prev_url" id="prev_url" value="${prev_url}">
            <h1 class="text-center">LOGIN</h1>
            <div class="question">
                <input type="text" id="email" name="email" required="" onchange="emailChange()" onfocus="$('#emailLabel').css('display','none');" onkeyup="emailChange()"  oninput="emailChange()">
                <label id='emailLabel'><img src="/image/id-icon.png" width="100%">아이디</label>
            </div>
            <div class="question">
                <input type="password" id="password" name="password" required="" onchange="passwordChange" onfocus="$('#passwordLabel').css('display','none');" onkeyup="passwordChange(event)"  oninput="passwordChange(event)">
                <label id='passwordLabel'><img src="/image/pw-icon.png" width="100%">비밀번호</label>
            </div>
</form>
            <button class="form-btn" type="button" id="login">로그인</button>
            <div class="id-login">
                <label class="auto-log"><input type="checkbox" id="idSaveCheck" value="remember-me"> 아이디저장</label>
                <ul class="search-login">
                    <li><a href="/web/search/email">아이디 찾기</a></li>
                    <li><a href="/web/search/pw">비밀번호 찾기</a></li>
                    <li><a href="/web/user/member"><strong>회원가입하기</strong></a></li>
                </ul>
            </div>
            <button class="form-btn naver_log" id="btnNaver"><img src="../image/naver-icon.png" style="    padding-right: 15px;border-right: 1px solid #fff;margin-right: 10px;"> 네이버로 로그인</button>
            <button class="form-btn face_log"  id="btnface"><img src="../image/facebook-icon.png" style="    padding-right: 15px;border-right: 1px solid #fff;margin-right: 10px;"> 페이스북으로 로그인</button>
            <button class="form-btn kakao_log" id="btnkakao"><img src="../image/kakao-icon.png" style="    padding-right: 15px;border-right: 1px solid #fff;margin-right: 10px;"> 카카오로 로그인</button>            
        
    </div>
    <div id="naver_id_login"></div>
    
   <!--    모바일웹으로 접속 시  -->

    <div class="modal fade back_modal" id="mobile_web" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-pop">
                <!-- 모달 이름 -->
                <div class="window">
                    <div class="mask-te">
                        <div class="qr_adv_logo">
                        <h4>폰 하나로 충분합니다</h4>
                        <img src="/image/qr_adv_logo.png">
                        </div>
                        <div class="ad-box-wrap">
                            <div class="ad-box-left">
                                <img src="/image/qr_adv.png" width="100%;">
                            </div>
                            <div class="ad-box-right">
                                <p>AI 코치로 나에게<br>딱맞는 코칭 제공!</p>
                                <p>나혼자<br>셀프라운딩을!</p>
                                <p>이젠 내 스코어도<br>통계 & 분석 & 관리</p>
                                <p>거리, 방향, 풍향 등<br>다양한 정보 한눈에!</p>
                            </div> 
                        <div class="ad-box-bottom">
                            <img src="/image/googleplay_logo.png" width="100%;">
                            <p>11월 런칭 예정! 버디야 앱을<br>다운받으면, 편리하게 이용 가능해요.</p>
                            <!-- p>지금 플레이스토어에서 버디야 앱을<br>다운받으면, 편리하게 이용 가능해요.</p  -->
                        </div>   
                            
                            <a href="/m/score">버디야 스코어 이력 관리 ＞</a>
                        </div>

                    </div>

                </div>
                <!-- button type="button" class="mo-pop-x" data-dismiss="modal">괜찮습니다. 모바일웹으로 볼게요.</button  -->


            </div>
        </div>
    </div>
	 <!-- 모바일로 접속  시 -->

    
    <!-- Footer -->

    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

    <!-- Footer -->
	<form  id='frm' name="'frm'" method="GET"></form>
</body>
<script>

    var message = "${returnCode}";
    
    var domain_url = "www.swingsaver.co.kr";
    
    if(message == "9999"){
        alert("로그인에 실패하였습니다. \n Email 및 비밀번호를 확인해주세요");
    }
    console.log(message);
    
    if ($("#prev_url").val() == "redirect:/score/scoreRegister")
    {
    	 $("#mobile_web").modal();
    }
    
    $(document).ready(function(){
        $("#login").click(function(){
        	fn_login();
        });
        
    	$("#btnface").click(function(){
    		document.forms1.action ="";
    		fn_facebook_login();
    	});
    	
    	$("#btnkakao").click(function(){
    		document.forms1.action ="";
    		fn_kakao_login();
    	});	
    	
    	$("#btnNaver").click(function(){
    		document.forms1.action ="";
    		fn_naver_login();
    	});	
    	
        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var key = getCookie("key");
       	console.log(key);
        $("#email").val(key); 
         
        if($("#email").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
            $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }
         
        $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
            if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
            }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("key");
            }
        });
         
        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("#email").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
            if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
            }
        });    	
    	
    });
    
    $("#email").keydown(function(key) {
    	if (key.keyCode == 13) {
    		fn_login();
    	}
    });
    $("#password").keydown(function(key) {
    	if (key.keyCode == 13) {
    		fn_login();
    	}
    });
    
    function fn_naver_login()
    {
    	var client_id = "${naverId}";   
    	var response_type = "code";
    	var redirect_uri = "${naverUrl}";  
    	var state = "${state}";
    	// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=jyvqXeaVOVmV&redirect_uri=http%3A%2F%2Fservice.redirect.url%2Fredirect&state=hLiDdL2uhPtsftcU
    	var url = "https://nid.naver.com/oauth2.0/authorize?client_id="+client_id+"&response_type="+response_type+"&redirect_uri="+redirect_uri+"&state="+state;
    	console.log(url);
    	document.domain = domain_url;  // "localhost";
    	window.open(url, "popup", "width=400, height=600, resizable=yes, scrollbars=auto");
    }
    
    function fn_kakao_login()
    {
    	var client_id = "${kakaoId}";   
    	var response_type = "code";
    	var redirect_uri = "${kakaoUrl}";  
    	var state = "${state}";
    	var url = "https://kauth.kakao.com/oauth/authorize?client_id="+client_id+"&redirect_uri="+redirect_uri+"&response_type="+response_type;
    	document.domain = domain_url;  // "localhost";
    	window.open(url, "popup", "width=400, height=600, resizable=yes, scrollbars=auto");	
    }
    
    function fn_facebook_login()
    {
    	var client_id = "${facebookId}";   
    	var resource_type = "token";
    	var redirect_uri = "${facebookUrl}";  
    	var state = "${state}";
    	var url = "https://www.facebook.com/v6.0/dialog/oauth?client_id="+client_id+"&redirect_uri="+redirect_uri+"&resource_type="+resource_type+"&state="+state;
    	document.domain = domain_url;  // "localhost";
    	window.open(url, "popup", "width=600, height=600, resizable=yes, scrollbars=auto");	
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
    
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
    
</script>
</html>
