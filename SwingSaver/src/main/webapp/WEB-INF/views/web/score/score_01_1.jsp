<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>


    <!--모바일웹 접속시 팝업-->
    <button type="button" class="mobile-pop" data-toggle="modal" data-target="#mobile_web">모바일웹 접속시 팝업</button>

	<form class="form-signin" id='forms1' name="forms1" method="POST">
	<input type="hidden" name="puterpattern1"  id="puterpattern1">
    <input type="hidden" name="puterpattern2"  id="puterpattern2">
    <input type="hidden" name="puterpattern3"  id="puterpattern3">
    <input type="hidden" name="puterpattern4"  id="puterpattern4">
    <input type="hidden" name="puterpattern5"  id="puterpattern5">
    <input type="hidden" name="puterpattern6"  id="puterpattern6">
    <input type="hidden" name="puterpattern7"  id="puterpattern7">
    <input type="hidden" name="puterpattern8"  id="puterpattern8">
    <input type="hidden" name="puterpattern9"  id="puterpattern9">
	<input type="hidden" name="puterpattern10" id="puterpattern10">
    <input type="hidden" name="puterpattern11" id="puterpattern11">
    <input type="hidden" name="puterpattern12" id="puterpattern12">
    <input type="hidden" name="puterpattern13" id="puterpattern13">
    <input type="hidden" name="puterpattern14" id="puterpattern14">
    <input type="hidden" name="puterpattern15" id="puterpattern15">
    <input type="hidden" name="puterpattern16" id="puterpattern16">
    <input type="hidden" name="puterpattern17" id="puterpattern17">
    <input type="hidden" name="puterpattern18" id="puterpattern18">
                                        
    <section class="container no-padding">
        <article class="col-xs-12" style="padding: 0;">
			<%@include file="/WEB-INF/views/web/inc/mypage_left_menu.jsp"%>
            
            <div class="content col-xs-9" style="padding: 0;">
                <div class="col-xs-12 no-padding">
                    <h2 class="right-tit">스코어 등록</h2>

                    <div class="score-page form-page">
                        <div class="sc-search">
                            <table>
                                <colgroup>
                                    <col width="17%">
                                    <col width="83%">
                                </colgroup>
                                <tr>
                                    <td class="font-weight-bold">
                                        <p>날짜</p>
                                    </td>
                                    <c:set var="now" value="<%=new java.util.Date()%>" />
                                    <td>
                                        <input type="date" id="userdate" name="userdate" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">
                                        <p>골프장</p>
                                    </td>

                                    <td>
                                        <div class="coun_td">
                                            <input type="radio" name="country_id" value="KR" checked="checked">
                                            <p>국내</p>
                                            <input type="radio" name="country_id" value="foreign">
                                            <p>국외</p>
                                        </div>


                                        <select name="zone_id" id="zone_id">    
                                    		<option value="">지역 선택</option>                            
                                			<c:forEach var="areInfo" items="${areaList}" varStatus="status">
                                    			<option  <c:if test="${qrInfo.zone_id == areInfo.zone_id}">selected</c:if>  value="${areInfo.zone_id}">${areInfo.zone_nm}(${areInfo.zone_id})</option>
                                 			</c:forEach>                                 		
                                        </select>
                                        <select name="countryclub_id" id="countryclub_id">
                                    		<option value="">골프장 선택</option>                            
                                			<c:forEach var="golfInfo" items="${golfList}" varStatus="status">
                                    			<option  <c:if test="${qrInfo.countryclub_id == golfInfo.countryclub_id}">selected</c:if>  value="${golfInfo.countryclub_id}">${golfInfo.countryclub_nm}(${golfInfo.countryclub_id})</option>
                                 			</c:forEach>  
                                        </select>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="font-weight-bold"><p>코스</p></td>
                                    <td class="course_td">
                                                                      출발&ensp;
                                            <select name="startcourse">
                                			<c:forEach var="parInfo" items="${parList}" varStatus="status">
                                    			<option  <c:if test="${qrInfo.startcourse == parInfo.course}">selected</c:if>  value="${parInfo.course}">${parInfo1.course_nm}(${parInfo.course})</option>
                                 			</c:forEach> 
                                        </select>
                                            &emsp;도착&ensp;
                                            <select name="endcourse">
                                            <option value="">IN</option>
                                			<c:forEach var="parInfo" items="${parList}" varStatus="status">
                                    			<option  <c:if test="${qrInfo.endcourse == parInfo.course}">selected</c:if>  value="${parInfo.course}">${parInfo.course_nm}(${parInfo.course})</option>
                                 			</c:forEach> 
                                        </select>
                                    </td>

                                </tr>
                            </table>

                        </div>

                        <div class="sc-cont">
                            <h4>골프장명 : <span id="golfTitle">골프장이름</span></h4>

                            <h4 class="sc-tit">출발 Course</h4>
                            <div style="overflow-x:auto; margin-bottom: 30px;">
                                <table>
                                    <tr class="fir-td">
                                        <th class="fir-td">HOLE</th>
                                        <th>1</th>
                                        <th>2</th>
                                        <th>3</th>
                                        <th>4</th>
                                        <th>5</th>
                                        <th>6</th>
                                        <th>7</th>
                                        <th>8</th>
                                        <th>9</th>
                                        <th>TOTAL</th>
                                    </tr>
                                    <tr>
                                        <td class="green-td fir-td">PAR</td>
                                        <td class="green-td"><span id="hole1">${parInfo1.hole1}</span></td>
                                        <td class="green-td"><span id="hole2">${parInfo1.hole2}</span></td>
                                        <td class="green-td"><span id="hole3">${parInfo1.hole3}</span></td>
                                        <td class="green-td"><span id="hole4">${parInfo1.hole4}</span></td>
                                        <td class="green-td"><span id="hole5">${parInfo1.hole5}</span></td>
                                        <td class="green-td"><span id="hole6">${parInfo1.hole6}</span></td>
                                        <td class="green-td"><span id="hole7">${parInfo1.hole7}</span></td>
                                        <td class="green-td"><span id="hole8">${parInfo1.hole8}</span></td>
                                        <td class="green-td"><span id="hole9">${parInfo1.hole9}</span></td>
                                        <td class="green-td"><span id="sum1">${parInfo1.sum}</span></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Stroke</td>
                                        <td><input type="text" name="stroke1" value="${scoreVo.stroke1}"></td>
                                        <td><input type="text" name="stroke2" value="${scoreVo.stroke2}"></td>
                                        <td><input type="text" name="stroke3" value="${scoreVo.stroke3}"></td>
                                        <td><input type="text" name="stroke4"  value="${scoreVo.stroke4}"></td>
                                        <td><input type="text" name="stroke5"  value="${scoreVo.stroke5}"></td>
                                        <td><input type="text" name="stroke6" value="${scoreVo.stroke6}"></td>
                                        <td><input type="text" name="stroke7" value="${scoreVo.stroke7}"></td>
                                        <td><input type="text" name="stroke8" value="${scoreVo.stroke8}"></td>
                                        <td><input type="text" name="stroke9" value="${scoreVo.stroke9}"></td>
                                        <td class="gray-td"><input type="text" name="stroke_sum1" value="${scoreVo.stroke1+scoreVo.stroke2+scoreVo.stroke3+scoreVo.stroke4+scoreVo.stroke5+scoreVo.stroke6+scoreVo.stroke7+scoreo.stroke8+scoreVo.stroke9}"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td><input type="text" name="putter1"></td>
                                        <td><input type="text" name="putter2"></td>
                                        <td><input type="text" name="putter3"></td>
                                        <td><input type="text" name="putter4"></td>
                                        <td><input type="text" name="putter5"></td>
                                        <td><input type="text" name="putter6"></td>
                                        <td><input type="text" name="putter7"></td>
                                        <td><input type="text" name="putter8"></td>
                                        <td><input type="text" name="putter9"></td>
                                        <td class="gray-td" rowspan="2"><input type="text" name="putter_sum1"></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter1">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter2">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter3">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter4">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter5">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter6">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter7">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter8">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter9">상세</button></td>

                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Score</td>
                                        <td><input type="text" name="score1" value="${scoreVo.score1-parInfo1.hole1}"></td>
                                        <td><input type="text" name="score2" value="${scoreVo.score2-parInfo1.hole2}"></td>
                                        <td><input type="text" name="score3" value="${scoreVo.score3-parInfo1.hole3}"></td>
                                        <td><input type="text" name="score4" value="${scoreVo.score4-parInfo1.hole4}"></td>
                                        <td><input type="text" name="score5" value="${scoreVo.score5-parInfo1.hole5}"></td>
                                        <td><input type="text" name="score6" value="${scoreVo.score6-parInfo1.hole6}"></td>
                                        <td><input type="text" name="score7" value="${scoreVo.score7-parInfo1.hole7}"></td>
                                        <td><input type="text" name="score8" value="${scoreVo.score8-parInfo1.hole8}"></td>
                                        <td><input type="text" name="score9" value="${scoreVo.score9-parInfo1.hole9}"></td>
                                        <td class="gray-td"><input type="text" name="score_sum1" value="${scoreVo.score1+scoreVo.score2+scoreVo.score3+scoreVo.score4+scoreVo.score5+scoreVo.score6+scoreVo.score7+scoreo.score8+scoreVo.score9 - (parInfo1.hole1+parInfo1.hole2+parInfo1.hole3+parInfo1.hole4+parInfo1.hole5+parInfo1.hole6+parInfo1.hole7+parInfo1.hole8+parInfo1.hole9)}"></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Fairway안착</td>
                                        <td><input type="checkbox" name="fairwayon1" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon2" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon3" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon4" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon5" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon6" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon7" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon8" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon9" value="Y"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Green적중</td>
                                        <td><input type="checkbox" name="greenon1" value="Y"></td>
                                        <td><input type="checkbox" name="greenon2" value="Y"></td>
                                        <td><input type="checkbox" name="greenon3" value="Y"></td>
                                        <td><input type="checkbox" name="greenon4" value="Y"></td>
                                        <td><input type="checkbox" name="greenon5" value="Y"></td>
                                        <td><input type="checkbox" name="greenon6" value="Y"></td>
                                        <td><input type="checkbox" name="greenon7" value="Y"></td>
                                        <td><input type="checkbox" name="greenon8" value="Y"></td>
                                        <td><input type="checkbox" name="greenon9" value="Y"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Sand Save</td>
                                        <td><input type="checkbox" name="sendsavechk1" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk2" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk3" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk4" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk5" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk6" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk7" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk8" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk9" value="Y"></td>
                                        <td class="gray-td" rowspan="2"> </td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="sendsave1" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave2" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave3" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave4" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave5" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave6" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave7" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave8" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave9" value="Y"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td">Par Break</td>
                                        <td><input type="checkbox" name="parbreak1" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak2" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak3" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak4" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak5" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak6" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak7" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak8" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak9" value="Y"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                </table>
                            </div>

                            <h4 class="sc-tit">도착 Course</h4>
                            <div style="overflow-x:auto;">
                                <table>
                                    <tr class="fir-td">
                                        <th class="fir-td">HOLE</th>
                                        <th>1</th>
                                        <th>2</th>
                                        <th>3</th>
                                        <th>4</th>
                                        <th>5</th>
                                        <th>6</th>
                                        <th>7</th>
                                        <th>8</th>
                                        <th>9</th>
                                        <th>TOTAL</th>
                                    </tr>
                                    <tr>
                                        <td class="green-td fir-td">PAR</td>
                                        <td class="green-td"><span id="hole10">${parInfo2.hole1}</span></td>
                                        <td class="green-td"><span id="hole11">${parInfo2.hole2}</span></td>
                                        <td class="green-td"><span id="hole12">${parInfo2.hole3}</span></td>
                                        <td class="green-td"><span id="hole13">${parInfo2.hole4}</span></td>
                                        <td class="green-td"><span id="hole14">${parInfo2.hole5}</span></td>
                                        <td class="green-td"><span id="hole15">${parInfo2.hole6}</span></td>
                                        <td class="green-td"><span id="hole16">${parInfo2.hole7}</span></td>
                                        <td class="green-td"><span id="hole17">${parInfo2.hole8}</span></td>
                                        <td class="green-td"><span id="hole18">${parInfo2.hole9}</span></td>
                                        <td class="green-td"><span id="sum2">${parInfo2.sum}</span></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Stroke</td>
                                        <td><input type="text" name="stroke10" value="${scoreVo.stroke10}"></td>
                                        <td><input type="text" name="stroke11" value="${scoreVo.stroke11}"></td>
                                        <td><input type="text" name="stroke12" value="${scoreVo.stroke12}"></td>
                                        <td><input type="text" name="stroke13"  value="${scoreVo.stroke13}"></td>
                                        <td><input type="text" name="stroke14"  value="${scoreVo.stroke14}"></td>
                                        <td><input type="text" name="stroke15" value="${scoreVo.stroke15}"></td>
                                        <td><input type="text" name="stroke16" value="${scoreVo.stroke16}"></td>
                                        <td><input type="text" name="stroke17" value="${scoreVo.stroke17}"></td>
                                        <td><input type="text" name="stroke18" value="${scoreVo.stroke18}"></td>
                                        <td class="gray-td"><input type="text" name="stroke_sum1" value="${scoreVo.stroke10+scoreVo.stroke11+scoreVo.stroke12+scoreVo.stroke13+scoreVo.stroke14+scoreVo.stroke15+scoreVo.stroke16+scoreo.stroke17+scoreVo.stroke18}"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td><input type="text" name="putter10"></td>
                                        <td><input type="text" name="putter11"></td>
                                        <td><input type="text" name="putter12"></td>
                                        <td><input type="text" name="putter13"></td>
                                        <td><input type="text" name="putter14"></td>
                                        <td><input type="text" name="putter15"></td>
                                        <td><input type="text" name="putter16"></td>
                                        <td><input type="text" name="putter17"></td>
                                        <td><input type="text" name="putter18"></td>
                                        <td class="gray-td" rowspan="2"><input type="text" name="putter_sum2"></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01">상세</button></td>

                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Score</td>
                                        <td><input type="text" name="score10" value="${scoreVo.score10-parInfo2.hole1}"></td>
                                        <td><input type="text" name="score11" value="${scoreVo.score11-parInfo2.hole2}"></td>
                                        <td><input type="text" name="score12" value="${scoreVo.score12-parInfo2.hole3}"></td>
                                        <td><input type="text" name="score13" value="${scoreVo.score13-parInfo2.hole4}"></td>
                                        <td><input type="text" name="score14" value="${scoreVo.score14-parInfo2.hole5}"></td>
                                        <td><input type="text" name="score15" value="${scoreVo.score15-parInfo2.hole6}"></td>
                                        <td><input type="text" name="score16" value="${scoreVo.score16-parInfo2.hole7}"></td>
                                        <td><input type="text" name="score17" value="${scoreVo.score17-parInfo2.hole8}"></td>
                                        <td><input type="text" name="score18" value="${scoreVo.score18-parInfo2.hole9}"></td>
                                        <td class="gray-td"><input type="text" name="score_sum2" value="${scoreVo.score10+scoreVo.score11+scoreVo.score12+scoreVo.score13+scoreVo.score14+scoreVo.score15+scoreVo.score16+scoreo.score17+scoreVo.score18 - (parInfo2.hole1+parInfo2.hole2+parInfo2.hole3+parInfo2.hole4+parInfo2.hole5+parInfo2.hole6+parInfo2.hole7+parInfo2.hole8+parInfo2.hole9)}"></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Fairway안착</td>
                                        <td><input type="checkbox" name="fairwayon10" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon11" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon12" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon13" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon14" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon15" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon16" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon17" value="Y"></td>
                                        <td><input type="checkbox" name="fairwayon18" value="Y"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Green적중</td>
                                        <td><input type="checkbox" name="greenon10" value="Y"></td>
                                        <td><input type="checkbox" name="greenon11" value="Y"></td>
                                        <td><input type="checkbox" name="greenon12" value="Y"></td>
                                        <td><input type="checkbox" name="greenon13" value="Y"></td>
                                        <td><input type="checkbox" name="greenon14" value="Y"></td>
                                        <td><input type="checkbox" name="greenon15" value="Y"></td>
                                        <td><input type="checkbox" name="greenon16" value="Y"></td>
                                        <td><input type="checkbox" name="greenon17" value="Y"></td>
                                        <td><input type="checkbox" name="greenon18" value="Y"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Sand Save</td>
                                        <td><input type="checkbox" name="sendsavechk10" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk11" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk12" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk13" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk14" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk15" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk16" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk17" value="Y"></td>
                                        <td><input type="checkbox" name="sendsavechk18" value="Y"></td>
                                        <td class="gray-td" rowspan="2"> </td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="sendsave10" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave11" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave12" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave13" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave14" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave15" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave16" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave17" value="Y"></td>
                                        <td><input type="checkbox" name="sendsave18" value="Y"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td">Par Break</td>
                                        <td><input type="checkbox" name="parbreak10" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak11" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak12" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak13" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak14" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak15" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak16" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak17" value="Y"></td>
                                        <td><input type="checkbox" name="parbreak18" value="Y"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                </table>
                            </div>
                            <button id="btnAdd" class="form-btn" onclick="#">등록하기</button>
                        </div>

                    </div>

                </div>
            </div>
        </article>
    </section>
	</form>



    <!--    stroke -->

    <div class="modal fade" id="stroke_01" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document" style="width: 700px;">
            <div class="modal-content" style="overflow-x:auto;">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">Stroke</h4>

                </div>
                <div class="sc-modal">
                    <!-- 모달 내용 -->
                    <form>
                        <div class="mo-st-01">
                            <table class="text-center">
                                <tbody>
                                    <colgroup>
                                        <col width="13%">
                                        <col width="28%">
                                        <col width="28%">
                                        <col width="28%">
                                    </colgroup>
                                    <tr class="text-bolder">
                                        <td>Stroke</td>
                                        <td>Club</td>
                                        <td>Shot</td>
                                        <td>구질</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td><input type="text"></td>
                                        <td><input type="text"></td>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td><input type="text"></td>
                                        <td><input type="text"></td>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td><input type="text"></td>
                                        <td><input type="text"></td>
                                        <td><input type="text"></td>
                                    </tr>


                                </tbody>

                            </table>
                        </div>
                        <div class="mo-st-02">
                            <table>
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <td>Shot거리</td>
                                    <td><input type="text"></td>
                                    <td><button>입력</button></td>
                                </tr>
                            </table>
                        </div>
                        <div class="mo-st-03">
                            <table>
                                <tr>
                                    <th>Hook</th>
                                    <th>Fade</th>
                                    <th>Straight</th>
                                    <th>Draw</th>
                                    <th>Slice</th>
                                </tr>
                                <tr>
                                    <td><img src="../image/direction-1.png" width="100%"></td>
                                    <td><img src="../image/direction-2.png" width="100%"></td>
                                    <td><img src="../image/direction-3.png" width="100%"></td>
                                    <td><img src="../image/direction-4.png" width="100%"></td>
                                    <td><img src="../image/direction-5.png" width="100%"></td>
                                </tr>
                                <tr>
                                    <td>1W</td>
                                    <td>6W</td>
                                    <td>1i</td>
                                    <td>6i</td>
                                    <td>PW</td>
                                </tr>
                                <tr>
                                    <td>2W</td>
                                    <td>7W</td>
                                    <td>2i</td>
                                    <td>7i</td>
                                    <td>GW</td>
                                </tr>
                                <tr>
                                    <td>3W</td>
                                    <td>9W</td>
                                    <td>3i</td>
                                    <td>9i</td>
                                    <td>SW</td>
                                </tr>
                                <tr>
                                    <td>4W</td>
                                    <td>11W</td>
                                    <td>4i</td>
                                    <td>11i</td>
                                    <td>LW</td>
                                </tr>
                                <tr>
                                    <td>5W</td>
                                    <td> </td>
                                    <td>5i</td>
                                    <td> </td>
                                    <td>Putter</td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">

                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn">저장</button>

                        </div>

                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	

    <!--    putts -->
    <div class="modal fade" id="putts_01" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document" style="width: 700px;">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">Putts</h4>
                </div>
                <div class="modal-move">
                    <!-- 모달 내용 -->
                    <form>
                       <input type="hidden" id="putter_id">
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="1" />
                            <img src="../image/jl_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01"  value="2" />
                            <img src="../image/jr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01"  value="3" />
                            <img src="../image/ol_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01"  value="4" />
                            <img src="../image/or_on.gif" width="100%">
                        </div>

                        <div class="modal-pt">
                            <input type="radio" name="putts01" value="5" />
                            <img src="../image/os_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01"  value="6" />
                            <img src="../image/sl_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01"  value="7" />
                            <img src="../image/sr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" value="8" />
                            <img src="../image/ss_on.gif" width="100%">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">

                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="btnSelect" class="modal-btn">선택</button>
                        </div>

                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="btnCancel" class="modal-btn btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .window h4 {
            color: #fff;
            display: inline-block;
            vertical-align: middle;
            margin: 15px 0 15px 15px;
            line-height: 23px;
        }

        .mask-te {
            margin: 40% 5% 0 5%;
        }

        .mask-te img {
            width: 100px;
        }

        .mask-te a {
            margin-top: 20px;
            background: #e03535;
            color: #fff;
            display: block;
            text-align: center;
            font-size: 17px;
            font-weight: 300;
            padding: 17px;
        }

        .modal-pop {
            background: none;
        }

        .mo-pop-x {
            border: none;
            background: none;
            font-weight: 300;
            text-decoration: underline;
            margin: 10px auto;
            display: block;
            text-align: center;
            color: #fff;
        }

    </style>







    <!--    모바일웹으로 접속 시  -->

    <div class="modal fade" id="mobile_web" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-pop">
                <!-- 모달 이름 -->
                <div class="window">
                    <div class="mask-te">
                        <img src="../image/mo-pop.png" width="100%;" style="display: inline-block;">
                        <h4>“유명 티칭 프로에게<br/>1:1 온라인 강의도 듣고,<br/>내 스코어 분석까지!”</h4>

                        <a href="#">스윙세이버 앱 다운받기</a>
                    </div>

                </div>
                <button type="button" class="mo-pop-x" data-dismiss="modal">괜찮습니다. 모바일웹으로 볼게요.</button>


            </div>
        </div>
    </div>

<script>

$(document).ready(function(){
	
	// 처음 로딩시 sendsave1~18까지 disable
	$("input[name='sendsave1']").attr( 'disabled', true );
	$("input[name=sendsave2]").attr( 'disabled', true );
	$("input[name=sendsave3]").attr( 'disabled', true );
	$("input[name=sendsave4]").attr( 'disabled', true );
	$("input[name=sendsave5]").attr( 'disabled', true );
	$("input[name=sendsave6]").attr( 'disabled', true );
	$("input[name=sendsave7]").attr( 'disabled', true );
	$("input[name=sendsave8]").attr( 'disabled', true );
	$("input[name=sendsave9]").attr( 'disabled', true );
	$("input[name=sendsave10]").attr( 'disabled', true );
	$("input[name=sendsave11]").attr( 'disabled', true );
	$("input[name=sendsave12]").attr( 'disabled', true );
	$("input[name=sendsave13]").attr( 'disabled', true );
	$("input[name=sendsave14]").attr( 'disabled', true );
	$("input[name=sendsave15]").attr( 'disabled', true );
	$("input[name=sendsave16]").attr( 'disabled', true );
	$("input[name=sendsave17]").attr( 'disabled', true );
	$("input[name=sendsave18]").attr( 'disabled', true );
	
	
    $("input[name=sendsavechk1]").click(function(){    	
    	if ($("input:checkbox[name='sendsavechk1']").is(":checked") == true)
    		$("input[name=sendsave1]").removeAttr('disabled');
    	else  {
    		$("input[name=sendsave1]").attr( 'disabled', true );
    		$("input[name=sendsave1]").attr( 'checked',  false );
    	}
    });
    $("input[name=sendsavechk2]").click(function(){
    	if ($("input:checkbox[name='sendsavechk2']").is(":checked") == true)
    		$("input[name=sendsave2]").attr( 'disabled', false );
    	else  {
    		$("input[name=sendsave2]").attr( 'disabled', true );
    		$("input[name=sendsave2]").attr( 'checked',  false );	
    	}
    });    
    $("input[name=sendsavechk3]").click(function(){
    	if ($("input:checkbox[name='sendsavechk3']").is(":checked") == true)
    		$("input[name=sendsave3]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave3]").attr( 'disabled', true );
    		$("input[name=sendsave3]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk4]").click(function(){
    	if ($("input:checkbox[name='sendsavechk4']").is(":checked") == true)
    		$("input[name=sendsave4]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave4]").attr( 'disabled', true );
    		$("input[name=sendsave4]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk5]").click(function(){
    	if ($("input:checkbox[name='sendsavechk5']").is(":checked") == true)
    		$("input[name=sendsave5]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave5]").attr( 'disabled', true );
    		$("input[name=sendsave5]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk6]").click(function(){
    	if ($("input:checkbox[name='sendsavechk6']").is(":checked") == true)
    		$("input[name=sendsave6]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave6]").attr( 'disabled', true );
    		$("input[name=sendsave6]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk7]").click(function(){
    	if ($("input:checkbox[name='sendsavechk7']").is(":checked") == true)
    		$("input[name=sendsave7]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave7]").attr( 'disabled', true );
    		$("input[name=sendsave7]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk8]").click(function(){
    	if ($("input:checkbox[name='sendsavechk8']").is(":checked") == true)
    		$("input[name=sendsave8]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave8]").attr( 'disabled', true );
    		$("input[name=sendsave8]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk9]").click(function(){
    	if ($("input:checkbox[name='sendsavechk9']").is(":checked") == true)
    		$("input[name=sendsave9]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave9]").attr( 'disabled', true );
    		$("input[name=sendsave9]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk10]").click(function(){
    	if ($("input:checkbox[name='sendsavechk10']").is(":checked") == true)
    		$("input[name=sendsave10]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave10]").attr( 'disabled', true );
    		$("input[name=sendsave10]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk11]").click(function(){
    	if ($("input:checkbox[name='sendsavechk11']").is(":checked") == true)
    		$("input[name=sendsave11]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave11]").attr( 'disabled', true );
    		$("input[name=sendsave11]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk12]").click(function(){
    	if ($("input:checkbox[name='sendsavechk12']").is(":checked") == true)
    		$("input[name=sendsave12]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave12]").attr( 'disabled', true );
    		$("input[name=sendsave12]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk13]").click(function(){
    	if ($("input:checkbox[name='sendsavechk13']").is(":checked") == true)
    		$("input[name=sendsave13]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave13]").attr( 'disabled', true );
    		$("input[name=sendsave13]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk14]").click(function(){
    	if ($("input:checkbox[name='sendsavechk14']").is(":checked") == true)
    		$("input[name=sendsave14]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave14]").attr( 'disabled', true );
    		$("input[name=sendsave14]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk15]").click(function(){
    	if ($("input:checkbox[name='sendsavechk15']").is(":checked") == true)
    		$("input[name=sendsave15]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave15]").attr( 'disabled', true );
    		$("input[name=sendsave15]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk16]").click(function(){
    	if ($("input:checkbox[name='sendsavechk16']").is(":checked") == true)
    		$("input[name=sendsave16]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave16]").attr( 'disabled', true );
    		$("input[name=sendsave16]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk17]").click(function(){
    	if ($("input:checkbox[name='sendsavechk17']").is(":checked") == true)
    		$("input[name=sendsave17]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave17]").attr( 'disabled', true );
    		$("input[name=sendsave17]").attr( 'checked',  false );	
    	}
    });
    $("input[name=sendsavechk18]").click(function(){
    	if ($("input:checkbox[name='sendsavechk18']").is(":checked") == true)
    		$("input[name=sendsave18]").attr( 'disabled', false );
    	else {
    		$("input[name=sendsave18]").attr( 'disabled', true );
    		$("input[name=sendsave18]").attr( 'checked',  false );	
    	}
    });
    
    $("#btnAdd").click(function(){
    	fn_save();
    });

    $('#putts_01').on('show.bs.modal', function (event) {
    	  var button = $(event.relatedTarget) // Button that triggered the modal
    	  var recipient = button.data('whatever') // Extract info from data-* attributes
    	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    	  
    	  console.log(recipient);
    	  $("#putter_id").val(recipient);
    	  
    	  //var modal = $(this)
    	  //modal.find('.modal-title').text('New message to ' + recipient)
    	  //modal.find('.modal-body input').val(recipient)
    });
    	
    
    // Putter Pattern 화면에서의 선택
    $("#btnSelect").click(function(){
    	if($("#putter_id").val() == "putter1")
    		$("input[name='putter1']").val($("input:radio[name='putts01']").val());
    	if($("#putter_id").val() == "putter2")
    		$("input[name='putter2']").val($("input:radio[name='putts01']").val());  
    	

    	$("#putts_01").attr('aria-hidden', 'true').hide();
    });
    
    $("#btnCancel").click(function(){
    	//$("#putts_01").hide();
    	$("#putts_01").attr('aria-hidden', 'true').hide();
    });
    
    $("#golfTitle").text($("#countryclub_id option:checked").text());
    
    //alert($("#countryclub_id option:checked").text());
});

// 입력 정보를 저장한다.
function fn_save()
{
	if (confirm("입력된 정보를 저장하시겠습니까?"))
	{
		forms1.action = "/score/scoreSave";
		forms1.submit();
	}
}
</script>

<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

</body>
</html>
