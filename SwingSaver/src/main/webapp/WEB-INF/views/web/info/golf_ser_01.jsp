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

        <div class="content" style="margin-bottom: 0;">
            <div class="col-md-12">
                <div class="main-ab">
                    <h1>What is <strong>Swingsaver?</strong></h1>
                    <h3>스윙세이버는 <strong>언제 어디서나 스윙분석</strong>이 가능합니다.</h3>
                    <img src="/image/main-img-01.png" width="70%">
                </div>
            </div>
        </div>
</section>


<section id="thi">
    <div class="main-gol">
        <div class="gol-tit">
            <h4>Professional Golfer</h4>
            <h1>스윙세이버의 프로골퍼를 소개합니다.</h1>
        </div>

        <div class="gol-profile col-md-12">
            <div class="col-md-4 profile">
                <img src="/image/pro-01.png">
                <h3>Professional Golfer</h3>
                <p>the role of teacher is often forma and ongo-ing, carried out at a school or other place of formal education.</p>
            </div>
            <div class="col-md-4 profile">
                <img src="/image/pro-01.png">
                <h3>Professional Golfer</h3>
                <p>the role of teacher is often forma and ongo-ing, carried out at a school or other place of formal education.</p>
            </div>
            <div class="col-md-4 profile">
                <img src="/image/pro-01.png">
                <h3>Professional Golfer</h3>
                <p>the role of teacher is often forma and ongo-ing, carried out at a school or other place of formal education.</p>
            </div>

        </div>
    </div>

</section>
    
<section id="fou">
    <div class="main-pro col-md-12">
        <div class="col-md-6 product-01">
                <img src="/image/tablet-01.png" width="100%">
        </div>
        <div class="col-md-6 product-info-01">
                <img src="/image/icon-01.png">
            <h4>Scientific Analysis</h4>
            <h1>간편하고 정밀한 분석력!</h1>
            <p>Edge Device로부터 생성된 데이터와 영상분석 툴을 연동한 정밀한 동작 분석 플랫폼입니다.<br>또한 Edge Device는 장비에 쉽게 장착할 수 있어 사용이 간편합니다.
            </p>
            <a href="#"><u>MORE INFO +</u></a>
        </div>
    </div>
    <div class="main-pro col-md-12">
           
            <div class="col-md-6 product-02 mobile-tab">
                <img src="/image/tablet-02.png" width="100%">
            </div>           
           
        <div class="col-md-6  product-info-01 product-info-02">
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
    <div class="main-pro col-md-12">
            <div class="col-md-6 product-02">
                <img src="/image/tablet-03.png" width="100%">
        </div>
        <div class="col-md-6 product-info-01">
                <img src="/image/icon-03.png">
            <h4>High Quality Lesson</h4>
            <h1>프로골퍼에게 1:1레슨!</h1>
            <p>다양한 조건을 통해 만족하는 가격과 양질의 교육자에게 원격레슨이 가능합니다.<br>직관적인 화면을 통한 레슨 및 클라우스 서비스가 제공됩니다.
            </p>
            <a href="#"><u>MORE INFO +</u></a>
        </div>
    </div>

</section>    
    

    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
</html>
