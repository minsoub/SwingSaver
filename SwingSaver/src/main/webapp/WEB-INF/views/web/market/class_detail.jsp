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
                    <h2 class="right-tit">클래스상세</h2>
                    <div class="sub-mem-list">
                    <h4 class="sub-tit">클래스정보</h4>
                    <div class="sub-g-btn">
<!--                        <button type="button" class="edit-btn" data-target="#">수정</button>-->
<!--                        <button type="button" class="edit-btn" data-toggle="modal" data-target="#g_sub_01_02">삭제</button>-->
                        <button type="button" id="btnList"  class="sea-btn add-btn" data-target="#">
                        <img src="/image/back-list.png" cwidth="100%">    
                            클래스목록</button>
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
                                        <td><strong>상품이름</strong></td>
                                        <td>${subGroupInfo.groupname}</td>
                                    </tr>                                   
                                    <tr>
                                        <td><strong>클래스아이디</strong></td>
                                        <td>${subGroupInfo.subgroupid}</td>
                                    </tr>                                    
                                    <tr>
                                        <td><strong>멤버 수</strong></td>
                                        <td>${subGroupInfo.membercount}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>시작날짜</strong></td>
                                        <td>${subGroupInfo.startdate}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>

                    <div class="sub-mem-list">
                    <h4 class="sub-tit">클래스멤버</h4>
                    <div class="sub-g-btn">
                        <!-- button type="button"  class="edit-btn" data-toggle="modal" data-target="#g_sub_02_01_01">이동</button  -->
                        <button type="button" id="memberdelete" class="edit-btn" >삭제</button>
                    </div>
                    <div class="col-xs-12 table-box">
                        <div class="table-responsive">
                            <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                                <colgroup>
                                    <col width="3%">
                                    <col width="27%">
                                    <col width="50%">
                                    <col width="20%">

                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" name=" " value=" "></th>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>등급</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="info" items="${subGroupInfo.subgroupmembers}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" id="userid" class="userid" value="${info.userid},${info.lastname}${info.firstname}"></td>
                                        <td>${info.lastname}${info.firstname}</td>
                                        <td>${info.email}</td>
                                        <td><c:set var="mtype" value="${info.membertype}"/>
                                            <c:choose>
                                                <c:when test="${mtype eq 'A'}">
                                                    Administrator
                                                </c:when>
                                                <c:when test="${mtype eq 'P'}">
                                                    Professional
                                                </c:when>
                                                <c:otherwise>
                                                    Student
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                               </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>    
                </div>
            </div>
        </article>
    </section>

    <!-- Footer -->

    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>

    <!-- Footer -->
    <div class="modal fade" id="subgrpmember" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog add-modal" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- 모달 이름 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title text-center" id="exampleModalLabel">소그룹멤버 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <div id="delsubgrpmember">

                    </div>
                    <form id="modalFrm">
                        <input type="hidden" id="seluserId">
                    </form>
                    <p>해당 소그룹멤버를 정말로 삭제하시겠습니까?</p>
                    <!-- 모달 내용 -->
                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->
                    <div class="col-md-12">
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn btn-secondary" id="delete">삭제</button>
                        </div>
                        <div class="mo-pa col-md-6 ">
                            <button type="button" class="modal-btn" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

<script>
    $(document).ready(function(){
        $( '.check-all' ).click( function() {
            $( '.userid' ).prop( 'checked', this.checked );
        } );

        $('#memberdelete').click(function() {
            var chklen = $("input[id=userid]:checkbox:checked").length;
            var _text = "";
            var _idtext = "";
            if(chklen == 0){
                alert("삭제할 소그룹 멤버를 선택해주세요");
                return;
            }else{
                var i = 1;
                $('#userid:checked').each(function() {
                    _idtext = _idtext+$(this).val().split(",")[0];
                    _text= _text+$(this).val().split(",")[1];
                    if(i<chklen){
                        _idtext =_idtext+",";
                        _text= _text+"</br>";
                    }
                    i++;
                });
                $("#subgrpmember").modal("show");
                $("#delsubgrpmember").html(_text);
                $("#seluserId").val(_idtext);
            }
        });
        $("#delete").click(function(){
            var subgroupid = '${subGroupInfo.subgroupid}';
            var userid = $("#seluserId").val();

            if(userid== ""){
                alert("삭제할 소그룹 멤버가 없습니다.");
                return;
            }

            var obj = new Object();
            obj.subgroupid = subgroupid;
            obj.userid = userid;

            var jsonData = JSON.stringify(obj);
			// alert(jsonData);
            AjaxCall("/group/subgroup/subGroupUserDelete","POST",jsonData);
            $("#subgrpmember").modal("hide");
        });
        

        $("#btnList").click(function(){
        	fn_List();
        });        
        
    });
    
    function fn_List()
    {
    	location.href="/market/class/list";
    }    
    </script>        
</html>
