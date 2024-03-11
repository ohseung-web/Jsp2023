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
.inquiryContainer .contents .typeWrite{
    border-top: 2px solid #1a1a1a;
}
table{
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
.typeWrite th, .typeWrite td{
    height: auto;
    line-height: 22px;
    vertical-align: middle;
}
.typeWrite th{
    padding: 10px 30px;
    font-weight: 400;
    border-bottom: 1px solid #e5e5e5;
    background-color: #f6f6f6;
}
.typeWrite th.rw{
    padding-right: 15px;
    text-align: left;
}
.typeWrite th.top{
    vertical-align: top;
}
.typeWrite td{
    padding: 10px 20px;
    border-bottom: 1px solid #e5e5e5;
}
input[type=text], input[type=password] {
    height: 40px;
    line-height: 40px;
    padding: 2px 4px 2px 15px;
    border: 1px solid #e0e0e0;
    color: #000;
    font-size: 13px;
}
input[type="text"]:hover, input[type="text"]:focus,
input[type="password"]:hover, input[type="password"]:focus{
    border-color: #000;
    transition: 0.3s;
}
.typeWrite #subject{
    width: 526px;
}
.typeWrite #content{
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 440px;
    resize: none;
    padding: 20px;
    border: 1px solid #CCCCCC;
    line-height: 1.2;
    background: transparent;
    color: #000000;
}
.btnBox{
    margin-top: 20px;
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
            </div>
            <form id="boardUpdateForm" action="InquiryBoardUpdateProc.do" method="post">
                <div class="typeWrite">
                    <table>
                        <tr>
                            <th class="rw">제목</th>
                            <td>
                                <input type="text" name="subject" id="subject" value="${idto.i_title}" maxlength="100">
                            </td>
                        </tr>
                        <tr>
                            <th class="rw top">본문</th>
                            <td>
                                <textarea name="content" id="content" maxlength="500">${idto.i_content}</textarea>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="code" value="${idto.i_code}">
                </div>
                <div class="btnBox">
                    <span class="left">
                        <a href="InquiryBoardList.do" class="btnNormalFix sizeM">목록</a>
                    </span>
                    <span class="right">
                        <a href="#" class="btnNormalFix sizeM" onclick="history.go(-1)">취소</a>
                        <a href="#" class="btnSubmitFix sizeM" onclick="form_submit();">등록</a>
                    </span>
                </div>
            </form>
        </div>
    </div>
    <script>
        function form_submit(){
        	let subject = document.getElementById('subject');
        	let content = document.getElementById('content');
        	if(subject.value==""){
        		alert('제목을 입력하세요.');
        		return;
        	}
        	if(content.value==""){
        		alert('내용을 입력하세요.');
        		return;
        	}
            document.getElementById('boardUpdateForm').submit();
        }
    </script>
</body>
</html>