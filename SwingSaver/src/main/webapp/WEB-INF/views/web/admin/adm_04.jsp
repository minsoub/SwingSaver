<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

  <input type="hidden" id="selgrpuserId">
  <input type="hidden" id="selctryId">
  <input type="hidden" id="selzoneId">
        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">골프장 정보</h2>
                <button type="button" id="golfDelete" data-toggle="modal" data-target="#adm_02_02_01" class="sea-btn del-btn">골프장삭제</button>
                <button type="button" id="golfAdd" class="sea-btn add-btn">골프장추가</button>
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <colgroup>
                                <col width="3%">
                                <col width="8%">
                                <col width="10%">
                                <col width="12%">
                                <col width="25%">
                                <col width="12%">
                                <col width="10%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="all" class="check-all"></th>
                                    <th>국가코드</th>
                                    <th>지역코드</th>
                                    <th>골프장코드</th>
                                    <th>골프장이름</th>
                                    <th>골프장홀수</th>
                                    <th>연락처</th>
                                    <th>메일</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="golfVo" items="${golfList}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" class="countryclub_id" name="countryclub_id" id="countryclub_id" value="${golfVo.countryclub_id},${golfVo.countryclub_nm},${golfVo.country_id},${golfVo.zone_id}"></td>
                                    <td>${golfVo.country_id}</td>
                                    <td>${golfVo.zone_id}</td>
                                    <td><a href="/admin/golf/${golfVo.country_id}/${golfVo.zone_id}/${golfVo.countryclub_id}">${golfVo.countryclub_id}</a></td>
                                    <td><a href="/admin/golf/${golfVo.country_id}/${golfVo.zone_id}/${golfVo.countryclub_id}">${golfVo.countryclub_nm}</a></td>
                                    <td>${golfVo.hole_value}</td>
                                    <td>${golfVo.phone}</td>
                                    <td>${golfVo.email}</td>
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
                    <h4 class="modal-title text-center" id="exampleModalLabel">골프장 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <div id="delgrp">

                    </div>
                    <p>해당 골프장을 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button id="delete" type="button" class="modal-btn btn-secondary" data-dismiss="modal">삭제</button>
                        </div>
                        <div class="mo-pa col-md-6 ">
                            <button id="close" type="button" class="modal-btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>

$(document).ready(function(){
    $('.check-all' ).click( function() {
        $('.countryclub_id' ).prop( 'checked', this.checked );
    } );	
    $("#golfAdd").click(function(){
    	fn_golfAdd();
    });
    $('#golfDelete').click(function() {
        var chklen = $("input[id=countryclub_id]:checkbox:checked").length;
        var _text = "";
        var _idtext = "";
        var _ctrytext = "";
        var _clubtext = "";
        if(chklen == 0){
            alert("삭제할 골프장정보를 선택해주세요");
            return;
        }else{
            var i = 1;
            $('#countryclub_id:checked').each(function() {
            	_clubtext = _clubtext+$(this).val().split(",")[0];                
                _text= _text+$(this).val().split(",")[1];
                _ctrytext = _ctrytext+$(this).val().split(",")[2];
                _idtext = _idtext+$(this).val().split(",")[3];
                
                if(i<chklen){
                    _idtext =_idtext+",";
                    _clubtext =_clubtext+",";
                    _ctrytext =_ctrytext+",";
                    _text= _text+"</br>";
                }
                i++;
            });
            $("#grpmemberdel").modal("show");
            $("#delgrp").html(_text);
            $("#selzoneId").val(_idtext);
            $("#selctryId").val(_ctrytext);
            $("#selgrpuserId").val(_clubtext);
        }
    });  
    $("#delete").click(function(){
        var zone_id = $("#selzoneId").val();
        var country_id = $("#selctryId").val();
        var countryclub_id = $("#selgrpuserId").val();
        var obj = new Object();
        obj.zone_id = zone_id;
        obj.country_id = country_id;
        obj.countryclub_id = countryclub_id;

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/golf/deleteGolf","POST",jsonData);
    });
    
    $("#close").click(function(){
        $("#delgrp").html("");
        $("#selgrpuserId").val("");    	
        $("#grpmemberdel").modal("hide");
    });
});

function fn_golfAdd()
{
	location.href="/admin/golf/addform";
}
</script>
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
