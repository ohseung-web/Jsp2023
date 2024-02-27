<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<style>
.inquiryContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.inquiryContainer .contents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0;
}
.inquiryContainer .contents .titleArea{
    margin: 55px 0 40px;
    text-align: center;
}
.titleArea h2{
    display: inline-block;
    word-break: keep-all;
    word-wrap: break-word;
    width: 100%;
    font-weight: 700;
    font-size: 32px;
    color: #555;
}
.baseBox{
    width: 100%;
    margin: 0 auto;
    padding: 74px 0;
    text-align: center;
    border: 1px solid #e5e5e5;
}
.baseBox .headDesc{
    margin-bottom: 40px;
    font-size: 16px;
    line-height: 22px;
    color: #000;
}
.txtEm{
	font-size: 16px;
    font-weight: 700;
}
input[type=text], input[type=password] {
    height: 40px;
    line-height: 40px;
    padding: 2px 4px 2px 15px;
    border: 1px solid #e0e0e0;
    color: #000;
    font-size: 13px;
}
.baseBox .password input{
    width: 100%;
    max-width: 293px;
}
.btnBox{
    margin: 20px 0;
    text-align: center;
}
.btnNormalFix{
    display: inline-block;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    border: 1px solid #d0ac88;
    color: #d0ac88;
    background-color: #fff;
    word-break: keep-all;
    word-wrap: break-word;
}
.btnSubmitFix{
    display: inline-block;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    border: 1px solid transparent;
    color: #fff;
    background-color: #d0ac88;
    word-break: keep-all;
    word-wrap: break-word;
}
.sizeM{
    min-width: 135px;
    height: 50px;
    padding: 0 10px;
    line-height: 50px;
    font-size: 14px;
}
</style>
</head>
<body>
	<div class="inquiryContainer">
        <div class="contents">
            <div class="titleArea">
                <h2>상품 리뷰</h2>
            </div>
            <form id="boardSecretForm" action="InquiryBoardSecretProc.do" method="post">
                <div class="baseBox">
                    <p class="headDesc">
                        이 글은 비밀글입니다. <strong class="txtEm">비밀번호</strong>를 입력하여 주세요.<br>관리자는 확인버튼만 누르시면 됩니다.
                    </p>
                    <p class="password">
                        <input type="password" name="userPw" id="password">
                        <input type="hidden" name="dbPw" value="${idto.i_pw}">
                        <input type="hidden" name="code" value="${idto.i_code}">
                    </p>
                </div>
                <div class="btnBox">
                    <a href="InquiryBoardList.do" class="btnNormalFix sizeM">목록</a>
                    <a href="#" class="btnSubmitFix sizeM" onclick="form_submit();">확인</a>
                </div>
            </form>
        </div>
    </div>
    <script>
        function form_submit(){
        	let password = document.getElementById('password');
            if(password.value === ""){
			    alert('비밀번호를 입력해주세요.');
			    return;
		    }
        	
            document.getElementById('boardSecretForm').submit();
        }
    </script>
</body>
</html>