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
                    <h2 class="right-tit">내 스코어 관리</h2>

                    <div class="score-page form-page">
                        <div class="sc-search">
                            <table>
                                <colgroup>
                                    <col width="17%">
                                    <col width="23%">
                                    <col width="40%">
                                    <col width="30%">
                                </colgroup>


                                <tr>
                                    <td class="font-weight-bold"><p>날짜</p></td>
                                    <td colspan="4">
                                    <input type="date" id="userdate" name="userdate" value="2015-10-10">
                                    ~
                                    <input type="date" id="userdate" name="userdate" value="2015-10-10">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold"><p>골프장</p></td>
                                    <td>
                                       <div class="chk_cou_rad">
                                       <input type="radio" name="chk_country" value="domestic" checked="checked"><p>국내</p>
                                       </div>
                                       <div class="chk_cou_rad">
                                        <input type="radio" name="chk_country" value="foreign"><p>국외</p>
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
                        
                        <div class="sc-cont text-center">
                           <table>
                               <tr>
                                   <th>날짜</th>
                                   <th>골프장</th>
                                   <th>출발</th>
                                   <th>종료</th>
                                   <th>PAR</th>
                                   <th>TOTAL</th>
                               </tr>
                                <tr>
                                   <td class="gray-td">2019-02-19</td>
                                   <td>한국골프장</td>
                                   <td>OUT</td>
                                   <td>IN</td>
                                   <td>12</td>
                                   <td class="gray-td">34</td>
                               </tr>
                                <tr>
                                   <td class="gray-td">2019-02-19</td>
                                   <td>한국골프장</td>
                                   <td>OUT</td>
                                   <td>IN</td>
                                   <td>12</td>
                                   <td class="gray-td">34</td>
                               </tr>                                                                                                       
                                <tr>
                                   <td class="gray-td">2019-02-19</td>
                                   <td>한국골프장</td>
                                   <td>OUT</td>
                                   <td>IN</td>
                                   <td>12</td>
                                   <td class="gray-td">34</td>
                               </tr>
                                <tr>
                                   <td class="gray-td">2019-02-19</td>
                                   <td>한국골프장</td>
                                   <td>OUT</td>
                                   <td>IN</td>
                                   <td>12</td>
                                   <td class="gray-td">34</td>
                               </tr>                               
                               
                                <tr>
                                   <td class="gray-td">2019-02-19</td>
                                   <td>한국골프장</td>
                                   <td>OUT</td>
                                   <td>IN</td>
                                   <td>12</td>
                                   <td class="gray-td">34</td>
                               </tr>                               
                                <tr>
                                   <td class="gray-td">2019-02-19</td>
                                   <td>한국골프장</td>
                                   <td>OUT</td>
                                   <td>IN</td>
                                   <td>12</td>
                                   <td class="gray-td">34</td>
                               </tr>                               
                               
                               
                               
                               
                               
                               
                           </table>                           
                        <button id="btnAdd" class="form-btn" onclick="#">스코어 등록</button>                            
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </section>

    <!-- Footer -->
	<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
<script>

    $(document).ready(function(){
        $("#btnAdd").click(function(){
			location.href="/score/scoreAdd";
        });     	
    });

</script>
</html>
