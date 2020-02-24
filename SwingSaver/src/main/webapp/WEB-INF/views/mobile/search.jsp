<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
    <nav id="header">
        <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo">검색하기</div>
        <img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%">
    </nav>

<section id="contents">
	<form name="frm" id="frm" method="POST">      
    <div class="search-area">
        <input type="text" placeholder="이름이나 지역을 검색해주세요" id="word" name="word" value="${word}">
        <button id="btnSearch">검색</button>
    </div>
    </form>  
    <div class="search-wrap">
       <div class="sear-btn">
          <p>최근검색</p>
          <button id="btnDelete">모두삭제</button> 
       </div>
       <div class="sear-keyword" id="historyData">
          <!-- a href="#">사우스랑스CC영암</a> 
          <a href="#">파주시</a> 
          <a href="#">경기북부</a> 
          <a href="#">덕평호반CC</a> 
          <a href="#">아시아나컨트리클럽</a  --> 
       </div>        
    </div>  
    
    <!-- div class="bud-tab">
        <a href="javascript:GolfList('');"  class="tab-01 <c:if test="${alliance_check ne 'Y'}">active</c:if> ">모두</a>
        <a href="javascript:GolfList('Y');" class="tab-01 <c:if test="${alliance_check eq 'Y'}">active</c:if> ">제휴</a>
    </div  -->
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
                <a class="play" href="webApp://goActivity?countryclub_id=${golfInfo.countryclub_id}">Play</a>
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
     
<script>
	$(document).ready(function(){
	
		// 쿠키에서 값을 가져와서 구성한다.
		var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
		if (items) {
		    var itemArray = items.split(',');
		    if (itemArray.length > 0)
		    {
		    	for (var i=0; i<itemArray.length; i++)
		    	{
		    		$("#historyData").append("<a href=\"javascript:setData('"+itemArray[i]+"');\">"+itemArray[i]+"</a>");
		    	}
		    }
		}
		
		$("#btnSearch").click(function(){
			if ($("#word").val() == "")
			{
				alert("검색단어를 입력하세요!!!");
				$("#word").focus();
				return;
			}
			// 검색 단어 쿠키 저장
			addCookie($("#word").val());
			
			// 검색 수행
			fnSearch();
		});
		$("#btnDelete").click(function(){
			//alert("t1");
			// 쿠키 삭제해야 한다.
			var name = "productItems";
			document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
			$('#historyData').empty();
		});
	});

	function setCookie(cookie_name, value, days)
	{
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + days);
		
		 var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
		document.cookie = cookie_name + '=' + cookie_value;
	}
	
	function getCookie(cookie_name) {
		var x, y;
		var val = document.cookie.split(';');
		
		for (var i=0; i<val.length; i++)
		{
		    x = val[i].substr(0, val[i].indexOf('='));
		    y = val[i].substr(val[i].indexOf('=') + 1);
		    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
		    if (x == cookie_name) {
		      return unescape(y); // unescape로 디코딩 후 값 리턴
		    }
		}
	}
	
	// addCookie("검색단어");
	function addCookie(id) {
		  var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
		  var maxItemNum = 5; // 최대 저장 가능한 아이템개수
		  var expire = 7; // 쿠키값을 저장할 기간
		  if (items) {
		    var itemArray = items.split(',');
		    if (itemArray.indexOf(id) != -1) {
		      // 이미 존재하는 경우 종료
		      console.log('Already exists.');
		    }
		    else {
		      // 새로운 값 저장 및 최대 개수 유지하기
		      itemArray.unshift(id);
		      if (itemArray.length > maxItemNum ) itemArray.length = 5;
		      items = itemArray.join(',');
		      setCookie('productItems', items, expire);
		    }
		  }
		  else {
		    // 신규 id값 저장하기
		    setCookie('productItems', id, expire);
		  }
	}
	 
	function setData(data)
	{
		$("#word").val(data);
		
		if (data != "") fnSearch();
	}
	function fnSearch()
	{
		frm.action = "/m/search";
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