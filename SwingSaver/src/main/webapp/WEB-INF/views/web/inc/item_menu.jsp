<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

            <div class="content-nav col-xs-3">
                <div class="side-menu">

                    <div class="user-info">
                        <p class="side-user">홍길동 프로</p>
                        <p class="meter-l meter-ti">현재회원 <span>200</span></p>
                        <p class="meter-r meter-ti">등록가능회원 <span>300</span></p>
                        <div class="meter info_color">
                            <span style="width:40%"></span>
                        </div>
                    </div>
                    <ul>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'item_') != -1}">active</c:if>" href="/market/item/list">상품관리</a></li>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'class_') != -1}">active</c:if>" href="/market/class/list">클래스관리</a></li>
                        <li><a class="<c:if test="${fn:indexOf(reqUri, 'pay_') != -1}">active</c:if>" href="/market/pay/list">매출조회</a></li>
                    </ul>
                </div>
            </div>