<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >
                    <h2 class="right-tit">그룹 수정</h2>

                    <div class="form-page joinus-page edit-page">

                        <form id="form1" name="form1" method="post">
						<input type="hidden" name="groupid" value="${groupInfo.id}">
                            <div class="question">
                                <p>그룹아이디</p>
                                <div class="que-info">
                                    <p>${groupInfo.id}</p>
                                </div>
                            </div>
                            <div class="question">
                                <p>그룹이름</p>
                                <input type="text" id="groupname" name="groupname" class="que-val" value="${groupInfo.groupname}" required />
                            </div>
                            <div class="question">
                                <p>그룹관리자</p>
                                <select name="userid" id="userid">    
                                    <option value="">스윙세이버 회원선택</option>                            
                                	<c:forEach var="memInfo" items="${memList}" varStatus="status">
                                    	<option <c:if test="${memInfo.userid == groupInfo.userid}">selected</c:if> value="${memInfo.userid}">${memInfo.lastname}${memInfo.firstname}(${memInfo.email})</option>
                                 	</c:forEach>
                                 </select> 
                            </div>
                            <div class="question">
                                <p>그룹타입</p>
                                <select name="grouptype" id="grouptype">
                  <option value="">그룹타입을 선택해주세요.</option>
                  <c:forEach var="grpCode" items="${grpTypList}" varStatus="status">
                  	<option <c:if test="${grpCode.code == groupInfo.grouptype}">selected</c:if> value="${grpCode.code}">${grpCode.codename}</option>
                  </c:forEach>
                </select>
                            </div>
                            <div class="question">
                                <p>사용인원</p>
                                <input type="text" id="quota" name="quota" class="que-val" value="${groupInfo.quota}" maxlength="4" required />
                            </div>

                            <div class="question">
                                <p>1인사용</p>
                                <select name="storagespace" id="storagespace">
                  <option value="">1인당 사용 용량 선택</option>
                  <c:forEach var="useCode" items="${useList}" varStatus="status">
                  	<option <c:if test="${useCode.code == groupInfo.storagespace}">selected</c:if> value="${useCode.code}">${useCode.codename}</option>
                  </c:forEach>
                </select>
                            </div>

                            <div class="question">
                                <p>사업자번호</p>
                                <input type="text" id="address" name="address" class="que-val" value="${groupInfo.address}" required />
                            </div>

                            <div class="question">
                                <p>연락처</p>
                                <input type="text" id="phone" name="phone" class="que-val" value="${groupInfo.phone}" required />
                            </div>
<!--                                알럿-->
<!--                            <p class="alert-p">정보를 모두 입력해주세요.</p>-->
                            <button id="btnUpdate" class="form-btn">수정</button>
                        </form>
                    </div>

                </div>
            </div>
 </section>
 
 <script>

$(document).ready(function(){
    $("#btnUpdate").click(function(){
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
	    document.form1.action = "/admin/group/update";
	    document.form1.submit();
	}
</script>

<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
