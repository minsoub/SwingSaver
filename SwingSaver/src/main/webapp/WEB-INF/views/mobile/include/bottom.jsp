<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="gnb">
        <div class="menu-gnb <c:if test="${setMenu eq 'search'}">active</c:if>">
        	<a href="/m/search.do">
            <img src="/mobile/image/gnb-01.svg" class="gnb-01" width="100%">
            <p>검색하기</p>
            </a>
        </div>
        <div class="menu-gnb <c:if test="${setMenu eq 'golflist'}">active</c:if>">
        	<a href="/m/golflist.do">
            <img src="/mobile/image/gnb-02.svg" class="gnb-01" width="100%">
            <p>둘러보기</p>
            </a>
        </div>        
        <div class="menu-gnb <c:if test="${setMenu eq 'home'}">active</c:if>">
        	<a href="/m/home.do">
            <img src="/mobile/image/gnb-03.svg" class="gnb-01" width="100%">
            <p>HOME</p>
            </a>
        </div>
        <div class="menu-gnb <c:if test="${setMenu eq 'bookmark'}">active</c:if>">
        	<a href="/m/bookmark.do">
            <img src="/mobile/image/gnb-04.svg" class="gnb-01" width="100%">
            <p>즐겨찾기</p>
            </a>
        </div>         
        <div class="menu-gnb <c:if test="${setMenu eq 'mypage'}">active</c:if>">
        	<a href="/web/mypage">
            <img src="/mobile/image/gnb-05.svg" class="gnb-01" width="100%">
            <p>마이페이지</p>
            </a>
        </div>         
    </div>
       
</body>
</html>