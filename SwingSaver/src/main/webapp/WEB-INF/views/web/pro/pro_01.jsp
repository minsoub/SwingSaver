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
                <h2 class="right-tit">마켓프로</h2>
				<div class="col-md-12 fare_info">
                    <ul class="tab">
                        <li class="current" data-tab="tab1"><a href="#">소스윙세이버 프로</a></li>
                        <li data-tab="tab2"><a href="#">프리미엄 프로</a></li>
                    </ul>


                    <div id="tab1" class="tabcontent current">
                    
                
                
                	<c:forEach var="proInfo" items="${proList}" varStatus="status">
                	<c:if test="${((status.index + 1 ) mod 2) eq 1}"><div class="col-md-12"></c:if>
                	
                    <div class="col-md-4">
                    <a href="/market/proDetail/${proInfo.id}" class="profile-box">                       
                       	<c:if test="${proInfo.photo != '' || proInfo.phpto ne null}"><img class="profile-img" src="${proInfo.photo}"></c:if>                                       
	            		<c:if test="${proInfo.photo eq ''}"><img class="profile-img" src="/image/profile-img.png"></c:if>                                       	                       
                       <div class="pro-txt-info">
                        <span>Swingsaver</span>
                        <h4>${proInfo.name} 프로</h4>
                        <ul>
                            ${fn:replace(proInfo.profile, replaceChar, "<br/>")}
                        </ul>
                        </div>                      
                    </a>
                    </div>
                    
                    <c:if test="${((status.index + 1 ) mod 2) eq 0}"></div></c:if>
                    </c:forEach>


                    <div id="tab2" class="tabcontent">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <a href="#" class="profile-box">
                       <img src="../image/profile-img.png">
                       
                       <div class="pro-txt-info">
                        <span>Premium</span>
                        <h4>홍길동 프로</h4>
                        <ul>
                            <li>2010 PGA 투어 윈덤 챔피언십 1위</li>
                            <li>2011 PGA 투어 윈덤 챔피언십 2위</li>
                            <li>2017 PGA 플레이어스 챔피언십 우승</li>
                        </ul>
                        </div>
                    	</a>
                            </div>
                            <div class="col-md-4">
                                <a href="#" class="profile-box">
                       <img src="../image/profile-img.png">
                       
                       <div class="pro-txt-info">
                        <span>Premium</span>
                        <h4>홍길동 프로</h4>
                        <ul>
                            <li>2010 PGA 투어 윈덤 챔피언십 1위</li>
                            <li>2011 PGA 투어 윈덤 챔피언십 2위</li>
                            <li>2017 PGA 플레이어스 챔피언십 우승</li>
                        </ul>
                        </div>
                    </a>
                            </div>
                            <div class="col-md-4">
                                <a href="#" class="profile-box">
                       <img src="../image/profile-img.png">
                       
                       <div class="pro-txt-info">
                        <span>Premium</span>
                        <h4>홍길동 프로</h4>
                        <ul>
                            <li>2010 PGA 투어 윈덤 챔피언십 1위</li>
                            <li>2011 PGA 투어 윈덤 챔피언십 2위</li>
                            <li>2017 PGA 플레이어스 챔피언십 우승</li>
                        </ul>
                        </div>
                    </a>
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
</html>
