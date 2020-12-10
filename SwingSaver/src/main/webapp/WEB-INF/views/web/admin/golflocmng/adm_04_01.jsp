<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">골프장 추가</h2>

                <div class="form-page joinus-page edit-page">


                    <form class="form-signin" id='forms1' name="forms1" method="POST" enctype="multipart/form-data">
                    <input type="hidden" id="image" name="image">
                    <input type="hidden" id="logo_image" name="logo_image">
                    <input type="hidden" id="assets" name="assets">
                    <input type="hidden" id="simage" name="simage">
                    <input type="hidden" id="fdata" name="fdata">
                        <div class="question">
                            <p>국가코드</p>
                                <select name="country_id" id="country_id" onchange="javascript:changeCountry(this.value);">    
                                    <option value="">국가를 선택해주세요.</option>                            
                                	<c:forEach var="ctryInfo" items="${countryList}" varStatus="status">
                                    	<option value="${ctryInfo.code}">${ctryInfo.codename}(${ctryInfo.code})</option>
                                 	</c:forEach>
                                 </select> 
                        </div>
                        <div class="question">
                            <p>지역코드</p>
                                <select name="zone_id" id="zone_id">    
                                    <option value="">지역을 선택해주세요.</option>
                                 </select> 
                        </div>
                        <div class="question">
                            <p>골프장코드</p>
                            <input type="text" id="countryclub_id" name="countryclub_id" placeholder="골프장코드[자동입력됨]" readonly maxlength="4" required />
                        </div>
                        <div class="question">
                            <p>골프장이름</p>
                            <input type="text" id="countryclub_nm" name="countryclub_nm" placeholder="골프장이름" maxlength="100" required />
                        </div>
                        <div class="question">
                            <p>골프장홀수</p>
                            <input type="number" id="hole_value" name="hole_value" placeholder="골프장홀수" maxlength=2  oninput="maxLengthCheck(this)"  />
                        </div>
                        
                        <div class="question">
                            <p>골프장로고</p>
                            <input type="file" id="imageFile" name="imageFile" placeholder="기본이미지 저장경로" style="width:350;"  />
                        </div>
                        <div class="question">
                            <p>골프장로고(가로)</p>
                            <input type="file" id="logo_imageFile" name="logo_imageFile" placeholder="가로이미지 저장경로" style="width:350;"  />
                        </div>
                        <div class="question">
                            <p>골프장홈피용</p>
                            <input type="file" id="assetsFile" name="assetsFile" placeholder="Asset 저장 경로"  style="width:350;"   />
                        </div>
                        <div class="question">
                            <p>스코어이미지</p>
                            <input type="file" id="simageFile" name="simageFile" placeholder="스코어이미지 저장 경로"  style="width:350;"   />
                        </div>                        
                        <div class="question">
                            <p>Assets 파일</p>
                            <input type="file" id="fdataFile" name="fdataFile" placeholder="Assets 저장 경로"  style="width:350;"   />
                        </div>                          
                        <div class="question">
                            <p>담당자주소</p>
                            <input type="text" id="address" name="address" placeholder="담당자 주소" maxlength="100"  />
                        </div>
                        <div class="question">
                                <p>연락처</p>
                                <input type="number" id="phone" name="phone" placeholder="지역담당자 전화번호(-빼고 입력)" maxlength=12  oninput="maxLengthCheck(this)" pattern=" "   />
                        </div>    
                        <div class="question">
                            <p>이메일</p>
                            <input type="email" id="email" name="email" placeholder="담당자 메일" maxlength="100"  />
                        </div>
                        <div class="question">
                        	<p>제휴여부</p>
                        	<input type="checkbox" id="alliance_check" name="alliance_check" value="Y">제휴골프장 (체크시 제휴골프장임)
                        </div> 
                        <div class="question">
                        	<p>예약 URL</p>
                        	<input type="text" id="rsv_url" name="rsv_url"  placeholder="예약 URL" style="width:350;" />
                        </div>  
                        <div class="question">
                        	<p>이벤트 URL</p>
                        	<input type="text" id="evt_url" name="evt_url"  placeholder="EVENT URL" style="width:350;" />
                        </div>                                                
                                                
                        <div class="question">
                        	<p>링크여부</p>
                        	<input type="checkbox" id="link_check" name="link_check" value="Y">링크사용 (체크시 모바일에서 링크사용)
                        </div>                               
                        <div class="question">
                        	<p>프로그램연동</p>
                        	<input type="text" id="pgm_call_param" name="pgm_call_param"  placeholder="프로그램 연동 호출 인자" style="width:350;" />
                        </div>          
                        <div class="question">
                            <p>비고</p>
                            <input type="text" id="description" name="description" placeholder="description" maxlength="100" >
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
    	fn_golfSave();
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

	function fn_golfSave()
	{
	    if($("#country_id").val() == ""){
	        alert("국가코드를 선택하세요");
	        $("#country_id").focus();
	        return;
	    }
	    if($("#zone_id").val() == ""){
	        alert("지역코드를 선택하세요");
	        $("#zone_id").focus();
	        return;
	    }
	    //if($("#countryclub_id").val() == ""){
	    //    alert("콜프장 코드를 입력하세요");
	    //    $("#countryclub_id").focus();
	    //    return;
	    //}	    
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
	    
	    document.forms1.action = "/admin/golf/add";
	    document.forms1.submit();
	}
</script>
        
        
        

<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
