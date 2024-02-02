<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<script src="https://kit.fontawesome.com/82fd850f0d.js" crossorigin="anonymous"></script>
<style>
.loginContainer{
    display: flex;
    justify-content: center;
    width: 100%;
}
.loginContainer .contents{
    width: 400px;
    margin: 50px 0;
}
.title{
    margin: 45px 0 40px;
    text-align: center;
}
.title h2{
	font-weight: 700;
    font-size: 32px;
    color: #1f1f1f;
}
.loginContainer .contents .login input{
    display: block;
    width: 100%;
    height: 48px;
    line-height: 48px;
    font-size: 13px;
    margin-bottom: 10px;
    padding: 0 20px;
    border: 1px solid #e3e3e3;
}
.loginContainer .contents .login input::placeholder{
	color: #bbb;
}
.loginContainer .contents .login_idSave_wrap{
    display: flex;
    justify-content: flex-end;
}
.loginContainer .contents .login_idSave_wrap p{
    margin: 10px 0 20px;
}
/* checkbox css start */
.loginContainer .contents .login_idSave_wrap .login_idSave input[type="checkbox"]{
    display : none;
}
.loginContainer .contents .login_idSave_wrap .login_idSave .check_label:before {
    content: '\f00c';
    font-family: fontawesome;
    width: 24px;
    height: 24px;
    text-align: center;
    line-height: 24px;
    font-size: 16px;
    color : #ccc;
    /*  border-radius: 3px; */
    border: 1px solid #ccc;
    margin-right: 10px;
    /* color: transparent; */
    display: inline-block;
}
.loginContainer .contents .login_idSave_wrap .login_idSave input[type="checkbox"]:checked + .check_label::before {
   /* background-color: rgb(43, 43, 43); */
   /*  color: white; */
   color: black;
   font-weight: bold;
}
/* checkbox css end */
.loginContainer .contents .login_idSave_wrap p label{
    margin: 0 15px 0 10px;
    vertical-align: middle;
}
.loginContainer .contents .login_button input[type="submit"]{
    width: 100%;
    height: 56px;
    padding: 19px 26px;
    font-size: 16px;
    font-weight: 700;
    line-height: 18px;
    border: 0;
    background: #d0ac88;
    color: #fff;
    cursor: pointer;
}
.loginContainer .contents .login_find{
    display: flex;
    justify-content: center;
}
.loginContainer .contents .login_find div{
    margin-top: 20px;
    padding: 0 10px;
}
.loginContainer .contents .login_find div a{
	font-size: 14px;
}
.loginContainer .contents .login_find div:nth-child(2){
    padding-left: 11px;
    background: url(img/icon/line2.png);
    background-repeat: no-repeat;
    background-position: left;
}
.loginContainer .contents .login_util{
    display: flex;
    justify-content: center;
    flex-direction: column;
    width: 100%;
    height: 232px;
    margin-top: 20px;
    border: 1px solid #e3e3e3;
    text-align: center;
}
.loginContainer .contents .login_util div:nth-child(1){
    font-size: 18px;
    font-weight: 700;
    color: #1a1a1a;
}
.loginContainer .contents .login_util div:nth-child(2){
    margin: 8px 0 23px 0;
    font-size: 14px;
    line-height: 1.5;
    color: #8a8a8a;
}
.loginContainer .contents .login_util div:nth-child(3){
    width: 152px;
    height: 56px;
    margin: 0 auto;
    border: 1px solid #d6d6d6;
}
.loginContainer .contents .login_util div:nth-child(3) a{
    display: block;
    width: 100%;
    height: 100%;
    line-height: 56px;
    font-size: 16px;
    font-weight: 700;
    color: #1a1a1a;
}
</style>
</head>
<body>
    <div class="loginContainer">
        <div class="contents">
        	<div class="title">
                <h2>로그인</h2>
            </div>
            <form action="MemberLoginProc.do" method="post">
                <div class="login">
                    <input type="text" id="id" name="id" placeholder="아이디">
                    <input type="password" id="pw" name="pw" placeholder="비밀번호">
                </div>
                <div class="login_idSave_wrap">
                    <p class="login_idSave">
                        <input type="checkbox" id="check_save_id" name="check_save_id">
                        <label for="check_save_id" class="check_label">아이디 저장</label>
                    </p>
                </div>
                <div class="login_button">
                    <input type="submit" value="로그인">
                </div>
            </form>
            <div class="login_find">
                <div><a href="Main.jsp?section=MemberFindId.jsp">아이디 찾기</a></div>
                <div><a href="Main.jsp?section=MemberFindPw.jsp">비밀번호 찾기</a></div>
            </div>
            <div class="login_util">
                <div>아직 회원이 아니신가요?</div>
                <div>지금 회원가입을 하시면<br>다양하고 특별한 혜택이 준비되어 있습니다.</div>
                <div><a href="Main.jsp?section=MemberJoin.jsp">회원가입</a></div>
            </div>
        </div>
    </div>
    <script>
 		// 쿠키 set, delete, get function
    	function setCookie(cookieName, value, exdays){
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName){
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if(start != -1){
    			start += cookieName.length;
    			var end = cookieData.indexOf(';', start);
    			if(end == -1)end = cookieData.length;
    			cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}    
    
        // 아이디저장을 체크하면 아이디 저장(7일동안)
        window.onload = function(){
            // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 쿠키값 없으면 공백.
            
            let userLoginId = getCookie("userLoginId");
            console.log(userLoginId);
            document.getElementById("id").value = userLoginId;

            // ID가 있는경우 아이디 저장 체크박스 체크
            if(document.getElementById("id").value != ""){
                document.getElementById("check_save_id").checked = true;
            }

            // 아이디 저장하기 체크박스 onchange
            let check_save_id = document.getElementById("check_save_id");
    
            check_save_id.onchange = function (event) {
                if(check_save_id.checked){ //checked true
                    let userLoginId = document.getElementById("id").value;
                    setCookie("userLoginId", userLoginId, 7); // 7일 동안 쿠키 보관
                }else{ //checked false
        	        deleteCookie("userLoginId");
                }
            };

            // 아이디 저장하기가  눌린상태에서, ID를 입력한 경우
            let idInput = document.getElementById("id");
    
            idInput.addEventListener("keyup", function(e) {
    	        if(check_save_id.checked){ //checked true
        	        let userLoginId = document.getElementById("id").value;
                    setCookie("userLoginId", userLoginId, 7); // 7일 동안 쿠키 보관
                }
            })
        }
        
    </script>
</body>
</html>