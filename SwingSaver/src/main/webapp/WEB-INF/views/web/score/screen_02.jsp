<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/score_header.jsp"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<input type="file" name="attachFile00" id="attachFile00" onchange="readURL(this);" style="display:none;"/>
  <section class="container no-padding">
    <div class="col-xs-12" style="padding: 0">
       	<button id="btnSave"   class="form-btn" onclick="#">이미지저장하기</button>
        <button id="btnChange" class="img-btn"  onclick="#">이미지변경하기</button>
        <button id="btnMng"    class="img-btn"  onclick="#">스코어관리하기</button>

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
                <img id="preview" src="/image/sc-print-bn.jpg" width="100%">
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
                        <td class="<c:if test="${(scoreVo.score1-parInfo1.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo.score1-parInfo1.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score1-parInfo1.hole1) > 0}">mi-num</c:if>"">${scoreVo.score1-parInfo1.hole1}</td>
                        <td class="<c:if test="${(scoreVo.score2-parInfo1.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo.score2-parInfo1.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score2-parInfo1.hole2) > 0}">mi-num</c:if>"">${scoreVo.score2-parInfo1.hole2}</td>
                        <td class="<c:if test="${(scoreVo.score3-parInfo1.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo.score3-parInfo1.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score3-parInfo1.hole3) > 0}">mi-num</c:if>"">${scoreVo.score3-parInfo1.hole3}</td>
                        <td class="<c:if test="${(scoreVo.score4-parInfo1.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo.score4-parInfo1.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score4-parInfo1.hole4) > 0}">mi-num</c:if>"">${scoreVo.score4-parInfo1.hole4}</td>
                        <td class="<c:if test="${(scoreVo.score5-parInfo1.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo.score5-parInfo1.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score5-parInfo1.hole5) > 0}">mi-num</c:if>"">${scoreVo.score5-parInfo1.hole5}</td>
                        <td class="<c:if test="${(scoreVo.score6-parInfo1.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo.score6-parInfo1.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score6-parInfo1.hole6) > 0}">mi-num</c:if>"">${scoreVo.score6-parInfo1.hole6}</td>
                        <td class="<c:if test="${(scoreVo.score7-parInfo1.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo.score7-parInfo1.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score7-parInfo1.hole7) > 0}">mi-num</c:if>"">${scoreVo.score7-parInfo1.hole7}</td>
                        <td class="<c:if test="${(scoreVo.score8-parInfo1.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo.score8-parInfo1.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score8-parInfo1.hole8) > 0}">mi-num</c:if>"">${scoreVo.score8-parInfo1.hole8}</td>
                        <td class="<c:if test="${(scoreVo.score9-parInfo1.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo.score9-parInfo1.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score9-parInfo1.hole9) > 0}">mi-num</c:if>"">${scoreVo.score9-parInfo1.hole9}</td>
                        <td>${scoreVo.score1+scoreVo.score2+scoreVo.score3+scoreVo.score4+scoreVo.score5+scoreVo.score6+scoreVo.score7+scoreo.score8+scoreVo.score9 - (parInfo1.hole1+parInfo1.hole2+parInfo1.hole3+parInfo1.hole4+parInfo1.hole5+parInfo1.hole6+parInfo1.hole7+parInfo1.hole8+parInfo1.hole9)}</td>
                      </tr>
                      <c:if test="${scoreVo2.error != 'NO'}">
                      <tr class="team-td">
                        <td>${qrInfo.othername1}</td>
                        <td class="<c:if test="${(scoreVo2.score1-parInfo1.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score1-parInfo1.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score1-parInfo1.hole1) > 0}">mi-num</c:if>"">${scoreVo2.score1-parInfo1.hole1}</td>
                        <td class="<c:if test="${(scoreVo2.score2-parInfo1.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score2-parInfo1.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score2-parInfo1.hole2) > 0}">mi-num</c:if>"">${scoreVo2.score2-parInfo1.hole2}</td>
                        <td class="<c:if test="${(scoreVo2.score3-parInfo1.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score3-parInfo1.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score3-parInfo1.hole3) > 0}">mi-num</c:if>"">${scoreVo2.score3-parInfo1.hole3}</td>
                        <td class="<c:if test="${(scoreVo2.score4-parInfo1.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score4-parInfo1.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score4-parInfo1.hole4) > 0}">mi-num</c:if>"">${scoreVo2.score4-parInfo1.hole4}</td>
                        <td class="<c:if test="${(scoreVo2.score5-parInfo1.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score5-parInfo1.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score5-parInfo1.hole5) > 0}">mi-num</c:if>"">${scoreVo2.score5-parInfo1.hole5}</td>
                        <td class="<c:if test="${(scoreVo2.score6-parInfo1.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score6-parInfo1.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score6-parInfo1.hole6) > 0}">mi-num</c:if>"">${scoreVo2.score6-parInfo1.hole6}</td>
                        <td class="<c:if test="${(scoreVo2.score7-parInfo1.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score7-parInfo1.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score7-parInfo1.hole7) > 0}">mi-num</c:if>"">${scoreVo2.score7-parInfo1.hole7}</td>
                        <td class="<c:if test="${(scoreVo2.score8-parInfo1.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score8-parInfo1.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score8-parInfo1.hole8) > 0}">mi-num</c:if>"">${scoreVo2.score8-parInfo1.hole8}</td>
                        <td class="<c:if test="${(scoreVo2.score9-parInfo1.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score9-parInfo1.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score9-parInfo1.hole9) > 0}">mi-num</c:if>"">${scoreVo2.score9-parInfo1.hole9}</td>
                        <td>${scoreVo2.score1+scoreVo2.score2+scoreVo2.score3+scoreVo2.score4+scoreVo2.score5+scoreVo2.score6+scoreVo2.score7+scoreo2.score8+scoreVo2.score9 - (parInfo1.hole1+parInfo1.hole2+parInfo1.hole3+parInfo1.hole4+parInfo1.hole5+parInfo1.hole6+parInfo1.hole7+parInfo1.hole8+parInfo1.hole9)}</td>
                      </tr>   
                      </c:if>   
                      <c:if test="${scoreVo3.error != 'NO'}">                         
                      <tr class="team-td">
                        <td>${qrInfo.othername2}</td>
                        <td class="<c:if test="${(scoreVo3.score1-parInfo1.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score1-parInfo1.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score1-parInfo1.hole1) > 0}">mi-num</c:if>"">${scoreVo3.score1-parInfo1.hole1}</td>
                        <td class="<c:if test="${(scoreVo3.score2-parInfo1.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score2-parInfo1.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score2-parInfo1.hole2) > 0}">mi-num</c:if>"">${scoreVo3.score2-parInfo1.hole2}</td>
                        <td class="<c:if test="${(scoreVo3.score3-parInfo1.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score3-parInfo1.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score3-parInfo1.hole3) > 0}">mi-num</c:if>"">${scoreVo3.score3-parInfo1.hole3}</td>
                        <td class="<c:if test="${(scoreVo3.score4-parInfo1.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score4-parInfo1.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score4-parInfo1.hole4) > 0}">mi-num</c:if>"">${scoreVo3.score4-parInfo1.hole4}</td>
                        <td class="<c:if test="${(scoreVo3.score5-parInfo1.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score5-parInfo1.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score5-parInfo1.hole5) > 0}">mi-num</c:if>"">${scoreVo3.score5-parInfo1.hole5}</td>
                        <td class="<c:if test="${(scoreVo3.score6-parInfo1.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score6-parInfo1.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score6-parInfo1.hole6) > 0}">mi-num</c:if>"">${scoreVo3.score6-parInfo1.hole6}</td>
                        <td class="<c:if test="${(scoreVo3.score7-parInfo1.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score7-parInfo1.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score7-parInfo1.hole7) > 0}">mi-num</c:if>"">${scoreVo3.score7-parInfo1.hole7}</td>
                        <td class="<c:if test="${(scoreVo3.score8-parInfo1.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score8-parInfo1.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score8-parInfo1.hole8) > 0}">mi-num</c:if>"">${scoreVo3.score8-parInfo1.hole8}</td>
                        <td class="<c:if test="${(scoreVo3.score9-parInfo1.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score9-parInfo1.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score9-parInfo1.hole9) > 0}">mi-num</c:if>"">${scoreVo3.score9-parInfo1.hole9}</td>
                        <td>${scoreVo3.score1+scoreVo3.score2+scoreVo3.score3+scoreVo3.score4+scoreVo3.score5+scoreVo3.score6+scoreVo3.score7+scoreo3.score8+scoreVo3.score9 - (parInfo1.hole1+parInfo1.hole2+parInfo1.hole3+parInfo1.hole4+parInfo1.hole5+parInfo1.hole6+parInfo1.hole7+parInfo1.hole8+parInfo1.hole9)}</td>
                      </tr>  
                      </c:if>
                      <c:if test="${scoreVo4.error != 'NO'}">                     
                      <tr class="team-td">
                        <td>${qrInfo.othername3}</td>
                        <td class="<c:if test="${(scoreVo4.score1-parInfo1.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score1-parInfo1.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score1-parInfo1.hole1) > 0}">mi-num</c:if>"">${scoreVo4.score1-parInfo1.hole1}</td>
                        <td class="<c:if test="${(scoreVo4.score2-parInfo1.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score2-parInfo1.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score2-parInfo1.hole2) > 0}">mi-num</c:if>"">${scoreVo4.score2-parInfo1.hole2}</td>
                        <td class="<c:if test="${(scoreVo4.score3-parInfo1.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score3-parInfo1.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score3-parInfo1.hole3) > 0}">mi-num</c:if>"">${scoreVo4.score3-parInfo1.hole3}</td>
                        <td class="<c:if test="${(scoreVo4.score4-parInfo1.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score4-parInfo1.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score4-parInfo1.hole4) > 0}">mi-num</c:if>"">${scoreVo4.score4-parInfo1.hole4}</td>
                        <td class="<c:if test="${(scoreVo4.score5-parInfo1.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score5-parInfo1.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score5-parInfo1.hole5) > 0}">mi-num</c:if>"">${scoreVo4.score5-parInfo1.hole5}</td>
                        <td class="<c:if test="${(scoreVo4.score6-parInfo1.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score6-parInfo1.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score6-parInfo1.hole6) > 0}">mi-num</c:if>"">${scoreVo4.score6-parInfo1.hole6}</td>
                        <td class="<c:if test="${(scoreVo4.score7-parInfo1.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score7-parInfo1.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score7-parInfo1.hole7) > 0}">mi-num</c:if>"">${scoreVo4.score7-parInfo1.hole7}</td>
                        <td class="<c:if test="${(scoreVo4.score8-parInfo1.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score8-parInfo1.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score8-parInfo1.hole8) > 0}">mi-num</c:if>"">${scoreVo4.score8-parInfo1.hole8}</td>
                        <td class="<c:if test="${(scoreVo4.score9-parInfo1.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score9-parInfo1.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score9-parInfo1.hole9) > 0}">mi-num</c:if>"">${scoreVo4.score9-parInfo1.hole9}</td>
                        <td>${scoreVo4.score1+scoreVo4.score2+scoreVo4.score3+scoreVo4.score4+scoreVo4.score5+scoreVo4.score6+scoreVo4.score7+scoreo4.score8+scoreVo4.score9 - (parInfo1.hole1+parInfo1.hole2+parInfo1.hole3+parInfo1.hole4+parInfo1.hole5+parInfo1.hole6+parInfo1.hole7+parInfo1.hole8+parInfo1.hole9)}</td>
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
						<td class="<c:if test="${(scoreVo.score10-parInfo2.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo.score10-parInfo2.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score10-parInfo2.hole1) > 0}">mi-num</c:if>"">${scoreVo.score10-parInfo2.hole1}</td>
                        <td class="<c:if test="${(scoreVo.score11-parInfo2.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo.score11-parInfo2.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score11-parInfo2.hole2) > 0}">mi-num</c:if>"">${scoreVo.score11-parInfo2.hole2}</td>
                        <td class="<c:if test="${(scoreVo.score12-parInfo2.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo.score12-parInfo2.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score12-parInfo2.hole3) > 0}">mi-num</c:if>"">${scoreVo.score12-parInfo2.hole3}</td>
                        <td class="<c:if test="${(scoreVo.score13-parInfo2.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo.score13-parInfo2.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score13-parInfo2.hole4) > 0}">mi-num</c:if>"">${scoreVo.score13-parInfo2.hole4}</td>
                        <td class="<c:if test="${(scoreVo.score14-parInfo2.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo.score14-parInfo2.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score14-parInfo2.hole5) > 0}">mi-num</c:if>"">${scoreVo.score14-parInfo2.hole5}</td>
                        <td class="<c:if test="${(scoreVo.score15-parInfo2.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo.score15-parInfo2.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score15-parInfo2.hole6) > 0}">mi-num</c:if>"">${scoreVo.score15-parInfo2.hole6}</td>
                        <td class="<c:if test="${(scoreVo.score16-parInfo2.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo.score16-parInfo2.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score16-parInfo2.hole7) > 0}">mi-num</c:if>"">${scoreVo.score16-parInfo2.hole7}</td>
                        <td class="<c:if test="${(scoreVo.score17-parInfo2.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo.score17-parInfo2.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score17-parInfo2.hole8) > 0}">mi-num</c:if>"">${scoreVo.score17-parInfo2.hole8}</td>
                        <td class="<c:if test="${(scoreVo.score18-parInfo2.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo.score18-parInfo2.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo.score18-parInfo2.hole9) > 0}">mi-num</c:if>"">${scoreVo.score18-parInfo2.hole9}</td>
                        <td>${scoreVo.score10+scoreVo.score11+scoreVo.score12+scoreVo.score13+scoreVo.score14+scoreVo.score15+scoreVo.score16+scoreo.score17+scoreVo.score18 - (parInfo2.hole1+parInfo2.hole2+parInfo2.hole3+parInfo2.hole4+parInfo2.hole5+parInfo2.hole6+parInfo2.hole7+parInfo2.hole8+parInfo2.hole9)}</td>
                      </tr>
                      <c:if test="${scoreVo2.error != 'NO'}">
                      <tr class="team-td">
                        <td>${qrInfo.othername1}</td>
						<td class="<c:if test="${(scoreVo2.score10-parInfo2.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score10-parInfo2.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score10-parInfo2.hole1) > 0}">mi-num</c:if>"">${scoreVo2.score10-parInfo2.hole1}</td>
                        <td class="<c:if test="${(scoreVo2.score11-parInfo2.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score11-parInfo2.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score11-parInfo2.hole2) > 0}">mi-num</c:if>"">${scoreVo2.score11-parInfo2.hole2}</td>
                        <td class="<c:if test="${(scoreVo2.score12-parInfo2.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score12-parInfo2.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score12-parInfo2.hole3) > 0}">mi-num</c:if>"">${scoreVo2.score12-parInfo2.hole3}</td>
                        <td class="<c:if test="${(scoreVo2.score13-parInfo2.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score13-parInfo2.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score13-parInfo2.hole4) > 0}">mi-num</c:if>"">${scoreVo2.score13-parInfo2.hole4}</td>
                        <td class="<c:if test="${(scoreVo2.score14-parInfo2.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score14-parInfo2.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score14-parInfo2.hole5) > 0}">mi-num</c:if>"">${scoreVo2.score14-parInfo2.hole5}</td>
                        <td class="<c:if test="${(scoreVo2.score15-parInfo2.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score15-parInfo2.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score15-parInfo2.hole6) > 0}">mi-num</c:if>"">${scoreVo2.score15-parInfo2.hole6}</td>
                        <td class="<c:if test="${(scoreVo2.score16-parInfo2.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score16-parInfo2.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score16-parInfo2.hole7) > 0}">mi-num</c:if>"">${scoreVo2.score16-parInfo2.hole7}</td>
                        <td class="<c:if test="${(scoreVo2.score17-parInfo2.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score17-parInfo2.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score17-parInfo2.hole8) > 0}">mi-num</c:if>"">${scoreVo2.score17-parInfo2.hole8}</td>
                        <td class="<c:if test="${(scoreVo2.score18-parInfo2.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo2.score18-parInfo2.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo2.score18-parInfo2.hole9) > 0}">mi-num</c:if>"">${scoreVo2.score18-parInfo2.hole9}</td>
                        <td>${scoreVo2.score10+scoreVo2.score11+scoreVo2.score12+scoreVo2.score13+scoreVo2.score14+scoreVo2.score15+scoreVo2.score16+scoreo2.score17+scoreVo2.score18 - (parInfo2.hole1+parInfo2.hole2+parInfo2.hole3+parInfo2.hole4+parInfo2.hole5+parInfo2.hole6+parInfo2.hole7+parInfo2.hole8+parInfo2.hole9)}</td>
                      </tr>  
                      </c:if>
                      <c:if test="${scoreVo3.error != 'NO'}">                                
                      <tr class="team-td">
                        <td>${qrInfo.othername2}</td>
						<td class="<c:if test="${(scoreVo3.score10-parInfo2.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score10-parInfo2.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score10-parInfo2.hole1) > 0}">mi-num</c:if>"">${scoreVo3.score10-parInfo2.hole1}</td>
                        <td class="<c:if test="${(scoreVo3.score11-parInfo2.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score11-parInfo2.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score11-parInfo2.hole2) > 0}">mi-num</c:if>"">${scoreVo3.score11-parInfo2.hole2}</td>
                        <td class="<c:if test="${(scoreVo3.score12-parInfo2.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score12-parInfo2.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score12-parInfo2.hole3) > 0}">mi-num</c:if>"">${scoreVo3.score12-parInfo2.hole3}</td>
                        <td class="<c:if test="${(scoreVo3.score13-parInfo2.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score13-parInfo2.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score13-parInfo2.hole4) > 0}">mi-num</c:if>"">${scoreVo3.score13-parInfo2.hole4}</td>
                        <td class="<c:if test="${(scoreVo3.score14-parInfo2.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score14-parInfo2.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score14-parInfo2.hole5) > 0}">mi-num</c:if>"">${scoreVo3.score14-parInfo2.hole5}</td>
                        <td class="<c:if test="${(scoreVo3.score15-parInfo2.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score15-parInfo2.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score15-parInfo2.hole6) > 0}">mi-num</c:if>"">${scoreVo3.score15-parInfo2.hole6}</td>
                        <td class="<c:if test="${(scoreVo3.score16-parInfo2.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score16-parInfo2.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score16-parInfo2.hole7) > 0}">mi-num</c:if>"">${scoreVo3.score16-parInfo2.hole7}</td>
                        <td class="<c:if test="${(scoreVo3.score17-parInfo2.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score17-parInfo2.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score17-parInfo2.hole8) > 0}">mi-num</c:if>"">${scoreVo3.score17-parInfo2.hole8}</td>
                        <td class="<c:if test="${(scoreVo3.score18-parInfo2.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo3.score18-parInfo2.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo3.score18-parInfo2.hole9) > 0}">mi-num</c:if>"">${scoreVo3.score18-parInfo2.hole9}</td>
                        <td>${scoreVo3.score10+scoreVo3.score11+scoreVo3.score12+scoreVo3.score13+scoreVo3.score14+scoreVo3.score15+scoreVo3.score16+scoreo3.score17+scoreVo3.score18 - (parInfo2.hole1+parInfo2.hole2+parInfo2.hole3+parInfo2.hole4+parInfo2.hole5+parInfo2.hole6+parInfo2.hole7+parInfo2.hole8+parInfo2.hole9)}</td>
                      </tr> 
                      </c:if>
                      <c:if test="${scoreVo4.error != 'NO'}">                  
                      <tr class="team-td">
                        <td>${qrInfo.othername3}</td>
						<td class="<c:if test="${(scoreVo4.score10-parInfo2.hole1) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score10-parInfo2.hole1) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score10-parInfo2.hole1) > 0}">mi-num</c:if>"">${scoreVo4.score10-parInfo2.hole1}</td>
                        <td class="<c:if test="${(scoreVo4.score11-parInfo2.hole2) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score11-parInfo2.hole2) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score11-parInfo2.hole2) > 0}">mi-num</c:if>"">${scoreVo4.score11-parInfo2.hole2}</td>
                        <td class="<c:if test="${(scoreVo4.score12-parInfo2.hole3) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score12-parInfo2.hole3) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score12-parInfo2.hole3) > 0}">mi-num</c:if>"">${scoreVo4.score12-parInfo2.hole3}</td>
                        <td class="<c:if test="${(scoreVo4.score13-parInfo2.hole4) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score13-parInfo2.hole4) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score13-parInfo2.hole4) > 0}">mi-num</c:if>"">${scoreVo4.score13-parInfo2.hole4}</td>
                        <td class="<c:if test="${(scoreVo4.score14-parInfo2.hole5) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score14-parInfo2.hole5) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score14-parInfo2.hole5) > 0}">mi-num</c:if>"">${scoreVo4.score14-parInfo2.hole5}</td>
                        <td class="<c:if test="${(scoreVo4.score15-parInfo2.hole6) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score15-parInfo2.hole6) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score15-parInfo2.hole6) > 0}">mi-num</c:if>"">${scoreVo4.score15-parInfo2.hole6}</td>
                        <td class="<c:if test="${(scoreVo4.score16-parInfo2.hole7) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score16-parInfo2.hole7) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score16-parInfo2.hole7) > 0}">mi-num</c:if>"">${scoreVo4.score16-parInfo2.hole7}</td>
                        <td class="<c:if test="${(scoreVo4.score17-parInfo2.hole8) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score17-parInfo2.hole8) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score17-parInfo2.hole8) > 0}">mi-num</c:if>"">${scoreVo4.score17-parInfo2.hole8}</td>
                        <td class="<c:if test="${(scoreVo4.score18-parInfo2.hole9) < 0}">pl-num</c:if><c:if test="${(scoreVo4.score18-parInfo2.hole9) == 0}">pl2-num</c:if><c:if test="${(scoreVo4.score18-parInfo2.hole9) > 0}">mi-num</c:if>"">${scoreVo4.score18-parInfo2.hole9}</td>
                        <td>${scoreVo4.score10+scoreVo4.score11+scoreVo4.score12+scoreVo4.score13+scoreVo4.score14+scoreVo4.score15+scoreVo4.score16+scoreo4.score17+scoreVo4.score18 - (parInfo2.hole1+parInfo2.hole2+parInfo2.hole3+parInfo2.hole4+parInfo2.hole5+parInfo2.hole6+parInfo2.hole7+parInfo2.hole8+parInfo2.hole9)}</td>
                      </tr> 
                      </c:if>
                    </table>
               </div>                                
           </div>
             
        </div>
     </div>
     
     <div class="bottom-bn">
        <p>이제 <strong>스윙세이버</strong>로 내 스코어를 직접 관리해보세요. <span>www.swingsaver.co.kr</span></p>
     </div> 
  </div>
              
                        
                                        
                                   
                       
        <!-- div class="score-page form-page" style="margin: 0px">
           <div class="test">
           
           
              <!-- img src="/image/sc-image.png" width="100%"   -->
           </div>
           <div class="sc-ad">
              <p><strong>스코어 관리</strong>가 필요하신가요?<br/>
              <a href=""><span>스윙세이버를 시작! <strong>Click!</strong></span></a></p>
            </div>                                                             
        </div>
    </div -->
</section>
  
  
<form class="form-signin" id='forms1' name="forms1" method="POST">
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
	if ("${scoreVo.user_id}" == -1)
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