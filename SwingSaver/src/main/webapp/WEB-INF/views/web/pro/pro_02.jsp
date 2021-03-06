<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>
<% pageContext.setAttribute("replaceChar", "\n");  %>

    <section class="container no-padding">
        <article class="col-md-12" style="padding: 0;">
            <div class="content" style="padding: 0;">
                <div class="col-xs-12 no-padding">
                
                    <h2 class="right-tit">마켓프로상세</h2>
                    <div class="sub-mem-list">
                    <h4 class="sub-tit">프로정보</h4>
                    <div class="sub-g-btn">
                        <button type="button" id="btnList" class="sea-btn add-btn" data-target="#"><img src="/image/back-list.png" cwidth="100%">프로목록</button>
                    </div>

                        
                    <div class="col-xs-12 table-box">
                        <div class="table-responsive">
                            <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                                <colgroup>
                                    <col width="30%">
                                    <col width="70%">
                                </colgroup>
                                <tbody>
                                	<!-- tr>
                                       <td class="bold-td" colspan="2">
                                       <c:if test="${proVo.photo != '' || proVo.phpto ne null}"><img class="profile-img" src="${proVo.photo}"></c:if>                                       
                                       <c:if test="${proVo.photo eq ''}"><img class="profile-img" src="/image/profile-img.png"></c:if>
                                       </td>
                                   </tr  -->
                                    <!-- tr>
                                        <td><strong>아이디</strong></td>
                                        <td>${proVo.email}</td>
                                    </tr  -->                                    
                                    <tr>
                                        <td><strong>이름</strong></td>
                                        <td>${proVo.name}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>프로레벨</strong></td>
                                        <td>${proVo.prolevel_nm}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>프로어필</strong></td>
                                        <td>${fn:replace(proVo.description, replaceChar, "<br/>")}</td>
                                    </tr>                                     
                                    <tr>
                                        <td><strong>프로필</strong></td>
                                        <td>${fn:replace(proVo.profile, replaceChar, "<br/>")}</td>
                                    </tr>                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                  </div>

   
                </div>
            </div>
        </article>
    </section>

    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

<script>

$(document).ready(function(){
    $("#btnList").click(function(){
    	location.href="/market/proList";
    });
});

</script>

</body>
</html>
