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
                    <h1>About Swingsaver</h1>
                    <h3>레슨정보 공유 서비스 & 골프장 관제 통합관리 시스템</h3>
                    <p>스윙세이버는 급변하는 시대상을 반영한 인문학적인 접근방식으로 최첨단 솔루션을 연구, 개발, 공급하는 전문 기업입니다.<br/>우수한 전문인력과 기술력으로 골프 카트 위치 관제 솔루션을 성공적으로 개발, 구축하여 그 저력을 인정 받았으며,<br/>이를 통해 확보된 기술력을 바탕으로 다양한 분야의 관제시스템을 개발하여 "고객의 사업경쟁력 강화"에 기여하고자 끊임없이 정진해 나갈 것 입니다.<br/> 정보화 사회가 요구하는 정보 기술의 통합 솔루션과 이를 지원하는 모든 프로세스를 체계적으로 설계, 개발하고,<br/>이를 바탕으로 산업, 레져, 교육 부문의 차별화된 고부가가치 제품으로 "스윙세이버"의 브랜드화를 구축하기 위해 노력해 나갈 것입니다.<br/>탁월한 기술력으로 무장하여 글로벌 기업으로 성장하기 위해 지속적인 혁신과 도전을 준비하고 있는 스윙세이버는<br/>확고한 브랜드로 성장해 나갈 것이며, 고객이 요구하는 진보된 제품을 개발, 공급하는 기업으로 계속 진화해 나갈 것을 약속드립니다.</p>

                </div>             
               
                <div class="main-ab" style="margin-top: 80px;">
                    <h1>Contact</h1>
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
