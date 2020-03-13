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
            <div class="no-padding">
                <h2 class="right-tit">이용방법</h2>
            </div>

            <div class="col-md-12">
                <ul class="tab">
                    <li class="current" data-tab="tab1"><a href="#">개인회원</a></li>
                    <li data-tab="tab2"><a href="#">그룹회원</a></li>
                    <li data-tab="tab3"><a href="#">레슨마켓</a></li>
                </ul>

                <div id="tab1" class="tabcontent current">
                    <div class="col-md-12">
                    <img src="/image/information_1.png" width="100%">
                    </div>
                </div>

                <div id="tab2" class="tabcontent">
                    <div class="col-md-12">
                    <img src="/image/information_2.png" width="100%">
                    </div>
                </div>          
                <div id="tab2" class="tabcontent">
                    <div class="col-md-12">
                    <img src="/image/information_3.png" width="100%">
                    </div>
                </div>            

            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->
</body>
</html>
