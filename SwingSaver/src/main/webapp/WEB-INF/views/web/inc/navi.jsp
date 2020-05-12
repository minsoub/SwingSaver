<%--
  Created by IntelliJ IDEA.
  User: mycom
  Date: 2019-06-04
  Time: 오전 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <header id="swingHead">
        <div class="head_wrap">
            <div>
                <h1 class="head_logo">
                    <a class="" href="/"><img src="/image/logo_defalt.png" width="100%"></a>
                </h1>
                <nav id="topNav">
                    <ul class="menu_wrap">
                        <li class=""><a href="/web/company" class="depth_1">스윙세이버</a></li>
                        <li class="nav_ser"><a href="" class="depth_1">서비스</a>
                            <ul class="depth_2_wrap" role="menu">
                                <li>
                                    <h4>골프 서비스</h4>
                                    <a href="/web/golfService" class="depth_2">서비스 소개</a>
                                    <a href="/market/proList" class="depth_2">코칭 프로 소개</a>
                                    <a href="/web/information" class="depth_2">이용방법</a>
                                    <a href="/web/fare" class="depth_2">요금제 및 환불</a>
                                    <a href="" class="depth_2">스윙밴드</a>
                                </li>
                                <li>
                                    <h4>서비스 준비중</h4>
                                </li>
                                <li>
                                    <h4>서비스 준비중</h4>

                                </li>
                                <li>
                                    <h4>서비스 준비중</h4>

                                </li>
                                <li>
                                    <h4>서비스 준비중</h4>

                                </li>
                            </ul>
                        </li>
                        <li class=""><a href="/web/golfManagement" class="depth_1">골프장관제</a></li>
                        <li class=""><a href="" class="depth_1">고객센터</a></li>
                    </ul>
                </nav>
                <ul class="log_wrap">                   
                  <c:choose>
                    <c:when test="${not empty sessionScope.login.userid}">
                    <li><a href="/logout" class="log_btn">로그아웃</a></li>
                    <li><a href="/web/mypage" class="log_btn">마이페이지</a>
                        <ul class="depth_2_wrap" role="menu">
                            <li>
                                <a href="/web/mypage" class="depth_2">내정보</a>
                                <a href="/group/grpenter" class="depth_2">그룹정보</a>
                                <!-- 마켓 프로일 경우 -->
                                <c:if test="${sessionScope.login.grouppro == 'Y'}">
                                	<a href="/market/itemList" class="depth_2">마켓정보</a>
                                </c:if>
                            </li>
                        </ul>
                    </li>
                    </c:when>
                    <c:otherwise>
                    <li><a href="/loginForm" class="log_btn">로그인</a></li>
                    </c:otherwise>
                  </c:choose>
                </ul>
            </div>
        </div>
    </header>
<!--    
<nav id="topNav" class="navbar navbar-default dropdownmenu">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand page-scroll" href="/"><img src="/image/logo-01.svg" class="header-logo" width="100%"></a>
        </div>
        <div class="navbar-collapse collapse sub-navwrap" id="bs-navbar">
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" onclick="location.href='/#first'">회사소개</button>
            </div>
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" data-toggle="dropdown">서비스</button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/#sec">스윙세이버란?</a>
                    <a class="dropdown-item" href="/#fou">서비스소개</a>

                </div>
            </div>
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" data-toggle="dropdown">제품</button>
            </div>
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" data-toggle="dropdown">레슨마켓</button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/#thi">레슨프로소개</a>
                    <a class="dropdown-item" href="/#">레슨마켓소개</a>

                </div>
            </div>
            <c:choose>
                <c:when test="${not empty sessionScope.login.userid}">
                    <div class="dropdown">
                        <button class="menubtn dropdown-toggle" data-toggle="dropdown"><p class="my-btn">내정보</p></button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/web/mypage">마이페이지</a>
                            <a class="dropdown-item" href="/group/grpenter">그룹</a>
                            <a class="dropdown-item" href="/logout">로그아웃</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="dropdown">
                        <button class="menubtn dropdown-toggle" data-toggle="dropdown" onclick="location.href='/loginForm'">로그인</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
 -->

<!-- small page -->
    <nav class="dg-hd-mo hidden-lg">
        <h1 class="dg-hd-mo-logo-area">
            <a href="/"><img src="/image/logo_defalt.png" class="header-logo" width="100%"></a>
        </h1>
        <!--메뉴전체 -->
        <nav class="dg-hd-mo-menu-panel" style="">
            <b class="dg-hd-mo-menu-btn" title="menu"><span></span></b>
            <div class="mo-menu-title">
        	<c:choose>
        		<c:when test="${not empty sessionScope.login.userid}">
            		<a href="/logout" class="dg-white">로그아웃</a>
            		<a href="/web/user/member" class="dg-white">마이페이지</a>
        	 	</c:when>
        	 	<c:otherwise>
        	 		<a href="/loginForm" class="dg-white">로그인</a>
            		<a href="/web/user/member" class="dg-white">회원가입</a>
        	 	</c:otherwise>
        	</c:choose>
            </div>
            <ul>
                <li class="menu-label menu-arrow-active-li">
                    <a href="/" class="dg-point">HOME</a>
                    <span class="dg-hd-mo-menu-arrow menu-arrow-active"></span>
                    <ul class="sub-menu sub-menu-on">
                        <li><a href="/web/company" onclick="fn_smallMenuClick()">스윙세이버</a></li>
                        <li><a href="#" onclick="fn_smallMenuClick()">서비스</a></li>
                        <li class="m_2depth"><a href="/web/golfService">골프장서비스 소개</a></li>                        
                        <li class="m_2depth"><a href="/market/proList">코칭 프로 소개</a></li>
                        <li class="m_2depth"><a href="/web/information">이용방법</a></li>
                        <li class="m_2depth"><a href="/web/fare">요금제 및 환불</a></li>
                        <li class="m_2depth"><a href="#">스윙밴드</a></li>
                        <li><a href="/web/golfManagement">골프장관제</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>                    
                </li>

            </ul>
            <c:choose>
            <c:when test="${not empty sessionScope.login.userid}">
            <ul>
                <li class="menu-label menu-arrow-active-li">
                    <a href="/web/mypage" class="dg-point">마이페이지</a>
                    <span class="dg-hd-mo-menu-arrow menu-arrow-active"></span>
                    <ul class="sub-menu sub-menu-on">
                         <li><a href="/web/mypage" class="depth_2">내정보</a></li>
                         <li><a href="/group/grpenter" class="depth_2">그룹정보</a></li>
                                <!-- 마켓 프로일 경우 -->
                                <c:if test="${sessionScope.login.grouppro == 'Y'}">
                                	<li><a href="/market/itemList" class="depth_2">마켓정보</a></li>
                                </c:if>                         
                    </ul>                    
                </li>
            </ul> 
            </c:when>
            </c:choose> 
                        
        </nav>
        <!--어두워지는 부분-->
        <div class="dg-hd-mo-menu-panel-overlay"></div>
    </nav>
    <script type="text/javascript">
        $(".dg-hd-mo-menu-btn, .dg-hd-mo-menu-panel-overlay").click(function() {
            $(".dg-hd-mo-menu-btn, .dg-hd-mo-menu-panel-overlay, .dg-hd-mo-menu-panel").toggleClass("mo-menu-active");
            /* dg-hd-mo-menu-panel-overlay 활성화 체크 */
            if ($(".dg-hd-mo-menu-panel-overlay").hasClass("mo-menu-active")) {
                $(".dg-hd-mo-menu-panel-overlay").fadeIn();
            } else {
                $(".dg-hd-mo-menu-panel-overlay").fadeOut();
            }
        });

        //메뉴의 + 클릭시 닫히고, 열림
        $('.dg-hd-mo-menu-arrow').click(function() {
            $(this).next('ul').toggleClass('sub-menu-on');
            var $curruntArrow = $(this).toggleClass('menu-arrow-active');
            $(this).parents('li').toggleClass('menu-arrow-active-li');
            $(this).prev('a').toggleClass('dg-point');
            $(this).parents('li').next('li').toggleClass('menu-arrow-active-li-next-li');
        });

    </script>
    
<!--     
<nav class="dg-hd-mo hidden-lg">
    <h1 class="dg-hd-mo-logo-area">
        <a href="/"><img src="/image/logo-01.svg" class="header-logo" width="100%"></a>
    </h1>
    <nav class="dg-hd-mo-menu-panel" style=''>
        <b class="dg-hd-mo-menu-btn" title="menu"><span></span></b>
        <div class="mo-menu-title">
        	<c:choose>
        		<c:when test="${not empty sessionScope.login.userid}">
            		<a href="/logout" class="dg-white">로그아웃</a>
        	 	</c:when>
        	 	<c:otherwise>
        	 		<a href="/loginForm" class="dg-white">로그인</a>
            		<a href="/web/user/member" class="dg-white">회원가입</a>
        	 	</c:otherwise>
        	</c:choose>
        </div>
        <ul>
            <li class="menu-label menu-arrow-active-li">
                <a href="/" class="dg-point">HOME</a>
                <span class="dg-hd-mo-menu-arrow menu-arrow-active"></span>
                <ul class="sub-menu sub-menu-on">
                    <li><a href="#fir" onclick="location.href='/#fir'">회사소개</a></li>
                    <li><a href="#sec" onclick="location.href='/#sec'">스윙세이버란?</a></li>
                    <li><a href="#thi" onclick="location.href='/#thi'">서비스소개</a></li>
                    <li><a href="#">제품</a></li>
                    <li><a href="#">레슨마켓</a></li>
                </ul>
            </li>

			<c:choose>
        		<c:when test="${not empty sessionScope.login.userid}">
            		<li class="menu-label menu-arrow-active-li-next-li">
		                <a href="/web/mypage">마이페이지</a>
		                <span class="dg-hd-mo-menu-arrow"></span>
		                <ul class="sub-menu">
		                    <li><a href="/web/mypage">개인정보수정</a></li>
                        	<li><a href="/score/scoreList">내스코어 관리</a></li>
                        	<li><a href="/score/statList">내스코어 통계</a></li>
		                    <li><a href="#">포인트 구매/이용료결제</a></li>
		                    <li><a href="#">결제내역 조회</a></li>
		                    <li><a href="#">서비스 변경</a></li>
		                    <li><a href="#">서비스 해지</a></li>
		                </ul>
		            </li>
		            <li class="menu-label">
		                <a href="/group/grpenter">그룹</a>
		                <span class="dg-hd-mo-menu-arrow"></span>
		                <ul class="sub-menu">
		                    <li><a href="/group/mygroup">그룹정보수정</a></li>
		                    <li><a href="/group/groupmember">그룹멤버관리</a></li>
		                    <li><a href="/group/subgroup">소그룹관리</a></li>
		                    <li><a href="#">월 이용 결제</a></li>
		                    <li><a href="#">결제내역 조회</a></li>
		                    <li><a href="#">서비스 변경 요청</a></li>
		                </ul>
		            </li>
        	 	</c:when>
        	 	<c:otherwise>
        	 	</c:otherwise>
        	</c:choose>
            

        </ul>
    </nav>
    <div class="dg-hd-mo-menu-panel-overlay"></div>
</nav>
-->
<!-- 
<script>
    $(".dg-hd-mo-menu-btn, .dg-hd-mo-menu-panel-overlay").click( function() {
        $(".dg-hd-mo-menu-btn, .dg-hd-mo-menu-panel-overlay, .dg-hd-mo-menu-panel").toggleClass("mo-menu-active");
        /* dg-hd-mo-menu-panel-overlay 활성화 체크 */
        if ($(".dg-hd-mo-menu-panel-overlay").hasClass("mo-menu-active")) {
            $(".dg-hd-mo-menu-panel-overlay").fadeIn();
        } else {
            $(".dg-hd-mo-menu-panel-overlay").fadeOut();
        }
    });

    //메뉴의 + 클릭시 닫히고, 열림
    $('.dg-hd-mo-menu-arrow').click(function(){
        $(this).next('ul').toggleClass('sub-menu-on');
        var $curruntArrow = $(this).toggleClass('menu-arrow-active');
        $(this).parents('li').toggleClass('menu-arrow-active-li');
        $(this).prev('a').toggleClass('dg-point');
        $(this).parents('li').next('li').toggleClass('menu-arrow-active-li-next-li');
    });
    
    function fn_smallMenuClick (){
    	$(".dg-hd-mo-menu-btn, .dg-hd-mo-menu-panel-overlay, .dg-hd-mo-menu-panel").toggleClass("mo-menu-active");
    	if ($(".dg-hd-mo-menu-panel-overlay").hasClass("mo-menu-active")) {
            $(".dg-hd-mo-menu-panel-overlay").fadeIn();
        } else {
            $(".dg-hd-mo-menu-panel-overlay").fadeOut();
        }
    }
</script>
-->