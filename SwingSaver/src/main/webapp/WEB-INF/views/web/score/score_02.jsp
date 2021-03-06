<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>

<body>
	<%@include file="/WEB-INF/views/web/inc/navi.jsp"%>

    <section class="container no-padding">
        <article class="col-xs-12" style="padding: 0;">
			<%@include file="/WEB-INF/views/web/inc/mypage_left_menu.jsp"%>
			
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

    			
            <div class="content col-xs-9" style="padding: 0;">
                <div class="col-xs-12" style="padding: 0">
                    <h2 class="right-tit">내 스코어 관리</h2>

                    <div class="score-page form-page">
                        <!--
                        <div class="sc-search">
                            <table>
                                <colgroup>
                                    <col width="17%">
                                    <col width="23%">
                                    <col width="40%">
                                    <col width="30%">
                                </colgroup>


                                <tr>
                                    <td class="font-weight-bold">
                                        <p>날짜</p>
                                    </td>
                                    <td colspan="4">
                                        <input type="date" id="userdate" name="userdate" value="2015-10-10"> ~
                                        <input type="date" id="userdate" name="userdate" value="2015-10-10">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">
                                        <p>골프장</p>
                                    </td>
                                    <td>
                                        <div class="chk_cou_rad">
                                            <input type="radio" name="chk_country" value="domestic" checked="checked">
                                            <p>국내</p>
                                        </div>
                                        <div class="chk_cou_rad">
                                            <input type="radio" name="chk_country" value="foreign">
                                            <p>국외</p>
                                        </div>

                                    </td>
                                    <td>
                                        <select name="area">
                                            <option value="area">지역</option>
                                            <option value=" ">서울</option>
                                            <option value=" ">경기</option>
                                            <option value=" ">강원</option>
                                        </select>
                                        <select name="golf-name">
                                            <option value="golf-name">선택</option>
                                            <option value=" ">골프장이름입력</option>
                                            <option value=" "> </option>
                                            <option value=" "> </option>
                                        </select>
                                    </td>
                                    <td><button>검색</button></td>
                                </tr>
                            </table>

                        </div>
-->

                        <div class="sc-cont">
                            <h4>${search_visit_date}&ensp;${scoreInfo.countryclub_nm} | SCORE : <strong>${scoreInfo.strokesum1+scoreInfo.strokesum2}</strong>(${scoreInfo.scoresum1+scoreInfo.scoresum2})</h4>
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
                                        <td class="green-td">${parInfo1.hole1}</td>
                                        <td class="green-td">${parInfo1.hole2}</td>
                                        <td class="green-td">${parInfo1.hole3}</td>
                                        <td class="green-td">${parInfo1.hole4}</td>
                                        <td class="green-td">${parInfo1.hole5}</td>
                                        <td class="green-td">${parInfo1.hole6}</td>
                                        <td class="green-td">${parInfo1.hole7}</td>
                                        <td class="green-td">${parInfo1.hole8}</td>
                                        <td class="green-td">${parInfo1.hole9}</td>
                                        <td class="green-td">${parInfo1.sum}</td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Stroke</td>
                                        <td>${scoreInfo.stroke1}</td>
                                        <td>${scoreInfo.stroke2}</td>
                                        <td>${scoreInfo.stroke3}</td>
                                        <td>${scoreInfo.stroke4}</td>
                                        <td>${scoreInfo.stroke5}</td>
                                        <td>${scoreInfo.stroke6}</td>
                                        <td>${scoreInfo.stroke7}</td>
                                        <td>${scoreInfo.stroke8}</td>
                                        <td>${scoreInfo.stroke9}</td>
                                        <td class="gray-td">${scoreInfo.strokesum1}</td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td>${scoreInfo.putter1}</td>
                                        <td>${scoreInfo.putter2}</td>
                                        <td>${scoreInfo.putter3}</td>
                                        <td>${scoreInfo.putter4}</td>
                                        <td>${scoreInfo.putter5}</td>
                                        <td>${scoreInfo.putter6}</td>
                                        <td>${scoreInfo.putter7}</td>
                                        <td>${scoreInfo.putter8}</td>
                                        <td>${scoreInfo.putter9}</td>
                                        <td class="gray-td" rowspan="2">${scoreInfo.puttersum1}</td>
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
                                        <td class="gray2-td fir-td">Score</td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score1 < 0}">mi-num</c:if><c:if test="${scoreInfo.score1 == 0}">ba-num</c:if><c:if test="${scoreInfo.score1 > 0}">pl-num</c:if>">${scoreInfo.score1}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score2 < 0}">mi-num</c:if><c:if test="${scoreInfo.score2 == 0}">ba-num</c:if><c:if test="${scoreInfo.score2 > 0}">pl-num</c:if>">${scoreInfo.score2}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score3 < 0}">mi-num</c:if><c:if test="${scoreInfo.score3 == 0}">ba-num</c:if><c:if test="${scoreInfo.score3 > 0}">pl-num</c:if>">${scoreInfo.score3}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score4 < 0}">mi-num</c:if><c:if test="${scoreInfo.score4 == 0}">ba-num</c:if><c:if test="${scoreInfo.score4 > 0}">pl-num</c:if>">${scoreInfo.score4}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score5 < 0}">mi-num</c:if><c:if test="${scoreInfo.score5 == 0}">ba-num</c:if><c:if test="${scoreInfo.score5 > 0}">pl-num</c:if>">${scoreInfo.score5}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score6 < 0}">mi-num</c:if><c:if test="${scoreInfo.score6 == 0}">ba-num</c:if><c:if test="${scoreInfo.score6 > 0}">pl-num</c:if>">${scoreInfo.score6}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score7 < 0}">mi-num</c:if><c:if test="${scoreInfo.score7 == 0}">ba-num</c:if><c:if test="${scoreInfo.score7 > 0}">pl-num</c:if>">${scoreInfo.score7}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score8 < 0}">mi-num</c:if><c:if test="${scoreInfo.score8 == 0}">ba-num</c:if><c:if test="${scoreInfo.score8 > 0}">pl-num</c:if>">${scoreInfo.score8}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score9 < 0}">mi-num</c:if><c:if test="${scoreInfo.score9 == 0}">ba-num</c:if><c:if test="${scoreInfo.score9 > 0}">pl-num</c:if>">${scoreInfo.score9}</p>
                                         </td>
                                        <td class="gray2-td">${scoreInfo.scoresum1}</td>
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
                            <div style="overflow-x:auto; margin-bottom: 10px;">
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
                                        <td>${scoreInfo.stroke10}</td>
                                        <td>${scoreInfo.stroke11}</td>
                                        <td>${scoreInfo.stroke12}</td>
                                        <td>${scoreInfo.stroke13}</td>
                                        <td>${scoreInfo.stroke14}</td>
                                        <td>${scoreInfo.stroke15}</td>
                                        <td>${scoreInfo.stroke16}</td>
                                        <td>${scoreInfo.stroke17}</td>
                                        <td>${scoreInfo.stroke18}</td>
                                        <td class="gray-td">${scoreInfo.strokesum2}</td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td>${scoreInfo.putter10}</td>
                                        <td>${scoreInfo.putter11}</td>
                                        <td>${scoreInfo.putter12}</td>
                                        <td>${scoreInfo.putter13}</td>
                                        <td>${scoreInfo.putter14}</td>
                                        <td>${scoreInfo.putter15}</td>
                                        <td>${scoreInfo.putter16}</td>
                                        <td>${scoreInfo.putter17}</td>
                                        <td>${scoreInfo.putter18}</td>
                                        <td class="gray-td" rowspan="2">${scoreInfo.puttersum2}</td>
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
                                        <td class="gray2-td fir-td">Score</td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score10 < 0}">mi-num</c:if><c:if test="${scoreInfo.score10 == 0}">ba-num</c:if><c:if test="${scoreInfo.score10 > 0}">pl-num</c:if>">${scoreInfo.score10}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score11 < 0}">mi-num</c:if><c:if test="${scoreInfo.score11 == 0}">ba-num</c:if><c:if test="${scoreInfo.score11 > 0}">pl-num</c:if>">${scoreInfo.score11}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score12 < 0}">mi-num</c:if><c:if test="${scoreInfo.score12 == 0}">ba-num</c:if><c:if test="${scoreInfo.score12 > 0}">pl-num</c:if>">${scoreInfo.score12}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score13 < 0}">mi-num</c:if><c:if test="${scoreInfo.score13 == 0}">ba-num</c:if><c:if test="${scoreInfo.score13 > 0}">pl-num</c:if>">${scoreInfo.score13}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score14 < 0}">mi-num</c:if><c:if test="${scoreInfo.score14 == 0}">ba-num</c:if><c:if test="${scoreInfo.score14 > 0}">pl-num</c:if>">${scoreInfo.score14}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score15 < 0}">mi-num</c:if><c:if test="${scoreInfo.score15 == 0}">ba-num</c:if><c:if test="${scoreInfo.score15 > 0}">pl-num</c:if>">${scoreInfo.score15}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score16 < 0}">mi-num</c:if><c:if test="${scoreInfo.score16 == 0}">ba-num</c:if><c:if test="${scoreInfo.score16 > 0}">pl-num</c:if>">${scoreInfo.score16}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score17 < 0}">mi-num</c:if><c:if test="${scoreInfo.score17 == 0}">ba-num</c:if><c:if test="${scoreInfo.score17 > 0}">pl-num</c:if>">${scoreInfo.score17}</p>
                                        </td>
                                        <td>
                                            <p class="<c:if test="${scoreInfo.score18 < 0}">mi-num</c:if><c:if test="${scoreInfo.score18 == 0}">ba-num</c:if><c:if test="${scoreInfo.score18 > 0}">pl-num</c:if>">${scoreInfo.score18}</p>
                                         </td>
                                        <td class="gray2-td">${scoreInfo.scoresum2}</td>
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

                            <div class="sub-g-btn">
                                <button type="button" id="btnUpdate" class="edit-btn" data-target="#">수정</button>
                                <button type="button" id="btnDelete" class="edit-btn" data-toggle="modal" data-target="#score_del">삭제</button>
                                <button type="button" id="btnList"   class="sea-btn add-btn" data-target="#">
                        <img src="../image/back-list.png" cwidth="100%">    
                            목록</button>
                            </div>

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
            <div class="modal-content">
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
                            <input type="radio" name="putts01" checked="checked" value="2" />
                            <img src="../image/jr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="3" />
                            <img src="../image/ol_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="4" />
                            <img src="../image/or_on.gif" width="100%">
                        </div>

                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="5" />
                            <img src="../image/os_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="6" />
                            <img src="../image/sl_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="7" />
                            <img src="../image/sr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="8" />
                            <img src="../image/ss_on.gif" width="100%">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <!-- div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn">저장</button>
                        </div  -->
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn btn-secondary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


   <!--score info delete -->

    <div class="modal fade" id="score_del" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">스코어 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <p>해당 스코어를 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn btn-secondary" data-dismiss="modal">삭제</button>
                        </div>
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<form name="frm" method="post">
    <input type="hidden" name="stdate" id="stdate" value="${stdate}">
	<input type="hidden" name="etdate" id="etdate" value="${etdate}">
	<input type="hidden" name="country_id" id="country_id" value="${country_id}">
	<input type="hidden" name="zone_id" id="zone_id" value="${zone_id}">
	<input type="hidden" name="countryclub_id" id="countryclub_id" value="${countryclub_id}">
	
	<input type="hidden" name="search_seq_no" id="search_seq_no" value="${search_seq_no}">
	<input type="hidden" name="search_countryclub_id" id="search_countryclub_id" value="${search_countryclub_id}">
	<input type="hidden" name="search_visit_date" id="search_visit_date" value="${search_visit_date}">	
</form>
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
    	
    
    $("#btnCancel").click(function(){
    	//$("#putts_01").hide();
    	$("#putts_01").attr('aria-hidden', 'true').hide();
    });
    
    $("#golfTitle").text($("#countryclub_id option:checked").text());
    
    //alert($("#countryclub_id option:checked").text());
    
    $("#btnList").click(function(){
    	frm.action = "/score/scoreList";
    	frm.submit();
    });
    $("#btnDelete").click(function(){
    	fn_Delete();
    });
    
    $("#btnUpdate").click(function(){
    	fn_Modify();
    });
});


function fn_Delete()
{
        var obj = new Object();
        obj.countryclub_id = "${search_countryclub_id}";
        obj.visit_date = "${search_visit_date}";
        obj.seq_no = "${search_seq_no}";
        obj.user_id = "${scoreInfo.user_id}";
        
        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/score/scoreDelete","POST",jsonData);	
}

function fn_Modify()
{
	frm.action = "/score/scoreModify";
	frm.submit();
}

</script>

    <!-- Footer -->
	<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->


</body>



</html>
