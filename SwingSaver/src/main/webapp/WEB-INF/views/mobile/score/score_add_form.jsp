<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
 <nav id="header">
 	<a href="/m/score"><img src="/image/h-back.png" class="gnb-log" width="100%"></a>
    <div class="logo"><img src="/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>

    <section id="contents" class="">
        <div class="con-wrap">
            <div class="sc-search-wrap">
                <h1>골프장 정보입력</h1>
                <div class="btnSearch">
                	<select class="sc-select countryclub_id" name="countryclub_id" id="countryclub_id">                	
                	</select> 
                
                    <!-- input class="sc-Search" type="text" id="countryclub_name" name="countryclub_name" placeholder="골프장 이름을 검색해주세요">
                    <input type="image" src="/mobile/image/view-btn-bl.png" name="countryclub_search" id="btnSearchTop" class="btn_top_srarch" title="검색" value="검색" alt="검색" -->                
                </div>
                <br>
                <input type="date" class="sc-dacl" id="visit_date" name="visit_date" placeholder="날짜 입력">                
                <input type="time" class="sc-dacl" id="teeup_time" name="teeup_time" placeholder="시간 입력"> 
                
                 
                <select class="sc-select" id="start_course" name="start_course">
                	<option value="">OUT 코스를 선택해주세요</option>
            	</select>
                <select class="sc-select" id="end_course" name="end_course">
                	<option value="">IN 코스를 선택해주세요</option>
            	</select>
                <a class="bud-btn red-btn" href="#" id="startScore">START</a>
            </div>
        </div>
    </section>


<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>


<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>


<script>
$(document).ready(function(){
	$('.countryclub_id').select2({
		ajax: {
			url: "/m/countryclub-search", 
			dataType: 'json',
			delay: 250,
			cache: true,
			data: function(params) {
				return {
					countryclub_nm: params.term
				};
			}, 
			processResults: function (data)
			{
				if (data == null) return;
				data = JSON.parse(data);
				console.log(data);
				console.log(data.result);
				return {
					results: data.result
				};
			}
		}, 
		placeholder: '골프장 이름을 검색해 주세요', 
		minimumInputLength: 2			
	});
	
	$('#countryclub_id').on("select2:select", function(e) { 
		 // 클럽 아이디와 명칭으로 OUT/IN 코드 조회
		$("#start_course").empty();
		$("#end_course").empty();
		
		console.log(e);
		var countryclub_id = e.params.data.id;
		
		console.log("selected id : " + countryclub_id);
		
		if(countryclub_id == "") return;
		
		// 다시 조회
		var url = "/m/parList/"+countryclub_id;
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
	            var reqdata = JSON.parse(rtnData); //.data);
	            
	            console.log(reqdata);
	            $('#start_course').append($('<option>').text("OUT 코스를 선택해주세요"));
	            $('#end_course').append($('<option>').text("IN 코스를 선택해주세요"));
	            
	            if(typeof (reqdata.parList) === 'object'){	
	            	$.each(reqdata.parList, function(i, obj){
	                    $('#start_course').append($('<option>').text(obj.course_nm).attr('value', obj.course));
	                    $('#end_course').append($('<option>').text(obj.course_nm).attr('value', obj.course));
	            	});
	            	
	            	//console.log(reqdata.parList); 
	            	//$('#start_course').append($('<option>').text(reqdata.parList.course_nm).attr('value', reqdata.parList.course));
                    //$('#end_course').append($('<option>').text(reqdata.parList.course_nm).attr('value', reqdata.parList.course));
	            }else {
	            	$.each(reqdata.parList, function(i, obj){
	            		console.log(obj);
	                    $('#start_course').append($('<option>').text(obj.course_nm).attr('value', obj.course));
	                    $('#end_course').append($('<option>').text(obj.course_nm).attr('value', obj.course));
	            	});
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log(jqXHR.responseText);
	        }
	    });			
	});
	
	
    $("#startScore").click(function(){
    	if ($("#countryclub_id").val() == "")
    	{
    		alert("골프장을 먼저 검색하세요!!!");
    		return;
    	}
    	if ($("#start_course").val() == "") {
    		alert("OUT 코스를 선택하세요!!!");
    		$("#start_course").focus();    		
    		return;
    	}
    	if ($("#end_course").val() == "") {
    		alert("IN 코스를 선택하세요!!!");
    		$("#end_course").focus();    		
    		return;
    	}    
    	if ($("#visit_date").val() == "") {
    		alert("일자를 입력하지 않았습니다!!!");
    		$("#vist_date").focus();
    		return;
    	}
    	if ($("#teeup_time").val() == "") {
    		alert("티업시간을 입력하지 않았습니다!!!");
    		$("#teeup_time").focus();
    		return;
    	}
    	var url = "/m/score-add/"+$("#countryclub_id").val()+"/"+$("#start_course").val()+"/"+$("#end_course").val();
    	var vd = $("#visit_date").val(); //.replace(/-/g, '');
    	var tm = $("#teeup_time").val(); // .replace(/:/g, '');
    	var param = "?visit_date="+vd+"&teeup_time="+tm;
    	//alert(vd);
    	//alert(tm);
    	location.href=url+param;
    });
});
</script>
</html>
