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


                        <form>
                            <div class="question">
                                <p>상품종류</p>
                                <select name="grouptype">
                                  <option value=" " selected="selected">상품종류를 선택해주세요</option>
                                  <option value="월정액">월정액</option>
                                  <option value="원포인트">원포인트</option>
                                </select>
                            </div>

                            <div class="question">
                                <p>상품명</p>
                                <input type="text" class="que-val" value="상품명" required />
                            </div>
                            <div class="question">
                                <p class="text_t">상품설명</p>
                            <textarea name="" id="" placeholder="상품설명을 입력해주세요" cols="50" rows="5"></textarea>
                           </div>                            
                            
                            <div class="question">
                                <p>상품가격</p>
                                <input type="number" class="que-val" value="상품가격" required />
                            </div>
                            <div class="question">
                                <p>사용횟수</p>
                                <input type="number" class="que-val" value="사용횟수" required />
                            </div>
                            
                        <!--상품종류 원포인트 선택시만 노출-->
                            <div class="question">
                                <p>사용기한</p>
                                <select name="grouptype">
                                  <option value=" " selected="selected">사용기한을 선택해주세요</option>
                                  <option value="3개월">3개월</option>
                                  <option value="6개월">6개월</option>
                                  <option value="12개월">12개월</option>
                                </select>
                            </div>
                        <!--상품종류 원포인트 선택시만 노출-->
                            
                            <button class="form-btn">생성</button>


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


</body>



</html>
