<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/web/inc/score_header.jsp"%>


                   <section class="container no-padding">
                <div class="col-xs-12" style="padding: 0">
                    <div class="score-page form-page" style="margin: 0px">
                    <div class="test">
                    <img src="/image/sc-image.png" width="100%">
                    </div>
                               <div class="sc-ad">
                                   <p><strong>스코어 관리</strong>가 필요하신가요?<br/>
                                   <a href=""><span>스윙세이버를 시작! <strong>Click!</strong></span></a></p>
                               </div>
                                
                                <button id="btnSave" class="form-btn" onclick="#">이미지저장하기</button>
                                <button id="btnPrint" class="img-btn" onclick="#">인쇄하기</button>


                    </div>

                </div>
    </section>
    
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/html2canvas.min.js"></script>
<script type="text/javascript" src="/js/canvas2image.js"></script>
<script type="text/javascript">

var test = $(".test").get(0);  // html 얻기
// to canvas
$('#btnSave').click(function(e) {
  html2canvas(test).then(function(canvas) {
    // canvas width
    var canvasWidth = canvas.width;
    // canvas height
    var canvasHeight = canvas.height;
    // render canvas
    $('.toCanvas').after(canvas);
    // show 'to image' button
    $('.toPic').show(1000);
    // convert canvas to image
    //$('.toPic').click(function(e) {
      var img = Canvas2Image.convertToImage(canvas, canvasWidth, canvasHeight);
      // render image
      $(".toPic").after(img);
      // save
    //  $('#save').click(function(e) {
        let type = "jpeg"; // image type
        let w = 400; // image width
        let h = 600; // image height
        let f = "score"; // file name
        w = (w === '') ? canvasWidth : w;
        h = (h === '') ? canvasHeight : h;
        // save as image
        Canvas2Image.saveAsImage(canvas, w, h, type, f);
  //    });
  //  });
  });
});
</script>    

<%@include file="/WEB-INF/views/web/inc/score_footer.jsp"%>