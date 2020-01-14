<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/score_header.jsp"%>

    <div class="sc_ban"><p>SCORE</p></div>
    <section class="container no-padding">
                <div class="col-xs-12" style="padding: 0">
                    <div class="score-page form-page" style="margin: 0px">
   
                        <div class="sc-cont">
                          <h3>Course 1.</h3>
                          <div style="overflow-x:auto; margin-bottom: 20px;">
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
                                   <td class="gray-td fir-td">PAR</td>
                                   <td>${parInfo1.hole1}</td>
                                   <td>${parInfo1.hole2}</td>
                                   <td>${parInfo1.hole3}</td>
                                   <td>${parInfo1.hole4}</td>
                                   <td>${parInfo1.hole5}</td>
                                   <td>${parInfo1.hole6}</td>
                                   <td>${parInfo1.hole7}</td>
                                   <td>${parInfo1.hole8}</td>
                                   <td>${parInfo1.hole9}</td>
                                   <td class="gray-td">${parInfo1.sum}</td>
                               </tr>

 
                                <tr>
                                   <td class="black-td fir-td">Score</td>
                                    <td><p class="pl-num">${scoreVo.score1}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score2}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score3}</p></td>
                                    <td><p class="mi-num">${scoreVo.score4}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score5}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score6}</p></td>
                                    <td><p class="mi-num">${scoreVo.score7}</p></td>
                                    <td><p class="pl-num">${scoreVo.score8}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score9}</p></td>
                                   <td class="black-td">34</td>
                               </tr>                                                               


                          
                          
                           </table>
                           </div>

                          <h3>Course 2.</h3>
                          <div style="overflow-x:auto; margin-bottom: 20px;">
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
                                   <td class="gray-td fir-td">PAR</td>
                                   <td>${parInfo2.hole1}</td>
                                   <td>${parInfo2.hole2}</td>
                                   <td>${parInfo2.hole3}</td>
                                   <td>${parInfo2.hole4}</td>
                                   <td>${parInfo2.hole5}</td>
                                   <td>${parInfo2.hole6}</td>
                                   <td>${parInfo2.hole7}</td>
                                   <td>${parInfo2.hole8}</td>
                                   <td>${parInfo2.hole9}</td>
                                   <td class="gray-td">${parInfo2.sum}</td>
                               </tr>

 
                                <tr>
                                   <td class="black-td fir-td">Score</td>
                                    <td><p class="pl-num">${scoreVo.score10}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score11}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score12}</p></td>
                                    <td><p class="mi-num">${scoreVo.score13}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score14}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score15}</p></td>
                                    <td><p class="mi-num">${scoreVo.score16}</p></td>
                                    <td><p class="pl-num">${scoreVo.score17}</p></td>
                                   <td><p class="pl2-num">${scoreVo.score18}</p></td>
                                   <td class="black-td">34</td>
                               </tr>                                               
                           </table>
                           </div>                                    
                                <button id="btnMng"  class="form-btn" onclick="#">내 스코어 관리하기</button>
                                <button id="btnMake" class="img-btn" onclick="#">이미지로 만들기</button>
                        </div>


                    </div>

                </div>
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
<script>

$(document).ready(function(){
    $("#btnMng").click(function(){
    	fn_mngScoreList();
    });
    $("#btnMake").click(function(){
    	fn_makeImage();
    });    
});
// 내 스코어 관리하기
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
// 이미지로 만들기
function fn_makeImage()
{
	
}
</script>

<%@include file="/WEB-INF/views/web/inc/score_footer.jsp"%>
