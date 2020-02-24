<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

  <input type="hidden" id="selgrpuserId">
            
            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >                 
                <h2 class="right-tit">광고사이트 관리</h2>
                <button type="button" id="groupdelete" data-toggle="modal" data-target="#adm_02_02_01" class="sea-btn del-btn">광고사이트 삭제</button>
                <button type="button" class="sea-btn add-btn" id="groupAdd">광고사이트등록</button>
                
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="3%">
                                <col width="12%">
                                <col width="17%">
                                <col width="23%">
                                <col width="20%">
                                <col width="15%">                             
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="all" class="check-all"></th>
                                    <th>사이트명</th>
                                    <th>사이트URL</th>
                                    <th>정렬순서</th>
                                    <th>사용여부</th>
                                    <th>등록일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="advVo" items="${advList}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" class="groupid" name="seq" id="seq" value="${advVo.seq},${advVo.site_name}"></td>
                                    <td><a href="javascript:DetailView('${advVo.seq}');">${advVo.site_name}</a></td>
                                    <td>${advVo.site_url}</td>
                                    <td>${advVo.order_no}</td>
                                    <td>${advVo.use_yn}</td>
                                    <td>${advVo.reg_dt}</td>
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
    
    <div class="modal fade" id="grpmemberdel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">사이트 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <div id="delgrp">

                    </div>
                    <form id="modalFrm">
                        
                    </form>
                    <p>해당 사이트를 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn btn-secondary" data-dismiss="modal" id="delete">삭제</button>
                        </div>  
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn" id="close">취소</button>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>

$(document).ready(function(){
    $('.check-all' ).click( function() {
        $('.groupid' ).prop( 'checked', this.checked );
    } );	
    $("#groupAdd").click(function(){
    	fn_groupAdd();
    });
    $('#groupdelete').click(function() {
        var chklen = $("input[id=groupid]:checkbox:checked").length;
        var _text = "";
        var _idtext = "";
        if(chklen == 0){
            alert("삭제할 그룹을 선택해주세요");
            return;
        }else{
            var i = 1;
            $('#groupid:checked').each(function() {
                _idtext = _idtext+$(this).val().split(",")[0];
                _text= _text+$(this).val().split(",")[1];
                if(i<chklen){
                    _idtext =_idtext+",";
                    _text= _text+"</br>";
                }
                i++;
            });
            $("#grpmemberdel").modal("show");
            $("#delgrp").html(_text);
            $("#selgrpuserId").val(_idtext);
        }
    });  
    $("#delete").click(function(){
        var groupid = $("#selgrpuserId").val();
        var obj = new Object();
        obj.groupid = groupid;

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/group/deleteGroup","POST",jsonData);
    });
    
    $("#close").click(function(){
        $("#delgrp").html("");
        $("#selgrpuserId").val("");    	
        $("#grpmemberdel").modal("hide");
    });
});

function fn_groupAdd()
{
	location.href="/admin/advList/addform";
}

function DetailView(seq)
{
	location.href="/admin/advList/detail/"+seq;
}
</script>


<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>