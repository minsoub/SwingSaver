<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>

<body>

    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>


    <div class="form-page joinus-page">
        <form name="forms1">
            <h1 class="text-center">회원가입</h1>

            <div class="email-q-01">
                <p><span></span>이메일</p>
                <input type="text" id="email01" placeholder="이메일"  />@
                <input type="text" class="email-input-02" name="stremail02" id="stremail02" readonly value="">
                <select class="que-val" id="selemail02" name="grouptype" onChange="selemail(this)">
                    <option value="" selected>선택하세요</option>
                    <option value="naver.com">naver.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="hotmail.com">hotmail.com</option>
                    <option value="nate.com">nate.com</option>
                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                    <option value="empas.com">empas.com</option>
                    <option value="dreamwiz.com">dreamwiz.com</option>
                    <option value="freechal.com">freechal.com</option>
                    <option value="lycos.co.kr">lycos.co.kr</option>
                    <option value="korea.com">korea.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="hanmir.com">hanmir.com</option>
                    <option value="paran.com">paran.com</option>
                    <option value="1">직접입력</option>
                </select>
            </div>
            <div class="question02">
                <p><span></span>이름</p>
                <input class="tex-01" type="text" id="lastname" placeholder="성"  />
                <input class="tex-02" type="text" id="firstname" placeholder="이름"  />
                
            </div>
            <div class="question02">
                <p><span></span>생년월일</p>
                <select id="year" name="year" class="que-val">
                	<c:forEach var="i" begin="1940" end="2010">
                		<option value="${i}">${i} 년</option>
                	</c:forEach>
                </select>
                <select id="month" name="month" class="que-val">
                	<c:forEach var="i" begin="1" end="12">
                		<c:if test='${i < 10}'>
                			<option value="0${i}">${i}월</option>
                		</c:if>
                		<c:if test='${i > 9}'>
                			<option value="${i}">${i}월</option>
                		</c:if>
                	</c:forEach>
                </select>
                <select id="day" name="day" class="que-val">
                	<c:forEach var="i" begin="1" end="31">
                		<c:if test='${i < 10}'>
                			<option value="0${i}">${i}일</option>
                		</c:if>
                		<c:if test='${i > 9}'>
                			<option value="${i}">${i}일</option>
                		</c:if>
                	</c:forEach>
                </select>
                                                
                <!-- input class="tex-01" type="text" id="year" name="year" placeholder="년도(4글자)"  />
                <input class="tex-03" type="text" id="month" name="month" placeholder="월"  />
                <input class="tex-03 tex-04" type="text" id="day" name="day" placeholder="일"  /   -->
            </div>

            <div class="question">
                <p><span></span>비밀번호</p>
                <input type="password" id="pwd" placeholder="영문/숫자/특수문자 6자리 이상 조합"  />
            </div>
            <div class="question">
                <p><span></span>재확인</p>
                <input type="password" id="pwdConfirm" placeholder="비밀번호 재확인"  />
            </div>

<!-- 약관 정의  -->

                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li>이용약관 동의(필수)</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk1" id="chk1" value="Y" checked>동의
                            </li>
                        </ul>
                        <textarea name="" id="">여러분을 환영합니다.
스윙세이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 스윙세이버 서비스의 이용과 관련하여 스윙세이버 서비스를 제공하는 스윙세이버 주식회사(이하 ‘스윙세이버’)와 이를 이용하는 스윙세이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 스윙세이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                        </textarea>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>개인정보 수집 및 이용 동의(필수)</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk2" id="chk2" value="Y" checked>동의
                            </li>
                        </ul>
                        <textarea name="" id="">1.수집‧이용목적 : 스윙세이버 홈페이지 사용
2.수집 항목 : (필수) 이름, 생년월일, 연락처(본인), 이메일
3.보유기간 : 회원가입일로부터 1년
위의 목적으로 개인정보 수집‧이용에 동의합니다.
                        </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>마케팅/홍보의 수집 및 이용 동의(선택)</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk3" id="chk3" value="Y" checked>동의
                            </li>
                        </ul>
                        <textarea name="" id="">1. 마케팅 정보 선택적 수집·이용 목적
스윙세이버 고객에 대한 편의제공, 귀사 및 제휴업체의 상품·서비스 안내 및 이용권유, 사은·판촉행사 등의 마케팅 활동, 시장조사 및 상품·서비스 개발연구 등을 목적으로 수집·이용 합니다.
2. 수집·이용할 마케팅 정보의 항목
3. 개인식별정보: 성명, 전화번호, e-mail, 주소 등.
4. 고객 ID, 접속 일시, IP주소 SNS아이디 등.
5. 수집이용하는 마케팅 정보의 보유 및 이용기간 : 동의일로부터 회원 탈퇴 혹은 마케팅 동의 해제시 까지 보유·이용합니다.
※ 상기 내용이 변동하는 경우 당사의 인터넷홈페이지 게시 등을 통해 그 내용을 공시합니다.
                        </textarea>
                    </li>
                </ul>

<!-- 약관 정의 끝  -->
            <button class="form-btn" type="button" id="member">등록</button>
        </form>
    </div>

    <!-- Footer -->

    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
<script>

    $(document).ready(function(){
        $("#year").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
        $("#month").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
        $("#day").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만


        $("#member").click(function(){

            var email01 = $("#email01").val();
            var selemail02 = $("#stremail02").val();
            var firstname = $("#firstname").val();
            var lastname=$("#lastname").val();
            var year=$("#year").val();
            var month=$("#month").val();
            var day=$("#day").val();
            /*var phone=$("#phone").val();
            var gender = $(':input:radio[name="gender"]:checked').val();*/

            var pwd = $("#pwd").val();
            var pwdConfirm = $("#pwdConfirm").val();

            
            if(email01 =="" || selemail02 == ""){
                alert("이메일 정보를 확인 하세요");
                return;
            }
            if(firstname == ""){
                alert("성을 입력 하세요");
                $("#firstname").focus();
                return;
            }
            if(lastname == ""){
                alert("이름을 입력 하세요");
                $("#lastname").focus();
                return;
            }
            if(year == "" || month == ""  || day == "" ){
                alert("생년월일을 입력 하세요");
                return;
            }
            if(!birthChk(year+month+day)){
                alert("생년월일을 다시 입력해주세요.");
                return;
            }


            /*if(phone.length == ""){
                alert("전화번호를 입력 하세요");
                return;
            }*/
            if(!checkPassword(pwd,"pwd") || !checkPassword(pwdConfirm,"pwdConfirm")){
                return;
            }
            if(pwd != pwdConfirm){
                alert("비밀번호가 틀립니다. 다시 입력하세요");
                $('#pwdConfirm').val('').focus();
                return;
            }

            var email = email01+"@"+selemail02;
            if(!validateEmail(email)){
                alert("올바른 이메일 주소를 입력하세요");
                return;
            }
            
            // 약관 동의 여부
            if ($('input:checkbox[id="chk1"]').is(":checked") == false)
            {
            	alert("이용약관 동의는 필수입니다!!!");
            	return;
            }
            if ($('input:checkbox[id="chk2"]').is(":checked") == false)
            {
            	alert("개인정보 수입 및 이용 동의는 필수입니다!!!");
            	return;
            }
            
            var obj = new Object();
            obj.email = email;
            obj.firstname = firstname;
            obj.lastname = lastname;
            obj.dob = year+month+day;
            /*obj.phone = phone;
            obj.gender = gender;*/
            obj.userpassword = pwd;
            var jsonData = JSON.stringify(obj);
            console.log(jsonData);
            AjaxCallReg("/web/user/join","POST",jsonData);

        });
    });

    function selemail(data)
    {
    	//alert(data.value);
    	if (data.value == "1")
    	{
    		$("#stremail02").val("");
    		$("#stremail02").attr("readonly", false);
    	}else {
    		$("#stremail02").attr("readonly", true);
    		$("#stremail02").val(data.value);
    	}
    }
</script>
</html>

