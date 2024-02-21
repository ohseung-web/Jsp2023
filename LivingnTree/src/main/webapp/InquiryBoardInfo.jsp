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
.titleArea p{
    margin: 0;
    font-size: 13px;
    color: #000;
}
.inquiryContainer .contents .inquiryBox{
	display: table;
	table-layout: fixed;
	padding: 10px;
	width: 100%;
	border: 10px solid #f6f6f6;
}
.inquiryBox .inquiryBoxWrap{
	display: flex;
	gap: 10px;
	align-items: center;
}
.inquiryBox .inquiryimg img{
	width: 65px;
	height: 65px;
}
.inquiryBox .inquiryBoxWrap .inquiryinfo h3{
	font-weight: 700;
}
.typeWrite .head{
    padding: 30px 0;
    border-bottom: 1px solid #eaeaea;
}
.typeWrite .head h3{
    font-size: 18px;
    font-weight: normal;
}
.typeWrite .head .description{
    margin-top: 15px;
}
.typeWrite .head .description .name{
    display: inline-block;
    margin-right: 8px;
}
.typeWrite .head .description .etcArea{
    display: inline-block;
}
.typeWrite .head .description .etcArea li{
    display: inline-block;
    padding: 0 8px;
    vertical-align: middle;
    color: #6d6d6d;
}
.typeWrite .detail{
    padding: 30px 20px;
    word-break: break-all;
    line-height: normal;
}
.btnBox{
    margin: 12px 0;
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
.btnBox .left{
    float: left;
    text-align: left;
}
.btnBox .left a{
    margin-right: 8px;
}
.btnBox .right{
    float: right;
    text-align: right;
}
.btnBox .right a{
    margin-left: 8px;
}
</style>
</head>
<body>
    <div class="inquiryContainer">
        <div class="contents">
            <div class="titleArea">
                <h2>상품 문의</h2>
                <p>상품 Q&A입니다.</p>
            </div>
            <div class="inquiryBox">
            	<div class="inquiryBoxWrap">
            		<div class="inquiryimg">
            			<img src="img/productimg/${idto.p_mainimg}">
            		</div>
            		<div class="inquiryinfo">
            			<h3>${idto.p_name}</h3>
            		</div>
            	</div>
            </div>
            <div class="typeWrite">
                <div class="head">
                    <h3>${idto.i_title}</h3>
                    <div class="description">
                        <span class="name">${idto.m_name}</span>
                        <ul class="etcArea">
                            <li>${idto.i_date}</li>
                            <li>조회 ${idto.i_readcount}</li>
                        </ul>
                    </div>
                </div>
                <div class="detail">
                    ${idto.i_content}
                </div>
                <div class="btnBox">
                    <span class="left">
                        <c:if test="${loginId eq idto.m_id}">
                            <a href="InquiryBoardDelete.do?code=${idto.i_code}" class="btnNormalFix sizeM">삭제</a>
                            <a href="InquiryBoardUpdate.do?code=${idto.i_code}" class="btnNormalFix sizeM">수정</a>
                        </c:if>
                    </span>
                    <span class="right">
                        <a href="InquiryBoardList.do" class="btnNormalFix sizeM">목록</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>