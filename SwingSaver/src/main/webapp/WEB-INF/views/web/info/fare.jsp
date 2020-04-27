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
                    <li class="current" data-tab="tab1"><a href="#">코칭 서비스 요금</a></li>
                    <li data-tab="tab2"><a href="#">아카데미 요금</a></li>
                </ul>


                <div id="tab1" class="tabcontent current">
                    <div class="col-md-12 per_fare">
                        <img src="/image/fare_1.png" width="70%">
                        <div style="margin-top: 30px;">
                            <a href="#" class="fare_btn">결제하기</a>
                        </div>
                    </div>
                    <div class="col-md-12 group_fare">
                        <h3>서비스 환불규정</h3>
                        <p>
                            결제한 코칭 서비스의 유효기간이 지났을 경우는, 연장 신청을 통해 사용기간 연장이 가능합니다.<br>월별요금제는 사용자가 언제든 취소할 수 있습니다. 다음 달이 되기 이전에 요금제 해지를 해주세요.<br>이미 결제를 된 차월 요금제에 대해서는, 해당 월이 시작되기 전까지 취소가 가능합니다. <br>
                            요금제 취소에 대한 추가 사항은 당사로 문의해 주세요.
                        </p>
                    </div>                    
                    
                </div>

                <div id="tab2" class="tabcontent">
                    <div class="col-md-12 per_fare">
                        <img src="/image/fare_2.png" width="70%">
                        <div style="margin-top: 30px;">
                            <a href="#" class="fare_btn">결제하기</a>
                        </div>
                    </div>
                    <div class="col-md-12 group_fare">
                        <h3>서비스 환불규정</h3>
                        <p>
                            스윙세이버 아카데미 서비스는 관리자가 지속적으로 사용가능 하도록 월별 요금제를 통해 제공합니다.<br>다음달 요금제에 대해서는 전달 25일까지 결제가 완료되어야 사용가능합니다.<br>월별 요금제는 사용자가 언제든 취소할 수 있습니다. 다음 달이 되기 이전에 요금제 해지를 해주세요.<br> 이미 결제를 된 차월 요금제에 대해서는, 해당 월이 시작되기 전까지 무료 취소가 가능합니다. <br>
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
