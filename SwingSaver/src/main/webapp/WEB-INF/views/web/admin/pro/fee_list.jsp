<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>


        <div class="content" style="margin-bottom: 0;">
            <div class="no-padding adm-con">
                <h2 class="right-tit">프로 요금상세</h2>

                <button type="button" id="btnList" class="sea-btn add-btn" data-target="#">
                        <img src="/image/back-list.png" cwidth="100%">    
                            프로목록</button>
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="40%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">                                
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>상품이름</th>
                                    <th>클래스아이디</th>
                                    <th>멤버수</th>
                                    <th>시작일</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="info" items="${itemList}" varStatus="status">
                                <tr>
                                    <td>${info.title}</td>
                                    <td>${info.subgroupid}</td>
                                    <td>${info.buycount}</td>
                                    <td>${info.startdate}</td>
                                </tr>
                            </c:forEach>                         
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script>

$(document).ready(function(){
    $("#btnList").click(function(){
    	fn_List();
    });  
});	

function fn_List()
{
	location.href="/admin/market/proList";
}  

</script>
    
	<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>	
}
