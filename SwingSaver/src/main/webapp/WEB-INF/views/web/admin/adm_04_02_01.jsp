<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">골프장 수정</h2>

                <div class="form-page joinus-page edit-page">


                    <form class="form-signin" id='forms1' name="forms1" method="POST"  enctype="multipart/form-data">
                    <input type="hidden" id="image" name="image" value="${golfInfo.image}">
                    <input type="hidden" id="assets" name="assets" value="${golfInfo.assets}">                    
                        <div class="question">
                            <p>국가코드</p>
                                <input type="text" id="country_id" name="country_id" placeholder="국가코드" value="${golfInfo.country_id}" readonly maxlength="4" required /> 
                        </div>
                        <div class="question">
                            <p>지역코드</p>
                                <input type="text" id="zone_id" name="zone_id" placeholder="지역코드" value="${golfInfo.zone_id}" readonly maxlength="4" required />
                        </div>
                        <div class="question">
                            <p>골프장코드</p>
                            <input type="text" id="countryclub_id" name="countryclub_id" placeholder="골프장코드" value="${golfInfo.countryclub_id}" readonly maxlength="4" required />
                        </div>
                        <div class="question">
                            <p>골프장이름</p>
                            <input type="text" id="countryclub_nm" name="countryclub_nm" placeholder="골프장이름" value="${golfInfo.countryclub_nm}" maxlength="100" required />
                        </div>
                        <div class="question">
                            <p>골프장홀수</p>
                            <input type="text" id="hole_value" name="hole_value" placeholder="골프장홀수" value="${golfInfo.hole_value}" maxlength=2 oninput="maxLengthCheck(this)"  />
                        </div>
                        <div class="question">
                            <p>이미지경로</p>
                            <input type="file" id="imageFile" name="imageFile" placeholder="기본이미지 저장경로" value="${golfInfo.image}"  maxlength="100"  />
                            [${golfInfo.image}]
                        </div>
                        <div class="question">
                            <p>Asset경로</p>
                            <input type="file" id="assetsFile" name="assetsFile" placeholder="Asset 저장 경로" value="${golfInfo.assets}" maxlength="100"  />
                            [${golfInfo.assets}]
                        </div>
                        <div class="question">
                            <p>담당자주소</p>
                            <input type="text" id="address" name="address" placeholder="담당자 주소" value="${golfInfo.address}" maxlength="100"  />
                        </div>
                        <div class="question">
                                <p>연락처</p>
                                <input type="tel" id="phone" name="phone" placeholder="지역담당자 전화번호(-빼고 입력)" value="${golfInfo.phone}" maxlength=12 oninput="maxLengthCheck(this)" pattern=" "   />
                        </div>    
                        <div class="question">
                            <p>이메일</p>
                            <input type="email" id="email" name="email" placeholder="담당자 메일" value="${golfInfo.email}" maxlength="100"  />
                        </div>        
                        
                        <div class="question">
                        	<p>제휴여부</p>
                        	<input type="checkbox" id="alliance_check" name="alliance_check" value="Y" <c:if test="${golfInfo.alliance_check eq 'Y'}">checked</c:if> >제휴골프장 (체크시 제휴골프장임)
                        </div>        
                        <div class="question">
                        	<p>프로그램연동</p>
                        	<input type="text" id="pgm_call_param" name="pgm_call_param"  placeholder="프로그램 연동 호출 인자" style="width:350;" value="${golfInfo.pgm_call_param}" />
                        </div> 
                                                          
                        <div class="question">
                                <p>비고</p>
                                <input type="text" id="description" name="description" value="${golfInfo.description}" placeholder="description" maxlength="100" >
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
    	fn_areaSave();
    });
});

function changeCountry(data)
{
	// zone_id clear
	$("#zone_id").empty();
	
	// 다시 조회
	var url = "/admin/area/areaList/"+data;
	var method = "GET";
	var data = "";
	
    $.ajax({
        type: method,
        url : url,
        data: data,
        dataType:"json",
        async:true,
        contentType:"application/json;charset=UTF-8",
        success : function(rtnData) {
        	console.dir(rtnData);
            var reqdata = JSON.parse(rtnData.data);
            $('#zone_id').append($('<option>').text("지역을 선택해주세요."));
            $.each(reqdata.areaList, function(i, obj){
                    $('#zone_id').append($('<option>').text(obj.zone_nm).attr('value', obj.zone_id));
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
        }
    });		
}

	function fn_areaSave()
	{	    
	    if($("#countryclub_nm").val() == ""){
	        alert("콜프장명을 입력하세요");
	        $("#countryclub_nm").focus();
	        return;
	    }
/*	    if($("#hole_value").val() == ""){
	        alert("홀 수를 입력하세요");
	        $("#hole_value").focus();
	        return;
	    }

	    if($("#address").val() == ""){
	        alert("지역담당자 주소를 입력하세요");
	        $("#address").focus();
	        return;
	    }
	    if($("#phone").val() == ""){
	        alert("연락처를 입력하세요");
	        $("#phone").focus();
	        return;
	    }		
*/	    
	    document.forms1.action = "/admin/golf/update";
	    document.forms1.submit();
	}
</script>

<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
