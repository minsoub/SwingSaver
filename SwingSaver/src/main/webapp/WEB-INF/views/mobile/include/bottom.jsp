<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="gnb">    
    	<c:if test="${setMenu eq 'aicoach'}">
        	<div class="menu-gnb active">
        		<a href="/m/aicoach.do">
            	<div class="gnb-01"></div>
            	<p>AI COACH</p>
            	</a>
        	</div>      	
    	</c:if>
    	<c:if test="${setMenu ne 'aicoach'}">
        	<div class="menu-gnb">
        		<a href="/m/aicoach.do">
            	<div class="gnb-01"></div>
            	<p>AI COACH</p>
            	</a>
        	</div>     	
    	</c:if>
     
     	<c:if test="${setMenu eq 'golflist'}">
        	<div class="menu-gnb active">
        		<a href="/m/golflist.do">
            	<div class="gnb-02"></div>
            	<p>FIND</p>
            	</a>
        	</div>
        </c:if>
     	<c:if test="${setMenu ne 'golflist'}">
        	<div class="menu-gnb">
        		<a href="/m/golflist.do">
            	<div class="gnb-02"></div>
            	<p>FIND</p>
            	</a>
        	</div>
        </c:if>
        
        <c:if test="${setMenu eq 'home'}">               
        	<div class="menu-gnb active">
        		<a href="/m/home.do">
            	<div class="gnb-03"></div>
            	<p>HOME</p>
            	</a>
        	</div>
        </c:if>
        <c:if test="${setMenu ne 'home'}">               
        	<div class="menu-gnb">
        		<a href="/m/home.do">
            	<div class="gnb-03"></div>
            	<p>HOME</p>
            	</a>
        	</div>
        </c:if>
        
        <c:if test="${setMenu eq 'bookmark'}">        
        	<div class="menu-gnb active">
        		<a href="/m/bookmark.do">
            	<div class="gnb-04"></div>
            	<p>QUICK</p>
            	</a>
        	</div>         
        </c:if>
        <c:if test="${setMenu ne 'bookmark'}">        
        	<div class="menu-gnb">
        		<a href="/m/bookmark.do">
            	<div class="gnb-04"></div>
            	<p>QUICK</p>
            	</a>
        	</div>         
        </c:if>
                
        <c:if test="${setMenu eq 'score'}">      
        	<div class="menu-gnb active">
        		<a href="/m/score">
            	<div class="gnb-05"></div>
            	<p>SCORE</p>
            	</a>
        	</div> 
        </c:if>
        <c:if test="${setMenu ne 'score'}">      
        	<div class="menu-gnb">
        		<a href="/m/score">
            	<div class="gnb-05"></div>
            	<p>SCORE</p>
            	</a>
        	</div> 
        </c:if>        
                
    </div>
       
</body>
</html>