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
                                            <input type="radio" name="chk_country" value="domestic" checked="checked">
                                            <p>국내</p>
                                            <input type="radio" name="chk_country" value="foreign">
                                            <p>국외</p>
                                        </div>


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

                                </tr>
                                <tr>
                                    <td class="font-weight-bold"><p>코스</p></td>
                                    <td class="course_td">
                                            출발&ensp;
                                            <select name="course_1">
                                            <option value="out">OUT</option>
                                            <option value=" "> </option>
                                            <option value=" "> </option>
                                            <option value=" "> </option>
                                        </select>
                                            &emsp;도착&ensp;
                                            <select name="course_2">
                                            <option value="in">IN</option>
                                            <option value=" "> </option>
                                            <option value=" "> </option>
                                            <option value=" "> </option>
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
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/jl_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/jr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/ol_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/or_on.gif" width="100%">
                        </div>

                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/os_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/sl_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/sr_on.gif" width="100%">
                        </div>
                        <div class="modal-pt">
                            <input type="radio" name="putts01" checked="checked" value="putts01" />
                            <img src="../image/ss_on.gif" width="100%">
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


<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

</body>
</html>
