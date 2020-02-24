<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
    <nav id="header">
        <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo">buddyya</div>
        <img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%">
    </nav>
    
<section id="contents">
<form name="frm" id="frm" action="POST">
<input type="hidden" name="alliance_check" id="alliance_check" value="${alliance_check}" />
    <div class="select-area">
        <select name="zone_id" id="zone_id" class="select-bar" onChange="javascript:ChangeZone(this.value);">
        	<option value="">지역선택</option>
        <c:forEach var="areafInfo" items="${areaList}" varStatus="status">
        	<option value="${areaInfo.code}" <c:if test="${areaInfo.code eq zone_id}">selected</c:if>>${areaInfo.codename}</option>
        </c:forEach>
        </select>
    </div>
    <div class="bud-tab">
        <a href="javascript:GolfList('');"  class="tab-01 <c:if test="${alliance_check ne 'Y'}">active</c:if> ">모두</a>
        <a href="javascript:GolfList('Y');" class="tab-01 <c:if test="${alliance_check eq 'Y'}">active</c:if> ">제휴</a>
    </div>
    <div class="list-wrap">
    	<c:forEach var="golfInfo" items="${golfList}" varStatus="status">
        <div class="list">
            <img src="<c:if test="${golfInfo.alliance_check eq 'Y'}">/mobile/image/buddyya-on.png</c:if><c:if test="${golfInfo.alliance_check ne 'Y'}">/mobile/image/buddyya-off.png</c:if>" class="list-img" width="100%">
            <div class="list-info">
            	<a href="javascript:DetailView('${golfInfo.country_id}','${golfInfo.zone_id}', '${golfInfo.countryclub_id}');">
                <img src="<c:url value='${golfInfo.image_url}'/>" class="list-logo">
                <h4>${golfInfo.countryclub_nm}</h4>
                <p>${golfInfo.zone_nm}</p>
                </a>
            </div>
            <div class="list-right">
                <img src="<c:if test="${golfInfo.alliance_check eq 'Y'}">/mobile/image/like-on.svg</c:if><c:if test="${golfInfo.alliance_check ne 'Y'}">/mobile/image/like-off.svg</c:if>" class="list-like" width="100%">
                <a class="play" href="javascript:CallApp('${golfInfo.countryclub_id}');">Play</a>
            </div>            
        </div>
        </c:forEach>       
    </div> 
</form>    
<form name="sFrm" id="sFrm" method="POST">
	<input type="hidden" id="country_id" name="country_id" />
	<input type="hidden" id="zone_id" name="zone_id" />
	<input type="hidden" id="countryclub_id" name="countryclub_id" />
</form>
</section>

<script>
	function GolfList(data)
	{
		$("#alliance_check").val(data);
		frm.action = "/m/golflist.do";
		frm.submit();
	}
	
	function ChangeZone(data)
	{
		frm.action = "/m/golflist.do";
		frm.submit();		
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