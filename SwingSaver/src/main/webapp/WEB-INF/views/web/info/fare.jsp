<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>

<body>
	<%@include file="/WEB-INF/views/web/inc/navi.jsp"%>
    <section class="container no-padding">

        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding">
                <h2 class="right-tit">요금제 규정</h2>
            </div>

            <div class="col-md-12 fare_info">
                <ul class="tab">
                    <li class="current" data-tab="tab1"><a href="#">개인 요금제</a></li>
                    <li data-tab="tab2"><a href="#">환불규정</a></li>
                </ul>


                <div id="tab1" class="tabcontent current">
                    <div class="col-md-6 per_fare">
                        <img src="/image/fare_stan.png" width="100%">
                    </div>
                    <div class="col-md-6 per_fare">
                        <img src="/image/fare_pre.png" width="100%">
                    </div>
                </div>

                <div id="tab2" class="tabcontent">
                    <div class="col-md-12 group_fare">
                       <h3>서비스 환불규정</h3>
                        <p>
                            스윙세이버는 사용자에게 필요한 서비스를 지속적으로 사용가능 하도록 월별 요금제를 통해 제공합니다. <br>
                            월별요금제는 사용자가 언제든 취소할 수 있습니다. 다음 달이 되기 이전에 요금제 해지를 해주세요.<br>
                            이미 결제를 된 차월 요금제에 대해서는, 해당 월이 시작되기 전까지 무료 취소가 가능합니다. <br>
<!--                            또한 1년간 요금제를 유지하기만 하면 더 낮은 월별 요금을 제공하는 연간 약정 옵션도 있습니다.-->
                            요금제 취소에 대한 추가 사항은 당사로 문의해 주세요.
                        </p>
                    </div>
                </div>           
           
            </div>
        </div>


    </section>

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
    
    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->
</body>
</html>
