<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>

    <div class="form-page joinus-page">
        <form class="form-signin" id='forms1' name="forms1" method="POST">
            <h1 class="text-center">ADMIN LOGIN</h1>

            <div class="question">
                <p>아이디</p>
                <input type="text" id="email" name="email" placeholder=" " required />
            </div>
            <div class="question">
                <p>비밀번호</p>
                <input type="password" id="password" name="password" placeholder=" "  onkeyup="passwordChange(event)" required />
            </div>


            <button class="form-btn" type="button" id="login">로그인</button>
            <div class="id-login">
                <label class="auto-log"><input type="checkbox" name=""> 자동로그인</label>
<!--
                <ul class="search-login">
                    <li><a href="#">아이디 찾기</a></li>
                    <li><a href="#">비밀번호 찾기</a></li>
                    <li><a href="#"><strong>회원가입하기</strong></a></li>
                </ul>
-->
            </div>
        </form>
    </div>

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
});

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
    document.forms1.action = "/admin/adminLogin";
    document.forms1.submit();
}
function passwordChange(event){
	if ( event.keyCode == 13){
		fn_login();
	}
}

</script>


</html>
