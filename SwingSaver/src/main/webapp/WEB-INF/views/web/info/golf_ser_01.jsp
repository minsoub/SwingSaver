<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
    <script>
        $(function() {
            $('ul.tab li').click(function() {
                var activeTab = $(this).attr('data-tab');
                $('ul.tab li').removeClass('current');
                $('.tabcontent').removeClass('current');
                $(this).addClass('current');
                $('#' + activeTab).addClass('current');
            })
        });

    </script>


</head>

<body>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>


           <section class="container no-padding">

                <div class="content" style="margin-bottom: 0; ">
                   
                   
                    <div class="col-md-12">
                        <div class="main-ab" style="text-align: center;margin-bottom: 8%;">
                            <h2 class="right-tit">What is <strong>Swingsaver Golf Service? </strong></h2>
                            <img src="/image/main-img-01.png" width="90%">
                        </div>
                    </div>

                <div class="no-padding">
                        <h2 class="right-tit">골프 App 서비스 소개<br>
                            <p>"스윙세이버는 <strong>언제 어디서나 골프 스윙분석과 레슨이 간편하고 레슨공유가 편리</strong>합니다."</p>
                        </h2>                    
                </div>
                <div class="main-pro col-md-12">
                    <div class="col-md-6 product-01">
                        <img src="/image/tablet-01.png" width="100%">
                    </div>
                    <div class="col-md-6 product-info-01">
                        <img src="/image/icon-01.png">
                        <h4>Easy Analysis</h4>
                        <h1>간편하고 편리한 분석!</h1>
                        <p>고가의 촬영장비 없이도 언제, 어디서나 간편하게 촬영하고,<br>편리한 UI로 사용이 쉬워요.

                        </p>
                        <a href="#"><u>MORE INFO +</u></a>
                    </div>
                </div>
                <div class="main-pro col-md-12">

                    <div class="col-md-6 product-02 mobile-tab">
                        <img src="/image/tablet-02.png" width="100%">
                    </div>

                    <div class="col-md-6  product-info-01">
                        <img src="/image/icon-04.png">
                        <h4>Easy Member Managing</h4>
                        <h1>편리하고 쉬운 회원관리! </h1>
                        <p>언제, 어디서나 Cloud룰 통해 골퍼와 프로간의 실시간 레슨정보를 공유하고<br>Andriod, IOS가 호환되어 회원관리가 편해요.</p>
                        <a href="#"><u>MORE INFO +</u></a>
                    </div>
                    <div class="col-md-6 product-02 pc-tab">
                        <img src="/image/tablet-02.png" width="100%">
                    </div>
                </div>
                <div class="main-pro col-md-12">
                    <div class="col-md-6 product-02">
                        <img src="/image/tablet-03.png" width="100%">
                    </div>
                    <div class="col-md-6 product-info-01">
                        <img src="/image/icon-03.png">
                        <h4>High Quality Lesson</h4>
                        <h1>레슨마켓 프로에게 1:1 레슨!</h1>
                        <p>언제, 어디서나 수준 높은 원 타임 레슨을<br>전문프로에게 받을 수 있어요.
                        </p>
                        <a href="#"><u>MORE INFO +</u></a>
                    </div>
                </div>
                <div class="main-pro col-md-12">

                    <div class="col-md-6 product-02 mobile-tab">
                        <img src="/image/tablet-02.png" width="100%">
                    </div>

                    <div class="col-md-6  product-info-01">
                        <img src="/image/icon-02.png">
                        <h4>Bigdata Analysis</h4>
                        <h1>빅데이터를 활용한 정보 제공!</h1>
                        <p>생성된 빅데이터를 활용하여 지속가능한 교정교육 및 효과적인 분석이 가능합니다.<br>스윙세이버는 당신만의 특별한 스윙 분석을 해드립니다.</p>
                        <a href="#"><u>MORE INFO +</u></a>
                    </div>
                    <div class="col-md-6 product-02 pc-tab">
                        <img src="/image/tablet-02.png" width="100%">
                    </div>
                </div>
                </div>

            </section>
    
    

    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
</html>
