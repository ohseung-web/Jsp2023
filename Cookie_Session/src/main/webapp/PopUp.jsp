<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popup</title>
<style type="text/css">
/* 오늘 하루 보지 않기 팝업 */
button {
  border: 0;
  background: none;
  cursor:pointer;
}

.main_popup {
  position: fixed;
  z-index: 1005;
  -webkit-box-shadow: 0px 13px 40px -6px #061626;
  box-shadow: 0px 13px 40px -6px #061626;
  top: 50px;
  left: 50px;
  display: none;

  &.on {
    display: block;
    background-color: #fff;
  }

  .img_wrap {
    width: 200px;
    height: 200px;
    display:flex;
    justify-content:center;
    align-items:center;
  }

  .btn_close {
    width: 32px;
    height: 32px;
    position: absolute;
    top: 17px;
    right: 17px;
    font-size: 0;
    border: 0;
    background: none;

    &::before {
      content: "";
      width: 2px;
      height: 32px;
      background-color: #333;
      position: absolute;
      top: 0;
      left: 15px;
      transform: rotate(45deg);
    }
    &::after {
      content: "";
      width: 32px;
      height: 2px;
      background-color: #333;
      position: absolute;
      top: 15px;
      left: 0;
      transform: rotate(45deg);
    }
  }

  .btn_today_close {
    width: 100%;
    height: 45px;
    background-color: #333;
    text-align: center;
    color: #fff;
    font-size: 14px;
    display: block;
    span {
      display: block;
      line-height: 40px;
      vertical-align: bottom;
      opacity: 0.8;
    }
  }
}
</style>
</head>
<body>
    <div class="main_popup">
  <div class="layer_cont">
    <div class="img_wrap">
      팝업 콘텐츠
    </div>
    <div class="btn_wrap">
      <!-- 오늘 하루 보지 않기 --->
      <button class="btn_today_close"><span>오늘 하루 보지 않기</span></button>
      <!-- 그냥 닫기 --->
      <button class="btn_close">close</button>
    </div>
  </div>
</div>
   
   <script> 
// 쿠키 관련 함수
   var handleCookie = {
       // 쿠키 쓰기 (이름, 값, 만료일)
       setCookie: function (name, val, exp) {
         var date = new Date();

         // 만료 시간 구하기(만료일을 ms단위로 변경)
         date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
         console.log(name + "=" + val + ";expires=" + date.toUTCString() + ";path=/");

         // 실제로 쿠키 작성하기
         document.cookie = name + "=" + val + ";expires=" + date.toUTCString() + ";";
       },
       // 쿠키 읽어오기(쿠키 이름을 기준으로 정규식 이용해서 가져오기)
       getCookie: function (name) {
         var value = document.cookie.match("(^|;) ?" + name + "=([^;]*)(;|$)");
         return value ? value[2] : null;
       }
   };
   
</script>
</body>
</html>