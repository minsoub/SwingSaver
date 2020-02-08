<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/top_menu.jsp"%>

<% pageContext.setAttribute("replaceChar", "\n");  %>

    <section class="container no-padding">
        <article class="col-md-12" style="padding: 0;">
            <div class="content" style="padding: 0;">
                <h2 class="right-tit">마켓프로</h2>

                
                
                	<c:forEach var="proInfo" items="${proList}" varStatus="status">
                	<c:if test="${((status.index + 1 ) mod 2) eq 1}"><div class="col-md-12"></c:if>
                	
                    <div class="col-md-6">
                    <a href="/market/proDetail/${proInfo.id}" class="pro-box">
                       <div class="pro-img">
                       	<c:if test="${proInfo.photo != '' || proInfo.phpto ne null}"><img class="profile-img" src="${proInfo.photo}"></c:if>                                       
	            		<c:if test="${proInfo.photo eq ''}"><img class="profile-img" src="/image/profile-img.png"></c:if>                                       	
                       </div>                       
                       <div class="pro-info">
                        <h4>${proInfo.name}</h4>
                        <span>${proInfo.prolevel_nm}</span>
                        <ul>
                            ${fn:replace(proInfo.profile, replaceChar, "<br/>")}
                        </ul>
                        </div>
                        <p>+</p>                       
                    </a>
                    </div>
                    
                    <c:if test="${((status.index + 1 ) mod 2) eq 0}"></div></c:if>
                    </c:forEach>
<!--                     
                    <div class="col-md-6 pro-wrap">
                    <a href="#" class="pro-box">
                       <div class="pro-img">
                       <img  src="../image/profile-img.png">
                       </div>                       
                       <div class="pro-info">
                        <h4>홍길동 프로</h4>
                        <span>Premium</span>
                        <ul>
                            <li>2010 PGA 투어 윈덤 챔피언십 1위</li>
                            <li>2011 PGA 투어 윈덤 챔피언십 2위</li>
                            <li>2017 PGA 플레이어스 챔피언십 우승</li>
                        </ul>
                        </div>
                       <p>+</p>
                    </a> 
                    </div> 
                    
                </div>
                
                <div class="col-md-12 pro-wrap">
                    <div class="col-md-6">
                    <a href="#" class="pro-box">
                       <div class="pro-img">
                       <img src="../image/profile-img.png">
                       </div>                       
                       <div class="pro-info">
                        <h4>홍길동 프로</h4>
                        <span>Premium</span>
                        <ul>
                            <li>2010 PGA 투어 윈덤 챔피언십 1위</li>
                            <li>2011 PGA 투어 윈덤 챔피언십 2위</li>
                            <li>2017 PGA 플레이어스 챔피언십 우승</li>
                        </ul>
                        </div>
                       <p>+</p>                      
                    </a>
                    </div>
                    <div class="col-md-6">
                    <a href="#" class="pro-box">
                       <div class="pro-img">
                       <img  src="../image/profile-img.png">
                       </div>                       
                       <div class="pro-info">
                        <h4>홍길동 프로</h4>
                        <span>Premium</span>
                        <ul>
                            <li>2010 PGA 투어 윈덤 챔피언십 1위</li>
                            <li>2011 PGA 투어 윈덤 챔피언십 2위</li>
                            <li>2017 PGA 플레이어스 챔피언십 우승</li>
                        </ul>
                        </div>
                       <p>+</p>
                    </a> 
                    </div> 
                </div>                
  -->
            </div>
        </article>
    </section>

    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
</html>
