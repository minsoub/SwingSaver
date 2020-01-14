<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >   
                    <h2 class="right-tit">지역정보 수정</h2>

                    <div class="form-page joinus-page edit-page">


                        <form class="form-signin" id='forms1' name="forms1" method="POST">
                            <div class="question">
                                <p>국가코드</p>
                                <select name="country_id" id="country_id" disabled>    
                                    <option value="">국가를 선택해주세요.</option>                            
                                	<c:forEach var="ctryInfo" items="${countryList}" varStatus="status">
                                    	<option  <c:if test="${ctryInfo.code == areaInfo.country_id}">selected</c:if>  value="${ctryInfo.code}">${ctryInfo.codename}(${ctryInfo.code})</option>
                                 	</c:forEach>
                                 </select> 
                            </div>
                            <div class="question">
                                <p>지역코드</p>
                                <input type="text" name="zone_id" id="zone_id" placeholder="지역코드" required value="${areaInfo.zone_id}" readonly maxlength=4 />
                            </div>
                            <div class="question">
                                <p>지역명</p>
                                <input type="text" name="zone_nm" id="zone_nm" placeholder="지역명" required value="${areaInfo.zone_nm}"  maxlength=50 />
                            </div>                            
                            <div class="question">
                                <p>지역담당자</p>
                                <input type="text" name="user_name" id="user_name" placeholder="지역담당자" value="${areaInfo.user_name}" required maxlength="30" />
                            </div>                            
                            <div class="question">
                                <p>주소</p>
                                <input type="text" name="address" id="address" placeholder="지역담당자 주소" required value="${areaInfo.address}" maxlength="100"/>
                            </div>
                            <div class="question">
                                <p>연락처</p>
                                <input type="number" name="phone" id="phone" placeholder="지역담당자 전화번호(-빼고 입력)" value="${areaInfo.phone}" maxlength="12" oninput="maxLengthCheck(this)" pattern=" "  required />
                            </div>

                            <div class="question">
                            <p>이메일</p>
                            <input type="email" name="email" id="email" placeholder="담당자 메일" required value="${areaInfo.email}" maxlength=100 />
                        </div>
                            <div class="question">
                                <p>비고</p>
                                <input type="text" name="description" id="description" value="${areaInfo.description}" placeholder="description">
                            </div>

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
    	fn_areaSave();
    });
});

	function fn_areaSave()
	{
	    if($("#zone_nm").val() == ""){
	        alert("지역명을 입력하세요");
	        $("#zone_nm").focus();
	        return;
	    }
	    if($("#user_name").val() == ""){
	        alert("지역담당자명을  입력하세요");
	        $("#user_name").focus();
	        return;
	    }
	    if($("#address").val() == ""){
	        alert("지역담당자 주소를 입력하세요");
	        $("#address").focus();
	        return;
	    }
	    if($("#phone").val() == ""){
	        alert("연락처를 입력하세요");
	        $("#phone").focus();
	        return;
	    }	
	    $("#country_id").removeAttr("disabled");
	    
	    document.forms1.action = "/admin/area/update";
	    document.forms1.submit();
	}
</script>

<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
