<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
    <nav id="header">
        <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo"><img src="/mobile/image/head-logo.png" class="" width="100%"></div>
        <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
    </nav>
    
<section id="contents" class="gray_con">

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
                <a class="play active" href="javascript:CallApp('${golfInfo.countryclub_id}');">Play</a>
            </div>            
        </div>
        </c:forEach>             

    </div>
  
</section>

<form name="sFrm" id="sFrm" method="POST">
	<input type="hidden" id="country_id" name="country_id" />
	<input type="hidden" id="zone_id" name="zone_id" />
	<input type="hidden" id="countryclub_id" name="countryclub_id" />
</form>
</section>

<script>
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