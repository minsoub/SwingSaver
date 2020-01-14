<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">코스 정보 추가</h2>

                <div class="form-page joinus-page edit-page">


                    <form class="form-signin" id='forms1' name="forms1" method="POST">
                    <input type="hidden" name="countryclub_id" id="countryclub_id" value="${countryclub_id}">
                    <input type="hidden" name="country_id" id="country_id" value="${country_id}">
                    <input type="hidden" name="zone_id" id="zone_id" value="${zone_id}">
<!--
                         <div class="question">
                            <p>골프장 ID</p>
                            <input type="text" placeholder="골프장ID" required />
                        </div>
-->
                         <div class="question">
                            <p>코스명</p>
                            <input type="text" id="course_nm" name="course_nm" placeholder="코스명" maxlength="50" required />
                        </div> 
                         <div class="question">
                            <p>코스순서</p>
                            <input type="number" id="course" name="course" placeholder="코스순서" maxlength="2" required />
                        </div>                         
                       
                        <div class="question">
                            <p>Hole 1</p>
                            <select name="hole1">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>
                        <div class="question">
                            <p>Hole 2</p>
                            <select name="hole2">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 3</p>
                            <select name="hole3">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 4</p>
                            <select name="hole4">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 5</p>
                            <select name="hole5">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>
                        <div class="question">
                            <p>Hole 6</p>
                            <select name="hole6">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 7</p>
                            <select name="hole7">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>                        
                        <div class="question">
                            <p>Hole 8</p>
                            <select name="hole8">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>                          
                        <div class="question">
                            <p>Hole 9</p>
                            <select name="hole9">
                                  <option value="0" selected="selected">PAR정보 입력</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                        </div>                         

                       
                        <!--                            <p class="alert-p">정보를 모두 입력해주세요.</p>-->
                        <button id="btnSave" class="form-btn">등록</button>
                    </form>
                </div>


            </div>
        </div>
    </section>

<script>

$(document).ready(function(){
    $("#btnSave").click(function(){
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
	    if($("#course").val() == ""){
	        alert("코스순서를 입력하세요");
	        $("#course").focus();
	        return;
	    }
	    document.forms1.action = "/admin/par/add";
	    document.forms1.submit();
	}
</script>

<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>