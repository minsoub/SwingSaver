<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
<%@include file="/WEB-INF/views/mobile/include/top_menu.jsp"%>


    <section id="contents" class="gray_con">
        <div class="con-wrap">
            <h2>조회기간</h2>
            <div class="month-wrap">
                <a href="/m/score_sts.do?p=1" class="<c:if test='${m eq "1"}'>month-btn on</c:if><c:if test='${m ne "1"}'>month-btn</c:if>">1개월</a>
                <a href="/m/score_sts.do?p=2" class="<c:if test='${m eq "2"}'>month-btn on</c:if><c:if test='${m ne "2"}'>month-btn</c:if>">2개월</a>
                <a href="/m/score_sts.do?p=3" class="<c:if test='${m eq "3"}'>month-btn on</c:if><c:if test='${m ne "3"}'>month-btn</c:if>">3개월</a>
                <a href="/m/score_sts.do?p=12" class="<c:if test='${m eq "12"}'>month-btn on</c:if><c:if test='${m ne "12"}'>month-btn</c:if>">월별</a>
            </div>  

            <div class="date-wrap">
                <div class="sc-date">${search_period}</div>
                <a href="/m/score" class="sta-btn">리스트보기</a>
            </div>
            <div class="sta-box">
                <h2 class="red">BEST SCORE</h2>
                <div class="sc-box-wrap">
                    <div class="sc-box">
                        <p>최고스코어<br/><strong>${sts.high_stroke}</strong>타</p>
                    </div>
                    <div class="sc-box">
                        <p>최대퍼팅거리<br/><strong>20.2</strong>M</p>
                    </div>
                    <div class="sc-box">
                        <p>최대티샷거리<br/><strong>256</strong>M</p>
                    </div>
                </div>
            </div>
            <div class="sta-box">
                <h2 class="red">평균성적분석</h2>
                <div class="sc-box-wrap">
                    <div class="sc-box-round">
                        <p>평균타수<br/><strong>${sts.avg_stroke}</strong>타</p>
                    </div>
                    <div class="sc-box-round">
                        <p>평균비거리<br/><strong>20.2</strong>M</p>
                    </div>
                    <div class="sc-box-round">
                        <p>평균퍼팅수<br/><strong>${sts.avg_put_cnt}</strong>타</p>
                    </div>
                </div>
                <div class="sc-box-wrap">
                    <div class="sc-box-round">
                        <p>페어웨이안착<br/><strong>${sts.avg_fairway}</strong>%</p>
                    </div>
                    <div class="sc-box-round">
                        <p>그린적중률<br/><strong>${sts.avg_greenon}</strong>%</p>
                    </div>
                    <div class="sc-box-round">
                        <p>퍼팅패턴<br/><strong>${sts.avg_pattern}</strong></p>
                    </div>
                </div>
            </div>

            <div class="sta-box">
                <h2>평균타수 ${sts.avg_stroke}타</h2>
                <div style="width:100%">
                    <canvas id="myChart1"></canvas>
                </div>
            </div>
            <script>
            	var obj1 = new Array();
            	var obj2 = new Array();
            	
            	<c:forEach var="scoreInfo" items="${sts.list}" varStatus="status">
            		obj1.push("${scoreInfo.visit_date_format}");
            		obj2.push("${scoreInfo.total_socre}");
            	</c:forEach>
            	
                new Chart(document.getElementById("myChart1"), {
                    type: 'line',
                    data: {
                        labels: obj1,   // ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 타수',
                            data: obj2,   // [74, 96, 70, 63, 80],
                            borderColor: "rgba(255, 92, 92, 1)",
                            backgroundColor: "rgba(255, 92, 92, 0.3)",
                            fill: true,
                            lineTension: 0
                        }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        },
                        scales: {
                            xAxes: [{
                                display: true
                            }],
                            yAxes: [{
                                display: true,
                                ticks: {
                                    suggestedMin: 0,
                                }
                            }]
                        }
                    }
                });

            </script>

           
            <div class="sta-box">
                <h2>평균 비거리 160.6M</h2>
                <div style="width:100%">
                    <canvas id="myChart2"></canvas>
                </div>
            </div>
            <script>
                new Chart(document.getElementById("myChart2"), {
                    type: 'line',
                    data: {
                        labels: ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 비거리',
                            data: [
                                1.1,
                                2,
                                1.3,
                                1.6,
                                2.1
                            ],
                            borderColor: "rgba(255, 201, 14, 1)",
                            backgroundColor: "rgba(255, 201, 14, 0.3)",
                            fill: true,
                            lineTension: 0
                        }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        },
                        scales: {
                            xAxes: [{
                                display: true
                            }],
                            yAxes: [{
                                display: true,
                                ticks: {
                                    suggestedMin: 0,
                                }
                            }]
                        }
                    }
                });

            </script>           
           
            <div class="sta-box">
                <h2>평균퍼팅수 ${sts.avg_put_cnt}타</h2>
                <div style="width:100%">
                    <canvas id="myChart3"></canvas>
                </div>
            </div>
            <script>
            	var obj3 = new Array();
            	var obj4 = new Array();
            	
            	<c:forEach var="scoreInfo" items="${sts.list}" varStatus="status">
        			obj3.push("${scoreInfo.visit_date_format}");
        			obj4.push("${scoreInfo.puttersum}");
        		</c:forEach>
        	
                new Chart(document.getElementById("myChart3"), {
                    type: 'line',
                    data: {
                        labels: obj3,  // ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 퍼팅수',
                            data: obj4,  // [1.1, 2, 1.3, 1.6, 2.1 ],
                            borderColor: "rgba(92, 188, 255, 1)",
                            backgroundColor: "rgba(92, 188, 255, 0.3)",
                            fill: true,
                            lineTension: 0
                        }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        },
                        scales: {
                            xAxes: [{
                                display: true
                            }],
                            yAxes: [{
                                display: true,
                                ticks: {
                                    suggestedMin: 0,
                                }
                            }]
                        }
                    }
                });

            </script>               
           
            <div class="sta-box">
                <h2>페어웨이안착률 ${sts.avg_fairway}%</h2>
                <div style="width:100%">
                    <canvas id="myChart4"></canvas>
                </div>
            </div>
            <script>
        	var obj5 = new Array();
        	var obj6 = new Array();
        	
        	<c:forEach var="scoreInfo" items="${sts.list}" varStatus="status">
    			obj5.push("${scoreInfo.visit_date_format}");
    			obj6.push("${scoreInfo.fairwayon_rate}");
    		</c:forEach>
    		            
                new Chart(document.getElementById("myChart4"), {
                    type: 'line',
                    data: {
                        labels: obj5,  // ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 페어웨이안착률',
                            data: obj6,   // [ 64, 40, 70, 73, 50 ],
                            borderColor: "rgba(255, 92, 92, 1)",
                            backgroundColor: "rgba(255, 92, 92, 0.3)",
                            fill: true,
                            lineTension: 0
                        }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        },
                        scales: {
                            xAxes: [{
                                display: true
                            }],
                            yAxes: [{
                                display: true,
                                ticks: {
                                    suggestedMin: 0,
                                }
                            }]
                        }
                    }
                });

            </script>               
                      
            <div class="sta-box">
                <h2>그린적중률 ${sts.avg_greenon}%</h2>
                <div style="width:100%">
                    <canvas id="myChart5"></canvas>
                </div>
            </div>
            <script>
        	var obj7 = new Array();
        	var obj8 = new Array();
        	
        	<c:forEach var="scoreInfo" items="${sts.list}" varStatus="status">
    			obj7.push("${scoreInfo.visit_date_format}");
    			obj8.push("${scoreInfo.greenon_rate}");
    		</c:forEach>
    		
                new Chart(document.getElementById("myChart5"), {
                    type: 'line',
                    data: {
                        labels: obj7, // ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 그린적중률',
                            data: obj8,   // [24, 10, 60, 40, 35 ],
                            borderColor:  "rgba(255, 201, 14, 1)",
                            backgroundColor:  "rgba(255, 201, 14,0.3)",
                            fill: true,
                            lineTension: 0
                        }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        },
                        scales: {
                            xAxes: [{
                                display: true
                            }],
                            yAxes: [{
                                display: true,
                                ticks: {
                                    suggestedMin: 0,
                                }
                            }]
                        }
                    }
                });

            </script>               
                                 
           
           
            <div class="sta-box">
                <h2>퍼팅패턴</h2>
                <div style="width:100%">
                    <canvas id="myChart6"></canvas>
                </div>
            </div>
            <script>
        	var obj9 = new Array();	
			
        	<c:forEach var="scoreInfo" items="${sts.list}" varStatus="status">
    			obj9.push("${scoreInfo.visit_date_format}");
    		</c:forEach>
    		
                // 우선 컨텍스트를 가져옵니다. 
                var ctx = document.getElementById("myChart6").getContext('2d');
                /*
                - Chart를 생성하면서, 
                - ctx를 첫번째 argument로 넘겨주고, 
                - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
                */
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ["SL", "SR", "SS", "JL", "JR", "OL", "OS", "OL"],
                        datasets: [{
                            label: '퍼팅 패턴',
                            data: [${sts.pattern[1]}, ${sts.pattern[2]}, ${sts.pattern[3]}, ${sts.pattern[4]},
                            	${sts.pattern[5]}, ${sts.pattern[6]}, ${sts.pattern[7]}, ${sts.pattern[8]}],
                            backgroundColor: [
                                'rgba(90, 99, 108, 0.2)',
                                'rgba(90, 99, 108, 0.2)',
                                'rgba(90, 99, 108, 0.2)',
                                'rgba(90, 99, 108, 0.2)',
                                'rgba(90, 99, 108, 0.2)',
                                'rgba(90, 99, 108, 0.2)',
                                'rgba(90, 99, 108, 0.2)',
                                'rgba(90, 99, 108, 0.2)'
                            ],
                            borderColor: [
                                'rgba(90, 99, 108,1)',
                                'rgba(90, 99, 108, 1)',
                                'rgba(90, 99, 108, 1)',
                                'rgba(90, 99, 108, 1)',
                                'rgba(90, 99, 108, 1)',
                                'rgba(90, 99, 108, 1)',
                                'rgba(90, 99, 108, 1)',
                                'rgba(90, 99, 108, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });

            </script>



        </div>
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>
