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
                    <h2 class="right-tit">상품 수정</h2>

                    <div class="form-page joinus-page edit-page">


                        <form class="form-signin" id='forms1' name="forms1" method="POST">
                        <input type="hidden" id="groupid"    name="groupid" value="${info.groupid}">
                        <input type="hidden" id="subgroupid" name="subgroupid" value="${info.subgroupid}">
                        <input type="hidden" id="id" name="id" value="${info.id}">
                        <input type="hidden" id="status" name="status" value="${info.status}">
                        <input type="hidden" id="item_type" name="item_type" value="${info.item_type}">
                        
                            <div class="question">
                                <p>상품종류</p>
                                <input type="text" class="que-val" id="item_type_name" name="item_type_name" value="${info.item_type_name}" readonly/>
                            </div>

                            <div class="question">
                                <p>상품명</p>
                                <input type="text" class="que-val" id="title" name="title" placeholder="상품명" value="${info.title}" required />
                            </div>
                            <div class="question">
                                <p class="text_t">상품설명</p>
                            	<textarea name="description" id="description" placeholder="상품설명을 입력해주세요" cols="50" rows="5">${info.description}</textarea>
                           </div>                            
                            
                            <div class="question">
                                <p>상품가격</p>
                                <input type="number" class="que-val" id="price" name="price" value="${info.price}" required maxlength="5" oninput="maxLengthCheck(this)" />
                            </div>
                            <div class="question">
                                <p>사용횟수</p>
                                <input type="number" class="que-val" id="lessoncount" name="lessoncount" value="${info.lessoncount}" maxlength="2" oninput="maxLengthCheck(this)" required />
                            </div>
                           <c:if test="${info.item_type == '1'}">
                           	<!-- 그룹정보  -->
                           	<div class="question grouptype">
                                <p>사용인원</p>
                                <input type="number" class="que-val" id="quota" name="quota" value="${info.quota}" required maxlength="5" oninput="maxLengthCheck(this)" />
                           	</div>
                            <div class="question grouptype">
                                <p>시작 날짜</p>
                                <input type="text" id="startdate" name="startdate" value="${info.startdate}" placeholder="소그룹 시작 날짜 입력" required />
                            </div>
                            <div class="question grouptype">
                                <p>종료 날짜</p>
                                <input type="text" id="enddate" name="enddate" value="${info.enddate}" placeholder="소그룹 종료 날짜 입력" required />
                            </div>                                                      
                           	<!-- 그룹정보 End -->     
                           </c:if>        
                            
                        
                         <c:if test="${info.item_type == '2'}">
                         <!--상품종류 원포인트 선택시만 노출-->
                            <div class="question">
                                <p>사용기한</p>
                                <select name="expiryperiod">
                                  <option value="" selected="selected">사용기한을 선택해주세요</option>
                                  <option value="3" <c:if test="${info.expiryperiod == 3}">selected</c:if>>3개월</option>
                                  <option value="6" <c:if test="${info.expiryperiod == 6}">selected</c:if>>6개월</option>
                                  <option value="12" <c:if test="${info.expiryperiod == 12}">selected</c:if>>12개월</option>
                                </select>
                            </div>
                        <!--상품종류 원포인트 선택시만 노출-->
                          </c:if>  
                            <button class="form-btn" id="btnSave">수정</button>


                        </form>
                    </div>

                </div>
            </div>
        </article>
    </section>

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
	}else if($("#item_type").val() == "1") {
		if ($("#quota").val() == "")
		{
			alert("사용인원을 입력하세요!!!");
			$("#quota").focus();
			return;
		}	
        var startdate=$("#startdate").val();
        var enddate=$("#enddate").val();
        if(startdate == ""){
            alert("소그룹 시작일자를 입력 하세요");
            return;
        }
        if(enddate == ""){
            alert("소그룹 종료일자를 입력 하세요");
            return;
        }        
	}

    document.forms1.action = "/market/item/update";
    document.forms1.submit();
}
</script>


</body>
</html>