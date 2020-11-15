<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
<%@include file="/WEB-INF/views/mobile/include/top_menu.jsp"%>

    <section id="contents" class="">
        <div class="con-wrap">
            <div class="date-wrap">
                <div class="sc-date">${scoreInfo.visit_date}</div>
                <a href="/m/score" class="sta-btn">리스트보기</a>
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
                        <td>${parInfo1.hole1}</td>
                        <td>${scoreInfo.stroke1}</td>
                        <td>${scoreInfo.score1}</td>
                        <td><c:if test='${scoreInfo.fairwayon1 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon1 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon1 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon1 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter1}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>${parInfo1.hole2}</td>
                        <td>${scoreInfo.stroke2}</td>
                        <td>${scoreInfo.score2}</td>
                        <td><c:if test='${scoreInfo.fairwayon2 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon2 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon2 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon2 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter2}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>${parInfo1.hole3}</td>
                        <td>${scoreInfo.stroke3}</td>
                        <td>${scoreInfo.score3}</td>
                        <td><c:if test='${scoreInfo.fairwayon3 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon3 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon3 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon3 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter3}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>${parInfo1.hole4}</td>
                        <td>${scoreInfo.stroke4}</td>
                        <td>${scoreInfo.score4}</td>
                        <td><c:if test='${scoreInfo.fairwayon4 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon4 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon4 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon4 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter4}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td>${parInfo1.hole5}</td>
                        <td>${scoreInfo.stroke5}</td>
                        <td>${scoreInfo.score5}</td>
                        <td><c:if test='${scoreInfo.fairwayon5 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon5 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon5 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon5 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter5}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td>${parInfo1.hole6}</td>
                        <td>${scoreInfo.stroke6}</td>
                        <td>${scoreInfo.score6}</td>
                        <td><c:if test='${scoreInfo.fairwayon6 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon6 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon6 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon6 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter6}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td>${parInfo1.hole7}</td>
                        <td>${scoreInfo.stroke7}</td>
                        <td>${scoreInfo.score7}</td>
                        <td><c:if test='${scoreInfo.fairwayon7 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon7 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon7 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon7 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter7}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td>${parInfo1.hole8}</td>
                        <td>${scoreInfo.stroke8}</td>
                        <td>${scoreInfo.score8}</td>
                        <td><c:if test='${scoreInfo.fairwayon8 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon8 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon8 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon8 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter8}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td>${parInfo1.hole9}</td>
                        <td>${scoreInfo.stroke9}</td>
                        <td>${scoreInfo.score9}</td>
                        <td><c:if test='${scoreInfo.fairwayon9 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon9 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon9 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon9 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter9}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th class="tbl-bl">Total</th>
                        <th>${parInfo1.sum}</th>
                        <th>${scoreInfo.strokesum1}</th>
                        <th>${scoreInfo.scoresum1}</th>
                        <th>0</th>
                        <th>0</th>
                        <th>${scoreInfo.puttersum1}</th>
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
                        <td>${parInfo2.hole1}</td>
                        <td>${scoreInfo.stroke10}</td>
                        <td>${scoreInfo.score10}</td>
                        <td><c:if test='${scoreInfo.fairwayon10 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon10 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon10 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon10 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter10}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>${parInfo2.hole2}</td>
                        <td>${scoreInfo.stroke11}</td>
                        <td>${scoreInfo.score11}</td>
                        <td><c:if test='${scoreInfo.fairwayon11 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon11 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon11 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon11 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter11}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>${parInfo2.hole3}</td>
                        <td>${scoreInfo.stroke12}</td>
                        <td>${scoreInfo.score12}</td>
                        <td><c:if test='${scoreInfo.fairwayon12 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon12 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon12 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon12 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter12}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>${parInfo2.hole4}</td>
                        <td>${scoreInfo.stroke13}</td>
                        <td>${scoreInfo.score13}</td>
                        <td><c:if test='${scoreInfo.fairwayon13 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon13 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon13 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon13 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter13}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td>${parInfo2.hole5}</td>
                        <td>${scoreInfo.stroke14}</td>
                        <td>${scoreInfo.score14}</td>
                        <td><c:if test='${scoreInfo.fairwayon14 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon14 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon14 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon14 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter14}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td>${parInfo2.hole6}</td>
                        <td>${scoreInfo.stroke15}</td>
                        <td>${scoreInfo.score15}</td>
                        <td><c:if test='${scoreInfo.fairwayon15 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon15 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon15 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon15 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter15}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td>${parInfo2.hole7}</td>
                        <td>${scoreInfo.stroke16}</td>
                        <td>${scoreInfo.score16}</td>
                        <td><c:if test='${scoreInfo.fairwayon16 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon16 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon16 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon16 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter16}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>8</th>
                        <td>${parInfo2.hole8}</td>
                        <td>${scoreInfo.stroke17}</td>
                        <td>${scoreInfo.score17}</td>
                        <td><c:if test='${scoreInfo.fairwayon17 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon17 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon17 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon17 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter17}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th>9</th>
                        <td>${parInfo2.hole9}</td>
                        <td>${scoreInfo.stroke18}</td>
                        <td>${scoreInfo.score18}</td>
                        <td><c:if test='${scoreInfo.fairwayon18 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.fairwayon18 eq "N"}'>NO</c:if></td>
                        <td><c:if test='${scoreInfo.greenon18 eq "Y"}'>Ok</c:if><c:if test='${scoreInfo.greenon18 eq "N"}'>NO</c:if></td>
                        <td>${scoreInfo.putter18}</td>
                        <td><a class=""><img src="/mobile/image/view-btn.png" style="width: 20px;"></a></td>
                    </tr>
                    <tr>
                        <th class="tbl-bl">Total</th>
                        <th>${parInfo2.sum}</th>
                        <th>${scoreInfo.strokesum2}</th>
                        <th>${scoreInfo.scoresum2}</th>
                        <th>0</th>
                        <th>0</th>
                        <th>${scoreInfo.puttersum2}</th>
                        <th>0</th>
                    </tr>                    
                    
                    
                    
                </table>
            </div>


        </div>
        
        
        
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
   
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>
