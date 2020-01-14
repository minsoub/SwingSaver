<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

  <input type="hidden" id="selgrpuserId">
  <input type="hidden" id="selctryId">
  
        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">지역정보</h2>
                <button type="button" id="areadelete"  data-toggle="modal" data-target="#adm_02_02_01" class="sea-btn del-btn">지역삭제</button>
                <button type="button" id="areaAdd" class="sea-btn add-btn">지역추가</button>
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <colgroup>
                                <col width="3%">
                                <col width="8%">
                                <col width="8%">
                                <col width="10%">
                                <col width="12%">
                                <col width="20%">
                                <col width="12%">
                                <col width="17%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="all" class="check-all"></th>
                                    <th>국가코드</th>
                                    <th>지역코드</th>
                                    <th>지역명</th>
                                    <th>지역담당자</th>
                                    <th>담당자주소</th>
                                    <th>담당자연락처</th>
                                    <th>메일</th>
                                    <th>비고</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="areaVo" items="${areaList}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" class="zone_id" name="zone_id" id="zone_id" value="${areaVo.zone_id},${areaVo.zone_nm},${areaVo.country_id}"></td>
                                    <td>${areaVo.country_id}</td>
                                    <td><a href="/admin/area/${areaVo.country_id}/${areaVo.zone_id}">${areaVo.zone_id}</a></td>
                                    <td><a href="/admin/area/${areaVo.country_id}/${areaVo.zone_id}">${areaVo.zone_nm}</a></td>
                                    <td>${areaVo.user_name}</td>
                                    <td>${areaVo.address}</td>
                                    <td>${areaVo.phone}</td>
                                    <td>${areaVo.email}</td>
                                    <td>${areaVo.description}</td>
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
                    <h4 class="modal-title text-center" id="exampleModalLabel">지역 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <div id="delgrp">

                    </div>
                    <form id="modalFrm">
                        
                    </form>
                    <p>해당 지역을 정말로 삭제하시겠습니까?</p>
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
        $('.zone_id' ).prop( 'checked', this.checked );
    } );	
    $("#areaAdd").click(function(){
    	fn_areaAdd();
    });
    $('#areadelete').click(function() {
        var chklen = $("input[id=zone_id]:checkbox:checked").length;
        var _text = "";
        var _idtext = "";
        var _ctrytext = "";
        if(chklen == 0){
            alert("삭제할 지역을 선택해주세요");
            return;
        }else{
            var i = 1;
            $('#zone_id:checked').each(function() {
                _idtext = _idtext+$(this).val().split(",")[0];
                _text= _text+$(this).val().split(",")[1];
                _ctrytext = _ctrytext+$(this).val().split(",")[2];
                if(i<chklen){
                    _idtext =_idtext+",";
                    _ctrytext =_ctrytext+",";
                    _text= _text+"</br>";
                }
                i++;
            });
            $("#grpmemberdel").modal("show");
            $("#delgrp").html(_text);
            $("#selgrpuserId").val(_idtext);
            $("#selctryId").val(_ctrytext);
        }
    });  
    $("#delete").click(function(){
        var zone_id = $("#selgrpuserId").val();
        var country_id = $("#selctryId").val();
        var obj = new Object();
        obj.zone_id = zone_id;
        obj.country_id = country_id;

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/area/deleteArea","POST",jsonData);
    });
    
    $("#close").click(function(){
        $("#delgrp").html("");
        $("#selgrpuserId").val("");    	
        $("#grpmemberdel").modal("hide");
    });
});

function fn_areaAdd()
{
	location.href="/admin/area/addform";
}
</script>
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
