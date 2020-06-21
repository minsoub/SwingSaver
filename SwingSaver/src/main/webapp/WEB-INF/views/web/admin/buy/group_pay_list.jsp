<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

<input type="hidden" id="deleteIds">


            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >                 
                <h2 class="right-tit">그룹 구매정보 관리</h2>
                <!-- button type="button" id="btnDelete" data-toggle="modal"  class="sea-btn del-btn">구매건삭제</button>
                <button type="button" id="btnAdd"    class="sea-btn add-btn">구매수기등록</button  -->
                
                
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="15%">
                                <col width="20%">
                                <col width="20%">
                                <col width="15%">
                                <col width="10%">   
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>그룹타입</th>
                                    <th>그룹명</th>                                 
                                    <th>가격</th>
                                    <th>만기일자</th>
                                    <th>결제여부</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="payInfo" items="${payList}" varStatus="status">
                                <tr>
                                    <td>${payInfo.item_type_name}</td>
                                    <td><a href="javascript:ProView('${payInfo.id}');">${payInfo.title}</a></td>                                                               
                                    <td>${payInfo.price}</td>
                                    <td>${payInfo.duedate}</td>
                                    <td>${payInfo.received}</td>
                                </tr>
                            </c:forEach>                                
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>
            </div>                       
 </section>




    <!-- adm_02_02_01 -->
    
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
                    <p>해당 제품을  정말로 삭제하시겠습니까?</p>
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
        	console.dir("whereis...");
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
        AjaxCall("/admin/item/deleteItem","POST",jsonData);
    });
    
    $("#close").click(function(){
        $("#delgrp").html("");
        $("#deleteIds").val("");    	
        $("#adm_02_02_01").modal("hide");
    });
});

function fn_proAdd()
{
	location.href="/admin/item/addform";
}

function ProView(id)
{
	location.href="/admin/item/detail/"+id;
}
</script>
    
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
