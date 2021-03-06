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
        

            <%@include file="/WEB-INF/views/web/inc/group_left_menu.jsp"%>
            
            <div class="content col-xs-9" style="padding: 0;">
                <div class="col-xs-12 no-padding">
                    <h2 class="right-tit">그룹정보수정</h2>

                    <div class="form-page joinus-page edit-page">


                        <form>
                            <input type="hidden" id="id" value="${groupInfo.id}">
                            <input type="hidden" id="grouptype" value="${groupInfo.grouptype}">
                            <input type="hidden" id="quota" value="${groupInfo.quota}">
                            <input type="hidden" id="storagespace" value="${groupInfo.storagespace}">


                            <div class="question"><p>그룹아이디</p>
                                ${groupInfo.id}
                            </div>
                            <div class="question"><p>그룹이름</p>
                                <input type="text" id="groupname" value="${groupInfo.groupname}" placeholder="그룹이름 입력" required />
                            </div>
                            <div class="question"><p>그룹타입</p>
                                <c:choose>
                                    <c:when test="${groupInfo.grouptype eq 'A'}">
                                        Academy
                                    </c:when>
                                    <c:otherwise>
                                        Range
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="question"><p>사용량</p>
                                ${groupInfo.quota}명 / 1인 ${groupInfo.storagespace}
                            </div>


                            <div class="question"><p>사업자번호</p>
                                <input type="text" id="address" value="${groupInfo.address}" placeholder="사업자번호 입력(-빼고 입력)" required />
                            </div>

                            <div class="question"><p>연락처</p>
                                <input type="text" id="phone" value="${groupInfo.phone}" placeholder="전화번호(-빼고 입력)" required />
                            </div>

                            <p class="alert-p">정보를 모두 입력해주세요.</p>
                            <button class="form-btn" type="button" id="group">수정</button>
                        </form>
                    </div>

                </div>
            </div>
        </article>
    </section>

    <!-- Footer -->
    <%@include file="/WEB-INF/views/web/inc/footer.jsp"%>
    <!-- Footer -->

</body>
<script>

    $(document).ready(function(){
        $("#address").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만
        $("#phone").keyup(function(){ $(this).val($(this).val().replace(/[^0-9]/gi,"") );  }); //숫자만


        $("#group").click(function(){
            var groupname = $("#groupname").val();
            var grouptype = $("#grouptype").val();
            var quota = $("#quota").val();
            var storagespace = $("#storagespace").val();
            var address=$("#address").val();
            var phone=$("#phone").val();
            var id=$("#id").val();


            if(groupname ==""){
                alert("그룹이름을 입력 하세요");
                return;
            }

            if(!checkCorporateRegistrationNumber(address)){
                alert("사업자 번호를 확인해 주세요");
                return
            }
            if(phone == ""){
                alert("전화번호를 입력 하세요");
                return;
            }

            var obj = new Object();
            obj.groupname = groupname;
            obj.grouptype = grouptype;
            obj.quota = quota;
            obj.storagespace = storagespace;
            obj.address = address;
            obj.phone = phone;
            obj.id = id;
            obj.enddate = "${groupInfo.enddate}";
            obj.status ="Y";

            var jsonData = JSON.stringify(obj);
            console.log(jsonData);
            AjaxCall("/group/updateGroup","POST",jsonData);

        });
    });

</script>
</html>
