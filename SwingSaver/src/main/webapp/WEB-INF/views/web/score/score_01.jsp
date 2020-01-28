<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>


    <section class="container no-padding">
        <article class="col-xs-12" style="padding: 0;">
			<%@include file="/WEB-INF/views/web/inc/mypage_left_menu.jsp"%>
            <div class="content col-xs-9" style="padding: 0;">
                <div class="col-xs-12 no-padding">
                    <h2 class="right-tit">내 스코어 관리</h2>
<form class="form-signin" id='frm' name="frm" method="POST">
<input type="hidden" name="search_seq_no" id="search_seq_no">
<input type="hidden" name="search_countryclub_id" id="search_countryclub_id">
<input type="hidden" name="search_visit_date" id="search_visit_date">
                    <div class="score-page form-page">
                        <div class="sc-search">
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

                        </div>
                        
                        <div class="sc-cont text-center">
                           <table>
                               <tr>
                                   <th>날짜</th>
                                   <th>골프장</th>
                                   <th>출발</th>
                                   <th>종료</th>
                                   <th>PAR</th>
                                   <th>TOTAL</th>
                               </tr>
                               <c:forEach var="scoreInfo" items="${scoreList}" varStatus="status">
                                <tr>
                                   <td class="gray-td">${scoreInfo.visit_date}</td>
                                   <td><a href="javascript:DetailView('${scoreInfo.visit_date}', '${scoreInfo.countryclub_id}', '${scoreInfo.seq_no}', '${scoreInfo.user_id}');">${scoreInfo.countryclub_nm}</a></td>
                                   <td>${scoreInfo.start_sum}</td>
                                   <td>${scoreInfo.end_sum}</td>
                                   <td>${scoreInfo.par_sum}</td>
                                   <td class="gray-td">${scoreInfo.score_sum}</td>
                               </tr>
                               </c:forEach>                                 
                           </table>                           
                        <button id="btnAdd" class="form-btn" onclick="#">스코어 등록</button>                            
                        </div>
                    </div>
                </div>
            </div>
</form>            
        </article>
    </section>

    <!-- Footer -->
	<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
<script>

    $(document).ready(function(){
        $("#btnAdd").click(function(){
        	fn_move();
			//location.href="/score/scoreAdd";
        }); 
        
        $("#btnSearch").click(function(){
        	fn_search();
        });
    });
    
    function fn_move()
    {
    	frm.method = "GET";
    	frm.action = "/score/scoreAdd";
    	frm.submit();
    	//location.href = "/score/scoreAdd";
    }
    
    function fn_search()
    {
    	frm.action = "/score/scoreList";
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
    // 상세 정보 페이지로 이동한다
    function DetailView(visit_dt, countryclub_id, seq_no, user_id)
    {
    	$("#search_visit_date").val(visit_dt);
    	$("#search_countryclub_id").val(countryclub_id);
    	$("#search_seq_no").val(seq_no);
    	
    	frm.method = "POST";
    	frm.action = "/score/scoreDetail";
    	frm.submit();
    }

</script>
</html>
