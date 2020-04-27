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
                            <h1>About</h1>
                        <div class="main-ab">
                        <h3 class="com-tit">스윙세이버 비젼</h3>                        

                            <p>스윙세이버는 모든 사람들이 안전하고 편리하게 일상의 여가를 즐기는 모습을 상상합니다.<br/> 세상이 필요로 하는 제품과 서비스를 제공하여 더 스마트한 일상을 만드는데 끊임없이 정진하겠습니다.<br/> 또한 지속적인 혁신과 도전을 통해 글로벌 브랜드 기업으로 성장해 나갈 것을 약속 드립니다.
                            </p>
                        </div>
                        
                        
                        <div class="main-ab">
                            <h3 class="com-tit">코칭 서비스 플랫폼</h3>
                            <a class="more-btn" href="/web/golfService">자세히보기 +</a>
                            <p>스윙세이버 코칭 서비스 플랫폼는 스마트기기와 IoT Device를 이용하여 <br/><span class="red-font">언제, 어디서나 간편하고 편리하게 현장에서 동작분석</span>이 가능하고, <br/>
                            교육자와 피 교육자간의 코칭 정보를 편리하게 공유함으로써 교육의 성과를 극대화 하는 O2O서비스 플랫폼입니다.
                            </p>
                            <ul>
                                <li class="tit-li">간편하게 촬영하고 분석하는 App 제공</li>
                                <li>고가의 촬영장비 없이도 언제, 어디서나 간편하게 촬영하고, 편리한 UI로 사용이 쉬워요. </li>
                                <li class="tit-li">언제, 어디서나 편리한 레슨 공유</li>
                                <li>언제, 어디서나 Cloud 통해 전문가와의 실시간 레슨정보를 공유하고 Andriod, IOS가  호환되어 회원관리가 편해요.</li>                                
                                <li class="tit-li">나만의 멘토! 편리한 레슨마켓 이용</li>
                                <li>아카데미에 등록하지 않아도 레슨마켓을 통해 나만의 전문적인 멘토가 있어 언제든지 레슨 받을 수 있어요.</li>                                 
                                <li class="tit-li">데이터 분석으로 내 상태파악</li>
                                <li>잘하고 있는지? 실력이 늘었는지? 문제는 없는지? 데이터 분석 정보로 알 수 있어요.</li>                                 
                                <li class="tit-li">다양한 레슨 분야 활용</li>
                                <li>생활체육,골프, 반려견, 산업, 미용 등의 다양한 분야에 레슨 서비스를  받을 수 있어요.</li>                                  
                            </ul>
                        </div>                       
                        <div class="main-ab">
                            <h3 class="com-tit">스윙세이버 골프장 관제 솔루션</h3>
                            <a class="more-btn" href="/web/golfManagement">자세히보기 +</a>
                            <p>3개국에 인증받은 자사 통신망과  IoT기술을 적용한 골프장 관제 솔루션으로<br/>국내 및 미국, 일본 등에 수출하여 그 실력을 인정 받고 있습니다.
                            </p>
                            <ul>
                                <li class="tit-li">셀프라운딩 운영에 유일한 대안</li>
                                <li>안전사고 예방 & 골퍼의 코스매니지먼트가 우선시 되는 “셀프라운딩” 에 최적화되어 있어요.</li>
                                <li class="tit-li">안전사고 예방을 위한 솔루션 제공</li>
                                <li>타구사고 방지, 잔디보호, 카트운행 시 위험지역 사고 에방을 위한 제어, 카트자동 이동 등의 솔루션이 있어요.</li>                                
                                <li class="tit-li">골퍼의 셀프 코스 매니지먼트를 위한 서비스  </li>
                                <li>태블릿 뿐아니라 골퍼폰에서도 관제서비스를 받을 수 있고 스스로 스코어카드를 꾸미고 관리할 수 있어요.</li>                                 
                                <li class="tit-li">통신비 없이 맘 놓고 시설&코스 업무적용</li>
                                <li>하나의 통신 플랫폼에서 통신비 없이 경기관리/시설관리/코스관리 업무 확장이 가능해요. </li>                                                                
                            </ul>
                        </div>                        
                       
                       
                       
                        <div class="main-ab" style="margin-top: 80px;">
                            <h3 class="com-tit">Contact</h3>
                            <p>경기도 안양시 동안구 학의로 282 금강펜테리움IT센터 B동 720호<br/>대표전화 : 02-6408-7874</p>

                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3169.526474789543!2d126.96673341413803!3d37.40102924134926!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b5e3bca981777%3A0xcd709e8d06896596!2z6rK96riw64-EIOyViOyWkeyLnCDrj5nslYjqtawg6rSA7JaRMuuPmSDtlZnsnZjroZwgMjgy!5e0!3m2!1sko!2skr!4v1583593848530!5m2!1sko!2skr" width="100%" height="400" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                        </div>
                    </div>

                </div>

            </section>


    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
</html>
