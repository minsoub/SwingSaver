<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">코스 정보 수정</h2>

                <div class="form-page joinus-page edit-page">

                    <form class="form-signin" id='forms1' name="forms1" method="POST">
                    <input type="hidden" name="countryclub_id" id="countryclub_id" value="${parInfo.countryclub_id}">
                    <input type="hidden" name="country_id" id="country_id" value="${parInfo.country_id}">
                    <input type="hidden" name="zone_id" id="zone_id" value="${parInfo.zone_id}">
<!--
                         <div class="question">
                            <p>골프장 ID</p>
                            <input type="text" placeholder="골프장ID" required />
                        </div>
-->
                         <div class="question">
                            <p>코스명</p>
                            <input type="text" id="course_nm" name="course_nm" value="${parInfo.course_nm}" placeholder="코스명" required />
                        </div> 
                         <div class="question">
                            <p>코스순서</p>
                            <input type="number" id="course" name="course" value="${parInfo.course}" readonly placeholder="코스순서" required />
                        </div>                         
                       
                        <div class="question">
                            <p>Hole 1</p>
                            <select name="hole1">
                                  <option <c:if test="${parInfo.hole1 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole1 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole1 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole1 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>
                        <div class="question">
                            <p>Hole 2</p>
                            <select name="hole2">
                                  <option <c:if test="${parInfo.hole2 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole2 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole2 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole2 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 3</p>
                            <select name="hole3">
                                  <option <c:if test="${parInfo.hole3 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole3 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole3 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole3 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 4</p>
                            <select name="hole4">
                                  <option <c:if test="${parInfo.hole4 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole4 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole4 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole4 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 5</p>
                            <select name="hole5">
                                  <option <c:if test="${parInfo.hole5 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole5 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole5 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole5 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>
                        <div class="question">
                            <p>Hole 6</p>
                            <select name="hole6">
                                  <option <c:if test="${parInfo.hole6 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole6 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole6 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole6 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 7</p>
                            <select name="hole7">
                                  <option <c:if test="${parInfo.hole7 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole7 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole7 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole7 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 8</p>
                            <select name="hole8">
                                  <option <c:if test="${parInfo.hole8 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole8 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole8 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole8 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>                          
                        <div class="question">
                            <p>Hole 9</p>
                            <select name="hole9">
                                  <option <c:if test="${parInfo.hole9 == 0}">selected</c:if> value="0" selected="selected">PAR정보 입력</option>
                                  <option <c:if test="${parInfo.hole9 == 3}">selected</c:if> value="3">3</option>
                                  <option <c:if test="${parInfo.hole9 == 4}">selected</c:if> value="4">4</option>
                                  <option <c:if test="${parInfo.hole9 == 5}">selected</c:if> value="5">5</option>
                                </select>
                        </div>                         

                       
                        <!--                            <p class="alert-p">정보를 모두 입력해주세요.</p>-->
                        <button id="btnUpdate" class="form-btn">수정</button>
                    </form>
                </div>


            </div>
        </div>

    </section>
<script>

$(document).ready(function(){
    $("#btnUpdate").click(function(){
    	fn_parSave();
    });
});

	function fn_parSave()
	{
	    if($("#course_nm").val() == ""){
	        alert("코스명을 입택하세요");
	        $("#course_nm").focus();
	        return;
	    }
	    document.forms1.action = "/admin/par/update";
	    document.forms1.submit();
	}
</script>