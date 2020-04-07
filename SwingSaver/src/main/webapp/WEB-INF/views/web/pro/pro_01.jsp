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
                        <li class="current" data-tab="tab1"><a href="#">스윙세이버 프로</a></li>
                        <li data-tab="tab2"><a href="#">프리미엄 프로</a></li>
                    </ul>

                    <div id="tab1" class="tabcontent current">                                                   
                		<c:forEach var="proInfo" items="${proList1}" varStatus="status">
                			<c:if test="${((status.index + 1 ) mod 3) eq 1}"><div class="col-md-12"></c:if>                	
                    			<div class="col-md-4">
                    				<a href="/market/proDetail/${proInfo.id}" class="profile-box">                       
                       					<c:if test="${proInfo.photo != '' || proInfo.phpto ne null}"><img src="${proInfo.photo}"></c:if>                                       
	            						<c:if test="${proInfo.photo eq ''}"><img src="/image/profile-img.png"></c:if>                                       	                       
                       					<div class="pro-txt-info">
                        					<span>Swingsaver</span>
                        					<h4>${proInfo.name} 프로</h4>
                        					<ul>
                        					  <c:set var="dd" value="${fn:split(proInfo.profile, replaceChar)}" />
                        					  <c:forEach var="lst" items="${dd}" varStatus="g">
                        					  	<c:if test="${g.count > 4}"></c:if>
                        					  	<c:if test="${g.count < 4}"><li>${lst}</li></c:if>
                        					  </c:forEach>
                            					<!--  ${fn:replace(proInfo.profile, replaceChar, "<br/>")}  -->
                        					</ul>
                        				</div>                      
                    				</a>
                    			</div>                    
                    		<c:if test="${((status.index + 1 ) mod 3) eq 0}"></div></c:if>
                    	</c:forEach>
						<c:if test="${(proCount1  mod 3) > 0}"></div></c:if>
					</div>

                    <div id="tab2" class="tabcontent">
                		<c:forEach var="proInfo" items="${proList2}" varStatus="status">
                			<c:if test="${((status.index + 1 ) mod 3) eq 1}"><div class="col-md-12"></c:if>                	
                    			<div class="col-md-4">
                    				<a href="/market/proDetail/${proInfo.id}" class="profile-box">                       
                       					<c:if test="${proInfo.photo != '' || proInfo.phpto ne null}"><img src="${proInfo.photo}"></c:if>                                       
	            						<c:if test="${proInfo.photo eq ''}"><img src="/image/profile-img.png"></c:if>                                       	                       
                       					<div class="pro-txt-info">
                        					<span>Premium</span>
                        					<h4>${proInfo.name} 프로</h4>
                        					<ul>
                        					  <c:set var="dd" value="${fn:split(proInfo.profile, replaceChar)}" />
                        					  <c:forEach var="lst" items="${dd}" varStatus="g">
                        					  	<c:if test="${g.count > 4}"></c:if>
                        					  	<c:if test="${g.count < 4}"><li>${lst}</li></c:if>
                        					  </c:forEach>
                            					<!--  ${fn:replace(proInfo.profile, replaceChar, "<br/>")}  -->
                        					</ul>
                        				</div>                      
                    				</a>
                    			</div>                    
                    		<c:if test="${((status.index + 1 ) mod 3) eq 0}"></div></c:if>
                    	</c:forEach>
						<c:if test="${(proCount2  mod 3) > 0}"></div></c:if>
                    </div>
			</div>
        </article>
    </section>

    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
</html>

    <script>
        $(function() {
            $('ul.tab li').click(function() {
                var activeTab = $(this).attr('data-tab');
                $('ul.tab li').removeClass('current');
                $('.tabcontent').removeClass('current');
                $(this).addClass('current');
                $('#' + activeTab).addClass('current');
            })
        });

    </script>
