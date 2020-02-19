<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>버디야</title>
<link rel="stylesheet" href="/mobile/css/style.css">
    

    <script src="/js/jquery-latest.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jsUtil.js"></script>
    <script src="/mobile/js/Common.js"></script>
    
    <!-- script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
    <script src="/js/morris.js-0.5.1/morris.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.js"></script>
    <!-- script src="/js/morris.js-0.5.1/lib/example.js"></script  -->
    <!-- link rel="stylesheet" href="/js/morris.js-0.5.1/lib/example.css" -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.css">
    <link rel="stylesheet" href="/js/morris.js-0.5.1/morris.css">    
    
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="reqUri" value="${pageContext.request.requestURI}"></c:set>
    <script>var currUri ='<c:out value="${reqUri}"/>'</script>
    
        
<script type="text/javascript">
<!--
// 주소창 자동 닫힘
window.addEventListener("load", function(){
setTimeout(loaded, 100);

}, false);

function loaded(){
window.scrollTo(0, 1);
}
//-->
</script>
<style media="screen">
   .wrap{
     width: 1000px;
     height: 300px;
     overflow-x: scroll;
     white-space:nowrap
   }
   .wrap img{
       width:300px;
       height:100%;
   }
</style>
</head>
<body>