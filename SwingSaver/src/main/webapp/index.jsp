<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/views/web/inc/header.jsp"%>
	
    <link href="/css/flexslider.css" rel="stylesheet" />
    <script src="/js/jquery.flexslider.js"></script>


    <script>
        $(function() {
            $('.flexslider').flexslider({
                animation: "slide"
            });
        });

    </script>
    	
</head>

<body>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>

<!--슬라이드-->
    <div class="flexslider">
        <ul class="slides">
            <li>
                <div class="slide_ban ban_img_1">
                    <div class="ban_con" style="">
                        <h1>배우는 즐거움!<br/>스윙세이버가 더 편리하게 도와드리겠습니다.</h1>
                        <p>Any where Any time, Online Coaching Service</p>
                        <a href="#">MORE VIEW</a>
                    </div>
                </div>
            </li>
            <li>
                <div class="slide_ban ban_img_2">
                    <div class="ban_con" style="">
                        <h1>이젠 셀프라운딩!<br/>그 시작을 스윙세이버가 함께하겠습니다.</h1>
                        <p>Safe & Easy, Self Managing Golf Service</p>
                        <a href="#">MORE VIEW</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
<!--슬라이드-->
    

    <section class="">
        <article class="col-md-12" style="padding: 0;">
            <div class="content" style="padding: 0;">

                <div class="col-md-12 main_box_wrap">
                    <div class="col-md-4">
                        <a href="/web/golfService" class="">
                            <div class="main_box overbox">
                                <span class="main_sub">media</span>
                                <h4>언론속 스윙세이버</h4>
                                <ul>
                                    <li>한국골프대학교 & ㈜스윙세이버는 스윙세이버 플랫폼을<br/>교과운영에 활용할 수 있도록 산학협력체결 하였습니다.</li>
                                </ul>
                               <p>+</p>
                            </div>

                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="/web/information" class="">
                            <div class="main_box overbox">
                                <span class="main_sub">information</span>
                                <h4>서비스 이용방법</h4>
                                <ul>
                                    <li>회원가입 및 아카데미 운영을 위한 방법을 보실 수 있고,<br/>App다운 및 사용에 대해서도 자세히 설명되어 있습니다.</li>
                                </ul>
                               <p>+</p>
                            </div>

                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="/market/proList" class="">
                            <div class="main_box overbox">
                                <span class="main_sub">Coaching Service</span>
                                <h4>코칭 전문가 소개</h4>
                                <ul>
                                    <li>스윙세이버에서만 제공되는 수준 높은 코칭 서비스,<br/>코칭 전문가들을 만나보세요!</li>
                                </ul>
                               <p>+</p>
                            </div>

                        </a>
                    </div>
                </div>

              <div class="tit-center">
               <h1>Our Products</h1>
              </div>
                <div class="col-md-12 main_box_wrap">
                    <div class="col-md-4">
                        <a href="/web/golfManagement" class="">
                            <div class=" main_box main_box_img1">
                                <span class="main_sub">golf play</span>
                                <h4>골프장 경기관제</h4>
                                <ul>
                                    <li>골프장 셀프라운딩 운영을 위한 최적화된<br/>솔루션을 소개합니다.</li>
                                </ul>
                               <p>+</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="/web/golfManagement" class="">
                            <div class=" main_box main_box_img2">
                                <span class="main_sub">facility</span>
                                <h4>골프장 시설관제</h4>
                                <ul>
                                    <li>코스내 모든 시설 자원의 연결을 통해<br/>업무감소와 비용절감을 실현하세요.</li>
                                </ul>
                               <p>+</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="/web/golfManagement" class="">
                            <div class=" main_box main_box_img3">
                                <span class="main_sub">course</span>
                                <h4>골프장 코스관제</h4>
                                <ul>
                                    <li>코스 예보 시스템을 준비중입니다.<br/></li>
                                </ul>
                               <p>+</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </article>
    </section>


     <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
</html>

