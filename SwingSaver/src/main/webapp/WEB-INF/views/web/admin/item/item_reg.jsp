<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/admin_header.jsp"%>
<%@include file="/WEB-INF/views/web/inc/admin_menu.jsp"%>

            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >   
                    <h2 class="right-tit">상품등록</h2>

                    <div class="form-page joinus-page edit-page">


                        <form class="form-signin" id='forms1' name="forms1" method="POST">
                        <input type="hidden" id="id" name="id" value="${itemInfo.id}">
                            <div class="question">
                                <p>마켓프로</p>
                                <select name="proid" id="proid">    
                                    <option value="">스윙세이버 프로선택</option>                            
                                	<c:forEach var="proInfo" items="${proList}" varStatus="status">
                                    	<option value="${proInfo.id}" <c:if test="${proInfo.id == itemInfo.proid}">selected</c:if>>${proInfo.name}</option>
                                 	</c:forEach>
                                 </select>                                 
                            </div>                        
                            <div class="question">
                                <p>상품명</p>
                                <input type="text" id="title" name="title" maxlength="200" value="${itemInfo.title}" placeholder="상품명 입력" required />
                            </div>

                            <div class="question">
                                <p>상품타입</p>
                                <select name="item_type" id="item_type">
                  					<option value="" selected="selected">그룹타입을 선택해주세요.</option>
                  					<option value="1" <c:if test="${itemInfo.item_type == '1'}">selected</c:if>>월정액 상품</option>
                  					<option value="2" <c:if test="${itemInfo.item_type == '2'}">selected</c:if>>원포인트 레슨</option>
                				</select>
                            </div>
                            <div class="question">
                                <p>상품가격</p>
                                <input type="number" id="price" name="price" maxlength="8" value="${itemInfo.price}" placeholder="상품가격" required />
                            </div>

                            <div class="question">
                                <p>상품기간(유효기간)</p>
                                <select name="period" id="period">
                  					<option value="" selected="selected">상품기간을 선택해주세요.</option>
                  					<option value="1" <c:if test="${itemInfo.period == '1'}">selected</c:if>>1개월</option>
                  					<option value="2" <c:if test="${itemInfo.period == '2'}">selected</c:if>>2개월</option>
                  					<option value="3" <c:if test="${itemInfo.period == '3'}">selected</c:if>>3개월</option>
                  					<option value="4" <c:if test="${itemInfo.period == '4'}">selected</c:if>>4개월</option>
                  					<option value="5" <c:if test="${itemInfo.period == '5'}">selected</c:if>>5개월</option>
                  					<option value="6" <c:if test="${itemInfo.period == '6'}">selected</c:if>>6개월</option>
                  					<option value="7" <c:if test="${itemInfo.period == '7'}">selected</c:if>>7개월</option>
                  					<option value="8" <c:if test="${itemInfo.period == '8'}">selected</c:if>>8개월</option>
                  					<option value="9" <c:if test="${itemInfo.period == '9'}">selected</c:if>>9개월</option>
                  					<option value="10" <c:if test="${itemInfo.period == '10'}">selected</c:if>>10개월</option>
                  					<option value="11" <c:if test="${itemInfo.period == '11'}">selected</c:if>>11개월</option>
                  					<option value="12" <c:if test="${itemInfo.period == '12'}">selected</c:if>>12개월</option>
                				</select>                                
                            </div>
                            
                            <div class="question">
                                <p>상태</p>
                                <select name="status" id="status">
                  					<option value="Y" <c:if test="${itemInfo.status == 'Y'}">selected</c:if>>사용가능</option>
                  					<option value="N" <c:if test="${itemInfo.status == 'N'}">selected</c:if>>사용불가</option>
                  					<option value="S" <c:if test="${itemInfo.status == 'S'}">selected</c:if>>Sold Out</option>
                				</select>                                
                            </div>                            
                            
                            <div class="question">
                                <p>레슨횟수</p>
                                <input type="number" name="lessoncount" id="lessoncount" value="${itemInfo.lessoncount}" maxlength="2" placeholder="레슨횟수-원포인트레슨일 경우" required />
                            </div>
                            
                            <div class="question">
                                <p>상품설명</p>
                                <textarea name="description" id="description" placeholder="상품설명을 입력해주세요" cols=50 rows=5>${itemInfo.description}</textarea>
                            </div>

                            <p class="alert-p">정보를 모두 입력해주세요.</p>
                            <button id="btnSave" class="form-btn">저장</button>
                        </form>
                    </div>

                </div>
            </div>
 </section>
 
<script>

$(document).ready(function(){
    $("#btnSave").click(function(){
    	fn_itemSave();
    });
});

	function fn_itemSave()
	{
	    if($("#title").val() == ""){
	        alert("상품명을 입력하세요");
	        $("#title").focus();
	        return;
	    }
	    if($("#proid").val() == ""){
	        alert("마켓프로를 선택하세요");
	        $("#proid").focus();
	        return;
	    }
	    if($("#item_type").val() == ""){
	        alert("상품타입을 선택하세요");
	        $("#item_type").focus();
	        return;
	    }
	    if($("#price").val() == ""){
	        alert("상품가격을  입력하세요");
	        $("#price").focus();
	        return;
	    }
	    if($("#period").val() == ""){
	        alert("상품기간을 선택하세요");
	        $("#period").focus();
	        return;
	    }
	    if ($("#id").val() == "")
	    	document.forms1.action = "/admin/item/add";
	    else 
	    	document.forms1.action = "/admin/item/update";
	    document.forms1.submit();
	}
</script>



<%@include file="/WEB-INF/views/web/inc/admin_footer.jsp"%>
