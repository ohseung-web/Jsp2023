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
.cartOrderResultContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.cartOrderResultContainer .contents{
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
	<div class="cartOrderResultContainer">
        <div class="contents">
            <div class="title">
                <h2>구매 정보</h2>
            </div>
            <div class="memberArea">
                <div class="complete">
                    <p class="headDesc">고객님 상품구매가 완료 되었습니다.</p>
                    <div class="description">
                        <ul>
                            <li>
                                <strong class="term">수령인</strong>
                                <div class="desc">${name}</div>
                            </li>
                            <li>
                                <strong class="term">구매일자</strong>
                                <div class="desc">${date}</div>
                            </li>
                            <li>
                                <strong class="term">구매코드</strong>
                                <div class="desc">${date}_${code}</div>
                            </li>
                        </ul>
                    </div>
                </div>
	            <div class="btnBox">
                    <input type="button" class="normalBtn" onclick="location.href='MyShopOrder.do'" value="주문내역 조회">
                    <input type="button" class="submitBtn" onclick="location.href='MainList.do'" value="홈으로 이동">
                </div>
            </div>
        </div>
    </div>
</body>
</html>