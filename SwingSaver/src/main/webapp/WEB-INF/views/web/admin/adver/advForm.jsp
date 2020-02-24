<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">광고제휴 사이트 추가</h2>

                <div class="form-page joinus-page edit-page">


                    <form class="form-signin" id='forms1' name="forms1" method="POST" enctype="multipart/form-data">
                    <input type="hidden" id="seq" name="seq" value="0">
					<input type="hidden" id="log_image" name="log_image">
                        <div class="question">
                            <p>사이트명</p>
                            <input type="text" id="site_name" name="site_name" placeholder="사이트명" maxlength="100" required />
                        </div>
                        <div class="question">
                            <p>사이트 URL</p>
                            <input type="text" id="site_url" name="site_url" placeholder="사이트 URL" maxlength="100" required />
                        </div>
                        <div class="question">
                            <p>사이트 이미지</p>
                            <input type="file" id="imageFile" name="imageFile" placeholder="기본이미지 저장경로" style="width:350;"  />
                        </div>
                        <div class="question">
                            <p>정렬순서</p>
                            <input type="number" id="order_no" name="order_no" placeholder="순서" maxlength="3"  value="99" />
                        </div>  

                        <div class="question">
                        	<p>사용여부</p>
                        	<input type="checkbox" id="use_yn" name="use_yn" value="Y" checked>사용여부 (체크시 사용함)
                        </div>        
         
                        <div class="question">
                            <p>사이트 설명</p>
                            <input type="text" id="description" name="description" placeholder="description" maxlength="1000" >
                        </div>
                        <button id="btnSave" class="form-btn">등록</button>
                    </form>
                </div>


            </div>
        </div>
    </section>

<script>

$(document).ready(function(){
    $("#btnSave").click(function(){
    	fn_advSave();
    });
});


function fn_advSave()
{
    if($("#site_name").val() == ""){
        alert("사이트명을 입력하세요");
        $("#site_name").focus();
        return;
    }
    if($("#site_url").val() == ""){
        alert("사이트 URL을 입력하세요");
        $("#site_url").focus();
        return;
    }   
    if($("#imageFile").val() == ""){
        alert("사이트 이미지를 입력하세요");
        $("#imageFile").focus();
        return;
    }
	    
    document.forms1.action = "/admin/advList/add";
    document.forms1.submit();
}
</script>
        
        
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
