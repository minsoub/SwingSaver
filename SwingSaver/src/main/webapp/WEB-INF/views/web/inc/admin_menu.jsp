<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




   <section class=" no-padding">
      <div class="adm-nav" style="">
           <div class="adm-menu">
                <div class="logo-brand">
                    <a href="#">
                    <img src="/image/logo-defalt-white.png" width="100%">
                </a>
                </div>
                <ul>
                    <li><a class="<c:if test="${fn:indexOf(reqUri, 'adm_01') != -1}">active</c:if>" href="/admin/groupList">그룹관리</a></li>
                    <li><a class="<c:if test="${fn:indexOf(reqUri, 'adm_pro_01') != -1}">active</c:if>" href="/admin/markketProList">프로관리</a></li>
                    <li><a href="#">골프장관리</a>
                    <ul class="side-sub">
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'adm_03') != -1}">active</c:if>" href="/admin/areaList">-지역정보</a></li>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'adm_04') != -1}">active</c:if>" href="/admin/golfList">-골프장정보</a></li>
                    </ul>
                    </li>
                </ul>
            </div>
       </div>