<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

<input type="hidden" id="deleteIds">


            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >                 
                <h2 class="right-tit">마켓프로관리</h2>
                <button type="button" id="btnDelete" data-toggle="modal" data-target="#adm_02_02_01" class="sea-btn del-btn">프로삭제</button>
                <button type="button" id="btnAdd"    class="sea-btn add-btn">프로등록</button>
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="3%">
                                <col width="20%">
                                <col width="17%">
                                <col width="20%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name=" " value=" "></th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>레슨가격</th>
                                    <th>프로레벨</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="proInfo" items="${proList}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" class="id" name="id" id="id" value="${proInfo.id},${proInfo.name}"></td>
                                    <td>${proInfo.email}</td>
                                    <td>${proInfo.name}</td>
                                    <td>${proInfo.lessonprice}</td>
                                    <td>${proInfo.level_nm}</td>
                                </tr>
                            </c:forEach>                                
                            </tbody>
                        </table>
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
                    <h4 class="modal-title text-center" id="exampleModalLabel">프로 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <h5><div id="delgrp"></div></h5>
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
    
<script>

$(document).ready(function(){
    $('.check-all' ).click( function() {
        $('.id' ).prop( 'checked', this.checked );
    } );	
    $("#btnAdd").click(function(){
    	fn_proAdd();
    });
    $('#btnDelete').click(function() {
        var chklen = $("input[id=id]:checkbox:checked").length;
        var _text = "";
        var _idtext = "";
        if(chklen == 0){
            alert("삭제할 마켓프로를 선택해주세요");
            return;
        }else{
            var i = 1;
            $('#id:checked').each(function() {
                _idtext = _idtext+$(this).val().split(",")[0];
                _text= _text+$(this).val().split(",")[1];
                if(i<chklen){
                    _idtext =_idtext+",";
                    _text= _text+"</br>";
                }
                i++;
            });
            $("#adm_02_02_01").modal("show");
            $("#delgrp").html(_text);
            $("#deleteIds").val(_idtext);
        }
    });  
    
    $("#delete").click(function(){
        var ids = $("#deleteIds").val();

        var obj = new Object();
        obj.id = ids;

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/market/deletePro","POST",jsonData);
    });
    
    $("#close").click(function(){
        $("#delgrp").html("");
        $("#deleteIds").val("");    	
        $("#adm_02_02_01").modal("hide");
    });
});

function fn_proAdd()
{
	location.href="/admin/market/addform";
}
</script>
    
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
