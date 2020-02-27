<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>


    
    <nav id="header">
        <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo">buddyya</div>
        <img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%">
    </nav>
    
<section id="contents">

   <div class="main-bn slideshow-container">
  		<div class="mySlides fade">
    		<div class="numbertext">1 / 3</div>
    		<img src="/mobile/image/banner-01.png" style="width:100%">
    		<div class="text3">Caption Text</div>
  		</div>
  		
  		<div class="mySlides fade">
    		<div class="numbertext">2 / 3</div>
    		<img src="/mobile/image/banner-01.png" style="width:100%">
    		<div class="text3">Caption Text</div>
  		</div>  
  		
  		<div class="mySlides fade">
    		<div class="numbertext">3 / 3</div>
    		<img src="/mobile/image/banner-01.png" style="width:100%">
    		<div class="text3">Caption Text</div>
  		</div>  
  		
  		<!-- Next and previous buttons -->
  		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  		<a class="next" onclick="plusSlides(1)">&#10095;</a>
    		
   </div>
   
	<!-- The dots/circles -->
	<div style="text-align:center">
  		<span class="dot" onclick="currentSlide(1)"></span>
  		<span class="dot" onclick="currentSlide(2)"></span>
  		<span class="dot" onclick="currentSlide(3)"></span>
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
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
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

