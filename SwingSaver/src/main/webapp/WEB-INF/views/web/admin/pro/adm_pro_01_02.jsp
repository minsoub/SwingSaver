<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >  
                    <h2 class="right-tit">마켓프로상세</h2>
                    <div class="sub-mem-list">
                    <h4 class="sub-tit">프로정보</h4>
                    <div class="sub-g-btn">
                        <button type="button" id="btnModify" class="edit-btn" data-target="#">수정</button>
                        <button type="button" class="edit-btn" data-toggle="modal" data-target="#adm_02_02_01">삭제</button>
                        <button type="button" id="btnList" class="sea-btn add-btn" data-target="#"><img src="../image/back-list.png" cwidth="100%">프로목록</button>
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
                                       <td class="bold-td" colspan="2"><img class="profile-img" src="../image/profile-img.png"></td>
                                   </tr>
                                    <tr>
                                        <td><strong>아이디</strong></td>
                                        <td>${proVo.email}</td>
                                    </tr>                                    
                                    <tr>
                                        <td><strong>이름</strong></td>
                                        <td>${proVo.name}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>프로레벨</strong></td>
                                        <td>${proVo.level_nm}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>프로필</strong></td>
                                        <td>${proVo.profile}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>수상경력</strong></td>
                                        <td>${proVo.description}</td>
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
    
    <div class="modal fade" id="adm_02_02_01" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">마켓 프로 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <h5>${proVo.name}</h5>
                    <p>해당 프로를 정말로 삭제하시겠습니까?</p>
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
    
<form id="form1" name="form1" method="post">
<input type="hidden" name="id" value="${proVo.id}">
</form>    
<script>

$(document).ready(function(){

    $("#btnList").click(function(){
    	fn_proList();
    });
    $("#btnModify").click(function(){
    	fn_modify();
    });
    
    $('#btnDelete').click(function() {
        $("#adm_02_02_01").modal("show");
    }); 
    
    $("#delete").click(function(){
        var obj = new Object();
        obj.groupid = "${proVo.id}";

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/market/deletePro","POST",jsonData);
    });
    
    $("#close").click(function(){  	
        $("#adm_02_02_01").modal("hide");
    });
});

// 마켓 프로 수정화면으로 이동
function fn_modify()
{
	document.form1.action = "/admin/market/proModify";
	document.form1.submit();
}
// 마켓 프로 리스트로 이동
function fn_proList()
{
	location.href="/admin/markket/proList";
}
</script>

<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
