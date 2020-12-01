<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="gnb">
    
    	<c:if test="${setMenu eq 'aicoach'}">
        	<div class="menu-gnb active">
        		<a href="/m/aicoach.do">
            	<img src="/mobile/image/gnb-01-on.svg" class="gnb-01" width="100%">
            	<p>AI COACH</p>
            	</a>
        	</div>      	
    	</c:if>
    	<c:if test="${setMenu ne 'aicoach'}">
        	<div class="menu-gnb">
        		<a href="/m/aicoach.do">
            	<img src="/mobile/image/gnb-01.svg" class="gnb-01" width="100%">
            	<p>AI COACH</p>
            	</a>
        	</div>     	
    	</c:if>
     
     	<c:if test="${setMenu eq 'golflist'}">
        	<div class="menu-gnb active">
        		<a href="/m/golflist.do">
            	<img src="/mobile/image/gnb-02-on.svg" class="gnb-01" width="100%">
            	<p>FIND</p>
            	</a>
        	</div>
        </c:if>
     	<c:if test="${setMenu ne 'golflist'}">
        	<div class="menu-gnb">
        		<a href="/m/golflist.do">
            	<img src="/mobile/image/gnb-02.svg" class="gnb-01" width="100%">
            	<p>FIND</p>
            	</a>
        	</div>
        </c:if>
        
        <c:if test="${setMenu eq 'home'}">               
        	<div class="menu-gnb active">
        		<a href="/m/home.do">
            	<img src="/mobile/image/gnb-03-on.svg" class="gnb-01" width="100%">
            	<p>HOME</p>
            	</a>
        	</div>
        </c:if>
        <c:if test="${setMenu ne 'home'}">               
        	<div class="menu-gnb">
        		<a href="/m/home.do">
            	<img src="/mobile/image/gnb-03.svg" class="gnb-01" width="100%">
            	<p>HOME</p>
            	</a>
        	</div>
        </c:if>
        
        <c:if test="${setMenu eq 'bookmark'}">        
        	<div class="menu-gnb active">
        		<a href="/m/bookmark.do">
            	<img src="/mobile/image/gnb-04-on.svg" class="gnb-01" width="100%">
            	<p>QUICK</p>
            	</a>
        	</div>         
        </c:if>
        <c:if test="${setMenu ne 'bookmark'}">        
        	<div class="menu-gnb">
        		<a href="/m/bookmark.do">
            	<img src="/mobile/image/gnb-04.svg" class="gnb-01" width="100%">
            	<p>QUICK</p>
            	</a>
        	</div>         
        </c:if>
                
        <c:if test="${setMenu eq 'score'}">      
        	<div class="menu-gnb active">
        		<a href="/m/score">
            	<img src="/mobile/image/gnb-05-on.svg" class="gnb-01" width="100%">
            	<p>SCORE</p>
            	</a>
        	</div> 
        </c:if>
        <c:if test="${setMenu ne 'score'}">      
        	<div class="menu-gnb">
        		<a href="/m/score">
            	<img src="/mobile/image/gnb-05.svg" class="gnb-01" width="100%">
            	<p>SCORE</p>
            	</a>
        	</div> 
        </c:if>        
                
    </div>
       
</body>
</html>