<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/web/inc/header.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/views/web/inc/navi.jsp"%>
    
<form id="form1" name="form1" method="post">
<input type="hidden" name="id" value="${info.id}">
<input type="hidden" name="item_type" value="${info.item_type}">
</form> 

    <section class="container no-padding">
        <article class="col-xs-12" style="padding: 0;">
           <%@include file="/WEB-INF/views/web/inc/item_menu.jsp"%>    
           
             <div class="content col-xs-9" style="padding: 0;">
                <div class="col-xs-12 no-padding">
                    <h2 class="right-tit">상품상세</h2>
                    <div class="sub-mem-list">
                    <h4 class="sub-tit">상품정보</h4>
                    <div class="sub-g-btn">
                        <button type="button" id="btnModify" class="edit-btn" data-target="#">수정</button>
                        <button type="button" id="btnDelete" class="edit-btn" data-toggle="modal" data-target="#adm_02_02_01">삭제</button>
                        <button type="button" id="btnList"   class="sea-btn add-btn" data-target="#">
                        <img src="/image/back-list.png" cwidth="100%">    
                            지역목록</button>
                    </div>

                        
                    <div class="col-xs-12 table-box">
                        <div class="table-responsive">
                            <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                                <colgroup>
                                    <col width="30%">
                                    <col width="70%">

                                </colgroup>

                                <tbody>
                                    <tr>
                                        <td><strong>상품종류</strong></td>
                                        <td>${info.item_type_name}</td>
                                    </tr>                                    
                                    <tr>
                                        <td><strong>상품명</strong></td>
                                        <td>${info.title}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>상품설명</strong></td>
                                        <td>${info.description}</td>
                                    </tr>                                    
                                    <tr>
                                        <td><strong>상품가격</strong></td>
                                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${info.price}" />원</td>
                                    </tr>
                                    <tr>
                                        <td><strong>사용횟수</strong></td>
                                        <td>${info.lessoncount}회</td>
                                    </tr>
                                    <tr>
                                        <td><strong>사용기한</strong></td>
                                        <td><c:if test="${info.item_type=='1'}">${info.startdate}~${info.enddate}</c:if>
                                            <c:if test="${info.item_type=='2'}">${info.expiryperiod}개월</c:if></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
   
                </div>
            </div>
        </article>
    </section>


    <!--    소그룹삭제 g_sub_01_02 -->
    <div class="modal fade" id="g_sub_01_02" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">상품 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <h5>${info.title}</h5>
                    <p>해당 상품을 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="delete" class="modal-btn btn-secondary" data-dismiss="modal">삭제</button>
                        </div>  
                        <div class="mo-pa col-md-6 ">
                            <button type="button" id="close" class="modal-btn">취소</button>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>

 
    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->


<script>

$(document).ready(function(){

    $("#btnList").click(function(){
    	fn_List();
    });
    $("#btnModify").click(function(){
    	fn_modify();
    });
    
    $('#btnDelete').click(function() {
    	console.log("show");
        $("#g_sub_01_02").modal("show");
    }); 
    
    $("#delete").click(function(){
        var obj = new Object();
        obj.id = "${info.id}";

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/market/item/delete","POST",jsonData);
    });
    
    $("#close").click(function(){  	
    	console.log("hide");
        $("#g_sub_01_02").modal("hide");
    });
});

// 수정화면으로 이동
function fn_modify()
{
	document.form1.action = "/market/item/modify";
	document.form1.submit();
}
// 리스트로 이동
function fn_List()
{
	location.href="/market/item/list";
}
</script>

</body>
</html>
