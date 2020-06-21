<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
            <div class="content-nav col-xs-3">
                <div class="side-menu">
                    <div class="user-info">
                        <img class="side-profile" src="<c:url value='${userInfo.photo}'/>">
                        <p class="side-user">${userInfo.email}</p>
                        <p class="meter-l meter-ti">사용 <span>${userInfo.usedspace}M</span></p>
                        <c:set var="remaining" value="${userInfo.storagespace-userInfo.usedspace}"/>
                        <c:set var="rating" value="${(userInfo.usedspace+0.0)/(userInfo.storagespace+0.0)}"/>
                        <p class="meter-r meter-ti">잔여 <span>${remaining}M</span></p>
                        <div class="meter info_color">
                            <c:choose>
                                <c:when test="${userInfo.usedspace == 0 || rating == 'NaN'}">
                                    <span style="width: 0%"></span>
                                </c:when>
                                <c:otherwise>
                                    <span style="width:<fmt:formatNumber value="${rating}" type="percent"/>"></span>
                                </c:otherwise>
                            </c:choose>

                            <%--<span style="width:<fmt:formatNumber value="${(0+0.0)/(0+0.0)}" type="percent"/>"></span>--%>
                        </div>
                        <p class="side-info">등급 1 | 소그룹01 | 총사용량:${userInfo.storagespace}M<br/> 사용가능포인트:${userInfo.availablepoints}p
                            <br/> 서비스 유효일자:20-10-01</p>
                    </div>
                    <ul>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'mypage_01') != -1}">active</c:if>" href="/web/mypage">개인정보수정</a></li>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'score_01') != -1}">active</c:if>" href="/score/scoreList">내스코어 관리</a></li>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'data_01') != -1}">active</c:if>"href="/score/statList">내스코어 통계</a></li>
                        <li><a href="#">포인트 구매/이용료결제</a></li>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'mypay_list') != -1}">active</c:if>"href="/web/mypay">결제내역 조회</a></li>
                        <li><a href="#">서비스 변경</a></li>
                        <li><a href="#">서비스 해지</a></li>
                    </ul>
                </div>
            </div>