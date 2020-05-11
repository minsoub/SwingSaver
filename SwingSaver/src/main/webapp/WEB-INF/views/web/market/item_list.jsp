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
                <h2 class="right-tit">상품관리</h2>
                <button type="button" data-toggle="modal" data-target="#g_sub_01_02" class="sea-btn del-btn" id="btnDel">상품삭제</button>
                <button type="button" class="sea-btn add-btn" id="btnAdd">상품생성</button>
                <div class="col-xs-12 table-box">
                    <div class="table-responsive">
                        <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="3%">
                                <col width="22%">
                                <col width="15%">
                                <col width="15%">
                                <col width="15%">
                                <col width="15%">
                                <col width="15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name=" " value=" "></th>
                                    <th>상품이름</th>
                                    <th>종류</th>
                                    <th>유효기간</th>
                                    <th>레슨횟수</th>
                                    <th>가격</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" name=" " value=" "></td>
                                    <td>초보 기초 완성반</td>
                                    <td>월정액</td>
                                    <td>1개월</td>
                                    <td>4회</td>
                                    <td>100,000원</td>
                                    <td>사용가능</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name=" " value=" "></td>
                                    <td>중급 기본 완성반</td>
                                    <td>월정액</td>
                                    <td>1개월</td>
                                    <td>4회</td>
                                    <td>100,000원</td>
                                    <td>사용불가</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name=" " value=" "></td>
                                    <td>고급 실전 완성반</td>
                                    <td>월정액</td>
                                    <td>1개월</td>
                                    <td>4회</td>
                                    <td>100,000원</td>
                                    <td>사용가능</td>
                                </tr>                                
                                <tr>
                                    <td><input type="checkbox" name=" " value=" "></td>
                                    <td>자세교정 완성반(중급)</td>
                                    <td>원포인트</td>
                                    <td>6개월</td>
                                    <td>12회</td>
                                    <td>200,000원</td>
                                    <td>매진</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name=" " value=" "></td>
                                    <td>자세교정 완성반(고급)</td>
                                    <td>원포인트</td>
                                    <td>12개월</td>
                                    <td>25회</td>
                                    <td>400,000원</td>
                                    <td>사용가능</td>
                                </tr>

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
                    <h5>상품 이름1</h5>
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
    	$("#btnAdd").click(function(){
    		location.href="/market/itemAddform";
    	});
    });
    
</script> 

</body>
</html>

 
    }
