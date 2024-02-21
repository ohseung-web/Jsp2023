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
.reviewContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.reviewContainer .contents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0;
}
.reviewContainer .contents .titleArea{
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
    max-width: 586px;
    margin: 25px auto 0;
    font-size: 14px;
    color: #6D6D6D;
}
.reviewContainer .contents .typeList{
    border-top: 0;
}
table{
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
table tr{
    display: table-row;
    vertical-align: middle;
}
.typeList table th, .typeList table td{
    height: 29px;
    padding: 15px 10px 16px;
    font-size: 13px;
    line-height: 22px;
    vertical-align: middle;
    border: 0;
}
.typeList table th{
    border-bottom: 0;
    font-weight: 400;
    text-align: center;
    color: #000;
    background-color: #f6f6f6;
}
.typeList table td{
    border-bottom: 1px solid #e5e5e5;
    text-align: center;
    color: #555;
}
.typeList table td.code{
    color: #6d6d6d;
}
.typeList table td img{
	width: 46px;
	height: 46px;
}
.typeList table td.subject{
    padding-left: 20px;
    padding-right: 20px;
    text-align: left;
    word-break: break-all;
    word-wrap: break-word;
}
.typeList table td.subject a{
    margin-right: 5px;
    vertical-align: middle;
}
.typeList .boardEmpty{
    padding: 56px 0;
    border-bottom: 1px solid #e5e5e5;
    text-align: center;
    color: #6d6d6d;
}
.typeList .boardButton{
    margin-top: 20px;
    text-align: center;
}
.btnSubmitFix{
    display: inline-block;
    padding: 12px 20px;
    height: 40px;
    font-size: 13px;
    border: 1px solid transparent;
    line-height: 1;
    font-weight: 700;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #fff;
    background: #d0ac88;
}
.typeList .boardButton .btnSubmitFix{
    float: right;
    width: 135px;
    word-break: keep-all;
    word-wrap: break-word;
}
.typeList #boardSearchForm{
    /* margin-top: -60px; */
}
.typeList #boardSearchForm .boardSearch{
    max-width: 1480px;
    margin: 20px -5px 0;
    margin-left: auto;
    margin-right: auto;
}
.boardSearch .form{
    display: flex;
}
.boardSearch select, .boardSearch input[type="text"], .boardSearch a{
    margin: 0 5px;
}
select{
    max-width: 100%;
    height: 40px;
    padding: 0 30px 0 15px;
    font-size: 13px;
    border: 1px solid #e0e0e0;
    background: #fff url(img/icon/ico_select.png) no-repeat right 10px center;
    background-size: 14px 8px;
    appearance: none;
}
.boardSearch #search_key{
    width: 110px;
    padding: 0 30px 0 15px;
}
input[type="text"]{
    height: 40px;
    line-height: 40px;
    padding: 2px 4px 2px 15px;
    border: 1px solid #e0e0e0;
    color: #000;
    font-size: 13px;
}
input[type="text"]:hover, input[type="text"]:focus{
    border-color: #000;
    transition: 0.3s;
}
.boardSearch #search{
    width: 175px;
}
.btnNormal{
    display: inline-block;
    padding: 12px 20px;
    height: 40px;
    font-size: 13px;
    border: 1px solid #d0ac88;
    line-height: 1;
    font-weight: normal;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #d0ac88;
    background-color: #fff;
}
.typeList .pageing{
    margin: 50px auto;
    text-align: center;
}
.typeList .pageing > a:first-child{
    background: url(img/icon/btn_page_prev.png) no-repeat center center;
}
.typeList .pageing > a{
    display: inline-block;
    width: 40px;
    height: 40px;
    line-height: 40px;
    font-size: 0;
    text-align: center;
    vertical-align: top;
    background: url(img/icon/btn_page_next.png) no-repeat center center;
    background-size: 40px;
}
.typeList .pageing ol{
    display: inline-block;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
}
.typeList .pageing li{
    display: inline-block;
    margin: 0 0 0 -1px;
    vertical-align: top;
}
.typeList .pageing li a{
    display: block;
    width: 40px;
    padding: 12px 0;
    font-size: 14px;
    color: #6d6d6d;
    border: 1px solid #e5e5e5;
    line-height: 14px;
    background: #fff;
}
/* .typeList .pageing li a.this{

} */
</style>
</head>
<body>
	<c:if test="${msg != null and msg eq '0'}">
		<script type="text/javascript">
			alert("비밀번호를 확인하세요.");
		</script>
	</c:if>

	<div class="reviewContainer">
        <div class="contents">
            <div class="titleArea">
                <h2>상품 리뷰</h2>
                <p>상품 사용후기입니다.</p>
            </div>
            <div class="typeList">
                <table>
                    <tr>
                        <th width="80">번호</th>
                        <th width="85">상품정보</th>
                        <th width="615">제목</th>
                        <th width="85">작성자</th>
                        <th width="120">작성일</th>
                        <th width="55">조회</th>
                    </tr>
                    <c:if test="${aList.size() ne 0}">
                        <c:set var="number" value="${number}" />
                        <c:forEach var="rdto" items="${aList}">
                            <tr>
                                <td width="80" class="code">${number}</td>
                                <td width="85"><img src="img/productimg/${rdto.p_mainimg}"></td>
                                <!-- 답글 들여쓰기 -->
                                <td width="700" class="subject">
                                    <!--
                                                <c:if test="${bdto.re_step > 1}">
                                                    <c:forEach var="j" begin="1" end="${(bdto.re_step-1)*3 }">
                                                        &nbsp;
                                                    </c:forEach>
                                                </c:if>
                                                -->
                                    ${rdto.p_name}<br>
                                    <a href="ReviewBoardInfo.do?code=${rdto.r_code}">${rdto.r_title}</a>
                                </td>
                                <td width="85">${rdto.m_name}</td>
                                <td width="120">${rdto.r_date}</td>
                                <td width="55">${rdto.r_readcount}</td>
                            </tr>
                            <c:set var="number" value="${number=number-1}" />
                        </c:forEach>
                    </c:if>
                </table>
                <c:if test="${aList.size() eq 0}">
                    <p class="boardEmpty">게시물이 없습니다.</p>
                </c:if>
                <!-- 글쓰기 버튼 -->
                <%-- <div class="boardButton">
                    <c:if test="${loginId ne null}">
                        <a href="ReviewBoardWrite.jsp">글쓰기</a>
                    </c:if>
                </div> --%>
                <!-- 게시물 검색 -->
                <form id="boardSearchForm" action="" method="post">
                    <div class="boardSearch">
                        <div class="form">
                            <select name="search_key" id="search_key">
                                <option value="subject" selected="selected">제목</option>
                                <option value="content">내용</option>
                            </select>
                            <input type="text" name="search" id="search">
                            <a href="#" class="btnNormal" onclick="form_submit()">찾기</a>
                        </div>
                    </div>
                </form>
                <!-- 페이징 코드 [1] [2] [3] ... -->
                <c:if test="${aList.size() ne 0}">
                    <div class="pageing">
                        <c:if test="${startPage>pageBlock }">
                            <a href="ReviewBoardList.do?pageNum=${startPage-pageBlock}">이전</a>
                        </c:if>
            
                        <ol>
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                <li>
                                    <a href="ReviewBoardList.do?pageNum=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </ol>
            
                        <c:if test="${endPage<pageCount}">
                            <a href="ReviewBoardList.do?pageNum=${startPage+pageBlock}">다음</a>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <script>
        function form_submit(){
            document.getElementById('boardSearchForm').submit();
        }
    </script>
</body>
</html>