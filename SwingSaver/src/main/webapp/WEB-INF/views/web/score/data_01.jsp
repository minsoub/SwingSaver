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
                <div class="col-md-12" style="padding: 0">
                    <h2 class="right-tit">내 스코어 통계</h2>

                    <div class=" ">

                        <div class="col-md-5">
                            <div id="morrisDonut" style="height: 300px"></div>

                            <script>
                                /* <![CDATA[ */


                                new Morris.Donut({
                                    element: 'morrisDonut',
                                    data: [{
                                            label: "Birdie",
                                            value: 3.7,
                                        },
                                        {
                                            label: "Par",
                                            value: 33.8,
                                        },
                                        {
                                            label: "Bogey",
                                            value: 33.8,
                                        },
                                        {
                                            label: "Double Bogey",
                                            value: 17.1,
                                        },
                                        {
                                            label: "Triple Bogey",
                                            value: 6.7,
                                        }
                                           ],
                                    colors: ["#ff6191","#04d2b7","#8BC34A","#b569dc","#3da1ff"],
                                    
                                });

                                /* ]]> */

                            </script>

                        </div>
                        
                        <div class="col-md-7 cir-chart">
                           <h3><select name="month">
                                <option value=" ">1월</option>
                                <option value=" ">2월</option>
                                <option value=" ">3월</option>
                                <option value=" ">4월</option>
                                <option value=" ">5월</option>
                                <option value=" ">6월</option>
                                <option value=" ">7월</option>
                                <option value=" ">8월</option>
                                <option value=" ">9월</option>
                                <option value=" ">10월</option>
                                <option value=" ">11월</option>
                                <option value=" ">12월</option>
                                </select>  스코어</h3>
                            <table>
                                <tr>
                                    <td style="color: #ff6191;">■</td>
                                    <td>Birdie</td>
                                    <td>3.7%</td>
                                </tr>
                                <tr>
                                    <td style="color: #04d2b7;">■</td>
                                    <td>Par</td>
                                    <td>33.8%</td>
                                </tr>
                                <tr>
                                    <td style="color: #8BC34A;">■</td>
                                    <td>Bogey</td>
                                    <td>33.8%</td>
                                </tr>
                                <tr>
                                    <td style="color: #b569dc;">■</td>
                                    <td>Double Bogey</td>
                                    <td>17.1%</td>
                                </tr>
                                <tr>
                                    <td style="color: #3da1ff;">■</td>
                                    <td>Triple Bogey</td>
                                    <td>6.7%</td>
                                </tr>


                            </table>
                        </div>

                    </div>


                    <div>





                    </div>







                </div>
            </div>
        </article>
    </section>



    <!-- Footer -->
	<%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->


</body>



</html>
