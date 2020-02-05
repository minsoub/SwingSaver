<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >
                    <h2 class="right-tit">마켓프로 수정</h2>

                    <div class="form-page joinus-page edit-page">


                        <form id="form1" name="form1" method="post">
						<input type="hidden" name="id" value="${proVo.id}">
                            <div class="question">
                                <p>아이디</p>
                                <div class="que-info">
                                    <p>${proVo.email}</p>
                                </div>
                            </div>
                        <div class="question">
                            <p>레슨가격</p>
                            <input type="number" id="lessonprice" name="lessonprice" value="${proVo.lessonprice}" placeholder="레슨가격 입력" required />
                        </div>
                        <div class="question">
                            <p>프로레벨</p>
                            <select name="level">
			                  <option value="">프로레벨을 선택해주세요.</option>
                              <c:forEach var="lblInfo" items="${lblList}" varStatus="status">
                               	<option <c:if test="${lblInfo.code == proVo.level}">selected</c:if>  value="${lblInfo.code}">${lblInfo.codename}(${lblInfo.code})</option>
                              </c:forEach>			                  
                			</select>
                        </div>
                        <div class="question">
                            <p class="text-t">프로필</p>
                            <input type="textarea" name="profile" id="profile" value="${proVo.profile}" placeholder="프로필을 입력해주세요" required />
                        </div>
                        <div class="question">
                            <p class="text-t">수상경력</p>
                            <input type="textarea" name="description" id="description" value="${proVo.description}" placeholder="수상경력을 입력해주세요" required />
                        </div> 

                            <button id="btnSave" class="form-btn">수정</button>
                        </form>
                    </div>

                </div>
            </div>

 </section>
<script>

$(document).ready(function(){

    $("#btnSave").click(function(){
    	fn_proSave();
    });
});

	function fn_proSave()
	{
		
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

	    document.forms1.action = "/admin/market/update";
	    document.forms1.submit();
	}
</script> 
 
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
