<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >   
                    <h2 class="right-tit">상품 상세정보</h2>

                    <div class="sub-g-btn">
                        <button type="button" id="btnModify" class="edit-btn" data-target="#">수정</button>
                        <button type="button" class="edit-btn" data-toggle="modal" data-target="#adm_02_02_01">삭제</button>
                        <button type="button" id="btnList" class="sea-btn add-btn" data-target="#"><img src="/image/back-list.png" cwidth="100%">상품목록</button>
                    </div>
                    
                    <div class="form-page joinus-page edit-page">

                       <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                          <colgroup>
                              <col width="30%">
                              <col width="70%">
                          </colgroup>
                          <tbody>
                             <tr>
                                <td><strong>스윙세이버 프로</strong></td>
                                <td>${itemInfo.pro_name}</td>
                             </tr>                        	
                             <tr>
                                <td><strong>상품명</strong></td>
                                <td>${itemInfo.title}</td>
                             </tr>                  
                             <tr>
                                <td><strong>상품종류</strong></td>
                                <td>${itemInfo.item_type_name}</td>
                             </tr>                           
                             <tr>
                                <td><strong>상품가격</strong></td>
                                <td>${itemInfo.price}</td>
                             </tr> 
                             <tr>
                                <td><strong>상품기간(유효기간)</strong></td>
                                <td>${itemInfo.period} 개월</td>
                             </tr>                        
                             <tr>
                                <td><strong>레슨횟수(원포인트레슨일경우)</strong></td>
                                <td>${itemInfo.lessioncount} 회</td>
                             </tr>                            
                             <tr>
                                <td><strong>상품설명</strong></td>
                                <td>${itemInfo.description}</td>
                             </tr>                        
                                  
                             <tr>
                                <td><strong>구매횟수</strong></td>
                                <td>${itemInfo.buycount}</td>
                             </tr>                                                                                   	         
                          </tbody>
                       </table>
 
                    </div>

                </div>
            </div>
 </section>
 
    <!--    그룹삭제 adm_02_02_01 -->
    
    <div class="modal fade" id="adm_02_02_01" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">제품 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <h5>${itemInfo.title}</h5>
                    <p>해당 제품을 정말로 삭제하시겠습니까?</p>
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
       
<script>

$(document).ready(function(){

    $("#btnList").click(function(){
    	fn_proList();
    });
    $("#btnModify").click(function(){
    	fn_modify();
    });
    
    $('#btnDelete').click(function() {
    	if ("${itemInfo.buycount}" != "0")
        	$("#adm_02_02_01").modal("show");
    	else 
    		alert("구매건이 있는 경우 삭제가 불가합니다!!!");
    }); 
    
    $("#delete").click(function(){
        var obj = new Object();
        obj.id = "${itemInfo.id}";

        var jsonData = JSON.stringify(obj);
        console.dir(jsonData);
        AjaxCall("/admin/item/deleteItem","POST",jsonData);
    });
    
    $("#close").click(function(){  	
        $("#adm_02_02_01").modal("hide");
    });
});

// 상품목록 수정화면으로 이동
function fn_modify()
{
	location.href="/admin/item/modify/"+"${itemInfo.id}";
}
// 상품목록 리스트로 이동
function fn_proList()
{
	location.href="/admin/item/itemList";
}
</script>



<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
