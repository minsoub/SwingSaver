<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
 <nav id="header">
    <img src="/mobile/image/gnb-menu.svg" class="gnb-menu" width="100%">
    <div class="logo"><img src="/mobile/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>


    <section id="contents" class="gray_con">
        <div class="con-wrap">
            <h2>조회기간</h2>
            <div class="month-wrap">
                <a href="" class="month-btn on">1개월</a>
                <a href="" class="month-btn">2개월</a>
                <a href="" class="month-btn">3개월</a>
                <a href="" class="month-btn">월별</a>
            </div>

            <div class="date-wrap">
                <div class="sc-date">2020.02.22 ~ 2020.03.22</div>
                <a href="#" class="sta-btn">리스트보기</a>
            </div>
            <div class="sta-box">
                <h2 class="red">BEST SCORE</h2>
                <div class="sc-box-wrap">
                    <div class="sc-box">
                        <p>최고스코어<br/><strong>75</strong>타</p>
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
                        <p>평균타수<br/><strong>75</strong>타</p>
                    </div>
                    <div class="sc-box-round">
                        <p>평균비거리<br/><strong>20.2</strong>M</p>
                    </div>
                    <div class="sc-box-round">
                        <p>평균퍼팅수<br/><strong>1.95</strong>타</p>
                    </div>
                </div>
                <div class="sc-box-wrap">
                    <div class="sc-box-round">
                        <p>페어웨이안착<br/><strong>56.9</strong>%</p>
                    </div>
                    <div class="sc-box-round">
                        <p>그린적중률<br/><strong>25</strong>%</p>
                    </div>
                    <div class="sc-box-round">
                        <p>퍼팅패턴<br/><strong>JR</strong></p>
                    </div>
                </div>
            </div>

            <div class="sta-box">
                <h2>평균타수 87타</h2>
                <div style="width:100%">
                    <canvas id="myChart1"></canvas>
                </div>
            </div>
            <script>
                new Chart(document.getElementById("myChart1"), {
                    type: 'line',
                    data: {
                        labels: ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 타수',
                            data: [
                                74,
                                96,
                                70,
                                63,
                                80
                            ],
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
                <h2>평균퍼팅수 1.86타</h2>
                <div style="width:100%">
                    <canvas id="myChart3"></canvas>
                </div>
            </div>
            <script>
                new Chart(document.getElementById("myChart3"), {
                    type: 'line',
                    data: {
                        labels: ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 퍼팅수',
                            data: [
                                1.1,
                                2,
                                1.3,
                                1.6,
                                2.1
                            ],
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
                <h2>페어웨이안착률 56.9%</h2>
                <div style="width:100%">
                    <canvas id="myChart4"></canvas>
                </div>
            </div>
            <script>
                new Chart(document.getElementById("myChart4"), {
                    type: 'line',
                    data: {
                        labels: ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 페어웨이안착률',
                            data: [
                                64,
                                40,
                                70,
                                73,
                                50
                            ],
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
                <h2>그린적중률 25%</h2>
                <div style="width:100%">
                    <canvas id="myChart5"></canvas>
                </div>
            </div>
            <script>
                new Chart(document.getElementById("myChart5"), {
                    type: 'line',
                    data: {
                        labels: ['2.2', '2.14', '3.1', '3.5', '3.14'],
                        datasets: [{
                            label: '날짜별 그린적중률',
                            data: [
                                24,
                                10,
                                60,
                                40,
                                35
                            ],
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
                        labels: ["O", "JL", "JR", "OL", "OR", "SL", "SR", "SS"],
                        datasets: [{
                            label: '퍼팅 패턴',
                            data: [4, 1, 0, 5, 0, 3, 1, 3],
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
