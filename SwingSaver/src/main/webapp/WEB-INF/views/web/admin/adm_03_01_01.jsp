<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >   
                <div class="form-page">                
                    <h2 class="text-center">지역정보등록 <c:if test="${result.result == true}">완료</c:if><c:if test="${result.result == false}">에러</c:if></h2>
                    <div class="success">
                        <img src="/image/log-02-img.png">
                        <p><c:if test="${result.result == true}">지역정보등록이 완료되었습니다.</c:if><c:if test="${result.result == false}">${result.error}</c:if></p>
                    </div>
                    <button id="btnList" class="form-btn" onclick="#">지역정보 보기</button>
                </div>
            </div>
        </div>
    </section>
<script>

$(document).ready(function(){
    $("#btnList").click(function(){
    	fn_areaList();
    });
});

function fn_areaList()
{
	location.href="/admin/areaList";
}
</script>
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>