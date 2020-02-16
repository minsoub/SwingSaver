<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobile/include/top.jsp"%>
    
    <nav id="header">
        <img src="./image/gnb-menu.svg" class="gnb-menu" width="100%">
        <div class="logo">buddyya</div>
        <img src="./image/gnb-ser.svg" class="gnb-ser" width="100%">
    </nav>
    
<section id="contents">
    <div class="select-area">
        <select name="area" class="select-bar">
        <option value="">경기북부</option>
        <option value=" ">경기남부</option>
        <option value=" ">서울</option>
        <option value=" ">강원도</option>
        </select>
    </div>
    <div class="bud-tab">
        <a href="#" class="tab-01">모두</a>
        <a href="#" class="tab-01 active">제휴</a>
    </div>
    <div class="list-wrap">
        <div class="list">
            <img src="./image/buddyya-on.png" class="list-img" width="100%">
            <div class="list-info">
                <img src="./image/golf-logo.png" class="list-logo">
                <h4>아시아나컨트리클럽</h4>
                <p>경기남부</p>
            </div>
            <div class="list-right">
                <img src="./image/like-on.svg" class="list-like" width="100%">
                <a class="play active">Play</a>
            </div>            
        </div>
        <div class="list">
            <img src="./image/buddyya-on.png" class="list-img" width="100%">
            <div class="list-info">
                <img src="./image/golf-logo.png" class="list-logo">
                <h4>아시아나컨트리클럽</h4>
                <p>경기남부</p>
            </div>
            <div class="list-right">
                <img src="./image/like-off.svg" class="list-like" width="100%">
                <a class="play">Play</a>
            </div>            
        </div>
        <div class="list">
            <img src="./image/buddyya-on.png" class="list-img" width="100%">
            <div class="list-info">
                <img src="./image/golf-logo.png" class="list-logo">
                <h4>아시아나컨트리클럽</h4>
                <p>경기남부</p>
            </div>
            <div class="list-right">
                <img src="./image/like-on.svg" class="list-like" width="100%">
                <a class="play active">Play</a>
            </div>            
        </div>        
   
    </div>
  
</section>
<%@include file="/WEB-INF/views/mobile/include/bottom.jsp"%>