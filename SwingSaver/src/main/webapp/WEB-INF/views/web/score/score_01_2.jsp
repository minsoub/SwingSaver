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
                                    <td>
                                        <input type="date" id="userdate" name="userdate" value="2015-10-10">
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
                                    				<option value="${ctryInfo.code}">${ctryInfo.codename}(${ctryInfo.code})</option>
                                 				</c:forEach>
                                 			</select> 
                                        </div>

                                		<select name="zone_id" id="zone_id" onchange="javascript:changeZone(this.value);">    
                                    		<option value="">지역을 선택해주세요.</option>
                                 		</select> 
                                 		
                                        <select name="countryclub_id"  id="countryclub_id" onchange="javascript:changeCountryClub(this.value);">
                                            <option value="">골프장 선택</option>
                                        </select>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="font-weight-bold"><p>코스</p></td>
                                    <td class="course_td">
                                                                     출발&ensp;
                                        <select id="start_course" name="start_course">
                                            <option value="">OUT 코스 선택</option>
                                        </select>
                                        &emsp;도착&ensp;
                                        <select id="end_course" name="end_course">
                                            <option value="">IN 코스 선택</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold"><p> </p></td>
                                    <td class="course_td">
                                        <button id="btnScoreView" type="button">스코어 상세 등록</button>
                                    </td>
                                </tr>                                
                            </table>

                        </div>

                        <div class="sc-cont" id="course" style="display:none;">
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
                                        <td class="green-td">4</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">5</td>
                                        <td class="green-td">5</td>
                                        <td class="green-td">3</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">5</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">36</td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Stroke</td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td class="gray-td"><input type="text" name="stroke"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td class="gray-td" rowspan="2"><input type="text" name="putts"></td>
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
                                        <td class="gray2-td fir-td">Score</td>
                                        <td><input type="text" name="score1"></td>
                                        <td><input type="text" name="score2"></td>
                                        <td><input type="text" name="score3"></td>
                                        <td><input type="text" name="score4"></td>
                                        <td><input type="text" name="score5"></td>
                                        <td><input type="text" name="score6"></td>
                                        <td><input type="text" name="score7"></td>
                                        <td><input type="text" name="score8"></td>
                                        <td><input type="text" name="score9"></td>
                                        <td class="gray2-td"><input type="text" name="scoreSum"></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Fairway안착</td>
                                        <td><input type="checkbox" name="fairwayon1" value="fairwayon1"></td>
                                        <td><input type="checkbox" name="fairwayon2" value="fairwayon2"></td>
                                        <td><input type="checkbox" name="fairwayon3" value="fairwayon3"></td>
                                        <td><input type="checkbox" name="fairwayon4" value="fairwayon4"></td>
                                        <td><input type="checkbox" name="fairwayon5" value="fairwayon5"></td>
                                        <td><input type="checkbox" name="fairwayon6" value="fairwayon6"></td>
                                        <td><input type="checkbox" name="fairwayon7" value="fairwayon7"></td>
                                        <td><input type="checkbox" name="fairwayon8" value="fairwayon8"></td>
                                        <td><input type="checkbox" name="fairwayon9" value="fairwayon9"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Green적중</td>
                                        <td><input type="checkbox" name="greenon1" value="greenon1"></td>
                                        <td><input type="checkbox" name="greenon2" value="greenon2"></td>
                                        <td><input type="checkbox" name="greenon3" value="greenon3"></td>
                                        <td><input type="checkbox" name="greenon4" value="greenon4"></td>
                                        <td><input type="checkbox" name="greenon5" value="greenon5"></td>
                                        <td><input type="checkbox" name="greenon6" value="greenon6"></td>
                                        <td><input type="checkbox" name="greenon7" value="greenon7"></td>
                                        <td><input type="checkbox" name="greenon8" value="greenon8"></td>
                                        <td><input type="checkbox" name="greenon9" value="greenon9"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Sand Save</td>
                                        <td><input type="checkbox" name="sandsave1" value="sandsave1"></td>
                                        <td><input type="checkbox" name="sandsave2" value="sandsave2"></td>
                                        <td><input type="checkbox" name="sandsave3" value="sandsave3"></td>
                                        <td><input type="checkbox" name="sandsave4" value="sandsave4"></td>
                                        <td><input type="checkbox" name="sandsave5" value="sandsave5"></td>
                                        <td><input type="checkbox" name="sandsave6" value="sandsave6"></td>
                                        <td><input type="checkbox" name="sandsave7" value="sandsave7"></td>
                                        <td><input type="checkbox" name="sandsave8" value="sandsave8"></td>
                                        <td><input type="checkbox" name="sandsave9" value="sandsave9"></td>
                                        <td class="gray-td" rowspan="2"> </td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td">Par Break</td>
                                        <td><input type="checkbox" name="parbreak1" value="parbreak1"></td>
                                        <td><input type="checkbox" name="parbreak2" value="parbreak2"></td>
                                        <td><input type="checkbox" name="parbreak3" value="parbreak3"></td>
                                        <td><input type="checkbox" name="parbreak4" value="parbreak4"></td>
                                        <td><input type="checkbox" name="parbreak5" value="parbreak5"></td>
                                        <td><input type="checkbox" name="parbreak6" value="parbreak6"></td>
                                        <td><input type="checkbox" name="parbreak7" value="parbreak7"></td>
                                        <td><input type="checkbox" name="parbreak8" value="parbreak8"></td>
                                        <td><input type="checkbox" name="parbreak9" value="parbreak9"></td>
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
                                        <td class="green-td">4</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">5</td>
                                        <td class="green-td">5</td>
                                        <td class="green-td">3</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">5</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">4</td>
                                        <td class="green-td">36</td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Stroke</td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td><input type="text" name="stroke"></td>
                                        <td class="gray-td"><input type="text" name="stroke"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Putts</td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td><input type="text" name="putts"></td>
                                        <td class="gray-td" rowspan="2"><input type="text" name="putts"></td>
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
                                        <td class="gray2-td fir-td">Score</td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td><input type="text" name="score"></td>
                                        <td class="gray2-td"><input type="text" name="score"></td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Fairway안착</td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td><input type="checkbox" name="fairway" value="fairway"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td">Green적중</td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td><input type="checkbox" name="green" value="green"></td>
                                        <td class="gray-td"> </td>
                                    </tr>
                                    <tr>
                                        <td class="gray-td fir-td" rowspan="2">Sand Save</td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td class="gray-td" rowspan="2"> </td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                        <td><input type="checkbox" name="sandsave" value="sandsave"></td>
                                    </tr>

                                    <tr>
                                        <td class="gray-td fir-td">Par Break</td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td><input type="checkbox" name="parbreak" value="parbreak"></td>
                                        <td class="gray-td"> </td>
                                    </tr>





                                </table>
                            </div>





                            <button class="form-btn" onclick="#">등록하기</button>








                        </div>










                    </div>

                </div>
            </div>
        </article>
    </section>




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
                                    <td><img src="/image/direction-1.png" width="100%"></td>
                                    <td><img src="/image/direction-2.png" width="100%"></td>
                                    <td><img src="/image/direction-3.png" width="100%"></td>
                                    <td><img src="/image/direction-4.png" width="100%"></td>
                                    <td><img src="/image/direction-5.png" width="100%"></td>
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
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/jl_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/jr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/ol_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/or_on.gif" width="100%">
                        </div>

                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/os_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/sl_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/sr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="/image/ss_on.gif" width="100%">
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


<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

</body>
<script>

$(document).ready(function(){
    $("#btnSave").click(function(){
    	fn_golfSave();
    });
    
    $("#btnScoreView").click(function(){
    	if ($("#country_id").val() == "")
    	{
    		alert("국가코드를 선택하지 않았습니다!!!");
    		return;
    	}	
    	if ($("#zone_id").val() == "")
    	{
    		alert("지역을 선택하지 않았습니다!!!");
    		return;
    	}
    	if ($("#countryclub_id").val() == "")
    	{
    		alert("골프장을 선택하지 않았습니다!!!");
    		return;
    	}
    	if ($("#start_course").val() == "")
    	{
    		alert("출발 OUT코스를 선택하지 않았습니다!!!");
    		return;
    	}
    	if ($("#end_course").val() == "")
    	{
    		alert("도착 IN코스를 선택하지 않았습니다!!!");
    		return;
    	}  
    	// 선택했다면 해당 정보를 보여준다.
    	$('#course').css("display", "block");
    });
});

	// 국가 코드를 선택했을 대 호출되는 메소드로 지역 정보를 콤보박스로 구성한다.
	function changeCountry(data)
	{
		// zone_id clear
		$("#zone_id").empty();
		
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
	

	function fn_golfSave()
	{
	    if($("#country_id").val() == ""){
	        alert("국가코드를 선택하세요");
	        $("#country_id").focus();
	        return;
	    }
	    if($("#zone_id").val() == ""){
	        alert("지역코드를 선택하세요");
	        $("#zone_id").focus();
	        return;
	    }
	    //if($("#countryclub_id").val() == ""){
	    //    alert("콜프장 코드를 입력하세요");
	    //    $("#countryclub_id").focus();
	    //    return;
	    //}	    
	    if($("#countryclub_nm").val() == ""){
	        alert("콜프장명을 입력하세요");
	        $("#countryclub_nm").focus();
	        return;
	    }
	    /*	    if($("#hole_value").val() == ""){
	        alert("홀 수를 입력하세요");
	        $("#hole_value").focus();
	        return;
	    }

	    if($("#address").val() == ""){
	        alert("지역담당자 주소를 입력하세요");
	        $("#address").focus();
	        return;
	    }
	    if($("#phone").val() == ""){
	        alert("연락처를 입력하세요");
	        $("#phone").focus();
	        return;
	    }	
	*/    
	    
	    document.forms1.action = "/admin/golf/add";
	    document.forms1.submit();
	}
</script>
</html>
