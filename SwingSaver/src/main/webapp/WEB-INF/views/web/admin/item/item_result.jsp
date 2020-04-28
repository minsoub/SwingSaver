<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >   
                <div class="form-page">
                    <h2 class="text-center">상품저장 결과</h2>
                    <div class="success">
                        <img src="/image/log-02-img.png">
                        <p>상품저장이 완료되었습니다.</p>
                    </div>
                    <button id="btnList" class="form-btn" onclick="#">상품관리</button>
                </div>
            </div>
        </div>
    </section>
<script>

$(document).ready(function(){

    $("#btnList").click(function(){
    	location.href="/admin/item/itemList";
    });
});

</script>
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>