<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>


        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">마켓프로등록</h2>

                <div class="form-page joinus-page edit-page">
                    <form class="form-signin" id='forms1' name="forms1" method="POST">
                        <div class="question">
                            <p>아이디</p>
                            <select class="userid" name="userid" id="ueerid">
                            	<option value="">이름이나 이메일 입력</option>
                              <c:forEach var="userInfo" items="${userList}" varStatus="status">
                               	<option value="${userInfo.userid}">${userInfo.lastname}${userInfo.firstname}(${userInfo.email})</option>
                              </c:forEach>	                            
                            </select>
                            <!--  input type="text" placeholder="이름이나 이메일 입력" required /  -->
                            <!-- div class="inquiry-box">
                                <p>홍길동 (sample@mail.com)</p>
                                <p>홍길동 (acser@mail.com)</p>
                                <p class="con-blue">*스윙세이버회원만 조회가능합니다.</p>
                            </div  -->
                        </div>
                        <div class="question">
                            <p>레슨가격</p>
                            <input type="number" id="lessonprice" name="lessonprice" placeholder="레슨가격 입력" required />
                        </div>
                        <div class="question">
                            <p>프로레벨</p>
                            <select name="level">
			                  <option value="">프로레벨을 선택해주세요.</option>
                              <c:forEach var="lblInfo" items="${lblList}" varStatus="status">
                               	<option value="${lblInfo.code}">${lblInfo.codename}(${lblInfo.code})</option>
                              </c:forEach>			                  
                			</select>
                        </div>
                        <div class="question">
                            <p class="text-t">프로필</p>
                            <input type="textarea" name="profile" id="profile" placeholder="프로필을 입력해주세요" required />
                        </div>
                        <div class="question">
                            <p class="text-t">수상경력</p>
                            <input type="textarea" name="description" id="description" placeholder="수상경력을 입력해주세요" required />
                        </div>                       
                       <!--얼랏-->
<!--                        <p class="alert-p">정보를 모두 입력해주세요.</p>-->
                        <button class="form-btn" id="btnSave">등록</button>
                    </form>
                </div>

            </div>
        </div>

    </section>
<script>

$(document).ready(function(){
	
	$('.userid').select2();
	
    $("#btnSave").click(function(){
    	fn_proSave();
    });
});

	function fn_proSave()
	{
	    if($("#userid").val() == ""){
	        alert("아이디를 선택하세요");
	        $("#userid").focus();
	        return;
	    }		
	    if($("#lessonprice").val() == ""){
	        alert("레슨가격을 입력하세요");
	        $("#lessonprice").focus();
	        return;
	    }		
	    if($("#level").val() == ""){
	        alert("프로 레벨을 선택하세요");
	        $("#level").focus();
	        return;
	    }

	    if($("#profile").val() == ""){
	        alert("프로필을 입력하세요");
	        $("#profile").focus();
	        return;
	    }
	    if($("#description").val() == ""){
	        alert("수상경력을  입력하세요");
	        $("#description").focus();
	        return;
	    }

	    document.forms1.action = "/admin/market/proAdd";
	    document.forms1.submit();
	}
</script>    
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
