<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>
    

    <section class="container no-padding">
        <article class="col-xs-12" style="padding: 0;">
           <%@include file="/WEB-INF/views/web/inc/item_menu.jsp"%>    
             <div class="content col-xs-9" style="padding: 0;">
                <div class="col-xs-12 no-padding">
                    <h2 class="right-tit">클래스관리</h2>
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="3%">
                                <col width="37%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">                                
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name=" " value=" "></th>
                                    <th>상품이름</th>
                                    <th>클래스아이디</th>
                                    <th>멤버수</th>
                                    <th>시작일</th>
                                </tr>
                            </thead>
                            <tbody>
                             <c:forEach var="info" items="${classList}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" class="id" name="id" id="id" value="${info.id},${info.groupname}"></td>
                                    <td><a href="/market/class/detail?id=${info.id}">${info.groupname}</a></td>
                                    <td>${info.id}</td>
                                    <td>${info.membercount}</td>
                                    <td>${info.startdate}</td>
                                </tr>
                            </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                </div>
   
                </div>
            </div>
        </article>
    </section>

    <!-- Footer -->

    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

    <!-- Footer -->

</body>
</html>
