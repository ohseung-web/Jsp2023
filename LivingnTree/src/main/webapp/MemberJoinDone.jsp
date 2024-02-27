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
.joinDoneContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.joinDoneContainer .contents{
    max-width: 1480px;
    width: 92%;
    margin: 20px 0 70px;
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
.memberArea{
    width: 720px;
    margin: 0 auto;
    line-height: 150%;
    text-align: center;
}
.memberArea .joinComplete{
    width: 100%;
    padding: 40px 100px;
    border: 1px solid #e3e3e3;
}
.memberArea .joinComplete .member_icon{
    margin-bottom: 16px;
}
.memberArea .joinComplete .member_icon img{
    width: 60px;
    height: 60px;
    vertical-align: top;
}
.memberArea .joinComplete .desc{
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 40px;
    color: #1a1a1a;
}
.memberArea .joinComplete .information{
    display: table;
    table-layout: fixed;
    width: 100%;
    border: 0;
    border-top: 1px solid #e8e8e8;
    border-bottom: 1px solid #e8e8e8;
    padding: 20px 10px;
}
.memberArea .joinComplete .information .description{
    display: table-cell;
    line-height: 1.5em;
    vertical-align: middle;
}
.memberArea .joinComplete .information .description dl{
    overflow: hidden;
	display: flex;
    text-align: left;
}
.memberArea .joinComplete .information .description dl dt{
    width: 70px;
    min-height: auto;
    padding: 5px 0;
    line-height: 22px;
    font-size: 14px;
    color: #1a1a1a;
}
.memberArea .joinComplete .information .description dl dd{
    min-height: auto;
    padding: 5px 0;
    line-height: 22px;
    font-size: 14px;
    color: #1a1a1a;
}
.memberArea .btnBox{
    display: flex;
    margin-top: 50px;
    text-align: center;
}
.memberArea .btnBox a{
    display: inline-block;
    width: 100%;
    height: 56px;
    line-height: 56px;
    font-size: 16px;
    border: 1px solid #bcbcbc;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #000;
    background-color: #fff;
}
.memberArea .btnBox a:hover{
    border-color: #000;
    transition: 0.3s;
}
</style>
</head>
<body>
	<div class="joinDoneContainer">
        <div class="contents">
            <div class="title">
                <h2>회원 가입 완료</h2>
            </div>
            <div class="memberArea">
                <div class="joinComplete">
                    <div class="member_icon">
                        <img src="img/icon/icon_joincomplete.svg" alt="아이콘">&nbsp;
                    </div>
                    <p class="desc">회원가입이 완료되었습니다.</p>
                    <div class="information">
                        <div class="description">
                            <dl>
                                <dt>아이디</dt>
                                <dd>${id}</dd>
                            </dl>
                            <dl>
                                <dt>이름</dt>
                                <dd>${name}</dd>
                            </dl>
                            <dl>
                                <dt>이메일</dt>
                                <dd>${email}</dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="btnBox">
                    <a href="MainList.do">메인으로 이동</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>