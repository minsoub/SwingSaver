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
           <%@include file="/WEB-INF/views/web/inc/mypage_left_menu.jsp"%>            
            
            <div class="content col-xs-9" style="padding: 0;">
            <div class="col-xs-12 no-padding">                   
                <h2 class="right-tit">결제내역조회</h2>
                <!-- button type="button" data-toggle="modal" data-target="#g_sub_01_02" class="sea-btn del-btn" id="btnDel">상품삭제</button>
                <button type="button" class="sea-btn add-btn" id="btnAdd">상품생성</button  -->
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="22%">
                                <col width="12%">
                                <col width="20%">
                                <col width="13%">
                                <col width="13%">
                                <col width="13%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구매내역</th>
                                    <th>유효기간</th>
                                    <th>가격</th>
                                    <th>결제금액</th>
                                    <!-- th>결제일자</th  -->
                                    <th>만기일자</th>
                                    <th>결제완료</th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach var="info" items="${itemList}" varStatus="status">
                                <tr>
                                    <!-- td><input type="checkbox" class="id" name="id" id="id" value="${info.id},${info.title}"></td  -->
                                    <td>${info.title}</td>
                                    <td>${info.startdate}~${info.enddate}</td>
                                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${info.price}" />원</td>
                                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${info.amount}" />원</td>
                                    <td>${info.duedate}</td>
                                    <td>${info.received}</td>
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
                    <h5><div id="delgrp"></div></h5>
                    <p>해당 상품을 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn btn-secondary" data-dismiss="modal">삭제</button>
                        </div>  
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn">취소</button>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->

    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

    <!-- Footer -->
<input type="hidden" id="deleteIds">
<script>

    $(document).ready(function(){
        $('.check-all' ).click( function() {
            $('.id' ).prop( 'checked', this.checked );
        } );
        
    	$("#btnAdd").click(function(){
    		location.href="/market/item/Addform";
    	});
    	
        $('#btnDelete').click(function() {
            var chklen = $("input[id=id]:checkbox:checked").length;
            var _text = "";
            var _idtext = "";

            if(chklen == 0){
                alert("삭제할 상품을 선택해주세요");
                return;
            }else{
            	console.dir("whereis...");
                var i = 1;
                $('#id:checked').each(function() {
                    _idtext = _idtext+$(this).val().split(",")[0];
                    _text= _text+$(this).val().split(",")[1];
                    if(i<chklen){
                        _idtext =_idtext+",";
                        _text= _text+"</br>";
                    }
                    i++;
                });
                $("#g_sub_01_02").modal("show");
                $("#delgrp").html(_text);
                $("#deleteIds").val(_idtext);
            }
        });  
        
        $("#delete").click(function(){
            var ids = $("#deleteIds").val();

            var obj = new Object();
            obj.id = ids;

            var jsonData = JSON.stringify(obj);
            console.dir(jsonData);
            AjaxCall("/market/item/delete","POST",jsonData);
        });
        
    });
    
</script> 

</body>
</html>
