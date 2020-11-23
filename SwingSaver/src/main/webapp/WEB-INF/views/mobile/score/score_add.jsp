<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
<%@include file="/WEB-INF/views/mobile/include/top_menu.jsp"%>

<c:set var="now" value="<%=new java.util.Date()%>" />


    <section id="contents" class="">
    
    <form name="frm" id="frm">
    <input type="hidden" name="visit_date" id="visit_date" value="<c:if test='${scoreInfo ne null}'>${scoreInfo.visit_date}</c:if>
                	<c:if test='${scoreInfo eq null}'><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:if>">
    <input type="hidden" name="countryclub_id" id="countryclub_id" value="${golfInfo.countryclub_id}">
    <input type="hidden" name="start_course" id="start_course" value="${parInfo1.course}">
    <input type="hidden" name="end_course" id="end_course" value="${parInfo2.course}">
    <input type="hidden" name="seq_no" id="seq_no" value="1">
        
        <div class="con-wrap">
            <div class="date-wrap">
                <div class="sc-date">
                	<c:if test='${scoreInfo ne null}'>${scoreInfo.visit_date}</c:if>
                	<c:if test='${scoreInfo eq null}'><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:if>
                </div>
                <a href="/m/score" class="sta-btn">리스트보기</a>
            </div>
            <div class="sc-btn-wrap">
                <div class="sc-golf-name">${golfInfo.countryclub_nm}</div>
                <a href="#" class="sta-btn gray-btn">스코어카드</a>
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
                        <th>Tracking</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <td><span id="hole1">${parInfo1.hole1}</span></td>
                        <td><input class= "input_data" type="number" id="stroke1" name="stroke1" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke1}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score1" name="score1"  readonly maxlength="2" value="${scoreInfo.score1}" readonly></td>
                        <td><select id="fairwayon1" name="fairwayon1">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon1 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon1 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon1 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon1" value="Y" <c:if test='${scoreInfo.greenon1 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter1" name="putter1" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter1}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td><span id="hole2">${parInfo1.hole2}</span></td>
                        <td><input class= "input_data" type="number" id="stroke2" name="stroke2" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke2}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score2" name="score2"  readonly maxlength="2" value="${scoreInfo.score2}"></td>
                        <td><select id="fairwayon2" name="fairwayon2">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon2 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon2 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon2 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon2" value="Y" <c:if test='${scoreInfo.greenon2 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter2" name="putter2" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter2}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td><span id="hole3">${parInfo1.hole3}</span></td>
                        <td><input class= "input_data" type="number" id="stroke3" name="stroke3" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke3}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score3" name="score3"  readonly maxlength="2" value="${scoreInfo.score3}"></td>
                        <td><select id="fairwayon3" name="fairwayon3">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon3 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon3 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon3 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon3" value="Y" <c:if test='${scoreInfo.greenon3 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter3" name="putter3" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter3}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td><span id="hole4">${parInfo1.hole4}</span></td>
                        <td><input class= "input_data" type="number" id="stroke4" name="stroke4" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke4}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score4" name="score4"  readonly maxlength="2" value="${scoreInfo.score4}"></td>
                        <td><select id="fairwayon4" name="fairwayon4">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon4 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon4 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon4 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon4" value="Y" <c:if test='${scoreInfo.greenon4 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter4" name="putter4" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter4}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td><span id="hole5">${parInfo1.hole5}</span></td>
                        <td><input class= "input_data" type="number" id="stroke5" name="stroke5" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke5}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score5" name="score5"  readonly maxlength="2" value="${scoreInfo.score5}"></td>
                        <td><select id="fairwayon5" name="fairwayon5">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon5 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon5 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon5 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon5" value="Y" <c:if test='${scoreInfo.greenon5 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter5" name="putter5" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter5}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td><span id="hole6">${parInfo1.hole6}</span></td>
                        <td><input class= "input_data" type="number" id="stroke6" name="stroke6" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke6}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score6" name="score6"  readonly maxlength="2" value="${scoreInfo.score6}"></td>
                        <td><select id="fairwayon6" name="fairwayon6">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon6 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon6 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon6 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon6" value="Y" <c:if test='${scoreInfo.greenon6 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter6" name="putter6" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter6}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td><span id="hole7">${parInfo1.hole7}</span></td>
                        <td><input class= "input_data" type="number" id="stroke7" name="stroke7" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke7}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score7" name="score7"  readonly maxlength="2" value="${scoreInfo.score7}"></td>
                        <td><select id="fairwayon7" name="fairwayon7">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon7 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon7 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon7 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon7" value="Y" <c:if test='${scoreInfo.greenon7 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter7" name="putter7" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter7}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td><span id="hole8">${parInfo1.hole8}</span></td>
                        <td><input class= "input_data" type="number" id="stroke8" name="stroke8" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke8}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score8" name="score8"  readonly maxlength="2" value="${scoreInfo.score8}"></td>
                        <td><select id="fairwayon8" name="fairwayon8">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon8 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon8 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon8 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon8" value="Y" <c:if test='${scoreInfo.greenon8 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter8" name="putter8" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter8}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td><span id="hole9">${parInfo1.hole9}</span></td>
                        <td><input class= "input_data" type="number" id="stroke9" name="stroke9" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke9}" onkeyup="strokeChk1(this)"></td>
                        <td><input class= "input_data" type="text" id="score9" name="score9"  readonly maxlength="2" value="${scoreInfo.score9}"></td>
                        <td><select id="fairwayon9" name="fairwayon9">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon9 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon9 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon9 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon9" value="Y" <c:if test='${scoreInfo.greenon9 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter9" name="putter9" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter9}" onkeyup="putterChk1(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
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
                        <th>Tracking</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <td><span id="hole10">${parInfo2.hole1}</span></td>
                        <td><input class= "input_data" type="number" id="stroke10" name="stroke10" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke10}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score10" name="score10"  readonly maxlength="2" value="${scoreInfo.score10}"></td>
                        <td><select id="fairwayon10" name="fairwayon10">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon10 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon10 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon10 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon10" value="Y" <c:if test='${scoreInfo.greenon10 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter10" name="putter10" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter10}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td><span id="hole11">${parInfo2.hole2}</span></td>
                        <td><input class= "input_data" type="number" id="stroke11" name="stroke11" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke11}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score11" name="score11"  readonly maxlength="2" value="${scoreInfo.score11}"></td>
                        <td><select id="fairwayon11" name="fairwayon11">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon11 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon11 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon11 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon11" value="Y" <c:if test='${scoreInfo.greenon11 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter11" name="putter11" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter11}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td><span id="hole12">${parInfo2.hole3}</span></td>
                        <td><input class= "input_data" type="number" id="stroke12" name="stroke12" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke12}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score12" name="score12"  readonly maxlength="2" value="${scoreInfo.score12}"></td>
                        <td><select id="fairwayon12" name="fairwayon12">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon12 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon12 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon12 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon12" value="Y" <c:if test='${scoreInfo.greenon12 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter12" name="putter12" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter12}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td><span id="hole13">${parInfo2.hole4}</span></td>
                        <td><input class= "input_data" type="number" id="stroke13" name="stroke13" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke13}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score13" name="score13"  readonly maxlength="2" value="${scoreInfo.score13}"></td>
                        <td><select id="fairwayon13" name="fairwayon13">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon13 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon13 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon13 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon13" value="Y" <c:if test='${scoreInfo.greenon13 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter13" name="putter13" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter13}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td><span id="hole14">${parInfo2.hole5}</span></td>
                        <td><input class= "input_data" type="number" id="stroke14" name="stroke14" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke14}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score14" name="score14"  readonly maxlength="2" value="${scoreInfo.score14}"></td>
                        <td><select id="fairwayon14" name="fairwayon14">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon14 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon14 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon14 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon14" value="Y" <c:if test='${scoreInfo.greenon14 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter14" name="putter14" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter14}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td><span id="hole15">${parInfo2.hole6}</span></td>
                        <td><input class= "input_data" type="number" id="stroke15" name="stroke15" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke15}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score15" name="score15"  readonly maxlength="2" value="${scoreInfo.score15}"></td>
                        <td><select id="fairwayon15" name="fairwayon15">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon15 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon15 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon15 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon15" value="Y" <c:if test='${scoreInfo.greenon15 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter15" name="putter15" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter15}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td><span id="hole16">${parInfo2.hole7}</span></td>
                        <td><input class= "input_data" type="number" id="stroke16" name="stroke16" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke16}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score16" name="score16"  readonly maxlength="2" value="${scoreInfo.score16}"></td>
                        <td><select id="fairwayon16" name="fairwayon16">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon16 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon16 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon16 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon16" value="Y" <c:if test='${scoreInfo.greenon16 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter16" name="putter16" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter16}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td><span id="hole17">${parInfo2.hole8}</span></td>
                        <td><input class= "input_data" type="number" id="stroke17" name="stroke17" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke17}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score17" name="score17"  readonly maxlength="2" value="${scoreInfo.score17}"></td>
                        <td><select id="fairwayon17" name="fairwayon17">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon17 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon17 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon17 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon17" value="Y" <c:if test='${scoreInfo.greenon17 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter17" name="putter17" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter17}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td><span id="hole18">${parInfo2.hole9}</span></td>
                        <td><input class= "input_data" type="number" id="stroke18" name="stroke18" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.stroke18}" onkeyup="strokeChk2(this)"></td>
                        <td><input class= "input_data" type="text" id="score18" name="score18"  readonly maxlength="2" value="${scoreInfo.score18}"></td>
                        <td><select id="fairwayon18" name="fairwayon18">
                        	<option value="">F/W 선택</option>
                        	<option value="L" <c:if test='${scoreInfo.fairwayon18 eq "L"}'>checked</c:if>>Left</option>
                        	<option value="Y" <c:if test='${scoreInfo.fairwayon18 eq "Y"}'>checked</c:if>>OK</option>
                        	<option value="R" <c:if test='${scoreInfo.fairwayon18 eq "R"}'>checked</c:if>>Right</option>
                        </select></td>
                        <td><input type="checkbox" name="greenon18" value="Y" <c:if test='${scoreInfo.greenon18 eq "Y"}'>checked</c:if>></td>
                        <td><input class= "input_data" type="number" id="putter18" name="putter18" maxlength="2" oninput="maxLengthCheck(this)" value="${scoreInfo.putter18}" onkeyup="putterChk2(this)"></td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
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
			<a class="bud-btn red-btn" href="#" id="saveScore">저장하기</a>

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
            
            
        </script>

        <!-- f/w Modal -->
        <div class="modal-wrapper fw-modal">
            <div class="modal">

                <div class="content">
                    <div class="mod-tit">
                        <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                        <h2>Fair Way</h2>
                        <a href="" class="fw-input">Left</a>
                        <a href="" class="fw-input">Ok</a>
                        <a href="" class="fw-input">Right</a>
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
        <div class="modal-wrapper green-modal">
            <div class="modal">

                <div class="content">
                    <div class="mod-tit">
                        <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                        <h2>green</h2>
                        <a href="" class="fw-input">Ok</a>
                        <a href="" class="fw-input">No</a>
                    </div>
                </div>
                <div class="clo-wrap">
                    <a class="btn-close trigger2" href="#">닫기
                  </a>
                </div>
            </div>
        </div>
        <!-- green Modal -->
<script>
$(document).ready(function(){
	// Stroke 변경에 의해서 다시 재계산한다.
	function ScoreChk1()
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
		
		if ($('#stroke1').val() != "") stroke_sum  += $('#stroke1').val();
		if ($('#stroke2').val() != "") stroke_sum  += $('#stroke2').val();
		if ($('#stroke3').val() != "") stroke_sum  += $('#stroke3').val();
		if ($('#stroke4').val() != "") stroke_sum  += $('#stroke4').val();
		if ($('#stroke5').val() != "") stroke_sum  += $('#stroke5').val();
		if ($('#stroke6').val() != "") stroke_sum  += $('#stroke6').val();
		if ($('#stroke7').val() != "") stroke_sum  += $('#stroke7').val();
		if ($('#stroke8').val() != "") stroke_sum  += $('#stroke8').val();
		if ($('#stroke9').val() != "") stroke_sum  += $('#stroke9').val();	
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
	
	function ScoreChk2()
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
		
		if ($('#stroke10').val() != "") stroke_sum  += $('#stroke10').val();
		if ($('#stroke11').val() != "") stroke_sum  += $('#stroke11').val();
		if ($('#stroke12').val() != "") stroke_sum  += $('#stroke12').val();
		if ($('#stroke13').val() != "") stroke_sum  += $('#stroke13').val();
		if ($('#stroke15').val() != "") stroke_sum  += $('#stroke14').val();
		if ($('#stroke15').val() != "") stroke_sum  += $('#stroke15').val();
		if ($('#stroke16').val() != "") stroke_sum  += $('#stroke16').val();
		if ($('#stroke17').val() != "") stroke_sum  += $('#stroke17').val();
		if ($('#stroke18').val() != "") stroke_sum  += $('#stroke18').val();	
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
	function putterChk1()
	{
		var sum = 0;

		if ($('#putter1').val() != "") sum  += $('#putter1').val();
		if ($('#putter2').val() != "") sum  += $('#putter2').val();
		if ($('#putter3').val() != "") sum  += $('#putter3').val();
		if ($('#putter4').val() != "") sum  += $('#putter4').val();
		if ($('#putter5').val() != "") sum  += $('#putter5').val();
		if ($('#putter6').val() != "") sum  += $('#putter6').val();
		if ($('#putter7').val() != "") sum  += $('#putter7').val();
		if ($('#putter8').val() != "") sum  += $('#putter8').val();
		if ($('#putter9').val() != "") sum  += $('#putter9').val();	
		$('#puttersum1').val(sum);
	}
	function putterChk2()
	{
		var sum = 0;

		if ($('#putter10').val() != "") sum  += $('#putter10').val();
		if ($('#putter11').val() != "") sum  += $('#putter11').val();
		if ($('#putter12').val() != "") sum  += $('#putter12').val();
		if ($('#putter13').val() != "") sum  += $('#putter13').val();
		if ($('#putter14').val() != "") sum  += $('#putter14').val();
		if ($('#putter15').val() != "") sum  += $('#putter15').val();
		if ($('#putter16').val() != "") sum  += $('#putter16').val();
		if ($('#putter17').val() != "") sum  += $('#putter17').val();
		if ($('#putter18').val() != "") sum  += $('#putter18').val();	
		$('#puttersum2').val(sum);
	}	
	
	
    $("#saveScore").click(function(){
    	if (confirm("입력된 정보를 저장하시겠습니까?"))
    	{
    		forms1.action = "/m/score/scoreSave";
    		forms1.submit();
    	}
    });	
});

<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>
