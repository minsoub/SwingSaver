<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>

 <nav id="header">
    <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
    <div class="logo"><img src="/mobile/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>
    
 <section id="contents" class="main_con">
   <div class="main-btn">
     <a href="#" class="">
   	  <img src="/mobile/image/golf_btn_kr.png" width="100%">
      	<p>국내 골프장<span>Republic of Korea</span></p>
     </a>

     <a href="#" class="">
      <img src="/mobile/image/golf_btn_fc.png" width="100%">
      <p>해외 골프장<span>Foreign country</span></p>
     </a>
   </div>
                
   <!--  광고 이미지    -->
   <div class="main-bn">
   <c:forEach var="advInfo" items="${advList}" varStatus="status">
   		<c:if test="${advInfo.use_yn eq 'Y' and status.index == 0}">
    		<a href="${advInfo.site_url}"><img src="<c:url value='${advInfo.image_url}'/>" width=100%></a>
  		</c:if>
  	</c:forEach> 		
   </div>
   <!-- 광고 이미지 End -->
   
   <a href="/score/scoreList" class="swing-bn">
      지난 스코어 보러가기<img src="/mobile/image/main-sc-btn.png">
   </a>

    <div class="recomend">
        <h2>제휴골프장</h2>       
        <div style="overflow-x: auto;">
          <div class="rec-list">
            <c:forEach var="golfInfo" items="${golfList}" varStatus="status">          	
            	<a href="javascript:goPage('${golfInfo.country_id}','${golfInfo.zone_id}','${golfInfo.countryclub_id}' )">
            	<img src="<c:url value='${golfInfo.image_url}'/>"  width="100%">
            	<p>${golfInfo.zone_nm}</p>
            	</a>
            </c:forEach>
          </div>   
        </div>        
    </div>
    
    
</section>

<form name="frm" id="frm" method="POST">
	<input type="hidden" id="country_id" name="country_id" />
	<input type="hidden" id="zone_id" name="zone_id" />
	<input type="hidden" id="countryclub_id" name="countryclub_id" />
</form>

<script>
	function goPage(country_id, zone_id, countryclub_id)
	{
		$("#country_id").val(country_id);
		$("#zone_id").val(zone_id);
		$("#countryclub_id").val(countryclub_id);
		frm.action = "/m/detail";
		frm.submit();
	}
</script>

<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>

