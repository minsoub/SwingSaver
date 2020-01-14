<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >   
                    <h2 class="right-tit">그룹등록</h2>

                    <div class="form-page joinus-page edit-page">


                        <form class="form-signin" id='forms1' name="forms1" method="POST">
                            <div class="question">
                                <p>그룹이름</p>
                                <input type="text" id="groupname" name="groupname" maxlength="50" placeholder="그룹이름 입력" required />
                            </div>
                            <div class="question">
                                <p>그룹관리자</p>
                                <select name="userid" id="userid">    
                                    <option value="">스윙세이버 회원선택</option>                            
                                	<c:forEach var="memInfo" items="${memList}" varStatus="status">
                                    	<option value="${memInfo.userid}">${memInfo.lastname}${memInfo.firstname}(${memInfo.email})</option>
                                 	</c:forEach>
                                 </select>                                 
                            </div>
                            <div class="question">
                                <p>그룹타입</p>
                                <select name="grouptype" id="grouptype">
                  <option value="" selected="selected">그룹타입을 선택해주세요.</option>
                  <c:forEach var="grpCode" items="${grpTypList}" varStatus="status">
                  	<option value="${grpCode.code}">${grpCode.codename}</option>
                  </c:forEach>
                </select>
                            </div>
                            <div class="question">
                                <p>사용인원</p>
                                <input type="text" id="quota" name="quota" maxlength="4" placeholder="총 사용인원" required />
                            </div>

                            <div class="question">
                                <p>1인사용</p>
                                <select name="storagespace" id="storagespace">
                  <option value="" selected="selected">1인당 사용 용량 선택</option>
                  <c:forEach var="useCode" items="${useList}" varStatus="status">
                  	<option value="${useCode.code}">${useCode.codename}</option>
                  </c:forEach>
                </select>
                            </div>

                            <div class="question">
                                <p>사업자번호</p>
                                <input type="text" name="address" id="address" maxlength="50" placeholder="사업자번호 입력(-빼고 입력)" required />
                            </div>

                            <div class="question">
                                <p>연락처</p>
                                <input type="text" name="phone" id="phone" maxlength="50" placeholder="전화번호(-빼고 입력)" required />
                            </div>

                            <p class="alert-p">정보를 모두 입력해주세요.</p>
                            <button id="btnSave" class="form-btn">등록</button>
                        </form>
                    </div>

                </div>
            </div>
 </section>
 
<script>

$(document).ready(function(){
    $("#btnSave").click(function(){
    	fn_groupSave();
    });
});

	function fn_groupSave()
	{
	    if($("#groupname").val() == ""){
	        alert("그룹이름을 입력하세요");
	        $("#groupname").focus();
	        return;
	    }
	    if($("#userid").val() == ""){
	        alert("그룹관리자를 선택하세요");
	        $("#userid").focus();
	        return;
	    }
	    if($("#grouptype").val() == ""){
	        alert("그룹타입을 선택하세요");
	        $("#grouptype").focus();
	        return;
	    }
	    if($("#quota").val() == ""){
	        alert("사용인원을  입력하세요");
	        $("#quota").focus();
	        return;
	    }
	    if($("#storagespace").val() == ""){
	        alert("1인당 사용 용량을 선택하세요");
	        $("#storagespace").focus();
	        return;
	    }
	    if($("#phone").val() == ""){
	        alert("연락처를 입력하세요");
	        $("#phone").focus();
	        return;
	    }	    
	    document.forms1.action = "/admin/group/add";
	    document.forms1.submit();
	}
</script>









    <!-- Footer

    <div id="footer">
        <div class="text-center footer-bt">
            <p>Copyright © 2019 Swingsaver. All rights reserved. 문의사항 : support@email.com</p>
        </div>
    </div>

   -->

<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
