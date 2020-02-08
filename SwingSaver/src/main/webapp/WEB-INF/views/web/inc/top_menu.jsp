<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>스윙세이버</title>

    <!-- 부트스트랩 -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="	/css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

</head>

<body>

<nav id="topNav" class="navbar navbar-default dropdownmenu">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand page-scroll" href="/"><img src="/image/logo-01.svg" class="header-logo" width="100%"></a>
        </div>
        <div class="navbar-collapse collapse sub-navwrap" id="bs-navbar">
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" onclick="location.href='/#fir'">회사소개</button>
            </div>
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" data-toggle="dropdown">서비스</button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#sec">스윙세이버란?</a>
                    <a class="dropdown-item" href="#fou">서비스소개</a>

                </div>
            </div>
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" data-toggle="dropdown">제품</button>
            </div>
            <div class="dropdown">
                <button class="menubtn dropdown-toggle" data-toggle="dropdown">레슨마켓</button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/market/proList">레슨프로소개</a>
                    <a class="dropdown-item" href="#">레슨마켓소개</a>
                </div>
            </div>
            
                
                
                    <div class="dropdown">
                        <button class="menubtn dropdown-toggle" data-toggle="dropdown" onclick="location.href='/loginForm'">로그인</button>
                    </div>
                
            
        </div>
    </div>
</nav>