<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/score_header.jsp"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<input type="file" name="attachFile00" id="attachFile00" onchange="readURL(this);" style="display:none;"/>
  <section class="container no-padding">
    <div class="col-xs-12" style="padding: 0">
       	<button id="btnSave"   class="form-btn" onclick="#">이미지저장하기</button>
        <button id="btnChange" class="img-btn"  onclick="#">이미지변경하기</button>
        <!-- button id="btnMng"    class="img-btn"  onclick="#">스코어관리하기</button  -->

		<div class="container myCanvas">
            <div class="top-wrap">
                 <img src="/image/logo.png">
                 <div class="sc-wrap">
                     <div class="sc-left">
                          <p><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /><br/><strong>${qrInfo.username}님</strong></p>
                     </div>
                     <div class="sc-right">
                          <h1>${scoreVo.score_sum}</h1><p>(${scoreVo.score_plus_sum})</p>
                     </div>                            
                 </div>
            </div>
    		<div class="" style="margin: 0px">
                <!-- img id="preview" src="/image/sc-print-bn.jpg" width="100%"  -->
                <img id="preview" src="<c:url value='${golfInfo.image_url}'/>" width="100%">
                <div class="sc-print">
                  <div>
                    <table>
                      <colgroup>
                        <col width="19%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="7%"/>
                        <col width="18%"/>                      
                      </colgroup>
                      <tr class=" ">
                        <th class=" ">HOLE</th>
                        <th>1</th>
                        <th>2</th>
                        <th>3</th>
                        <th>4</th>
                        <th>5</th>
                        <th>6</th>
                        <th>7</th>
                        <th>8</th>
                        <th>9</th>
                        <th>OUT</th>
                      </tr>
                      <tr class="green-td">
                        <td>PAR</td>
                        <td>${parInfo1.hole1}</td>
                        <td>${parInfo1.hole2}</td>
                        <td>${parInfo1.hole3}</td>
                        <td>${parInfo1.hole4}</td>
                        <td>${parInfo1.hole5}</td>
                        <td>${parInfo1.hole6}</td>
                        <td>${parInfo1.hole7}</td>
                        <td>${parInfo1.hole8}</td>
                        <td>${parInfo1.hole9}</td>
                        <td>${parInfo1.sum}</td>
                      </tr>
                      <tr class="user-td">
                        <td>${qrInfo.username}</td>
                        <td class="<c:if test="${scoreVo.scorechk1 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk1 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk1 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score1 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score1 != 0}">${scoreVo.scorechk1}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk2 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk2 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk2 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score2 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score2 != 0}">${scoreVo.scorechk2}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk3 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk3 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk3 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score3 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score3 != 0}">${scoreVo.scorechk3}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk4 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk4 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk4 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score4 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score4 != 0}">${scoreVo.scorechk4}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk5 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk5 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk5 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score5 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score5 != 0}">${scoreVo.scorechk5}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk6 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk6 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk6 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score6 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score6 != 0}">${scoreVo.scorechk6}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk7 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk7 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk7 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score7 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score7 != 0}">${scoreVo.scorechk7}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk8 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk8 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk8 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score8 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score8 != 0}">${scoreVo.scorechk8}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk9 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk9 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk9 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score9 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score9 != 0}">${scoreVo.scorechk9}</c:if></td>
                        <td>${scoreVo.scorechksum1}</td>
                      </tr>
                      <c:if test="${scoreVo2.error != 'NO'}">
                      <tr class="team-td">
                        <td>${qrInfo.othername1}</td>
                        <td class="<c:if test="${scoreVo2.scorechk1 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk1 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk1 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score1 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score1 != 0}">${scoreVo2.scorechk1}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk2 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk2 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk2 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score2 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score2 != 0}">${scoreVo2.scorechk2}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk3 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk3 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk3 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score3 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score3 != 0}">${scoreVo2.scorechk3}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk4 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk4 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk4 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score4 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score4 != 0}">${scoreVo2.scorechk4}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk5 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk5 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk5 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score5 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score5 != 0}">${scoreVo2.scorechk5}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk6 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk6 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk6 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score6 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score6 != 0}">${scoreVo2.scorechk6}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk7 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk7 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk7 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score7 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score7 != 0}">${scoreVo2.scorechk7}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk8 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk8 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk8 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score8 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score8 != 0}">${scoreVo2.scorechk8}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk9 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk9 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk9 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score9 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score9 != 0}">${scoreVo2.scorechk9}</c:if></td>
                        <td>${scoreVo2.scorechksum1}</td>
                      </tr>  
                      </c:if>   
                      <c:if test="${scoreVo3.error != 'NO'}">                         
                      <tr class="team-td">
                        <td>${qrInfo.othername2}</td>
                        <td class="<c:if test="${scoreVo3.scorechk1 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk1 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk1 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score1 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score1 != 0}">${scoreVo3.scorechk1}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk2 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk2 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk2 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score2 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score2 != 0}">${scoreVo3.scorechk2}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk3 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk3 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk3 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score3 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score3 != 0}">${scoreVo3.scorechk3}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk4 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk4 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk4 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score4 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score4 != 0}">${scoreVo3.scorechk4}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk5 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk5 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk5 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score5 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score5 != 0}">${scoreVo3.scorechk5}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk6 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk6 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk6 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score6 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score6 != 0}">${scoreVo3.scorechk6}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk7 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk7 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk7 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score7 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score7 != 0}">${scoreVo3.scorechk7}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk8 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk8 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk8 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score8 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score8 != 0}">${scoreVo3.scorechk8}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk9 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk9 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk9 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score9 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score9 != 0}">${scoreVo3.scorechk9}</c:if></td>
                        <td>${scoreVo3.scorechksum1}</td>
                      </tr> 
                      </c:if>
                      <c:if test="${scoreVo4.error != 'NO'}">                     
                      <tr class="team-td">
                        <td>${qrInfo.othername3}</td>
                        <td class="<c:if test="${scoreVo4.scorechk1 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk1 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk1 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score1 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score1 != 0}">${scoreVo4.scorechk1}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk2 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk2 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk2 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score2 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score2 != 0}">${scoreVo4.scorechk2}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk3 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk3 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk3 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score3 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score3 != 0}">${scoreVo4.scorechk3}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk4 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk4 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk4 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score4 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score4 != 0}">${scoreVo4.scorechk4}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk5 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk5 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk5 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score5 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score5 != 0}">${scoreVo4.scorechk5}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk6 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk6 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk6 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score6 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score6 != 0}">${scoreVo4.scorechk6}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk7 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk7 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk7 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score7 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score7 != 0}">${scoreVo4.scorechk7}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk8 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk8 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk8 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score8 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score8 != 0}">${scoreVo4.scorechk8}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk9 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk9 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk9 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score9 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score9 != 0}">${scoreVo4.scorechk9}</c:if></td>
                        <td>${scoreVo4.scorechksum1}</td>
                      </tr>   
                      </c:if>                       
                    </table>
                    <table>
                      <colgroup>
                       <col width="19%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="7%"/>
                       <col width="18%"/>                      
                      </colgroup>
                      <tr class=" ">
                       <th class=" ">HOLE</th>
                       <th>1</th>
                       <th>2</th>
                       <th>3</th>
                       <th>4</th>
                       <th>5</th>
                       <th>6</th>
                       <th>7</th>
                       <th>8</th>
                       <th>9</th>
                       <th>IN</th>
                      </tr>
                      <tr class="green-td">
                        <td>PAR</td>
                        <td>${parInfo2.hole1}</td>
                        <td>${parInfo2.hole2}</td>
                        <td>${parInfo2.hole3}</td>
                        <td>${parInfo2.hole4}</td>
                        <td>${parInfo2.hole5}</td>
                        <td>${parInfo2.hole6}</td>
                        <td>${parInfo2.hole7}</td>
                        <td>${parInfo2.hole8}</td>
                        <td>${parInfo2.hole9}</td>
                        <td>${parInfo2.sum}</td>
                      </tr>
                      <tr class="user-td">
                        <td>${qrInfo.username}</td>
                        <td class="<c:if test="${scoreVo.scorechk10 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk10 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk10 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score10 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score10 != 0}">${scoreVo.scorechk10}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk11 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk11 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk11 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score11 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score11 != 0}">${scoreVo.scorechk11}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk12 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk12 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk12 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score12 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score12 != 0}">${scoreVo.scorechk12}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk13 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk13 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk13 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score13 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score13 != 0}">${scoreVo.scorechk13}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk14 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk14 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk14 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score14 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score14 != 0}">${scoreVo.scorechk14}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk15 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk15 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk15 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score15 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score15 != 0}">${scoreVo.scorechk15}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk16 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk16 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk16 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score16 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score16 != 0}">${scoreVo.scorechk16}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk17 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk17 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk17 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score17 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score17 != 0}">${scoreVo.scorechk17}</c:if></td>
                        <td class="<c:if test="${scoreVo.scorechk18 < 0}">pl-num</c:if><c:if test="${scoreVo.scorechk18 == 0}">pl2-num</c:if><c:if test="${scoreVo.scorechk18 > 0}">mi-num</c:if>"><c:if test="${scoreVo.score18 == 0}">&nbsp;</c:if><c:if test="${scoreVo.score18 != 0}">${scoreVo.scorechk18}</c:if></td>
                        <td>${scoreVo.scorechksum2}</td>
                      </tr>
                      <c:if test="${scoreVo2.error != 'NO'}">
                      <tr class="team-td">
                        <td>${qrInfo.othername1}</td>
                        <td class="<c:if test="${scoreVo2.scorechk10 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk10 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk10 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score10 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score10 != 0}">${scoreVo2.scorechk10}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk11 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk11 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk11 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score11 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score11 != 0}">${scoreVo2.scorechk11}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk12 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk12 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk12 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score12 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score12 != 0}">${scoreVo2.scorechk12}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk13 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk13 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk13 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score13 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score13 != 0}">${scoreVo2.scorechk13}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk14 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk14 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk14 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score14 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score14 != 0}">${scoreVo2.scorechk14}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk15 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk15 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk15 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score15 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score15 != 0}">${scoreVo2.scorechk15}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk16 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk16 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk16 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score16 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score16 != 0}">${scoreVo2.scorechk16}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk17 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk17 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk17 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score17 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score17 != 0}">${scoreVo2.scorechk17}</c:if></td>
                        <td class="<c:if test="${scoreVo2.scorechk18 < 0}">pl-num</c:if><c:if test="${scoreVo2.scorechk18 == 0}">pl2-num</c:if><c:if test="${scoreVo2.scorechk18 > 0}">mi-num</c:if>"><c:if test="${scoreVo2.score18 == 0}">&nbsp;</c:if><c:if test="${scoreVo2.score18 != 0}">${scoreVo2.scorechk18}</c:if></td>
                        <td>${scoreVo2.scorechksum2}</td>
                      </tr> 
                      </c:if>
                      <c:if test="${scoreVo3.error != 'NO'}">                                
                      <tr class="team-td">
                        <td>${qrInfo.othername2}</td>
                        <td class="<c:if test="${scoreVo3.scorechk10 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk10 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk10 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score10 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score10 != 0}">${scoreVo3.scorechk10}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk11 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk11 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk11 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score11 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score11 != 0}">${scoreVo3.scorechk11}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk12 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk12 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk12 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score12 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score12 != 0}">${scoreVo3.scorechk12}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk13 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk13 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk13 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score13 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score13 != 0}">${scoreVo3.scorechk13}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk14 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk14 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk14 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score14 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score14 != 0}">${scoreVo3.scorechk14}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk15 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk15 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk15 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score15 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score15 != 0}">${scoreVo3.scorechk15}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk16 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk16 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk16 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score16 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score16 != 0}">${scoreVo3.scorechk16}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk17 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk17 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk17 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score17 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score17 != 0}">${scoreVo3.scorechk17}</c:if></td>
                        <td class="<c:if test="${scoreVo3.scorechk18 < 0}">pl-num</c:if><c:if test="${scoreVo3.scorechk18 == 0}">pl2-num</c:if><c:if test="${scoreVo3.scorechk18 > 0}">mi-num</c:if>"><c:if test="${scoreVo3.score18 == 0}">&nbsp;</c:if><c:if test="${scoreVo3.score18 != 0}">${scoreVo3.scorechk18}</c:if></td>
                        <td>${scoreVo3.scorechksum2}</td>
                      </tr>
                      </c:if>
                      <c:if test="${scoreVo4.error != 'NO'}">                  
                      <tr class="team-td">
                        <td>${qrInfo.othername3}</td>
                        <td class="<c:if test="${scoreVo4.scorechk10 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk10 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk10 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score10 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score10 != 0}">${scoreVo4.scorechk10}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk11 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk11 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk11 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score11 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score11 != 0}">${scoreVo4.scorechk11}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk12 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk12 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk12 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score12 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score12 != 0}">${scoreVo4.scorechk12}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk13 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk13 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk13 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score13 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score13 != 0}">${scoreVo4.scorechk13}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk14 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk14 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk14 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score14 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score14 != 0}">${scoreVo4.scorechk14}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk15 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk15 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk15 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score15 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score15 != 0}">${scoreVo4.scorechk15}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk16 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk16 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk16 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score16 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score16 != 0}">${scoreVo4.scorechk16}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk17 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk17 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk17 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score17 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score17 != 0}">${scoreVo4.scorechk17}</c:if></td>
                        <td class="<c:if test="${scoreVo4.scorechk18 < 0}">pl-num</c:if><c:if test="${scoreVo4.scorechk18 == 0}">pl2-num</c:if><c:if test="${scoreVo4.scorechk18 > 0}">mi-num</c:if>"><c:if test="${scoreVo4.score18 == 0}">&nbsp;</c:if><c:if test="${scoreVo4.score18 != 0}">${scoreVo4.scorechk18}</c:if></td>
                        <td>${scoreVo4.scorechksum2}</td>
                      </tr>
                      </c:if>
                    </table>
               </div>                                
           </div>
             
        </div>
     </div>
     <c:if test="${golfInfo.link_check == 'Y'}">
     <div class="bottom-bn">
        <p>이제 <strong>스윙세이버</strong>로 내 스코어를 직접 관리해보세요. <span><a href="javascript:fn_mngScoreList();">www.swingsaver.co.kr</a></span></p>
     </div> 
     </c:if>
  </div>
              
                        
                                        
                                   
                       
        <!-- div class="score-page form-page" style="margin: 0px">
           <div class="test">
           
           
              <!-- img src="/image/sc-image.png" width="100%"  
           </div>
           
           <div class="sc-ad">
              <p><strong>스코어 관리</strong>가 필요하신가요?<br/>
              <a href=""><span>스윙세이버를 시작! <strong><a href="javascript:fn_mngScoreList();">Click!</a></strong></span></a></p>
            </div>                                                             
        </div>
    </div -->
</section>
  
  
<form id='forms1' name="forms1" method="POST">
<input type="hidden" name="zone_id" value="${qrInfo.zone_id}">
<input type="hidden" name="countryclub_id" value="${qrInfo.countryclub_id}">
<input type="hidden" name="startcourse" value="${qrInfo.startcourse}">
<input type="hidden" name="endcourse" value="${qrInfo.endcourse}">
<input type="hidden" name="username" value="${qrInfo.username}">
<input type="hidden" name="score" value="${qrInfo.score}">
<input type="hidden" name="othername1" value="${qrInfo.othername1}">
<input type="hidden" name="score1" value="${qrInfo.score1}">
<input type="hidden" name="othername2" value="${qrInfo.othername2}">
<input type="hidden" name="score2" value="${qrInfo.score2}">
<input type="hidden" name="othername3" value="${qrInfo.othername3}">
<input type="hidden" name="score3" value="${qrInfo.score3}">	
</form>      
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/html2canvas.min.js"></script>
<script type="text/javascript" src="/js/canvas2image.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var test = $(".myCanvas").get(0);  // html 얻기

    $("#btnMng").click(function(){
    	fn_mngScoreList();
    });
	
    $("#btnChange").click(function(){
    	fn_imgUpload();
    });	
    
	// to canvas
	$('#btnSave').click(function(e) {
  		html2canvas(test).then(function(canvas) {
    		// canvas width
    		var canvasWidth = canvas.width;
    		// canvas height
    		var canvasHeight = canvas.height;
    		// render canvas
    		$('.toCanvas').after(canvas);
    		// show 'to image' button
    		$('.toPic').show(1000);
    		// convert canvas to image
    		//$('.toPic').click(function(e) {
      		var img = Canvas2Image.convertToImage(canvas, canvasWidth, canvasHeight);
      		// render image
      		$(".toPic").after(img);
      		// save
    		//  $('#save').click(function(e) {
        	let type = "png"; // image type
        	let w = 400; // image width
        	let h = 600; // image height
        	let f = "score"; // file name
        	w = (w === '') ? canvasWidth : w;
        	h = (h === '') ? canvasHeight : h;
        	// save as image
        	//Canvas2Image.saveAsImage(canvas, w, h, type, f);
        	
        	var a = document.createElement('a');
            // toDataURL defaults to png, so we need to request a jpeg, then convert for file download.
            a.href = canvas.toDataURL("image/png").replace("image/jpeg", "image/octet-stream");
            a.download = 'myScore.jpg';
            a.click()
            
  		});
	});

});
  		
//내 스코어 관리하기
function fn_mngScoreList()
{
	if ("${scoreVo.user_id}" == '-1')
	{
		// 사용자 로그인이 필요한다.
		forms1.action = "/score/loginForm";
		forms1.submit();
	}else {
		// 로그인이 되어 있으므로
		forms1.action = "/score/scoreRegister";
		forms1.submit();
	}
}

function fn_imgUpload() {
	$("#attachFile00").trigger('click');
}

function readURL(input) { 
	if (input.files && input.files[0]) { 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('#preview').attr('src', e.target.result); 
		} 
		reader.readAsDataURL(input.files[0]); 
	} 
}

</script>    

<%@include file="/WEB-INF/views/web/inc/score_footer.jsp"%>