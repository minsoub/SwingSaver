<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
 <nav id="header">
 	<a href="/m/home"><img src="/image/h-back.png" class="gnb-log" width="100%"></a>
    <div class="logo"><img src="/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/golflist.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>
    
<form name="frm" id="frm" action="POST">
<input type="hidden" name="alliance_check" id="alliance_check" value="${alliance_check}" />
    
<section id="contents" class="gray_con">


    <div class="select-area">
        <select name="zone_id" id="zone_id" class="select-bar" onChange="javascript:ChangeZone(this.value);">
        	<option value="">전국</option>
        <c:forEach var="areaInfo" items="${areaList}" varStatus="status">
        	<option value="${areaInfo.zone_id}" <c:if test="${areaInfo.zone_id eq zone_id}">selected</c:if>>${areaInfo.zone_nm}</option>
        </c:forEach>
        </select>
        
        <div class="s-input">
            <input type="text" id=word name=word value="${word}" placeholder="이름을 검색해주세요">
            <button id="btnSearch" onclick="javascript:Search();">검색</button>
        </div>        
    </div>
    
    <div class="bud-tab">
        <a href="javascript:GolfList('');"  class="tab-01 <c:if test="${alliance_check ne 'Y'}">active</c:if> ">모두</a>
        <a href="javascript:GolfList('Y');" class="tab-01 <c:if test="${alliance_check eq 'Y'}">active</c:if> ">제휴</a>
    </div>
    
    <div class="list-wrap" style="margin-top: 120px;">
    	<ul>
	    	<c:forEach var="golfInfo" items="${golfList}" varStatus="status">
	        <li class="list">
	            <!-- img src="<c:if test="${golfInfo.alliance_check eq 'Y'}">/mobile/image/buddyya-on.png</c:if><c:if test="${golfInfo.alliance_check ne 'Y'}">/mobile/image/buddyya-off.png</c:if>" class="list-img" width="100%"  -->
	            <div class="list-info">
	            	<a href="javascript:DetailView('${golfInfo.country_id}','${golfInfo.zone_id}', '${golfInfo.countryclub_id}');">
	                <img src="<c:url value='${golfInfo.image_url}'/>" class="list-logo">
	                <h4>${golfInfo.countryclub_nm}</h4>
	                <p>${golfInfo.zone_nm}</p>
	                </a>
	            </div>
	            <c:if test="${golfInfo.alliance_check eq 'Y'}"><img src="/image/partner.png" class="list-partner"></c:if>
	            <div class="list-right">
	                <img src="<c:if test="${golfInfo.alliance_check eq 'Y'}">/mobile/image/like-on.svg</c:if><c:if test="${golfInfo.alliance_check ne 'Y'}">/mobile/image/like-off.svg</c:if>" class="list-like" width="100%">
					<c:if test="${golfInfo.pay_chk eq 'Y'}">                
	                <a class="play active" href="javascript:CallApp('${golfInfo.countryclub_id}');">Play</a>
	                </c:if>
					<c:if test="${golfInfo.pay_chk ne 'Y'}">                
	                <a class="play" href="javascript:Pay('${golfInfo.country_id}', '${golfInfo.zone_id}', '${golfInfo.countryclub_id}');">Download</a>
	                </c:if>                
	            </div>            
	        </li>
	        </c:forEach>  
        </ul>     
    </div> 

</section>

 </form>   
 
<form name="sFrm" id="sFrm" method="POST">
	<input type="hidden" id="country_id" name="country_id" />
	<input type="hidden" id="zone_id" name="zone_id" />
	<input type="hidden" id="countryclub_id" name="countryclub_id" />
</form>
<script>
	function Pay(country_id, zone_id, countryclub_id)
	{
		// 결제 창을 띄우고 결제가 완료되면 파일을 다운로드 받게 한다. 
		var newWindow = window.open("about:blank");
		newWindow.location.href="/pay/assets/"+country_id+"/"+zone_id+"/"+countryclub_id;
	}
	function GolfList(data)
	{
		$("#alliance_check").val(data);
		frm.action = "/m/golflist.do";
		frm.submit();
	}
	
	function ChangeZone(data)
	{
		frm.action = "/m/golflist.do";
		frm.word.value = "";
		frm.submit();		
	}
	
	function Search()
	{		
		if (frm.word.value == "") {
			
			alert("검색단어를 입력하세요!!!");
			frm.word.focus();
			return;
		}else {
			frm.action = "/m/golflist.do";
			frm.zone_id.value = "";
			frm.submit();						
		}
	}
	

	function DetailView(country_id, zone_id, countryclub_id)
	{
		sFrm.country_id.value = country_id;
		sFrm.zone_id.value = zone_id;
		sFrm.countryclub_id.value = countryclub_id;
		sFrm.action = "/m/detail";
		sFrm.submit();
	}
</script>
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>