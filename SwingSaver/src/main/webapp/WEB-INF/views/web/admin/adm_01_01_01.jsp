<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>


            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >   
                <div class="form-page">
                    <h2 class="text-center">그룹등록 완료</h2>
                    <div class="success">
                        <img src="/image/log-02-img.png">
                        <p>그룹등록이 완료되었습니다.</p>
                    </div>
                    <button class="form-btn" id="btnList">그룹관리</button>
                </div>
            </div>
        </div>
    </section>
<script>

$(document).ready(function(){	
    $("#btnList").click(function(){
    	fn_groupList();
    });
});

function fn_groupList()
{
	location.href="/admin/groupList";	
}

</script>    
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
