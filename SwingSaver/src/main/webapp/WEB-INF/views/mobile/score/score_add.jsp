<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
 <nav id="header">
 	<a href="/m/score"><img src="/image/h-back.png" class="gnb-log" width="100%"></a>
    <div class="logo"><img src="/image/head-logo.png" class="" width="100%"></div>
    <a href="/m/search.do"><img src="/mobile/image/gnb-ser.svg" class="gnb-ser" width="100%"></a>
 </nav>

<c:set var="now" value="<%=new java.util.Date()%>" />


    <section id="contents" class="">
    
    <form name="frm" id="frm">
    <input type="hidden" name="visit_date" id="visit_date" value="<c:if test='${scoreInfo ne null}'>${scoreInfo.visit_date}</c:if><c:if test='${scoreInfo eq null}'>${visit_date}</c:if>">
    <input type="hidden" name="countryclub_id" id="countryclub_id" value="${golfInfo.countryclub_id}">
    <input type="hidden" name="start_course" id="start_course" value="${parInfo1.course}">
    <input type="hidden" name="end_course" id="end_course" value="${parInfo2.course}">
    <input type="hidden" name="teeup_time" id="teeup_time" value="<c:if test='${scoreInfo ne null}'>${scoreInfo.teeup_time}</c:if><c:if test='${scoreInfo eq null}'>${teeup_time}</c:if>">
        
        <div class="con-wrap">
        	<a class="sc-add" href="#" id="saveScore">저장하기</a>
            <div class="date-wrap">
                <div class="sc-date">
                	<c:if test='${scoreInfo ne null}'>${scoreInfo.visit_date_format}</c:if>
                	<c:if test='${scoreInfo eq null}'>${visit_date}</c:if>
                	/ 
                	<c:if test='${scoreInfo ne null}'>${scoreInfo.teeup_time_format}</c:if>
                	<c:if test='${scoreInfo eq null}'>${teeup_time}</c:if>
                </div>
                <a href="/m/score" class="sta-btn">리스트보기</a>
            </div>
            <div class="sc-btn-wrap">
                <div class="sc-golf-name">${golfInfo.countryclub_nm}<span><c:if test='${scoreInfo ne null}'>${scoreInfo.total_socre}(${scoreInfo.par_data})</c:if></span></div>
                <a href="#" id="scoreAnaly" class="sta-btn gray-btn">스코어분석</a>
            </div>              

            <div class="score-wrap">
                <h2>Course. 1</h2>
                <table class="sc-table">
                    <colgroup>
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">

                    </colgroup>
                    <tr>
                        <th class="tbl-bl">Hole</th>
                        <th>par</th>
                        <th>Shot</th>
                        <th>Score</th>
                        <th>F/W</th>
                        <th>Green</th>
                        <th>Putts</th>
                        <th>Putting Pattern</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <td><span id="hole1">${parInfo1.hole1}</span></td>
                        <td><input class= "input_data" type="number" id="stroke1" name="stroke1" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke1}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score1" name="score1"  readonly maxlength="2" value="${scoreInfo.score1}" readonly></td>
                        <td onclick="fairwayonPopup('fairwayon1');"><input type="hidden" id="fairwayon1" name="fairwayon1" value="${scoreInfo.fairwayon1}">
                        	<span id="fairwayon1_name">${scoreInfo.fairwayon1_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon1');">
                  		    <input type="hidden" id="greenon1" name="greenon1" value="${scoreInfo.greenon1}">
                        	<span id="greenon1_name">${scoreInfo.greenon1_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter1" name="putter1" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter1}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern1" name="puterpattern1" value="${scoreInfo.puterpattern1}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern1', document.getElementById('puterpattern1').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td><span id="hole2">${parInfo1.hole2}</span></td>
                        <td><input class= "input_data" type="number" id="stroke2" name="stroke2" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke2}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score2" name="score2"  readonly maxlength="2" value="${scoreInfo.score2}"></td>
                        <td onclick="fairwayonPopup('fairwayon2');"><input type="hidden" id="fairwayon2" name="fairwayon2" value="${scoreInfo.fairwayon2}">
                        	<span id="fairwayon2_name">${scoreInfo.fairwayon2_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon2');">
                  		    <input type="hidden" id="greenon2" name="greenon2" value="${scoreInfo.greenon2}">
                        	<span id="greenon2_name">${scoreInfo.greenon2_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter2" name="putter2" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter2}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern2" name="puterpattern2" value="${scoreInfo.puterpattern2}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern2', document.getElementById('puterpattern2').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td><span id="hole3">${parInfo1.hole3}</span></td>
                        <td><input class= "input_data" type="number" id="stroke3" name="stroke3" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke3}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score3" name="score3"  readonly maxlength="2" value="${scoreInfo.score3}"></td>
                        <td onclick="fairwayonPopup('fairwayon3');"><input type="hidden" id="fairwayon3" name="fairwayon3" value="${scoreInfo.fairwayon3}">
                        	<span id="fairwayon3_name">${scoreInfo.fairwayon3_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon3');">
                  		    <input type="hidden" id="greenon3" name="greenon3" value="${scoreInfo.greenon3}">
                        	<span id="greenon3_name">${scoreInfo.greenon3_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter3" name="putter3" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter3}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern3" name="puterpattern3" value="${scoreInfo.puterpattern3}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern3', document.getElementById('puterpattern3').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td><span id="hole4">${parInfo1.hole4}</span></td>
                        <td><input class= "input_data" type="number" id="stroke4" name="stroke4" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke4}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score4" name="score4"  readonly maxlength="2" value="${scoreInfo.score4}"></td>
                        <td onclick="fairwayonPopup('fairwayon4');"><input type="hidden" id="fairwayon4" name="fairwayon4" value="${scoreInfo.fairwayon4}">
                        	<span id="fairwayon4_name">${scoreInfo.fairwayon4_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon4');">
                  		    <input type="hidden" id="greenon4" name="greenon4" value="${scoreInfo.greenon4}">
                        	<span id="greenon4_name">${scoreInfo.greenon4_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter4" name="putter4" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter4}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern4" name="puterpattern4" value="${scoreInfo.puterpattern4}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern4', document.getElementById('puterpattern4').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td><span id="hole5">${parInfo1.hole5}</span></td>
                        <td><input class= "input_data" type="number" id="stroke5" name="stroke5" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke5}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score5" name="score5"  readonly maxlength="2" value="${scoreInfo.score5}"></td>
                        <td onclick="fairwayonPopup('fairwayon5');"><input type="hidden" id="fairwayon5" name="fairwayon5" value="${scoreInfo.fairwayon5}">
                        	<span id="fairwayon5_name">${scoreInfo.fairwayon5_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon5');">
                  		    <input type="hidden" id="greenon5" name="greenon5" value="${scoreInfo.greenon5}">
                        	<span id="greenon5_name">${scoreInfo.greenon5_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter5" name="putter5" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter5}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern5" name="puterpattern5" value="${scoreInfo.puterpattern5}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern5', document.getElementById('puterpattern5').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td><span id="hole6">${parInfo1.hole6}</span></td>
                        <td><input class= "input_data" type="number" id="stroke6" name="stroke6" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke6}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score6" name="score6"  readonly maxlength="2" value="${scoreInfo.score6}"></td>
                        <td onclick="fairwayonPopup('fairwayon6');"><input type="hidden" id="fairwayon6" name="fairwayon6" value="${scoreInfo.fairwayon6}">
                        	<span id="fairwayon6_name">${scoreInfo.fairwayon6_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon6');">
                  		    <input type="hidden" id="greenon6" name="greenon6" value="${scoreInfo.greenon6}">
                        	<span id="greenon6_name">${scoreInfo.greenon6_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter6" name="putter6" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter6}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern6" name="puterpattern6" value="${scoreInfo.puterpattern6}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern6', document.getElementById('puterpattern6').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td><span id="hole7">${parInfo1.hole7}</span></td>
                        <td><input class= "input_data" type="number" id="stroke7" name="stroke7" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke7}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score7" name="score7"  readonly maxlength="2" value="${scoreInfo.score7}"></td>
                        <td onclick="fairwayonPopup('fairwayon7');"><input type="hidden" id="fairwayon7" name="fairwayon7" value="${scoreInfo.fairwayon7}">
                        	<span id="fairwayon7_name">${scoreInfo.fairwayon7_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon7');">
                  		    <input type="hidden" id="greenon7" name="greenon7" value="${scoreInfo.greenon7}">
                        	<span id="greenon7_name">${scoreInfo.greenon7_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter7" name="putter7" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter7}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern7" name="puterpattern7" value="${scoreInfo.puterpattern7}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern7', document.getElementById('puterpattern7').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td><span id="hole8">${parInfo1.hole8}</span></td>
                        <td><input class= "input_data" type="number" id="stroke8" name="stroke8" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke8}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score8" name="score8"  readonly maxlength="2" value="${scoreInfo.score8}"></td>
                        <td onclick="fairwayonPopup('fairwayon8');"><input type="hidden" id="fairwayon8" name="fairwayon8" value="${scoreInfo.fairwayon8}">
                        	<span id="fairwayon8_name">${scoreInfo.fairwayon8_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon8');">
                  		    <input type="hidden" id="greenon8" name="greenon8" value="${scoreInfo.greenon8}">
                        	<span id="greenon8_name">${scoreInfo.greenon8_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter8" name="putter8" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter8}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern8" name="puterpattern8" value="${scoreInfo.puterpattern8}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern8', document.getElementById('puterpattern8').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td><span id="hole9">${parInfo1.hole9}</span></td>
                        <td><input class= "input_data" type="number" id="stroke9" name="stroke9" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke9}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score9" name="score9"  readonly maxlength="2" value="${scoreInfo.score9}"></td>
                        <td onclick="fairwayonPopup('fairwayon9');"><input type="hidden" id="fairwayon9" name="fairwayon9" value="${scoreInfo.fairwayon9}">
                        	<span id="fairwayon9_name">${scoreInfo.fairwayon9_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon9');">
                  		    <input type="hidden" id="greenon9" name="greenon9" value="${scoreInfo.greenon9}">
                        	<span id="greenon9_name">${scoreInfo.greenon9_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter9" name="putter9" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter9}" onkeyup="putterChk1(this)"></td>
                        <td><input type="hidden" id="puterpattern9" name="puterpattern9" value="${scoreInfo.puterpattern9}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern9', document.getElementById('puterpattern9').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th class="tbl-bl">Total</th>
                        <th>${parInfo1.sum}</th>
                        <th><input class= "input_data" type="text" id="strokesum1" name="strokesum1"  readonly value="${scoreInfo.strokesum1}"></th>
                        <th><input class= "input_data" type="text" id="scoresum1" name="scoresum1"  readonly value="${scoreInfo.scoresum1}"></th>
                        <th>0</th>
                        <th>0</th>
                        <th><input class= "input_data" type="text" id="puttersum1" name="puttersum1"  readonly value="${scoreInfo.puttersum1}"></th>
                        <th>0</th>
                    </tr>                    
                    
                    
                </table>
            </div>
            <div class="score-wrap">
                <h2>Course. 2</h2>
                <table class="sc-table">
                    <colgroup>
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">

                    </colgroup>
                    <tr>
                        <th class="tbl-bl">Hole</th>
                        <th>par</th>
                        <th>Shot</th>
                        <th>Score</th>
                        <th>F/W</th>
                        <th>Green</th>
                        <th>Putts</th>
                        <th>Putting Pattern</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <td><span id="hole10">${parInfo2.hole1}</span></td>
                        <td><input class= "input_data" type="number" id="stroke10" name="stroke10" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke10}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score10" name="score10"  readonly maxlength="2" value="${scoreInfo.score10}"></td>
                        <td onclick="fairwayonPopup('fairwayon10');"><input type="hidden" id="fairwayon10" name="fairwayon10" value="${scoreInfo.fairwayon10}">
                        	<span id="fairwayon10_name">${scoreInfo.fairwayon10_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon10');">
                  		    <input type="hidden" id="greenon10" name="greenon10" value="${scoreInfo.greenon10}">
                        	<span id="greenon10_name">${scoreInfo.greenon10_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter10" name="putter10" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter10}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern10" name="puterpattern10" value="${scoreInfo.puterpattern10}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern10', document.getElementById('puterpattern10').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td><span id="hole11">${parInfo2.hole2}</span></td>
                        <td><input class= "input_data" type="number" id="stroke11" name="stroke11" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke11}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score11" name="score11"  readonly maxlength="2" value="${scoreInfo.score11}"></td>
                        <td onclick="fairwayonPopup('fairwayon11');"><input type="hidden" id="fairwayon11" name="fairwayon11" value="${scoreInfo.fairwayon11}">
                        	<span id="fairwayon11_name">${scoreInfo.fairwayon11_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon11');">
                  		    <input type="hidden" id="greenon11" name="greenon11" value="${scoreInfo.greenon11}">
                        	<span id="greenon11_name">${scoreInfo.greenon11_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter11" name="putter11" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter11}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern11" name="puterpattern11" value="${scoreInfo.puterpattern11}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern11', document.getElementById('puterpattern11').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td><span id="hole12">${parInfo2.hole3}</span></td>
                        <td><input class= "input_data" type="number" id="stroke12" name="stroke12" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke12}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score12" name="score12"  readonly maxlength="2" value="${scoreInfo.score12}"></td>
                        <td onclick="fairwayonPopup('fairwayon12');"><input type="hidden" id="fairwayon12" name="fairwayon12" value="${scoreInfo.fairwayon12}">
                        	<span id="fairwayon12_name">${scoreInfo.fairwayon12_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon12');">
                  		    <input type="hidden" id="greenon12" name="greenon12" value="${scoreInfo.greenon12}">
                        	<span id="greenon12_name">${scoreInfo.greenon12_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter12" name="putter12" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter12}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern12" name="puterpattern12" value="${scoreInfo.puterpattern12}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern12', document.getElementById('puterpattern12').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td><span id="hole13">${parInfo2.hole4}</span></td>
                        <td><input class= "input_data" type="number" id="stroke13" name="stroke13" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke13}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score13" name="score13"  readonly maxlength="2" value="${scoreInfo.score13}"></td>
                        <td onclick="fairwayonPopup('fairwayon13');"><input type="hidden" id="fairwayon13" name="fairwayon13" value="${scoreInfo.fairwayon13}">
                        	<span id="fairwayon13_name">${scoreInfo.fairwayon13_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon13');">
                  		    <input type="hidden" id="greenon13" name="greenon13" value="${scoreInfo.greenon13}">
                        	<span id="greenon13_name">${scoreInfo.greenon13_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter13" name="putter13" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter13}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern13" name="puterpattern13" value="${scoreInfo.puterpattern13}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern13', document.getElementById('puterpattern13').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td><span id="hole14">${parInfo2.hole5}</span></td>
                        <td><input class= "input_data" type="number" id="stroke14" name="stroke14" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke14}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score14" name="score14"  readonly maxlength="2" value="${scoreInfo.score14}"></td>
                        <td onclick="fairwayonPopup('fairwayon14');"><input type="hidden" id="fairwayon14" name="fairwayon14" value="${scoreInfo.fairwayon14}">
                        	<span id="fairwayon14_name">${scoreInfo.fairwayon14_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon14');">
                  		    <input type="hidden" id="greenon14" name="greenon14" value="${scoreInfo.greenon14}">
                        	<span id="greenon14_name">${scoreInfo.greenon14_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter14" name="putter14" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter14}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern14" name="puterpattern14" value="${scoreInfo.puterpattern14}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern14', document.getElementById('puterpattern14').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td><span id="hole15">${parInfo2.hole6}</span></td>
                        <td><input class= "input_data" type="number" id="stroke15" name="stroke15" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke15}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score15" name="score15"  readonly maxlength="2" value="${scoreInfo.score15}"></td>
                        <td onclick="fairwayonPopup('fairwayon15');"><input type="hidden" id="fairwayon15" name="fairwayon15" value="${scoreInfo.fairwayon15}">
                        	<span id="fairwayon15_name">${scoreInfo.fairwayon15_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon15');">
                  		    <input type="hidden" id="greenon15" name="greenon15" value="${scoreInfo.greenon15}">
                        	<span id="greenon15_name">${scoreInfo.greenon15_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter15" name="putter15" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter15}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern15" name="puterpattern15" value="${scoreInfo.puterpattern15}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern15', document.getElementById('puterpattern15').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td><span id="hole16">${parInfo2.hole7}</span></td>
                        <td><input class= "input_data" type="number" id="stroke16" name="stroke16" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke16}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score16" name="score16"  readonly maxlength="2" value="${scoreInfo.score16}"></td>
                        <td onclick="fairwayonPopup('fairwayon16');"><input type="hidden" id="fairwayon16" name="fairwayon16" value="${scoreInfo.fairwayon16}">
                        	<span id="fairwayon16_name">${scoreInfo.fairwayon16_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon16');">
                  		    <input type="hidden" id="greenon16" name="greenon16" value="${scoreInfo.greenon16}">
                        	<span id="greenon16_name">${scoreInfo.greenon16_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter16" name="putter16" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter16}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern16" name="puterpattern16" value="${scoreInfo.puterpattern16}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern16', document.getElementById('puterpattern16').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td><span id="hole17">${parInfo2.hole8}</span></td>
                        <td><input class= "input_data" type="number" id="stroke17" name="stroke17" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke17}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score17" name="score17"  readonly maxlength="2" value="${scoreInfo.score17}"></td>
                        <td onclick="fairwayonPopup('fairwayon17');"><input type="hidden" id="fairwayon17" name="fairwayon17" value="${scoreInfo.fairwayon17}">
                        	<span id="fairwayon17_name">${scoreInfo.fairwayon17_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon17');">
                  		    <input type="hidden" id="greenon17" name="greenon17" value="${scoreInfo.greenon17}">
                        	<span id="greenon17_name">${scoreInfo.greenon17_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter17" name="putter17" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter17}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern17" name="puterpattern17" value="${scoreInfo.puterpattern17}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern17', document.getElementById('puterpattern17').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td><span id="hole18">${parInfo2.hole9}</span></td>
                        <td><input class= "input_data" type="number" id="stroke18" name="stroke18" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke18}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score18" name="score18"  readonly maxlength="2" value="${scoreInfo.score18}"></td>
                        <td onclick="fairwayonPopup('fairwayon18');"><input type="hidden" id="fairwayon18" name="fairwayon18" value="${scoreInfo.fairwayon18}">
                        	<span id="fairwayon18_name">${scoreInfo.fairwayon18_name}</span>
                  		</td>
                        <td onclick="greenonPopup('greenon18');">
                  		    <input type="hidden" id="greenon18" name="greenon18" value="${scoreInfo.greenon18}">
                        	<span id="greenon18_name">${scoreInfo.greenon18_name}</span>
                        </td>
                        <td><input class= "input_data" type="number" id="putter18" name="putter18" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter18}" onkeyup="putterChk2(this)"></td>
                        <td><input type="hidden" id="puterpattern18" name="puterpattern18" value="${scoreInfo.puterpattern18}">
                        <a class="" href="javascript:puterpatternPopup('puterpattern18', document.getElementById('puterpattern18').value);"><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    
                    
                    <tr>
                        <th class="tbl-bl">Total</th>
                        <th>${parInfo2.sum}</th>
                        <th><input class= "input_data" type="text" id="strokesum2" name="strokesum2"  readonly value="${scoreInfo.strokesum2}"></th>
                        <th><input class= "input_data" type="text" id="scoresum2" name="scoresum2"  readonly value="${scoreInfo.scoresum2}"></th>
                        <th>0</th>
                        <th>0</th>
                        <th><input class= "input_data" type="text" id="puttersum2" name="puttersum2"  readonly value="${scoreInfo.puttersum2}"></th>
                        <th>0</th>
                    </tr>                    
                    
                    
                    
                </table>
            </div>
			

        </div>
        </form>
        
        
        <script>
        
            $(document).ready(function() {
                $('.trigger1').on('click', function() {
                    $('.fw-modal').toggleClass('open');
                    $('.page-wrapper').toggleClass('blur-it');
                    return false;
                });
            });
            
            $(document).ready(function() {
                $('.trigger2').on('click', function() {
                    $('.green-modal').toggleClass('open');
                    $('.page-wrapper').toggleClass('blur-it');
                    return false;
                });
            });        
            
            $(document).ready(function() {
                $('.trigger3').on('click', function() {
                    $('.putting-modal').toggleClass('open');
                    $('.page-wrapper').toggleClass('blur-it');
                    return false;
                });
            });               
            
        </script>

        <!-- f/w Modal -->
        <div class="modal-wrapper fw-modal" id="fairwayon">
            <div class="modal">
				<input type="hidden" id="fairwayon_id">
                <div class="content">
                    <div class="mod-tit">
                        <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                        <h2>Fair Way</h2>
                        <a href="#" id="btnLeft"  class="fw-input">Left</a>
                        <a href="#" id="btnOK" class="fw-input">Ok</a>
                        <a href="#" id="btnRight" class="fw-input">Right</a>
                    </div>
                </div>
                <div class="clo-wrap">
                    <a class="btn-close trigger1" href="#">닫기
                  </a>
                </div>
            </div>
        </div>
        <!-- f/w Modal -->

        <!-- green Modal -->
        <div class="modal-wrapper green-modal" id="greenon">
            <div class="modal">
				<input type="hidden" id="greenon_id">
                <div class="content">
                    <div class="mod-tit">
                        <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                        <h2>green</h2>
                        <a href="#" id="greenOK" class="fw-input">Ok</a>
                        <a href="#" id="greenNO" class="fw-input">No</a>
                    </div>
                </div>
                <div class="clo-wrap">
                    <a class="btn-close trigger2" href="#">닫기
                  </a>
                </div>
            </div>
        </div>
        <!-- green Modal -->
        
       <!-- putting pattern Modal -->
        <div class="modal-wrapper putting-modal">
            <div class="modal">
            	<input type="hidden" id="puterpattern_id">
                <div class="content">
                    <div class="mod-tit">
                        <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                        <h2 class="mb-30">Putting Pattern</h2>
                        <div class="putt">
                        <p>Short</p>
                        <input type="radio" id="sl" value="1" name="radio"><label for="sl" class="sl"></label>
                        <input type="radio" id="sr" value="2" name="radio"><label for="sr" class="sr"></label>
                        <input type="radio" id="ss" value="3" name="radio"><label for="ss" class="ss"></label> 
                                               
                        <p>Just</p>
                        <input type="radio" id="jl" value="4" name="radio"><label for="jl" class="jl"></label>
                        <input type="radio" id="jr" value="5" name="radio"><label for="jr" class="jr"></label>                        
                        
                        <p>Over</p>
                        <input type="radio" id="ol" value="6" name="radio"><label for="ol" class="ol"></label>
                        <input type="radio" id="or" value="7" name="radio"><label for="or" class="or"></label>
                        <input type="radio" id="os" value="8" name="radio"><label for="os" class="os"></label>                          
                        </div>
                        <a href="#" id="puterpatterSelectId" class="form-btn">SAVE</a>
                    </div>
                </div>
                <div class="clo-wrap">
                    <a class="btn-close trigger3" href="#">닫기
                  </a>
                </div>
            </div>
        </div>
        <!-- putting pattern Modal -->
                
<script>
$(document).ready(function(){
	
	if ("${message}" != "") {
		alert("${message}");
		location.href="/m/score";	
	}
	// 초기에 불려졋을 때
	strokeChk1(this);
	strokeChk2(this);
	putterChk1(this);
	putterChk2(this);
	
    $("#saveScore").click(function(){
    	if (confirm("입력된 정보를 저장하시겠습니까?"))
    	{
    		frm.action = "/m/score/scoreSave";
    		frm.method = "POST";
    		frm.submit();
    	}
    });	

	$("#greenOK").click(function(){
		console.log($("#greenon_id").val());
		var id = $("#greenon_id").val();
		var name = id+"_name";
		console.log(id);
		console.log(name);
		var obj1 =  eval("$('#"+id+"')");
		var obj2 =  eval("$('#"+name+"')");
		
		obj1.val("Y");
		obj2.text("OK");
		$('.green-modal').toggleClass('open');
	});
	$("#greenNO").click(function(){
		console.log($("#greenon_id").val());
		var id = $("#greenon_id").val();
		var name = id+"_name";
		var obj1 =  eval("$('#"+id+"')");
		var obj2 =  eval("$('#"+name+"')");
		
		obj1.val("N");
		obj2.text("NO");
		$('.green-modal').toggleClass('open');
	});	

    $("#btnLeft").click(function(){
    	console.log($("#fairwayon_id").val());   
		var id = $("#fairwayon_id").val();
		var name = id+"_name";
		var obj1 =  eval("$('#"+id+"')");
		var obj2 =  eval("$('#"+name+"')");
		
		obj1.val("L");
		obj2.text("LEFT");    	
    	$('.fw-modal').toggleClass('open');
    });
    $("#btnOK").click(function(){
    	console.log($("#fairwayon_id").val());   
		var id = $("#fairwayon_id").val();
		var name = id+"_name";
		var obj1 =  eval("$('#"+id+"')");
		var obj2 =  eval("$('#"+name+"')");
		
		obj1.val("Y");
		obj2.text("OK");    
    	$('.fw-modal').toggleClass('open');    	
    });
    $("#btnRight").click(function(){
    	console.log($("#fairwayon_id").val());   
		var id = $("#fairwayon_id").val();
		var name = id+"_name";
		var obj1 =  eval("$('#"+id+"')");
		var obj2 =  eval("$('#"+name+"')");
		
		obj1.val("R");
		obj2.text("RIGHT");     	
    	$('.fw-modal').toggleClass('open');    	
    });   
    
    $("#puterpatterSelectId").click(function(){
    	var st = $(":input:radio[name=radio]:checked").val();
    	var id = $("#puterpattern_id").val();
    	var obj =  eval("$('#"+id+"')");
    	obj.val(st);
    	console.log(id +"=>"+st);
    	$(".putting-modal").toggleClass('open');
    });
    
    $("#scoreAnaly").click(function(){
		frm.action = "/m/score/scoreAnalysis";
		frm.method = "POST";
		frm.submit();
    });

});

function fairwayonPopup(id)
{
	console.log(id);
	$("#fairwayon_id").val(id);
	$('.fw-modal').toggleClass('open');
}

function greenonPopup(id)
{
	console.log(id);
	$("#greenon_id").val(id);
	$('.green-modal').toggleClass('open');
}

function puterpatternPopup(id, value)
{
	console.log(id +"=>"+value);
	$("#puterpattern_id").val(id);
	$(".putting-modal").toggleClass('open');
	
	// 전체 Clear
	for (var i=1; i<=8; i++)
	{
		$('input:radio[name=radio]:input[value=' + i + ']').removeAttr("checked");		
	}
	if (value != "")
	{
		$('input:radio[name=radio]:input[value=' + value + ']').prop("checked", "checked"); // true);		
		console.log("value =>" + value+", radio checked ====???");
	}
}

// Stroke 변경에 의해서 다시 재계산한다.
function strokeChk1(obj)
{
	var sum = 0;
	var stroke_sum = 0;
	
	console.log($('#hole1').val());  // par
	if ($('#stroke1').val() != "") $('#score1').val($('#stroke1').val() - $('#hole1').text());
	if ($('#stroke2').val() != "") $('#score2').val($('#stroke2').val() - $('#hole2').text());
	if ($('#stroke3').val() != "") $('#score3').val($('#stroke3').val() - $('#hole3').text());
	if ($('#stroke4').val() != "") $('#score4').val($('#stroke4').val() - $('#hole4').text());
	if ($('#stroke5').val() != "") $('#score5').val($('#stroke5').val() - $('#hole5').text());
	if ($('#stroke6').val() != "") $('#score6').val($('#stroke6').val() - $('#hole6').text());
	if ($('#stroke7').val() != "") $('#score7').val($('#stroke7').val() - $('#hole7').text());
	if ($('#stroke8').val() != "") $('#score8').val($('#stroke8').val() - $('#hole8').text());
	if ($('#stroke9').val() != "") $('#score9').val($('#stroke9').val() - $('#hole9').text());
	
	if ($('#stroke1').val() != "") stroke_sum  += parseInt($('#stroke1').val());
	if ($('#stroke2').val() != "") stroke_sum  += parseInt($('#stroke2').val());
	if ($('#stroke3').val() != "") stroke_sum  += parseInt($('#stroke3').val());
	if ($('#stroke4').val() != "") stroke_sum  += parseInt($('#stroke4').val());
	if ($('#stroke5').val() != "") stroke_sum  += parseInt($('#stroke5').val());
	if ($('#stroke6').val() != "") stroke_sum  += parseInt($('#stroke6').val());
	if ($('#stroke7').val() != "") stroke_sum  += parseInt($('#stroke7').val());
	if ($('#stroke8').val() != "") stroke_sum  += parseInt($('#stroke8').val());
	if ($('#stroke9').val() != "") stroke_sum  += parseInt($('#stroke9').val());	
	$('#strokesum1').val(stroke_sum);
	
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

function strokeChk2(obj)
{
	var sum = 0;
	var stroke_sum = 0;
	
	console.log($('#hole1').val());  // par
	if ($('#stroke10').val() != "") $('#score10').val($('#stroke10').val() - $('#hole10').text());
	if ($('#stroke11').val() != "") $('#score11').val($('#stroke11').val() - $('#hole11').text());
	if ($('#stroke12').val() != "") $('#score12').val($('#stroke12').val() - $('#hole12').text());
	if ($('#stroke13').val() != "") $('#score13').val($('#stroke13').val() - $('#hole13').text());
	if ($('#stroke14').val() != "") $('#score14').val($('#stroke14').val() - $('#hole14').text());
	if ($('#stroke15').val() != "") $('#score15').val($('#stroke15').val() - $('#hole15').text());
	if ($('#stroke16').val() != "") $('#score16').val($('#stroke16').val() - $('#hole16').text());
	if ($('#stroke17').val() != "") $('#score17').val($('#stroke17').val() - $('#hole17').text());
	if ($('#stroke18').val() != "") $('#score18').val($('#stroke18').val() - $('#hole18').text());
	
	if ($('#stroke10').val() != "") stroke_sum  += parseInt($('#stroke10').val());
	if ($('#stroke11').val() != "") stroke_sum  += parseInt($('#stroke11').val());
	if ($('#stroke12').val() != "") stroke_sum  += parseInt($('#stroke12').val());
	if ($('#stroke13').val() != "") stroke_sum  += parseInt($('#stroke13').val());
	if ($('#stroke15').val() != "") stroke_sum  += parseInt($('#stroke14').val());
	if ($('#stroke15').val() != "") stroke_sum  += parseInt($('#stroke15').val());
	if ($('#stroke16').val() != "") stroke_sum  += parseInt($('#stroke16').val());
	if ($('#stroke17').val() != "") stroke_sum  += parseInt($('#stroke17').val());
	if ($('#stroke18').val() != "") stroke_sum  += parseInt($('#stroke18').val());	
	$('#strokesum2').val(stroke_sum);
	
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

// Putter 퍼팅수 1
function putterChk1(obj)
{
	var sum = 0;

	if ($('#putter1').val() != "") sum  += parseInt($('#putter1').val());
	if ($('#putter2').val() != "") sum  += parseInt($('#putter2').val());
	if ($('#putter3').val() != "") sum  += parseInt($('#putter3').val());
	if ($('#putter4').val() != "") sum  += parseInt($('#putter4').val());
	if ($('#putter5').val() != "") sum  += parseInt($('#putter5').val());
	if ($('#putter6').val() != "") sum  += parseInt($('#putter6').val());
	if ($('#putter7').val() != "") sum  += parseInt($('#putter7').val());
	if ($('#putter8').val() != "") sum  += parseInt($('#putter8').val());
	if ($('#putter9').val() != "") sum  += parseInt($('#putter9').val());	
	$('#puttersum1').val(sum);
}
function putterChk2(obj)
{
	var sum = 0;

	if ($('#putter10').val() != "") sum  += parseInt($('#putter10').val());
	if ($('#putter11').val() != "") sum  += parseInt($('#putter11').val());
	if ($('#putter12').val() != "") sum  += parseInt($('#putter12').val());
	if ($('#putter13').val() != "") sum  += parseInt($('#putter13').val());
	if ($('#putter14').val() != "") sum  += parseInt($('#putter14').val());
	if ($('#putter15').val() != "") sum  += parseInt($('#putter15').val());
	if ($('#putter16').val() != "") sum  += parseInt($('#putter16').val());
	if ($('#putter17').val() != "") sum  += parseInt($('#putter17').val());
	if ($('#putter18').val() != "") sum  += parseInt($('#putter18').val());	
	$('#puttersum2').val(sum);
}	

</script>

<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>
