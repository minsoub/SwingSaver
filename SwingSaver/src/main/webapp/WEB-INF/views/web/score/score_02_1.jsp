<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>

	<form class="form-signin" id='forms1' name="forms1" method="POST">
	<input type="hidden" name="puterpattern1"  id="puterpattern1" value="${scoreInfo.puterpattern1}">
    <input type="hidden" name="puterpattern2"  id="puterpattern2" value="${scoreInfo.puterpattern2}">
    <input type="hidden" name="puterpattern3"  id="puterpattern3" value="${scoreInfo.puterpattern3}">
    <input type="hidden" name="puterpattern4"  id="puterpattern4" value="${scoreInfo.puterpattern4}">
    <input type="hidden" name="puterpattern5"  id="puterpattern5" value="${scoreInfo.puterpattern5}">
    <input type="hidden" name="puterpattern6"  id="puterpattern6" value="${scoreInfo.puterpattern6}">
    <input type="hidden" name="puterpattern7"  id="puterpattern7" value="${scoreInfo.puterpattern7}">
    <input type="hidden" name="puterpattern8"  id="puterpattern8" value="${scoreInfo.puterpattern8}">
    <input type="hidden" name="puterpattern9"  id="puterpattern9" value="${scoreInfo.puterpattern9}">
	<input type="hidden" name="puterpattern10" id="puterpattern10" value="${scoreInfo.puterpattern10}">
    <input type="hidden" name="puterpattern11" id="puterpattern11" value="${scoreInfo.puterpattern11}">
    <input type="hidden" name="puterpattern12" id="puterpattern12" value="${scoreInfo.puterpattern12}">
    <input type="hidden" name="puterpattern13" id="puterpattern13" value="${scoreInfo.puterpattern13}">
    <input type="hidden" name="puterpattern14" id="puterpattern14" value="${scoreInfo.puterpattern14}">
    <input type="hidden" name="puterpattern15" id="puterpattern15" value="${scoreInfo.puterpattern15}">
    <input type="hidden" name="puterpattern16" id="puterpattern16" value="${scoreInfo.puterpattern16}">
    <input type="hidden" name="puterpattern17" id="puterpattern17" value="${scoreInfo.puterpattern17}">
    <input type="hidden" name="puterpattern18" id="puterpattern18" value="${scoreInfo.puterpattern18}">
    
            
    <input type="hidden" name="stdate" id="stdate" value="${stdate}">
	<input type="hidden" name="etdate" id="etdate" value="${etdate}">
	<input type="hidden" name="country_id" id="country_id" value="${country_id}">
	<input type="hidden" name="zone_id" id="zone_id" value="${zone_id}">
	<input type="hidden" name="countryclub_id" id="countryclub_id" value="${countryclub_id}">
	
	<input type="hidden" name="search_seq_no" id="search_seq_no" value="${search_seq_no}">
	<input type="hidden" name="search_countryclub_id" id="search_countryclub_id" value="${search_countryclub_id}">
	<input type="hidden" name="search_visit_date" id="search_visit_date" value="${search_visit_date}">

    <section class="container no-padding">
        <article class="col-xs-12" style="padding: 0;">
			<%@include file="/WEB-INF/views/web/inc/mypage_left_menu.jsp"%>
			
            <div class="content col-xs-9" style="padding: 0;">
                <div class="col-xs-12 no-padding">
                    <h2 class="right-tit">스코어 수정</h2>

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
                                    <td>
                                        <input type="date" id="visit_date" name="visit_date" value="${visit_date}">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">
                                        <p>골프장</p>
                                    </td>

                                    <td>
                                        <div class="coun_td">
                                			<select name="country_id" id="country_id" onchange="javascript:changeCountry(this.value);">    
                                    			<option value="">국가를 선택해주세요.</option>                            
                                				<c:forEach var="ctryInfo" items="${countryList}" varStatus="status">
                                    				<option value="${ctryInfo.code}" <c:if test="${ctryInfo.code == scoreInfo.country_id}">selected</c:if>>${ctryInfo.codename}(${ctryInfo.code})</option>
                                 				</c:forEach>
                                 			</select> 
                                        </div>
                                        <select name="zone_id" id="zone_id"  onchange="javascript:changeZone(this.value);">    
                                    		<option value="">지역 선택</option>                            
                                			<c:forEach var="areInfo" items="${areaList}" varStatus="status">
                                    			<option  <c:if test="${scoreInfo.zone_id == areInfo.zone_id}">selected</c:if>  value="${areInfo.zone_id}">${areInfo.zone_nm}(${areInfo.zone_id})</option>
                                 			</c:forEach>                                 		
                                        </select>
                                        <select name="countryclub_id" id="countryclub_id" onchange="javascript:changeCountryClub(this.value);">
                                    		<option value="">골프장 선택</option>                            
                                			<c:forEach var="golfInfo" items="${golfList}" varStatus="status">
                                    			<option  <c:if test="${scoreInfo.countryclub_id == golfInfo.countryclub_id}">selected</c:if>  value="${golfInfo.countryclub_id}">${golfInfo.countryclub_nm}(${golfInfo.countryclub_id})</option>
                                 			</c:forEach>  
                                        </select>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="font-weight-bold"><p>코스</p></td>
                                    <td class="course_td">
                                                                      출발&ensp;
                                            <select name="start_course" id="start_course">
                                			<c:forEach var="parInfo" items="${parList}" varStatus="status">
                                    			<option  <c:if test="${scoreInfo.startcourse == parInfo.course}">selected</c:if>  value="${parInfo.course}">${parInfo1.course_nm}(${parInfo.course})</option>
                                 			</c:forEach> 
                                        </select>
                                            &emsp;도착&ensp;
                                            <select name="end_course" id="end_course">
                                            <option value="">IN</option>
                                			<c:forEach var="parInfo" items="${parList}" varStatus="status">
                                    			<option  <c:if test="${scoreInfo.endcourse == parInfo.course}">selected</c:if>  value="${parInfo.course}">${parInfo.course_nm}(${parInfo.course})</option>
                                 			</c:forEach> 
                                        </select>
                                    </td>

                                </tr>
                            </table>

                        </div>

                        <div class="sc-cont">
                            <h4>골프장이름</h4>

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
                                        <td><input type="number" id="stroke1" name="stroke1" value="${scoreInfo.stroke1}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke2" name="stroke2" value="${scoreInfo.stroke2}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke3" name="stroke3" value="${scoreInfo.stroke3}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke4" name="stroke4" value="${scoreInfo.stroke4}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke5" name="stroke5" value="${scoreInfo.stroke5}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke6" name="stroke6" value="${scoreInfo.stroke6}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke7" name="stroke7" value="${scoreInfo.stroke7}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke8" name="stroke8" value="${scoreInfo.stroke8}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td><input type="number" id="stroke9" name="stroke9" value="${scoreInfo.stroke9}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk1(this)"></td>
                                        <td class="gray-td"><input type="text" readonly id="strokesum1" name="strokesum1" value="${scoreInfo.strokesum1}"></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td><input type="number" id="putter1" name="putter1" value="${scoreInfo.stroke1}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter2" name="putter2" value="${scoreInfo.stroke2}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter3" name="putter3" value="${scoreInfo.stroke3}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter4" name="putter4" value="${scoreInfo.stroke4}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter5" name="putter5" value="${scoreInfo.stroke5}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter6" name="putter6" value="${scoreInfo.stroke6}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter7" name="putter7" value="${scoreInfo.stroke7}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter8" name="putter8" value="${scoreInfo.stroke8}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td><input type="number" id="putter9" name="putter9" value="${scoreInfo.stroke9}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk1()"></td>
                                        <td class="gray-td" rowspan="2"><input type="text" value="${scoreInfo.puttersum1}" readonly id="puttersum1" name="puttersum1"></td>
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
                                        <td><input type="text" id="score1" name="score1" readonly value="${scoreInfo.score1}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score2" name="score2" readonly value="${scoreInfo.score2}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score3" name="score3" readonly value="${scoreInfo.score3}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score4" name="score4" readonly value="${scoreInfo.score4}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score5" name="score5" readonly value="${scoreInfo.score5}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score6" name="score6" readonly value="${scoreInfo.score6}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score7" name="score7" readonly value="${scoreInfo.score7}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score8" name="score8" readonly value="${scoreInfo.score8}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score9" name="score9" readonly value="${scoreInfo.score9}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td class="gray-td"><input type="text" id="scoresum1" name="scoresum1" readonly value="${scoreInfo.scoresum1}"></td>
                                    </tr>
                                     <tr>
                                        <td class="gray-td fir-td">Fairway안착</td>
                                        <td><input type="checkbox" name="fairwayon1" value="Y" <c:if test="${scoreInfo.fairwayon1 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon2" value="Y" <c:if test="${scoreInfo.fairwayon2 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon3" value="Y" <c:if test="${scoreInfo.fairwayon3 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon4" value="Y" <c:if test="${scoreInfo.fairwayon4 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon5" value="Y" <c:if test="${scoreInfo.fairwayon5 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon6" value="Y" <c:if test="${scoreInfo.fairwayon6 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon7" value="Y" <c:if test="${scoreInfo.fairwayon7 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon8" value="Y" <c:if test="${scoreInfo.fairwayon8 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon9" value="Y" <c:if test="${scoreInfo.fairwayon9 == 'Y'}">checked</c:if>></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Green적중</td>
                                        <td><input type="checkbox" name="greenon1" value="Y" <c:if test="${scoreInfo.greenon1 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon2" value="Y" <c:if test="${scoreInfo.greenon2 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon3" value="Y" <c:if test="${scoreInfo.greenon3 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon4" value="Y" <c:if test="${scoreInfo.greenon4 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon5" value="Y" <c:if test="${scoreInfo.greenon5 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon6" value="Y" <c:if test="${scoreInfo.greenon6 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon7" value="Y" <c:if test="${scoreInfo.greenon7 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon8" value="Y" <c:if test="${scoreInfo.greenon8 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon9" value="Y" <c:if test="${scoreInfo.greenon9 == 'Y'}">checked</c:if>></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Sand Save</td>
                                        <td><input type="checkbox" name="sendsavechk1" value="Y" <c:if test="${scoreInfo.sendsave1 =='Y' or scoreInfo.sendsave1 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk2" value="Y" <c:if test="${scoreInfo.sendsave2 =='Y' or scoreInfo.sendsave2 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk3" value="Y" <c:if test="${scoreInfo.sendsave3 =='Y' or scoreInfo.sendsave3 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk4" value="Y" <c:if test="${scoreInfo.sendsave4 =='Y' or scoreInfo.sendsave4 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk5" value="Y" <c:if test="${scoreInfo.sendsave5 =='Y' or scoreInfo.sendsave5 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk6" value="Y" <c:if test="${scoreInfo.sendsave6 =='Y' or scoreInfo.sendsave6 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk7" value="Y" <c:if test="${scoreInfo.sendsave7 =='Y' or scoreInfo.sendsave7 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk8" value="Y" <c:if test="${scoreInfo.sendsave8 =='Y' or scoreInfo.sendsave8 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk9" value="Y" <c:if test="${scoreInfo.sendsave9 =='Y' or scoreInfo.sendsave9 == 'N'}">checked</c:if>></td>
                                        <td class="gray-td" rowspan="2"> </td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="sendsave1" value="Y" <c:if test="${scoreInfo.sendsave1 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave2" value="Y" <c:if test="${scoreInfo.sendsave2 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave3" value="Y" <c:if test="${scoreInfo.sendsave3 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave4" value="Y" <c:if test="${scoreInfo.sendsave4 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave5" value="Y" <c:if test="${scoreInfo.sendsave5 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave6" value="Y" <c:if test="${scoreInfo.sendsave6 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave7" value="Y" <c:if test="${scoreInfo.sendsave7 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave8" value="Y" <c:if test="${scoreInfo.sendsave8 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave9" value="Y" <c:if test="${scoreInfo.sendsave9 == 'Y'}">checked</c:if>></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td">Par Break</td>
                                        <td><input type="checkbox" name="parbreak1" value="Y" <c:if test="${scoreInfo.parbreak1 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak2" value="Y" <c:if test="${scoreInfo.parbreak2 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak3" value="Y" <c:if test="${scoreInfo.parbreak3 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak4" value="Y" <c:if test="${scoreInfo.parbreak4 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak5" value="Y" <c:if test="${scoreInfo.parbreak5 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak6" value="Y" <c:if test="${scoreInfo.parbreak6 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak7" value="Y" <c:if test="${scoreInfo.parbreak7 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak8" value="Y" <c:if test="${scoreInfo.parbreak8 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak9" value="Y" <c:if test="${scoreInfo.parbreak9 == 'Y'}">checked</c:if>></td>
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
                                        <td class="green-td">${parInfo2.hole1}</td>
                                        <td class="green-td">${parInfo2.hole2}</td>
                                        <td class="green-td">${parInfo2.hole3}</td>
                                        <td class="green-td">${parInfo2.hole4}</td>
                                        <td class="green-td">${parInfo2.hole5}</td>
                                        <td class="green-td">${parInfo2.hole6}</td>
                                        <td class="green-td">${parInfo2.hole7}</td>
                                        <td class="green-td">${parInfo2.hole8}</td>
                                        <td class="green-td">${parInfo2.hole9}</td>
                                        <td class="green-td">${parInfo2.sum}</td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Stroke</td>
                                        <td><input type="number" id="stroke10" name="stroke10" value="${scoreInfo.stroke10}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke11" name="stroke11" value="${scoreInfo.stroke11}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke12" name="stroke12" value="${scoreInfo.stroke12}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke13" name="stroke13" value="${scoreInfo.stroke13}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke14" name="stroke14" value="${scoreInfo.stroke14}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke15" name="stroke15" value="${scoreInfo.stroke15}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke16" name="stroke16" value="${scoreInfo.stroke16}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke17" name="stroke17" value="${scoreInfo.stroke17}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td><input type="number" id="stroke18" name="stroke18" value="${scoreInfo.stroke18}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="strokeChk2(this)"></td>
                                        <td class="gray-td"><input type="text" id="strokesum2" name="strokesum2" readonly value="${scoreInfo.strokesum2}"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td><input type="number" id="putter10" name="putter10" value="${scoreInfo.putter10}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter11" name="putter11" value="${scoreInfo.putter11}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter12" name="putter12" value="${scoreInfo.putter12}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter13" name="putter13" value="${scoreInfo.putter13}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter14" name="putter14" value="${scoreInfo.putter14}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter15" name="putter15" value="${scoreInfo.putter15}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter16" name="putter16" value="${scoreInfo.putter16}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter17" name="putter17" value="${scoreInfo.putter17}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td><input type="number" id="putter18" name="putter18" value="${scoreInfo.putter18}" maxlength="2" oninput="maxLengthCheck(this)" onkeyup="putterChk2()"></td>
                                        <td class="gray-td" rowspan="2"><input type="text" value="${scoreInfo.puttersum2}" readonly id="puttersum2" name="puttersum2"></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter10">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter11">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter12">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter13">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter14">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter15">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter16">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter17">상세</button></td>
                                        <td><button type="button" class="sc-view" data-toggle="modal" data-target="#putts_01" data-whatever="putter18">상세</button></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Score</td>
                                        <td><input type="text" id="score10" name="score10" readonly value="${scoreInfo.score10}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score11" name="score11" readonly value="${scoreInfo.score11}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score12" name="score12" readonly value="${scoreInfo.score12}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score13" name="score13" readonly value="${scoreInfo.score13}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score14" name="score14" readonly value="${scoreInfo.score14}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score15" name="score15" readonly value="${scoreInfo.score15}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score16" name="score16" readonly value="${scoreInfo.score16}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score17" name="score17" readonly value="${scoreInfo.score17}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td><input type="text" id="score18" name="score18" readonly value="${scoreInfo.score18}"  maxlength="3" oninput="maxLengthCheck(this)"></td>
                                        <td class="gray-td"><input type="text" id="scoresum2" name="scoresum2" readonly value="${scoreInfo.scoresum2}"></td>
                                    </tr>
                                   <tr>
                                        <td class="gray-td fir-td">Fairway안착</td>
                                        <td><input type="checkbox" name="fairwayon10" value="Y" <c:if test="${scoreInfo.fairwayon10 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon11" value="Y" <c:if test="${scoreInfo.fairwayon11 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon12" value="Y" <c:if test="${scoreInfo.fairwayon12 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon13" value="Y" <c:if test="${scoreInfo.fairwayon13 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon14" value="Y" <c:if test="${scoreInfo.fairwayon14 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon15" value="Y" <c:if test="${scoreInfo.fairwayon15 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon16" value="Y" <c:if test="${scoreInfo.fairwayon16 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon17" value="Y" <c:if test="${scoreInfo.fairwayon17 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="fairwayon18" value="Y" <c:if test="${scoreInfo.fairwayon18 == 'Y'}">checked</c:if>></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Green적중</td>
                                        <td><input type="checkbox" name="greenon10" value="Y" <c:if test="${scoreInfo.greenon10 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon11" value="Y" <c:if test="${scoreInfo.greenon11 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon12" value="Y" <c:if test="${scoreInfo.greenon12 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon13" value="Y" <c:if test="${scoreInfo.greenon13 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon14" value="Y" <c:if test="${scoreInfo.greenon14 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon15" value="Y" <c:if test="${scoreInfo.greenon15 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon16" value="Y" <c:if test="${scoreInfo.greenon16 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon17" value="Y" <c:if test="${scoreInfo.greenon17 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="greenon18" value="Y" <c:if test="${scoreInfo.greenon18 == 'Y'}">checked</c:if>></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Sand Save</td>
                                        <td><input type="checkbox" name="sendsavechk10" value="Y" <c:if test="${scoreInfo.sendsave10 =='Y' or scoreInfo.sendsave10 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk11" value="Y" <c:if test="${scoreInfo.sendsave11 =='Y' or scoreInfo.sendsave11 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk12" value="Y" <c:if test="${scoreInfo.sendsave12 =='Y' or scoreInfo.sendsave12 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk13" value="Y" <c:if test="${scoreInfo.sendsave13 =='Y' or scoreInfo.sendsave13 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk14" value="Y" <c:if test="${scoreInfo.sendsave14 =='Y' or scoreInfo.sendsave14 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk15" value="Y" <c:if test="${scoreInfo.sendsave15 =='Y' or scoreInfo.sendsave15 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk16" value="Y" <c:if test="${scoreInfo.sendsave16 =='Y' or scoreInfo.sendsave16 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk17" value="Y" <c:if test="${scoreInfo.sendsave17 =='Y' or scoreInfo.sendsave17 == 'N'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsavechk18" value="Y" <c:if test="${scoreInfo.sendsave18 =='Y' or scoreInfo.sendsave18 == 'N'}">checked</c:if>></td>
                                        <td class="gray-td" rowspan="2"> </td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="sendsave10" value="Y" <c:if test="${scoreInfo.sendsave10 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave11" value="Y" <c:if test="${scoreInfo.sendsave11 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave12" value="Y" <c:if test="${scoreInfo.sendsave12 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave13" value="Y" <c:if test="${scoreInfo.sendsave13 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave14" value="Y" <c:if test="${scoreInfo.sendsave14 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave15" value="Y" <c:if test="${scoreInfo.sendsave15 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave16" value="Y" <c:if test="${scoreInfo.sendsave16 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave17" value="Y" <c:if test="${scoreInfo.sendsave17 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="sendsave18" value="Y" <c:if test="${scoreInfo.sendsave18 == 'Y'}">checked</c:if>></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Par Break</td>
                                        <td><input type="checkbox" name="parbreak10" value="Y" <c:if test="${scoreInfo.parbreak10 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak11" value="Y" <c:if test="${scoreInfo.parbreak11 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak12" value="Y" <c:if test="${scoreInfo.parbreak12 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak13" value="Y" <c:if test="${scoreInfo.parbreak13 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak14" value="Y" <c:if test="${scoreInfo.parbreak14 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak15" value="Y" <c:if test="${scoreInfo.parbreak15 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak16" value="Y" <c:if test="${scoreInfo.parbreak16 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak17" value="Y" <c:if test="${scoreInfo.parbreak17 == 'Y'}">checked</c:if>></td>
                                        <td><input type="checkbox" name="parbreak18" value="Y" <c:if test="${scoreInfo.parbreak18 == 'Y'}">checked</c:if>></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                </table>
                            </div>
                            <button class="form-btn" onclick="#">수정하기</button>
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
                            <input type="radio" name="putts01" value="1" />
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
        	if($("#putter_id").val() == "putter1" && $("input[name='puterpattern1']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern1']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter2" && $("input[name='puterpattern2']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern2']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter3" && $("input[name='puterpattern3']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern3']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter4" && $("input[name='puterpattern4']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern4']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter5" && $("input[name='puterpattern5']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern5']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter6" && $("input[name='puterpattern6']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern6']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter7" && $("input[name='puterpattern7']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern7']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter8" && $("input[name='puterpattern8']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern8']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter9" && $("input[name='puterpattern9']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern9']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter10" && $("input[name='puterpattern10']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern10']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter11" && $("input[name='puterpattern11']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern11']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter12" && $("input[name='puterpattern12']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern12']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter13" && $("input[name='puterpattern13']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern13']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter14" && $("input[name='puterpattern14']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern14']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter15" && $("input[name='puterpattern15']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern15']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter16" && $("input[name='puterpattern16']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern16']").val()+"]").attr("checked", true);
        	if($("#putter_id").val() == "putter17" && $("input[name='puterpattern17']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern17']").val()+"]").attr("checked", true);    	
        	if($("#putter_id").val() == "putter18" && $("input[name='puterpattern18']").val() != "")
        		$("input:radio[name='putts01']:input[value="+$("input[name='puterpattern18']").val()+"]").attr("checked", true);      	  
    });
    	
    
    // Putter Pattern 화면에서의 선택
    $("#btnSelect").click(function(){
    	if($("#putter_id").val() == "putter1")
    		$("input[name='puterpattern1']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter2")
    		$("input[name='puterpattern2']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter3")
    		$("input[name='puterpattern3']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter4")
    		$("input[name='puterpattern4']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter5")
    		$("input[name='puterpattern5']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter6")
    		$("input[name='puterpattern6']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter7")
    		$("input[name='puterpattern7']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter8")
    		$("input[name='puterpattern8']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter9")
    		$("input[name='puterpattern9']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter10")
    		$("input[name='puterpattern10']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter11")
    		$("input[name='puterpattern11']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter12")
    		$("input[name='puterpattern12']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter13")
    		$("input[name='puterpattern13']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter14")
    		$("input[name='puterpattern14']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter15")
    		$("input[name='puterpattern15']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter16")
    		$("input[name='puterpattern16']").val($("input:radio[name='putts01']:checked").val());
    	if($("#putter_id").val() == "putter17")
    		$("input[name='puterpattern17']").val($("input:radio[name='putts01']:checked").val());    	
    	if($("#putter_id").val() == "putter18")
    		$("input[name='puterpattern18']").val($("input:radio[name='putts01']:checked").val());        	
 		// 팝업창 숨김
    	$("#putts_01").attr('aria-hidden', 'true').hide();
    });
    
    $("#btnCancel").click(function(){
    	//$("#putts_01").hide();
    	$("#putts_01").attr('aria-hidden', 'true').hide();
    });
    
    $("#golfTitle").text($("#countryclub_id option:checked").text());
    
    //alert($("#countryclub_id option:checked").text());
});


// 국가 코드를 선택했을 대 호출되는 메소드로 지역 정보를 콤보박스로 구성한다.
function changeCountry(data)
{
	// zone_id clear
	$("#zone_id").empty();
	if (data == "") return;
	// 다시 조회
	var url = "/admin/area/areaList/"+data;
	var method = "GET";
	var data = "";
	
    $.ajax({
        type: method,
        url : url,
        data: data,
        dataType:"json",
        async:true,
        contentType:"application/json;charset=UTF-8",
        success : function(rtnData) {
        	console.dir(rtnData);
            var reqdata = JSON.parse(rtnData.data);
            $('#zone_id').append($('<option>').text("지역을 선택해주세요."));
            $.each(reqdata.areaList, function(i, obj){
                    $('#zone_id').append($('<option>').text(obj.zone_nm).attr('value', obj.zone_id));
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
        }
    });		
}
// 지역 선택 했을 때 호출되는 메소드로 골프장 정보를 출력한다.
function changeZone(data)
{
	// countryclub_id clear
	$("#countryclub_id").empty();
	if (data == "") return;
	// 다시 조회
	var url = "/score/golfList/"+$("#country_id").val()+"/"+data;
	var method = "GET";
	var data = "";
	
    $.ajax({
        type: method,
        url : url,
        data: data,
        dataType:"json",
        async:true,
        contentType:"application/json;charset=UTF-8",
        success : function(rtnData) {
        	console.dir(rtnData);
            var reqdata = JSON.parse(rtnData.data);
            $('#countryclub_id').append($('<option>').text("골프장을 선택"));
            if(typeof (reqdata) === 'object'){	   
            	$('#countryclub_id').append($('<option>').text(reqdata.countryclub_nm).attr('value', reqdata.countryclub_id));
            }else {
            	$.each(reqdata, function(i, obj){
                    $('#countryclub_id').append($('<option>').text(obj.countryclub_nm).attr('value', obj.countryclub_id));
            	});
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
        }
    });			
}

function changeCountryClub(data)
{
	// countryclub_id clear
	$("#start_course").empty();
	$("#end_course").empty();
	if (data == "") return;
	// 다시 조회
	var url = "/score/parList/"+$("#country_id").val()+"/"+$("#zone_id").val()+"/"+data;
	var method = "GET";
	var data = "";
	
    $.ajax({
        type: method,
        url : url,
        data: data,
        dataType:"json",
        async:true,
        contentType:"application/json;charset=UTF-8",
        success : function(rtnData) {
        	console.dir(rtnData);
            var reqdata = JSON.parse(rtnData.data);
            $('#start_course').append($('<option>').text("OUT 코스선택"));
            $('#end_course').append($('<option>').text("IN 코스선택"));
            
            if(typeof (reqdata) === 'object'){	            	
            	$('#start_course').append($('<option>').text(reqdata.course_nm).attr('value', reqdata.course));
                $('#end_course').append($('<option>').text(reqdata.course_nm).attr('value', reqdata.course));
            }else {
            	$.each(reqdata, function(i, obj){
                    $('#start_course').append($('<option>').text(obj.course_nm).attr('value', obj.course));
                    $('#end_course').append($('<option>').text(obj.course_nm).attr('value', obj.course));
            	});
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
        }
    });			
}	

// Stoke 입력했을 때 호출되는 메소드 
function strokeChk1(obj)
{
	// stroke 점수를 계산한다.
	var sum = 0;
	if ($('#stroke1').val() != "") sum += parseInt($('#stroke1').val());
	if ($('#stroke2').val() != "") sum += parseInt($('#stroke2').val());
	if ($('#stroke3').val() != "") sum += parseInt($('#stroke3').val());
	if ($('#stroke4').val() != "") sum += parseInt($('#stroke4').val());
	if ($('#stroke5').val() != "") sum += parseInt($('#stroke5').val());
	if ($('#stroke6').val() != "") sum += parseInt($('#stroke6').val());
	if ($('#stroke7').val() != "") sum += parseInt($('#stroke7').val());
	if ($('#stroke8').val() != "") sum += parseInt($('#stroke8').val());
	if ($('#stroke9').val() != "") sum += parseInt($('#stroke9').val());
	
	$('#strokesum1').val(sum);
	
	// Score recalculate
	ScoreChk1();
}
function strokeChk2(obj)
{
	// stroke 점수를 계산한다.
	var sum = 0;
	if ($('#stroke10').val() != "") sum += parseInt($('#stroke10').val());
	if ($('#stroke11').val() != "") sum += parseInt($('#stroke11').val());
	if ($('#stroke12').val() != "") sum += parseInt($('#stroke12').val());
	if ($('#stroke13').val() != "") sum += parseInt($('#stroke13').val());
	if ($('#stroke14').val() != "") sum += parseInt($('#stroke14').val());
	if ($('#stroke15').val() != "") sum += parseInt($('#stroke15').val());
	if ($('#stroke16').val() != "") sum += parseInt($('#stroke16').val());
	if ($('#stroke17').val() != "") sum += parseInt($('#stroke17').val());
	if ($('#stroke18').val() != "") sum += parseInt($('#stroke18').val());
	
	$('#strokesum2').val(sum);
	// Score recalculate
	ScoreChk2();	
}
// Stroke 변경에 의해서 다시 재계산한다.
function ScoreChk1()
{
	var sum = 0;
	console.log($('#hole1').val());
	if ($('#stroke1').val() != "") $('#score1').val($('#stroke1').val() - $('#hole1').text());
	if ($('#stroke2').val() != "") $('#score2').val($('#stroke2').val() - $('#hole2').text());
	if ($('#stroke3').val() != "") $('#score3').val($('#stroke3').val() - $('#hole3').text());
	if ($('#stroke4').val() != "") $('#score4').val($('#stroke4').val() - $('#hole4').text());
	if ($('#stroke5').val() != "") $('#score5').val($('#stroke5').val() - $('#hole5').text());
	if ($('#stroke6').val() != "") $('#score6').val($('#stroke6').val() - $('#hole6').text());
	if ($('#stroke7').val() != "") $('#score7').val($('#stroke7').val() - $('#hole7').text());
	if ($('#stroke8').val() != "") $('#score8').val($('#stroke8').val() - $('#hole8').text());
	if ($('#stroke9').val() != "") $('#score9').val($('#stroke9').val() - $('#hole9').text());
	
	if ($('#score1').val() != "") sum += parseInt($('#score1').val());
	if ($('#score2').val() != "") sum += parseInt($('#score2').val());
	if ($('#score3').val() != "") sum += parseInt($('#score3').val());
	if ($('#score4').val() != "") sum += parseInt($('#score4').val());
	if ($('#score5').val() != "") sum += parseInt($('#score5').val());
	if ($('#score6').val() != "") sum += parseInt($('#score6').val());
	if ($('#score7').val() != "") sum += parseInt($('#score7').val());
	if ($('#score8').val() != "") sum += parseInt($('#score8').val());
	if ($('#score9').val() != "") sum += parseInt($('#score9').val());	
	$('#scoresum1').val(sum);
}
function ScoreChk2()
{
	var sum = 0;
	if ($('#stroke10').val() != "") $('#score10').val($('#stroke10').val() - $('#hole10').text());
	if ($('#stroke11').val() != "") $('#score11').val($('#stroke11').val() - $('#hole11').text());
	if ($('#stroke12').val() != "") $('#score12').val($('#stroke12').val() - $('#hole12').text());
	if ($('#stroke13').val() != "") $('#score13').val($('#stroke13').val() - $('#hole13').text());
	if ($('#stroke14').val() != "") $('#score14').val($('#stroke14').val() - $('#hole14').text());
	if ($('#stroke15').val() != "") $('#score15').val($('#stroke15').val() - $('#hole15').text());
	if ($('#stroke16').val() != "") $('#score16').val($('#stroke16').val() - $('#hole16').text());
	if ($('#stroke17').val() != "") $('#score17').val($('#stroke17').val() - $('#hole17').text());
	if ($('#stroke18').val() != "") $('#score18').val($('#stroke18').val() - $('#hole18').text());	
	
	if ($('#score10').val() != "") sum += parseInt($('#score10').val());
	if ($('#score11').val() != "") sum += parseInt($('#score11').val());
	if ($('#score12').val() != "") sum += parseInt($('#score12').val());
	if ($('#score13').val() != "") sum += parseInt($('#score13').val());
	if ($('#score14').val() != "") sum += parseInt($('#score14').val());
	if ($('#score15').val() != "") sum += parseInt($('#score15').val());
	if ($('#score16').val() != "") sum += parseInt($('#score16').val());
	if ($('#score17').val() != "") sum += parseInt($('#score17').val());
	if ($('#score18').val() != "") sum += parseInt($('#score18').val());	
	$('#scoresum2').val(sum);	
}

// Putts 입력을 체크한다 
function putterChk1()
{
	var sum = 0;
	if ($('#putter1').val() != "") sum += parseInt($('#putter1').val());
	if ($('#putter2').val() != "") sum += parseInt($('#putter2').val());
	if ($('#putter3').val() != "") sum += parseInt($('#putter3').val());
	if ($('#putter4').val() != "") sum += parseInt($('#putter4').val());
	if ($('#putter5').val() != "") sum += parseInt($('#putter5').val());
	if ($('#putter6').val() != "") sum += parseInt($('#putter6').val());
	if ($('#putter7').val() != "") sum += parseInt($('#putter7').val());
	if ($('#putter8').val() != "") sum += parseInt($('#putter8').val());
	if ($('#putter9').val() != "") sum += parseInt($('#putter9').val());
	
	$('#puttersum1').val(sum);	
}
function putterChk2()
{
	var sum = 0;
	if ($('#putter10').val() != "") sum += parseInt($('#putter10').val());
	if ($('#putter11').val() != "") sum += parseInt($('#putter11').val());
	if ($('#putter12').val() != "") sum += parseInt($('#putter12').val());
	if ($('#putter13').val() != "") sum += parseInt($('#putter13').val());
	if ($('#putter14').val() != "") sum += parseInt($('#putter14').val());
	if ($('#putter15').val() != "") sum += parseInt($('#putter15').val());
	if ($('#putter16').val() != "") sum += parseInt($('#putter16').val());
	if ($('#putter17').val() != "") sum += parseInt($('#putter17').val());
	if ($('#putter18').val() != "") sum += parseInt($('#putter18').val());
	
	$('#puttersum2').val(sum);		
}
// 입력 정보를 저장한다.
function fn_save()
{
	if (confirm("입력된 정보를 저장하시겠습니까?"))
	{
		forms1.action = "/score/scoreUpdate";
		forms1.submit();
	}
}
</script>

<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

</body>
</html>