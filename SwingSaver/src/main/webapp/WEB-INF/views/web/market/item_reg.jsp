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
                    <h2 class="right-tit">상품 생성</h2>

                    <div class="form-page joinus-page edit-page">


                        <form class="form-signin" id='forms1' name="forms1" method="POST">
                        <input type="hidden" id="groupid"    name="groupid">
                        <input type="hidden" id="subgroupid" name="subgroupid">
                            <div class="question">
                                <p>상품종류</p>
                                <select name="item_type">
                                  <option value="" selected="selected">상품종류를 선택해주세요</option>
                                  <option value="1">월정액</option>
                                  <option value="2">원포인트</option>
                                </select>
                            </div>
                            <div class="question">
                                <p>상품명</p>
                                <input type="text" class="que-val" id="title" name="title" placeholder="상품명" required />
                            </div>
                            <div class="question">
                                <p class="text_t">상품설명</p>
                            	<textarea name="description" id="description" placeholder="상품설명을 입력해주세요" cols="50" rows="5"></textarea>
                           </div>                            
                            
                            <div class="question">
                                <p>상품가격</p>
                                <input type="number" class="que-val" id="price" name="price" required />
                            </div>
                            <div class="question">
                                <p>사용횟수</p>
                                <input type="number" class="que-val" id="lessoncount" name="lessoncount" required />
                            </div>
                            
                        <!--상품종류 원포인트 선택시만 노출-->
                            <div class="question">
                                <p>사용기한</p>
                                <select name="expiryperiod">
                                  <option value="" selected="selected">사용기한을 선택해주세요</option>
                                  <option value="3">3개월</option>
                                  <option value="6">6개월</option>
                                  <option value="12">12개월</option>
                                </select>
                            </div>
                        <!--상품종류 원포인트 선택시만 노출-->
                            
                            <button class="form-btn" id="btnSave">저장</button>

                        </form>
                    </div>

                </div>
            </div>
        </article>
    </section>


    <!--    상품삭제 g_sub_01_02 -->

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
                    <h5>상품이름1</h5>
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

<script>
$(document).ready(function(){
    $("#btnSave").click(function(){
    	fn_Save();
    });		
    
    
});

function fn_Save()
{
    if($("#item_type").val() == ""){
        alert("상품종류를 선택하세요!!!");
        $("#item_type").focus();
        return;
    }	
    if($("#title").val() == ""){
        alert("상품명을 입력하세요");
        $("#title").focus();
        return;
    }    
    if($("#description").val() == ""){
        alert("상품설명  입력하세요");
        $("#description").focus();
        return;
    }
    		
    if($("#price").val() == ""){
        alert("가격을 입력하세요");
        $("#price").focus();
        return;
    }
	if ($("#item_type").val() == "2")
	{
		if ($("#lessoncount").val() == "")
		{
			alert("사용횟수를 입력하세요!!!");
			$("#lessoncount").focus();
			return;
		}
		if ($("#expiryperiod").val() == "")
		{
			alert("사용기한을 선택하세요!!");
			$("#expiryperiod").focus();
			return;
		}
	}

    document.forms1.action = "/market/itemSave";
    document.forms1.submit();
}
</script>


</body>
</html>
