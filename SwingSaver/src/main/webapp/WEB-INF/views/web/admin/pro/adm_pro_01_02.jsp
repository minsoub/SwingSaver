<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>스윙세이버</title>

    <!-- 부트스트랩 -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

   <section class=" no-padding">
            <div class="adm-nav" style="">
           <div class="adm-menu">
                <div class="logo-brand">
                    <a href="#">
                    <img src="../image/logo-defalt-white.png" width="100%">
                </a>
                </div>
                <ul>
                    <li><a href="#">그룹관리</a></li>
                    <li><a class="active" href="#">프로관리</a></li>
                    <li><a href="#">골프장관리</a>
                    <ul class="side-sub">
                        <li><a href="#">-지역정보</a></li>
                        <li><a href="#">-골프장정보</a></li>
                    </ul>
                    </li>
<!--
                    <li><a href="#">submenu01</a></li>
                    <li><a href="#">submenu01</a></li>
-->
                </ul>

            </div>

            </div>
            <div class="content" style="margin-bottom: 0;">
                <div class="no-padding adm-con" >  
                    <h2 class="right-tit">마켓프로상세</h2>
                    <div class="sub-mem-list">
                    <h4 class="sub-tit">프로정보</h4>
                    <div class="sub-g-btn">
                        <button type="button" class="edit-btn" data-target="#">수정</button>
                        <button type="button" class="edit-btn" data-toggle="modal" data-target="#adm_02_02_01">삭제</button>
                        <button type="button" class="sea-btn add-btn" data-target="#">
                        <img src="../image/back-list.png" cwidth="100%">    
                            프로목록</button>
                    </div>

                        
                    <div class="col-xs-12 table-box">
                        <div class="table-responsive">
                            <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                                <colgroup>
                                    <col width="30%">
                                    <col width="70%">

                                </colgroup>

                                <tbody>

                                       <td class="bold-td" colspan="2">
                                       <img class="profile-img" src="../image/profile-img.png">    
                                           
                                       </td>
                                   <td>
                                    <tr>
                                        <td><strong>아이디</strong></td>
                                        <td>abcd@sample</td>
                                    </tr>                                    
                                    <tr>
                                        <td><strong>이름</strong></td>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <td><strong>프로레벨</strong></td>
                                        <td>Premium</td>
                                    </tr>
                                    <tr>
                                        <td><strong>프로필</strong></td>
                                        <td>한국대학교골프학과<br/>2000한국골프단<br/>2010한국골프단</td>
                                    </tr>
                                    <tr>
                                        <td><strong>수상경력</strong></td>
                                        <td>2010 PGA투어 윈덤 챔피언쉽1위<br/>
                                        2012 PGA투어 윈덤 챔피언쉽1위<br/>
                                        2017 KPGA투어 티업 지스윙 메가 오픈 공동 2위</td>
                                    </tr>

                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
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
                    <h4 class="modal-title text-center" id="exampleModalLabel">그룹 삭제</h4>

                </div>
                <div class="modal-body text-center">
                    <h5>한국골프대학</h5>
                    <p>해당 그룹을 정말로 삭제하시겠습니까?</p>
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








</body>



</html>
