<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>
  
  <div class="content" style="margin-bottom: 0;">
     <div class="no-padding adm-con" >                 
        <h2 class="right-tit">QR 접속 현황</h2>

        <div class="col-xs-12 table-box">
                
           <div class="sc-search">
			<form class="form-signin" id='frm' name="frm" method="POST">
			<input type="hidden" name="search_countryclub_id" id="search_countryclub_id">
			<input type="hidden" name="search_visit_date" id="search_visit_date">
                        
                            <table>
                                <colgroup>
                                    <col width="17%">
                                    <col width="23%">
                                    <col width="40%">
                                    <col width="30%">
                                </colgroup>
                                <c:set var="now" value="<%=new java.util.Date()%>" />
                                <fmt:parseDate value="${stdate}" var="stdate" pattern="yyyyMMdd"/>
                                <fmt:parseDate value="${etdate}" var="etdate" pattern="yyyyMMdd"/>
                                <tr>
                                    <td class="font-weight-bold"><p>날짜</p></td>
                                    <td colspan="4">
                                    <input type="date" id="stdate" name="stdate" value="<fmt:formatDate value="${stdate}" pattern="yyyy-MM-dd" />">
                                    ~
                                    <input type="date" id="etdate" name="etdate" value="<fmt:formatDate value="${etdate}" pattern="yyyy-MM-dd" />">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold"><p>골프장</p></td>
                                    <td>
                                		<select name="country_id" id="country_id" onchange="javascript:changeCountry(this.value);">    
                                    		<option value="">국가를 선택해주세요.</option>                            
                                			<c:forEach var="ctryInfo" items="${countryList}" varStatus="status">
                                    			<option value="${ctryInfo.code}" <c:if test="${ctryInfo.code == country_id}">selected</c:if>>${ctryInfo.codename}(${ctryInfo.code})</option>
                                 			</c:forEach>
                                 		</select> 
                                    </td>
                                    <td>
                                        <select name="zone_id" id="zone_id"  onchange="javascript:changeZone(this.value);">    
                                    		<option value="">지역 선택</option>                            
                                			<c:forEach var="areInfo" items="${areaList}" varStatus="status">
                                    			<option  value="${areInfo.zone_id}" <c:if test="${areInfo.zone_id == zone_id}">selected</c:if>>${areInfo.zone_nm}(${areInfo.zone_id})</option>
                                 			</c:forEach>                                 		
                                        </select> 
                                        <select name="countryclub_id" id="countryclub_id" onchange="javascript:changeCountryClub(this.value);">
                                    		<option value="">골프장 선택</option>                            
                                			<c:forEach var="golfInfo" items="${golfList}" varStatus="status">
                                    			<option  value="${golfInfo.countryclub_id}"  <c:if test="${golfInfo.countryclub_id == countryclub_id}">selected</c:if>>${golfInfo.countryclub_nm}(${golfInfo.countryclub_id})</option>
                                 			</c:forEach>  
                                        </select>                                        
                                    </td>
                                    <td><button id="btnSearch">검색</button></td>
                                </tr>
                            </table>
						</form>
            </div>
                        
                                        
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="15%">
                                <col width="10%">
                                <col width="10%">
                                <col width="65%">                             
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>골프장명</th>
                                    <th>접속일자</th>
                                    <th>접속인원</th>
                                    <th>그래프</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="stsVo" items="${stsList}" varStatus="status">
                                <tr>
                                    <td>${stsVo.countryclub_nm}</td>
                                    <td>${stsVo.visit_date}</td>
                                    <td>${stsVo.cnt}</td>
                                    <td>
                                    	<table border=0 cellpadding=2 cellpscaing=2  width="${((stsVo.cnt/maxCnt) * 100)}%">
                                    	<tr><td  bgcolor="#cecece">${stsVo.cnt}명</td></tr>
                                    	</table>
                                    </td>
                                </tr>
							 </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    
                    	<div id="chart_div" style="width: 900px; height: 500px;"></div>
                    	
                </div>
                </div>
            </div>
          
 </section>


<script language="javascript" src="https://www.google.com/jsapi"></script>
<script>

    $(document).ready(function(){
        $("#btnSearch").click(function(){
        	fn_search();
        });
    });
    
    google.load("visualization", "1", {packages: ["corechart"]});
    google.setOnLoadCallback(drawChart);
    

    function drawChart()
    {
    	 var data = google.visualization.arrayToDataTable([
    		 <c:forEach var="items" items="${dataList}" varStatus="status">
    		   <c:if test="${status.count ne 1}">,</c:if>[    		       			
    		 	<c:forEach var="item" items="${items}" varStatus="sts">
    		 	   <c:if test="${sts.count ne 1}">,</c:if>
    		 	   <c:if test="${status.count eq 1}">'${item}'</c:if>
    		 	   <c:if test="${status.count ne 1}">
    		 	     <c:if test="${sts.count eq 1}">'${item}'</c:if>
    		 	     <c:if test="${sts.count ne 1}">${item}</c:if>
    		 	   </c:if>
    		 	       		 	   
    		 	</c:forEach>]    		       		   
    		 </c:forEach>
    	 ]);
    	 
 	 	//['date', 'Sales'],
	 	//['20200224', 2],
	 	//['20200225', 1],
	 	//['20200226', 3]
    	 
    	 var option = {
    	 	title : 'QR 접속 통계',
    	 	hAxis: {title: 'Visit Date', titleTextStyle: {color: 'red'}}
    	 };
    	 var chart = new google.visualization.AreaChart(document.getElementById("chart_div"));
    	 chart.draw(data, option);
    }
    
   
    function fn_search()
    {
    	frm.action = "/admin/stsList";
    	frm.submit();
    }
    
	 // 국가 코드를 선택했을 대 호출되는 메소드로 지역 정보를 콤보박스로 구성한다.
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
    // 지역 선택 했을 때 호출되는 메소드로 골프장 정보를 출력한다.
    function changeZone(data)
    {
    	// countryclub_id clear
    	$("#countryclub_id").empty();
    	
    	// 다시 조회
    	var url = "/score/golfList/"+$("#country_id").val()+"/"+data;
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
                $('#countryclub_id').append($('<option>').text("골프장을 선택"));
                if(typeof (reqdata) === 'object'){	   
                	$('#countryclub_id').append($('<option>').text(reqdata.countryclub_nm).attr('value', reqdata.countryclub_id));
                }else {
                	$.each(reqdata, function(i, obj){
                        $('#countryclub_id').append($('<option>').text(obj.countryclub_nm).attr('value', obj.countryclub_id));
                	});
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(jqXHR.responseText);
            }
        });			
    } 

</script>


<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>