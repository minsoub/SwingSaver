<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
<form id="form1" name="form1" method="post">
<input type="hidden" name="country_id" value="${golfInfo.country_id}">
<input type="hidden" name="zone_id" value="${golfInfo.zone_id}">
<input type="hidden" name="countryclub_id" value="${golfInfo.countryclub_id}">
</form>
        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">골프장 상세</h2>
                <div class="sub-mem-list">
                    <h4 class="sub-tit">골프장정보</h4>
                    <div class="sub-g-btn">
                        <button type="button" id="btnModify" class="edit-btn" data-target="#">수정</button>
                        <button type="button" id="btnDelete" class="edit-btn" data-toggle="modal" data-target="#adm_02_02_01">삭제</button>
                        <button type="button" id="btnList" class="sea-btn add-btn" data-target="#">
                        <img src="/image/back-list.png" cwidth="100%">    
                            골프장목록</button>
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
                                        <td><strong>국가코드</strong></td>
                                        <td>${golfInfo.country_id}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>지역코드</strong></td>
                                        <td>${golfInfo.zone_id}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>골프장코드</strong></td>
                                        <td>${golfInfo.countryclub_id}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>골프장이름</strong></td>
                                        <td>${golfInfo.countryclub_nm}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>골프장  홀수</strong></td>
                                        <td>${golfInfo.hole_value}홀</td>
                                    </tr>
                                    <tr>
                                        <td><strong>이미지경로
                                        </strong></td>
                                        <td>${golfInfo.image}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Asset경로</strong></td>
                                        <td>${golfInfo.assets}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>담당자주소</strong></td>
                                        <td>${golfInfo.address}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>연락처</strong></td>
                                        <td>${golfInfo.phone}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>이메일</strong></td>
                                        <td>${golfInfo.email}</td>
                                    </tr>
                                    <tr>
                                    	<td><strong>링크여부</strong>
                                    	<td>${golfInfo.link_check}
                                    </tr>                                    
                                    <tr>
                                    	<td><strong>제휴여부</strong>
                                    	<td>${golfInfo.alliance_check}
                                    </tr>
                                    <tr>
                                    	<td><strong>프로그램호출인자</strong></td>
                                    	<td>${golfInfo.pgm_call_param}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>비고</strong></td>
                                        <td>${golfInfo.description}</td>
                                    </tr>
                                    <tr>
                                    	<td><strong>QR사용 접속횟수</strong></td>
                                    	<td>${golfInfo.qr_cnt}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
<form id="form2" name="form2" method="post">                
  <input type="hidden" id="selgrpuserId">
   <input type="hidden" id="selCountry_id">
   <input type="hidden" id="selZone_id">
   <input type="hidden" id="selCountryclub_id">
</form>
                <div class="sub-mem-list">
                    <h4 class="sub-tit">코스정보</h4>
                    <div class="sub-g-btn">
                        <button type="button" id="btnParAdd" class="edit-btn" data-toggle=" " data-target="# ">추가</button>
                        <!-- button type="button" id="btnParModify" class="edit-btn" data-toggle=" " data-target=" ">수정</button -->
                        <button type="button" id="btnParDelete" class="edit-btn" data-toggle="modal" data-target="#course_01">삭제</button>                        
                    </div>
                    <div class="col-xs-12 table-box">
                        <div class="table-responsive">
                            <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                                <colgroup>
                                    <col width="3%">
                                    <col width="50%">
                                    <col width="50%">

                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name="all" class="check-all"></th>
                                        <th>코스순서</th>
                                        <th>코스명</th>
                                    </tr>
                                </thead>
                                <tbody>
                            <c:forEach var="parVo" items="${parList}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" class="course" name="course" id="course" value="${parVo.countryclub_id},${parVo.course_nm},${parVo.course}"></td>
                                    <td><a href="/admin/par/${golfInfo.country_id}/${golfInfo.zone_id}/${parVo.countryclub_id}/${parVo.course}">${parVo.course}</a></td>
                                    <td><a href="/admin/par/${golfInfo.country_id}/${golfInfo.zone_id}/${parVo.countryclub_id}/${parVo.course}">${parVo.course_nm}</a></td>
                                </tr>
                            </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </section>

    <!--golf info delete -->

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
                    <h5>${golfInfo.countryclub_nm}</h5>
                    <p>해당 골프장을 정말로 삭제하시겠습니까?</p>
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

    <!--course info delete -->

    <div class="modal fade" id="parDel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">코스 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <div id="delgrp">

                    </div>
                    <p>해당 코스를 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="parDelete" class="modal-btn btn-secondary" data-dismiss="modal">삭제</button>
                        </div>
                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="parClose" class="modal-btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>

$(document).ready(function(){
    $('.check-all' ).click( function() {
        $('.course' ).prop( 'checked', this.checked );
    } );
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
        obj.country_id = "${golfInfo.country_id}";
        obj.zone_id    = "${golfInfo.zone_id}";
        obj.countryclub_id    = "${golfInfo.countryclub_id}";

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/golf/deleteGolf","POST",jsonData);
    });
    
    $("#close").click(function(){  	
        $("#grpmemberdel").modal("hide");
    });
	
    $("#btnParAdd").click(function(){
    	fn_parAdd();
    });
    $('#btnParDelete').click(function() {
        var chklen = $("input[id=course]:checkbox:checked").length;
        var _text = "";
        var _clubtext = "";
        var _coursetext = "";
        var _ctrytext = "";
        var _zonetext = "";
		
        if(chklen == 0){
            alert("삭제할 Par 정보를 선택해주세요");
            return;
        }else{
            var i = 1;
            $('#course:checked').each(function() {
            	//_clubtext = _clubtext+$(this).val().split(",")[0];                
                _text= _text+$(this).val().split(",")[1];
                _coursetext = _coursetext+$(this).val().split(",")[2];
                _ctrytext = _ctrytext + "${golfInfo.country_id}";
                _zonetext = _zonetext + "${golfInfo.zone_id}";
                _clubtext = _clubtext + "${golfInfo.countryclub_id}";
                
                if(i<chklen){
                	_coursetext =_coursetext+",";
                	_ctrytext =_ctrytext+",";
                	_zonetext =_zonetext+",";
                	_clubtext =_clubtext+",";
                    _text= _text+"</br>";
                }
                i++;
            });
            $("#parDel").modal("show");
            $("#delgrp").html(_text);
            $("#selgrpuserId").val(_coursetext);
            $("#selCountry_id").val(_ctrytext);
            $("#selZone_id").val(_zonetext);
            $("#selCountryclub_id").val(_clubtext);
        }
    });  
    $("#parDelete").click(function(){
        var course = $("#selgrpuserId").val();
        var country_id = $("#selCountry_id").val();
        var zone_id = $("#selZone_id").val();
        var countryclub_id = $("#selCountryclub_id").val();        
        var obj = new Object();
        obj.course = course;
        obj.country_id = country_id;
        obj.zone_id = zone_id;
        obj.countryclub_id = countryclub_id;

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/par/deletePar","POST",jsonData, "/admin/golf/${golfInfo.country_id}/${golfInfo.zone_id}/${golfInfo.countryclub_id}");
    });
    
    $("#parClose").click(function(){
        $("#delgrp").html("");
        $("#selgrpuserId").val("");  
        $("#selCountry_id").val("");
        $("#selZone_id").val("");
        $("#selCountryclub_id").val("");        
        $("#parDel").modal("hide");
    });
    
});
function fn_parAdd()
{
	location.href="/admin/par/addform/${golfInfo.country_id}/${golfInfo.zone_id}/${golfInfo.countryclub_id}";
}
// 그룹 수정화면으로 이동
function fn_modify()
{
	document.form1.action = "/admin/golf/modify";
	document.form1.submit();
}
// 그룹 리스트로 이동
function fn_groupList()
{
	location.href="/admin/golfList";
}
</script>
<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>