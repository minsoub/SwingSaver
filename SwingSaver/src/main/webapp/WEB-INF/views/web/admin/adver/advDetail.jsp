<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
<form id="form1" name="form1" method="post">
<input type="hidden" name="seq" value="${advInfo.seq}">
</form>
            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >  
                    <h2 class="right-tit">광고사이트 상세</h2>
                    <div class="sub-mem-list">
                    <h4 class="sub-tit">광고사이트</h4>
                    <div class="sub-g-btn">
                        <button type="button" id="btnModify" class="edit-btn" data-target="#">수정</button>
                        <button type="button" id="btnDelete" class="edit-btn" data-toggle="modal" data-target="#adm_02_02_01">삭제</button>
                        <button type="button" id="btnList"   class="sea-btn add-btn" data-target="#">
                        <img src="/image/back-list.png" cwidth="100%">광고사이트 목록</button>
                    </div>
                        
                    <div class="col-xs-12 table-box">
                        <div class="table-responsive">
                            <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                                <colgroup>
                                    <col width="30%">
                                    <col width="70%">
                                </colgroup>

                                <tbody>
                                    <tr>
                                        <td><strong>사이트명</strong></td>
                                        <td>${advInfo.site_name}</td>
                                    </tr>                                    
                                    <tr>
                                        <td><strong>사이트 URL</strong></td>
                                        <td>${advInfo.site_url}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>정렬순서</strong></td>
                                        <td>${advInfo.order_no}</td>
                                    </tr>                                    
                                    <tr>
                                        <td><strong>사용여부</strong></td>
                                        <td>${advInfo.use_yn}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>사이트 설명</strong></td>
                                        <td>${advInfo.description}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>사이트 이미지</strong></td>
                                        <td><img src='<c:url value="${advInfo.image_url}" />'></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>

                </div>
            </div>
 </section>

    <!--    그룹삭제 adm_02_02_01 -->
    
    <div class="modal fade" id="grpmemberdel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">지역정보 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <h5>${groupInfo.zone_nm}</h5>
                    <p>해당 광고사이트 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="delete" class="modal-btn btn-secondary" data-dismiss="modal">삭제</button>
                        </div>  
                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="close" class="modal-btn">취소</button>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>

$(document).ready(function(){

    $("#btnList").click(function(){
    	fn_groupList();
    });
    $("#btnModify").click(function(){
    	fn_modify();
    });
    
    $('#btnDelete').click(function() {
        $("#grpmemberdel").modal("show");
    }); 
    
    $("#delete").click(function(){
        var obj = new Object();
        obj.seq = "${advInfo.seq}";

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/advList/delete","POST",jsonData);
    });
    
    $("#close").click(function(){  	
        $("#grpmemberdel").modal("hide");
    });
});

// 그룹 수정화면으로 이동
function fn_modify()
{
	document.form1.action = "/admin/advList/modify";
	document.form1.submit();
}
// 그룹 리스트로 이동
function fn_groupList()
{
	location.href="/admin/advList";
}
</script>
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>