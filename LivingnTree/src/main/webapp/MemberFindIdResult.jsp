<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LivingnTree</title>
<link rel="stylesheet" href="css/reset.css">
<style>
.findIdResultContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.findIdResultContainer .contents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0 150px;
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
    width: 400px;
    margin: 0 auto;
}
.memberArea .complete{
    text-align: center;
    line-height: 22px;
    color: #000;
}
.memberArea .complete .headDesc{
    margin-bottom: 20px;
    font-size: 16px;
}
.memberArea .complete .infoDesc{
    font-size: 13px;
}
.memberArea .complete .description{
    margin-top: 20px;
    text-align: left;
}
.memberArea .complete .description ul{
    overflow: hidden;
    margin-bottom: 20px;
    padding: 20px 0 10px;
    border-top: 1px solid #e5e5e5;
    border-bottom: 1px solid #e5e5e5;
    text-align: left;
}
.memberArea .complete .description ul li{
    margin-bottom: 10px;
}
.memberArea .complete .description ul li.hidden{
    display: none;
}
.memberArea .complete .description ul li .term{
    float: left;
    margin: 0 0 2px;
    padding: 0 4px 0 0;
    line-height: 22px;
    font-size: 13px;
}
.memberArea .complete .description ul li .desc{
    display: block;
    height: 22px;
    margin: 0 0 2px;
    padding: 0 5px 0 100px;
    line-height: 22px;
    font-size: 13px;
    font-weight: 400;
}
.memberArea .complete .description label{
	display: block;
	margin-top: 10px;
}
.memberArea .complete .description label span{
	font-size: 13px;
}
input[type="radio"]{
    position: relative;
    opacity: 1;
    width: 18px;
    height: 18px;
    margin-right: 10px;
    appearance: none;
    background: url("img/icon/bg_radio.png") no-repeat 0 0;
    background-size: 18px 18px;
    cursor: pointer;
}
input[type="radio"]:checked{
    background-image: url("img/icon/bg_radio_checked.png");
    transition: 0.2s ease-out;
}
.btnBox{
    display: flex;
    margin-top: 32px;
}
.btnBox input{
    display: inline-block;
    width: 195px;
    height: 50px;
    padding: 0 10px;
    line-height: 50px;
    font-size: 14px;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    cursor: pointer;
}
.btnBox .normalBtn{
    border: 1px solid #d0ac88;
    background-color: #fff;
    color: #d0ac88;
}
.btnBox .submitBtn{
    margin-left: 10px;
    border: 1px solid transparent;
    background-color: #d0ac88;
    color: #fff;
    font-weight: 700;
}    
</style>
</head>
<body>
	<div class="findIdResultContainer">
        <div class="contents">
            <div class="title">
                <h2>아이디 찾기</h2>
            </div>
            <div class="memberArea">
                <div class="complete">
                    <p class="headDesc">고객님 아이디 찾기가 완료 되었습니다.</p>
                    <p class="infoDesc">가입된 아이디가 총 ${idList.size()}개 있습니다.</p>
                    <div class="description">
                        <ul>
                            <li>
                                <strong class="term">이름</strong>
                                <div class="desc">${name}</div>
                            </li>
                            <c:choose>
                            	<c:when test="${not empty email}">
                            		<li>
                                		<strong class="term">이메일</strong>
                                		<div class="desc">${email}</div>
                            		</li>
                            	</c:when>
                            	<c:otherwise>
                            		<li>
                                		<strong class="term">휴대전화</strong>
                                		<div class="desc">${phone}</div>
                            		</li>
                            	</c:otherwise>
                            </c:choose>
                        </ul>
                        <c:forEach var="id" items="${idList}">
                        	<label>
                            	<input type="radio" name="fid">
                            	<span class="id">${id}</span>
                        	</label>
                        </c:forEach>
                    </div>
                </div>
                <div class="btnBox">
                    <input type="button" class="normalBtn" onclick="location.href='index.jsp?section=MemberLogin.jsp'" value="로그인">
                    <input type="button" class="submitBtn" onclick="location.href='index.jsp?section=MemberFindPw.jsp'" value="비밀번호 찾기">
                </div>
            </div>
        </div>
    </div>
</body>
</html>