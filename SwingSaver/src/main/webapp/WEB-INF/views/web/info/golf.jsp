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
                <h2 class="right-tit">골프장 관제</h2>
            </div>
            <div class="col-md-12">
                <ul class="tab">
                    <li class="current" data-tab="tab1"><a href="#">경기 관제</a></li>
                    <li data-tab="tab2"><a href="#">시설 관제</a></li>
                    <li data-tab="tab3"><a href="#">코스 관제</a></li>
                </ul>

                <div id="tab1" class="tabcontent current">
                        <div class="golf_img_box golf_img_1">
                            <div class="golf_btn">
                                <a href="#">자세히보기</a>
                                <a href="#">브로슈어 다운로드</a>
                                <a href="#">기대효과</a>
                            </div>
                        </div>                   
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain01.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>Control Center</h3>
                            <ul class="col-md-6">
                                <li>지도 맵과 블록도 맵을 통한 카트 실시간 모니터링</li>
                                <li>통신 상태 실시간 모니터링</li>
                                <li>카트단말과 양방향 메시지 송.수신</li>
                                <li>카트 속성 관리 (첫팀, 마지막팀 , VIP,단체팀, 교육팀 등)</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>스마트폰을 이용한 관제 및 핀 위치 입력</li>
                                <li>다양한 통계 데이터</li>
                                <li>환경설정을 통한 Setup(식음, 핀위치, 메세지 등)</li>
                                <li>라운딩 후 차량 경로 추적</li>
                            </ul>
                        </div>
                    </div>
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain02.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>BaseStation&SetTop</h3>
                            <ul class="col-md-6">
                                <li>RF무선통신 자가망</li>
                                <li>위치관제 전용</li>
                                <li>다 채널과 자동로밍 지원</li>
                                <li>WiFI, 블루투스 ,LTE 표준통신 지원</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>Sensor 확장 Port 및 RS232C지원</li>
                                <li>모든 태블릿 호환</li>
                                <li>모든 기기 및 Sensor 에 연동(M2M)</li>
                                <li>차량, 장비, 인원, 자재 등 사용</li>
                            </ul>
                        </div>
                    </div>
                    

                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain03.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>Tablet</h3>
                            <ul class="col-md-6">
                                <li>갤럭시 10.1”안드로이드</li>
                                <li>선명한 화면</li>
                                <li>야디지맵, 거리, 핀위치</li>
                                <li>양방향 메시지 송.수신</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>음식 주문 서비스</li>
                                <li>스코어 입력 및 스윙세이버 연동</li>
                                <li>헬캠영상 및 공략법 제공</li>
                                <li>4개국어 지원</li>
                            </ul>
                        </div>
                    </div>
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain05.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>배터리검침</h3>
                            <ul class="col-md-6">
                                <li>셋탑과 연동하여 사용</li>
                                <li>전류, 전압, 사용량 자동 체크</li>
                                <li>스마트폰 원격모니터링</li>
                                <li>상태정보 그래프제공</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>일/주/월/분기 별 통계 정보</li>
                            </ul>
                        </div>
                    </div>
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain06.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>Mobile통합관제</h3>
                            <ul class="col-md-6">
                                <li>모바일관제</li>
                                <li>그린ㆍ티 위치 및 답압관리</li>
                                <li>배터리상태 파악 및 관리</li>
                                <li>카트위치 모니터링</li>
                                <li>드론 사진을 이용한 코스관리</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>기타장비 검침 및 제어</li>
                                <li>코스 작업일보관리</li>
                                <li>W/T수위레벨 검침</li>
                                <li>모바일주차관리</li>
                            </ul>
                        </div>
                    </div>
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain07.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>신호등제어</h3>
                            <ul class="col-md-6">
                                <li>카트위치에 자동제어</li>
                                <li>유선제어장치 불필요</li>
                                <li>설치 시 비용절감</li>
                                <li>낙뢰 피해 방지</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>고객 안전 확보</li>
                            </ul>
                        </div>
                    </div>
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain08.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>스코어관리</h3>
                            <ul class="col-md-6">
                                <li>스코어 자동집계</li>
                                <li>게임 방식 적용</li>
                                <li>스코어카드 고객 폰 전송</li>
                                <li>스코어카드 자동 출력</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>마케팅 활용</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="tab2" class="tabcontent">
                        <div class="golf_img_box golf_img_2">
                            <div class="golf_btn">
                                <a href="#">자세히보기</a>
                                <a href="#">브로슈어 다운로드</a>
                                <a href="#">기대효과</a>
                            </div>
                        </div>                     
                   
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain01.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>Control Center</h3>
                            <ul class="col-md-6">
                                <li>지도 맵과 블록도 맵을 통한 카트 실시간 모니터링</li>
                                <li>통신 상태 실시간 모니터링</li>
                                <li>카트단말과 양방향 메시지 송.수신</li>
                                <li>카트 속성 관리 (첫팀, 마지막팀 , VIP,단체팀, 교육팀 등)</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>스마트폰을 이용한 관제 및 핀 위치 입력</li>
                                <li>다양한 통계 데이터</li>
                                <li>환경설정을 통한 Setup(식음, 핀위치, 메세지 등)</li>
                                <li>라운딩 후 차량 경로 추적</li>
                            </ul>
                        </div>
                    </div>
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain02.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>BaseStation&SetTop</h3>
                            <ul class="col-md-6">
                                <li>RF무선통신 자가망</li>
                                <li>위치관제 전용</li>
                                <li>다 채널과 자동로밍 지원</li>
                                <li>WiFI, 블루투스 ,LTE 표준통신 지원</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>Sensor 확장 Port 및 RS232C지원</li>
                                <li>모든 태블릿 호환</li>
                                <li>모든 기기 및 Sensor 에 연동(M2M)</li>
                                <li>차량, 장비, 인원, 자재 등 사용</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="tab3" class="tabcontent">
                        <div class="golf_img_box golf_img_3">
                            <div class="golf_btn">
                                <a href="#">자세히보기</a>
                                <a href="#">브로슈어 다운로드</a>
                                <a href="#">기대효과</a>
                            </div>
                        </div>                     
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain01.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>Control Center</h3>
                            <ul class="col-md-6">
                                <li>지도 맵과 블록도 맵을 통한 카트 실시간 모니터링</li>
                                <li>통신 상태 실시간 모니터링</li>
                                <li>카트단말과 양방향 메시지 송.수신</li>
                                <li>카트 속성 관리 (첫팀, 마지막팀 , VIP,단체팀, 교육팀 등)</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>스마트폰을 이용한 관제 및 핀 위치 입력</li>
                                <li>다양한 통계 데이터</li>
                                <li>환경설정을 통한 Setup(식음, 핀위치, 메세지 등)</li>
                                <li>라운딩 후 차량 경로 추적</li>
                            </ul>
                        </div>
                    </div>
                    <div class="golf_pro_box col-md-12">
                        <div class="col-md-3">
                            <img src="/image/fmain02.png" width="100%">
                        </div>
                        <div class="col-md-9">
                            <h3>BaseStation&SetTop</h3>
                            <ul class="col-md-6">
                                <li>RF무선통신 자가망</li>
                                <li>위치관제 전용</li>
                                <li>다 채널과 자동로밍 지원</li>
                                <li>WiFI, 블루투스 ,LTE 표준통신 지원</li>
                            </ul>
                            <ul class="col-md-6">
                                <li>Sensor 확장 Port 및 RS232C지원</li>
                                <li>모든 태블릿 호환</li>
                                <li>모든 기기 및 Sensor 에 연동(M2M)</li>
                                <li>차량, 장비, 인원, 자재 등 사용</li>
                            </ul>
                        </div>
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
