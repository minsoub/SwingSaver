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
                <h3 class="text-center">개인 요금제</h3>
                    <div class="col-md-6 per_fare">
                        <img src="/image/fare_stan.png" width="100%">
                    </div>
                    <div class="col-md-6 per_fare">
                        <img src="/image/fare_pre.png" width="100%">
                    </div>
                </div>

                <div id="tab2" class="tabcontent">
                    <div class="col-md-6 group_fare">
                        <img src="/image/fare_group.png" width="100%">
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
