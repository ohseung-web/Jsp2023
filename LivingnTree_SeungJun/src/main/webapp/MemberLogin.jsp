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
    margin-bottom: 10px;
    padding: 0 20px;
    border: 1px solid #e3e3e3;
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
    background: url(../img/icon/line2.png) no-repeat left;
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
                    <input type="text" name="id">
                    <input type="password" name="pw">
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
                <div><a href="#">아이디 찾기</a></div>
                <div><a href="#">비밀번호 찾기</a></div>
            </div>
            <div class="login_util">
                <div>아직 회원이 아니신가요?</div>
                <div>지금 회원가입을 하시면<br>다양하고 특별한 혜택이 준비되어 있습니다.</div>
                <div><a href="#">회원가입</a></div>
            </div>
        </div>
    </div>
</body>
</html>