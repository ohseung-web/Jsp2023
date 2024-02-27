<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.typeWrite #password{
    width: 200px;
}
ul.info{
    margin-top: 20px;
    color: #707070;
    line-height: 1.5;
}
ul.info li{
    padding-left: 9px;
    font-size: 13px;
    line-height: 1.5;
}
ul.info li + li{
    padding: 4px 0 0 9px;
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
<!-- ProductInfo.jsp에서 InquiryBoardReWrite.jsp로 넘겨주어야 하기 때문에 스크립트릿으로 request로 받는다. -->
<%-- <% String p_code = request.getParameter("p_code");%> --%>
    <div class="inquiryContainer">
        <div class="contents">
            <div class="titleArea">
                <h2>상품 문의</h2>
            </div>
            <form id="boardReWriteForm" action="InquiryBoardRewriteProc.do" method="post">
                <div class="typeWrite">
                    <table>
                        <tr>
                            <th class="rw">제목</th>
                            <td>
                                <input type="text" name="subject" id="subject" maxlength="100">
                            </td>
                        </tr>
                        <tr>
                            <th class="rw top">본문</th>
                            <td>
                                <textarea name="content" id="content" maxlength="500"></textarea>
                                <input type="hidden" name="p_code" value="${idto.p_code}">
                            </td>
                        </tr>
                    </table>
                </div>
                <ul class="info">
                    <li>- 상품과 관련없는 내용 또는 이미지, 욕설/비방, 개인정보유출, 광고/홍보글 등 적절하지 않은 게시물은 별도의 고지없이 비공개 처리 될 수 있습니다. </li>
                    <li>- 작성된 게시물(사진, 동영상 포함)은 운영 및 마케팅에 활용될 수 있습니다.</li>
                </ul>
                <div class="btnBox">
                    <span class="left">
                        <a href="InquiryBoardList.do" class="btnNormalFix sizeM">목록</a>
                    </span>
                    <span class="right">
                        <a href="#" class="btnNormalFix sizeM" onclick="history.go(-1)">취소</a>
                        <a href="#" class="btnSubmitFix sizeM" onclick="form_submit();">등록</a>
                        <input type="hidden" name="ref" value="${idto.ref}">
						<input type="hidden" name="re_step" value="${idto.re_step}">
                    </span>
                </div>
            </form>
        </div>
    </div>
    <script>
        function form_submit(){
        	let subject = document.getElementById('subject');
            if(subject.value === ""){
			    alert('제목을 입력해주세요.');
			    return;
		    }
        	
        	let content = document.getElementById('content');
            if(content.value === ""){
			    alert('내용을 입력해주세요.');
			    return;
		    }
        	
            document.getElementById('boardReWriteForm').submit();
        }
    </script>
</body>
</html>