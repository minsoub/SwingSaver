<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

            <div class="content-nav col-xs-3">
                <div class="side-menu">
                    <div class="user-info">
                    <p class="side-user">ID : <span>${groupInfo.id}</span></p>
                    <p class="meter-l meter-ti">현재회원 <span>${groupInfo.membercount}</span></p>
                    <p class="meter-r meter-ti">등록가능회원 <span>${groupInfo.quota-groupInfo.membercount}</span></p>

 
                    <div class="meter info_color">
                        <c:set var="rating" value="${(groupInfo.membercount+0.0)/(groupInfo.quota+0.0)}"/>
                        <c:choose>
                            <c:when test="${groupInfo.membercount == 0 || rating == 'NaN'}">
                                <span style="width: 0%"></span>
                            </c:when>
                            <c:otherwise>
                                <span style="width:<fmt:formatNumber value="${rating}" type="percent"/>"></span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <p class="side-info">${groupInfo.groupname} |
                        <c:choose>
                            <c:when test="${groupInfo.grouptype eq 'A'}">
                                Academy
                            </c:when>
                            <c:otherwise>
                                Range
                            </c:otherwise>
                        </c:choose>
                        <br/>할당회원:${groupInfo.quota} | 1인당 사용건수:${groupInfo.storagespace}</p>
                    </div>    
                    <ul>
                    
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'g_info_01') != -1}">active</c:if>" href="<c:if test="${sessionScope.login.grouppro == 'Y'}">#</c:if><c:if test="${sessionScope.login.grouppro == 'N'}">/group/mygroup</c:if>">그룹정보수정</a></li>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'g_mem_01') != -1}">active</c:if>" href="<c:if test="${sessionScope.login.grouppro == 'Y'}">#</c:if><c:if test="${sessionScope.login.grouppro == 'N'}">/group/groupmember</c:if>">그룹멤버관리</a></li>
                        
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'g_sub_0') != -1}">active</c:if>" href="/group/subgroup">소그룹관리</a></li>
                        <li><a href="#">월 이용 결제</a></li>
                        <li><a href="#">결제내역 조회</a></li>
                        <li><a href="#">서비스 변경 요청</a></li>
                    </ul>
                </div>
            </div>