<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
 <nav id="header">
 	<a href="/m/score"><img src="/image/h-back.png" class="gnb-log" width="100%"></a>
    <div class="logo"><img src="/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>

    <section id="contents" class="gray_con">
    <form name="frm" id="frm">
    <input type="hidden" name="visit_date" id="visit_date" value="${visit_date}">
    <input type="hidden" name="countryclub_id" id="countryclub_id" value="${countryclub_id}">
    <input type="hidden" name="start_course" id="start_course" value="${start_course}">
    <input type="hidden" name="end_course" id="end_course" value="${end_course}">
    <input type="hidden" name="teeup_time" id="teeup_time" value="${teeup_time}">
    </form>
            
        <div class="con-wrap">
            <div class="sc-btn-wrap">
                <div class="sc-date">${scoreAnalysys.visit_date_format} / ${scoreAnalysys.teeup_time_format}</div>
                <a href="#" id="scoreView" class="sta-btn gray-btn">스코어보기</a>
                <div class="sc-golf-name">${golfInfo.countryclub_nm} <span>${scoreAnalysys.total_socre}(${scoreAnalysys.par_data})</span></div>
            </div>           
       
            <h2 class="sta-tit">Score</h2>
            <div class="sta-box">
                <div style="width:100%">

                    <canvas id="myChart1"></canvas>
                    <script>
                        var g_data = [${scoreAnalysys.birdie},${scoreAnalysys.par}, ${scoreAnalysys.bogey},${scoreAnalysys.double_bogey},${scoreAnalysys.triple_bogey}];
                        data = {
                            datasets: [{
                                backgroundColor: ['#ff5767', '#ffbd3e', '#5d717e', '#5ad2ce', '#b3ea2e'],
                                data: g_data  // [10, 20, 30, 40, 50]
                            }],
                            labels: ['Birdie', 'Par', 'Bogey', 'Double Bogey', 'Triple Bogey']
                        };
                        var ctx1 = document.getElementById("myChart1");
                        var myPieChart = new Chart(ctx1, {
                            type: 'pie',
                            data: data,
                            options: {}
                        });

                    </script>
                    
                    <table style="width:100%">
                      <colgroup>
                          <col width="50%">
                          <col width="50%">
                      </colgroup>
                       <tr>
                           <td><span style="color:#ff5767">●</span>Birdie</td>
                           <td>${scoreAnalysys.birdie}%</td>
                       </tr> 
                       <tr>
                           <td><span style="color:#ffbd3e">●</span>Par</td>
                           <td>${scoreAnalysys.par}%</td>
                       </tr>                        
                       <tr>
                           <td><span style="color:#5d717e">●</span>Bogey</td>
                           <td>${scoreAnalysys.bogey}%</td>
                       </tr>                        
                       <tr>
                           <td><span style="color:#5ad2ce">●</span>Double Bogey</td>
                           <td>${scoreAnalysys.double_bogey}%</td>
                       </tr>                        
                       <tr>
                           <td><span style="color:#b3ea2e">●</span>Triple Bogey</td>
                           <td>${scoreAnalysys.triple_bogey}%</td>
                       </tr>                       
                    </table>
                </div>
            </div>



            <h2 class="sta-tit">Putts</h2>
            <div class="sta-box">
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
        		// putter-pattern
        		var put_data = [${scoreAnalysys.SL}, ${scoreAnalysys.SR},${scoreAnalysys.SS},${scoreAnalysys.JL},${scoreAnalysys.JR},${scoreAnalysys.OL},${scoreAnalysys.OS},${scoreAnalysys.OR}];
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ["SL", "SR", "SS", "JL", "JR", "OL", "OS", "OR"],
                        datasets: [{
                            label: 'putts',
                            data: put_data, // [4, 1, 0, 5, 0, 3, 1, 3],
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
            
            <div class="sta-box2">
                <h2 class="sta-tit">Fairway Hit</h2>
                <div class="sta-box text-center">
                    <p>${scoreAnalysys.fairway_total}개 / ${scoreAnalysys.fairway_hit}개 적중
                        <strong>${scoreAnalysys.total_socre}</strong>
                    </p>
                </div>
            </div>
            <div class="sta-box2">
                <h2 class="sta-tit">Green Hit</h2>
                <div class="sta-box text-center">
                    <p>${scoreAnalysys.green_total}개 / ${scoreAnalysys.green_hit}개 적중
                        <strong>${scoreAnalysys.total_socre}</strong>
                    </p>
                </div>
            </div>

        </div>        
    </section>
    
<script>
$(document).ready(function(){
    $("#scoreView").click(function(){
    	var url = "";
    	url += "visit_date="+$("#visit_date").val()+"&countryclub_id="+$("#countryclub_id").val()+"&teeup_time="+$("#teeup_time").val()+"&start_course="+$("#start_course").val()+"&end_course="+$("#end_course").val();
    	location.href="/m/scoredetail.do?"+url;
    });	
});
</script>
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>
