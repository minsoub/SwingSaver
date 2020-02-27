<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>

<style media="screen">
*{
	margin: 0, padding: 0;
}
.slide {
	width: 1000px;
	height: 600px;
	overflow: hidden;
	position: relative;
	margin: 0 auto;
}
.slide ul {
	width: 5000px;
	position: absolute;
	top: 0;
	left: 0;
	font-size: 0;
}
.slide ul li {
	display: inline-block;
}
#back {
	position: absolute;
	top: 250px;
	left: 0;
	cursor: pointer;
	z-index: 1;
}
#next {
	position: absolute;
	top: 250px;
	right: 0;
	cursor: pointer;
	z-index: 1;
}
</style>
    
    <nav id="header">
        <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo">buddyya</div>
        <img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%">
    </nav>
    
<section id="contents">

   <div class="main-bn slide">
   		<img id="back" src="image/back.png" alt="" width="100">
   		<ul>
   			<li>
        		<img src="/mobile/image/banner-01.png"width="100%">
        	</li>
        	<li>
        		<img src="/mobile/image/banner-02.png"width="100%">
        	</li>
        </ul>
        <img id="next" src="image/next.png" alt="" width="100">
   </div>
    <div class="main-btn">
        <a href="#" class="">
        <img src="/mobile/image/main-reserve.png" width="100%">
        <p>골프장예약</p>
        </a>
        
        <a href="/score/scoreList" class="">
        <img src="/mobile/image/main-score.png" width="100%">
        <p>내 스코어</p>
        </a>
    </div>
    <div class="swing-bn">
        <a href="/">
        <img src="/mobile/image/swing-bn.png"width="100%">
        </a>
    </div>
    <div class="recomend">
        <h2>추천골프장</h2>
        <div class="rec-list" style="overflow-x: auto; float:left">
          <c:forEach var="golfInfo" items="${golfList}" varStatus="status">
          	<div class="rec-data">
            	<a href="javascript:goPage('${golfInfo.country_id}','${golfInfo.zone_id}','${golfInfo.countryclub_id}' )">
            		<!-- img src="/mobile/image/golf-img01.png" width="100%"  -->
            		<img src="<c:url value='${golfInfo.image_url}'/>"  width="100%">
            		<p>${golfInfo.zone_nm}</p>
            		<h4>${golfInfo.countryclub_nm}</h4>    
            	</a>
            </div>
          </c:forEach>   
        </div>        
    </div>
</section>
<form name="frm" id="frm" method="POST">
	<input type="hidden" id="country_id" name="country_id" />
	<input type="hidden" id="zone_id" name="zone_id" />
	<input type="hidden" id="countryclub_id" name="countryclub_id" />
</form>

<script>
$(document).ready(function(){
	var imgs;
	var img_count;
	var img_position = 1;
	
	imgs = $(".slide ul");
	img_count = imgs.children().length;
	
	// 버튼을 클릭했을 때 함수 실행
	$("#back").click(function(){
		back();
	});
	$("#next").click(function(){
		next();
	});
});

function back() {
	if (1 < img_position) {
		imgs.animate({
			left: '+=1000px'
		});
		img_position--;
	}
}
function next() {
	if (img_count > img_position) {
		imgs.animate({
			left:'-=1000px'
		});
		img_position++;
	}
}

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

