	function CallApp(countryclub_id)
	{
		var userAgent = navigator.userAgent;
		var visitedAt = (new Date()).getTime();		// 방문시간
		
		if (userAgent.match(/android/)) {
			if (userAgent.atch(/Chrome/)) {
				setTimeout(function() {
					// xml 파일 (안드로이드)
					// <data​ android:host="goActivity"​ android:scheme="webApp" />
					//location.href = "intent://커스텀스킴주소#Intent; scheme=스킴; action=..;category=..; package=com.android.xxx; end;";
					location.href="webApp://goActivity?countryclub_id="+countryclub_id;			
				}, 1000);
			}else {
				// 크롬 이외의 브라우저
				setTimeout(function() {
					if ((new Date()).getTime() - visitedAt < 2000) {
						location.href="마켓주소";
					}
				}, 500)
			}
		}
		var iframe = document.createElement("iframe");
		iframe.style.visibility = "hidden";
		iframe.src = "webApp://goActivity?countryclub_id="+countryclub_id;	
		document.body.appendChild(iframe);
		document.body.removeChild(iframe);		// back 호출시 캐싱될 수 있으므로 제거한다.
	}