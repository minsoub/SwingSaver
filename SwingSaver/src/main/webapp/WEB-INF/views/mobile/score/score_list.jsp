<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
 <nav id="header">
 	<a href="/m/home"><img src="/image/h-back.png" class="gnb-log" width="100%"></a>
    <div class="logo"><img src="/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/golflist.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>


    <section id="contents" class="gray_con">
        <div class="con-wrap">
            <a href="/m/score-add" class="sc-add">새로운 스코어 추가 +</a>
           
            <h2>조회기간</h2>
            <div class="month-wrap">
                <a href="/m/score.do?p=1" class="<c:if test='${m eq "1"}'>month-btn on</c:if><c:if test='${m ne "1"}'>month-btn</c:if>">1개월</a>
                <a href="/m/score.do?p=2" class="<c:if test='${m eq "2"}'>month-btn on</c:if><c:if test='${m ne "2"}'>month-btn</c:if>">2개월</a>
                <a href="/m/score.do?p=3" class="<c:if test='${m eq "3"}'>month-btn on</c:if><c:if test='${m ne "3"}'>month-btn</c:if>">3개월</a>
                <a href="/m/score.do?p=12" class="<c:if test='${m eq "12"}'>month-btn on</c:if><c:if test='${m ne "12"}'>month-btn</c:if>">월별</a>
            </div>            
            
            <div class="date-wrap">
                <div class="sc-date">${search_period}</div>
                <a href="/m/score_sts" class="sta-btn gray-btn">통계보기</a>
            </div>
            
        </div>
        <div class="list-wrap">
          <c:forEach var="scoreInfo" items="${scoreList}" varStatus="status">
            <div class="list" style='cursor:pointer;' onclick="location.href='/m/scoredetail.do?visit_date=${scoreInfo.visit_date}&countryclub_id=${scoreInfo.countryclub_id}&teeup_time=${scoreInfo.teeup_time}&start_course=${scoreInfo.start_course}&end_course=${scoreInfo.end_course}'">
                <div class="list-info">
                    <span>${scoreInfo.visit_date_format} / ${scoreInfo.teeup_time_format}</span>
                    <h4>${scoreInfo.countryclub_nm} <span>${scoreInfo.stroke_sum}(${scoreInfo.score_sum_format })</span></h4>
                    <p>Thru <strong>0</strong> Shru <strong>0</strong> Score <strong>${scoreInfo.score_sum}</strong></p>
                </div>
                <div class="list-right">
                    <a href="/m/scoredetail.do?visit_date=${scoreInfo.visit_date}&countryclub_id=${scoreInfo.countryclub_id}&teeup_time=${scoreInfo.teeup_time}&start_course=${scoreInfo.start_course}&end_course=${scoreInfo.end_course}" class=""><img src="/mobile/image/arrow-btn.png" class="list-arrow"></a>
                </div>
            </div>
          </c:forEach>
          
            <!-- div class="list">
                <div class="list-info">
                    <span>2020.03.22</span>
                    <h4>아시아나컨트리클럽</h4>
                    <p>Thru <strong>0</strong> Shru <strong>0</strong> Score <strong>0</strong></p>
                </div>
                <div class="list-right">
                    <a class=""><img src="/mobile/image/arrow-btn.png" class="list-arrow"></a>
                </div>
            </div>
            <div class="list">
                <div class="list-info">
                    <span>2020.03.22</span>
                    <h4>아시아나컨트리클럽</h4>
                    <p>Thru <strong>0</strong> Shru <strong>0</strong> Score <strong>0</strong></p>
                </div>
                <div class="list-right">
                    <a class=""><img src="/mobile/image/arrow-btn.png" class="list-arrow"></a>
                </div>
            </div  -->         

        </div>
    </section>
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>
