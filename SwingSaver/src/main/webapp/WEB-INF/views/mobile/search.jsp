<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
    <nav id="header">
        <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo">검색하기</div>
        <img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%">
    </nav>
    
<section id="contents">
    <div class="search-area">
        <input type="text" placeholder="이름이나 지역을 검색해주세요" id="word" name="word">
        <button id="btnSearch">검색</button>
    </div>
    <div class="search-wrap">
       <div class="sear-btn">
          <p>최근검색</p>
          <button>모두삭제</button> 
       </div>
       <div class="sear-keyword" id="historyData">
          <a href="#">사우스랑스CC영암</a> 
          <a href="#">파주시</a> 
          <a href="#">경기북부</a> 
          <a href="#">덕평호반CC</a> 
          <a href="#">아시아나컨트리클럽</a> 
       </div>        
    </div>  
</section>

<script language="javascript">
	$(document).ready(function(){
	
		// 쿠키에서 값을 가져와서 구성한다.
		var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
		if (items) {
		    var itemArray = items.split(',');
		    if (itemArray.length > 0)
		    {
		    	for (var i=0; i<itemArray.length; i++)
		    	{
		    		$("#historyData").append("<a href='#'>"+itemArray[i]+"</a>");
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
</script>
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>