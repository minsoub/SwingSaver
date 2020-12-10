<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
<style media="screen">
   
* {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
  margin-right: 15px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text3 {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
.active, 
.dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}   
</style>

<%@include file="/WEB-INF/views/mobile/include/top_menu.jsp"%>
    
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
   <div class="main-bn slideshow-container">
   		<c:forEach var="advInfo" items="${advList}" varStatus="status">
   			<c:if test="${advInfo.use_yn eq 'Y'}">
   		   		<div class="mySlides fade">
    				<a href="${advInfo.site_url}"><img src="<c:url value='${advInfo.image_url}'/>" width=100%></a>
    	   		</div>
  			</c:if>
  		</c:forEach> 		
  	
  		<!-- Next and previous buttons -->
  		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  		<a class="next" onclick="plusSlides(1)">&#10095;</a>  		  	
   </div>
   <!-- 광고 이미지 End -->
   
   <a href="/m/score" class="swing-bn">
      지난 스코어 보러가기<img src="/mobile/image/main-sc-btn.png">
   </a>

    <div class="recomend">
        <h2>제휴골프장</h2>       
        <div style="overflow-x: auto;">
          <div class="rec-list">
            <c:forEach var="golfInfo" items="${golfList}" varStatus="status">          	
            	<a href="javascript:goPage('${golfInfo.country_id}','${golfInfo.zone_id}','${golfInfo.countryclub_id}' )">
            	<img src="<c:url value='${golfInfo.image_url}'/>"  width="100%">
            	<p>${golfInfo.countryclub_nm}</p>
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
  //var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  //for (i = 0; i < dots.length; i++) {
  //    dots[i].className = dots[i].className.replace(" active", "");
  //}
  slides[slideIndex-1].style.display = "block";
  //dots[slideIndex-1].className += " active";
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

