<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LivingnTree</title>
<link rel="stylesheet" href="css/reset.css">
<style>
.myShopContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.myShopContainer .contents{
    width: 100%;
    margin: 50px 0;
}
.myShopContainer .contents .prdEmpty{
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 60px 0;
	border-top: 2px solid #1a1a1a;
	border-bottom: 1px solid #e6e6e6;
    font-size: 16px;
    color: #9a9a9a;
	text-align: center;
}
.myShopContainer .contents .prdEmpty svg{
	display: block;
	max-width: 100%;
    height: auto;
	margin-bottom: 16px;
}
.myShopContainer .contents .myName{
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 500px;
    margin: 0 auto;
    padding: 50px 30px;
    border: 1px solid #e3e3e3;
    text-align: center;
}
.myShopContainer .contents .myShopArea{
    position: relative;
    width: calc(100% - 280px);
    max-width: calc(100% - 280px) !important;
    padding-left: 280px !important;
    margin: 0 auto !important;
    min-height: 630px;
}
.myShopContainer .contents .myShopArea .myShopMain{
    position: absolute;
    left: 0;
    top: 0;
    width: 200px;
}
.myShopArea .myShopMain .subTitle:first-child{
    margin: 0;
}
.myShopArea .myShopMain .subTitle{
    margin-top: 50px;
    padding-bottom: 6px;
}
.myShopArea .myShopMain h3{
    font-size: 16px;
    font-weight: 700;
    color: #000;
}
.myShopArea .myShopMain .menu li{
    margin-top: 15px;
}
.myShopArea .myShopMain .menu li a{
    display: block;
    color: #6d6d6d;
    font-size: 14px;
    cursor: pointer;
}
.myShopArea .titleArea{
    margin: 64px 0 16px 0;
    text-align: left;
}
.myShopArea .titleArea h3{
    font-size: 16px;
    font-weight: 500;
    color: #000;
}
/* .myShopArea .orderHistory{
    max-width: 1200px;
    width: 1000px;
} */
/*  .myShopArea .orderHistory .listItem{
	border-top: 2px solid #1a1a1a;
} */
/*
.myShopArea .orderHistory .listItem .orderList table{
    width: 100%;
    margin-top: 20px;
    border: 0;
    border-collapse: collapse;
}
.myShopArea .orderHistory .listItem .orderList table tr{
    display: table-row;
    vertical-align: middle;
}
.orderList table th, .orderList table td{
    height: 29px;
    padding: 5px 10px;
    line-height: 22px;
    vertical-align: middle;
    text-align: center;
    border: 0;
}
.myShopArea .orderHistory .listItem .orderList table th{
	height: 50px;
    white-space: nowrap;
    border-bottom: 0;
    font-weight: 400;
    background-color: #f6f6f6;
}
.myShopArea .orderHistory .listItem .orderList table td{
    border-bottom: 1px solid #e5e5e5;
}
.myShopArea .orderHistory .listItem .orderList table td a{
	vertical-align: middle;
}
.myShopArea .orderHistory .listItem .orderList table td img{
    width: 50px;
    height: 50px;
}
.btnNormal{
	display: inline-block;
    padding: 5px 10px;
	border: 1px solid #d0ac88;
    color: #d0ac88;
	background-color: #fff;
	vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
	cursor: pointer;
}
.sizeS{
    font-size: 12px;
} */
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
.nodata{
	padding: 56px 0;
    color: #6d6d6d;
    text-align: center;
}
</style>
</head>
<body>
    <div class="myShopContainer">
        <div class="contents">
            <div class="myShopArea">
                <div class="myShopMain">
                    <div class="subTitle"><h3>나의 쇼핑 정보</h3></div>
                    <ul class="menu">
                        <li><a href="MyShopOrder.do">주문내역 조회</a></li>
                        <li><a href="#">적립금 내역</a></li>
                        <li><a href="#">쿠폰 내역</a></li>
                        <li><a href="MyShopdelivaddress.do">배송 주소록 관리</a></li>
                    </ul>
                    <div class="subTitle"><h3>활동 정보</h3></div>
                    <ul class="menu">
                        <li><a href="#">최근 본 상품</a></li>
                        <li><a href="#">나의 위시리스트</a></li>
                        <li><a href="MyShopBoard.do">나의 게시글</a></li>
                    </ul>
                    <div class="subTitle"><h3>나의 정보</h3></div>
                    <ul class="menu">
                        <li><a href="MemberModify.do">회원정보 수정</a></li>
                        <li><a href="MemberLogoutProc.do">로그아웃</a></li>
                    </ul>
                </div>
                <div class="board">
                	<div class="titleArea">
                        <h3>게시물 관리</h3>
                	</div>
                	<div class="board_contents">
                        <c:choose>
                            <c:when test="${not empty aList || not empty aList2}">
                                <div class="typeList">
                                    <table>
                                        <tr>
                                            <th width="70">번호</th>
                                            <th width="700">제목</th>
                                            <th width="135">분류</th>
                                            <th width="85">작성자</th>
                                            <th width="100">작성일</th>
                                            <th width="55">조회</th>
                                        </tr>
                                        <c:set var="number" value="${number}" />
                                        <c:forEach var="idto" items="${aList}">
                                            <tr>
                                                <td width="80" class="code">${number}</td>
                                                <!-- 답글 들여쓰기 -->
                                                <td width="700" class="subject">
                                                    <a href="InquiryBoardInfo.do?code=${idto.i_code}">${idto.i_title}</a>
                                                </td>
                                                <td width="135"><a href="InquiryBoardList.do">상품 문의</a></td>
                                                <td width="85">${idto.m_name}</td>
                                                <td width="120">${idto.i_date}</td>
                                                <td width="55">${idto.i_readcount}</td>
                                            </tr>
                                            <c:set var="number" value="${number=number-1}" />
                                        </c:forEach>
                                        <c:forEach var="rdto" items="${aList2}">
                                            <tr>
                                                <td width="80" class="code">${number}</td>
                                                <td width="700" class="subject">
                                                    <a href="ReviewBoardInfo.do?code=${rdto.r_code}">${rdto.r_title}</a>
                                                </td>
                                                <td width="135"><a href="ReviewBoardList.do">상품 리뷰</a></td>
                                                <td width="85">${rdto.m_name}</td>
                                                <td width="120">${rdto.r_date}</td>
                                                <td width="55">${rdto.r_readcount}</td>
                                            </tr>
                                            <c:set var="number" value="${number=number-1}" />
                                        </c:forEach>
                                    </table>
                                    <!-- 페이징 코드 [1] [2] [3] ... -->
                                    <c:if test="${aList.size() ne 0 or aList2.size() ne 0}">
                                        <div class="pageing">
                                            <c:if test="${startPage>pageBlock}">
                                                <a href="MyShopBoard.do?pageNum=${startPage-pageBlock}">이전</a>
                                            </c:if>
                
                                            <ol>
                                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                                    <li>
                                                        <a href="MyShopBoard.do?pageNum=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </ol>
                
                                            <c:if test="${endPage<pageCount}">
                                                <a href="MyShopBoard.do?pageNum=${startPage+pageBlock}">다음</a>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                              <div class="prdEmpty">
                                <p class="nodata">게시물이 없습니다.</p>
                              </div>   
                            </c:otherwise>
                        </c:choose>
                	</div>
                </div>
                <%-- <div class="orderHistory">
                    <div class="titleArea">
                        <h3>게시물 관리</h3>
                    </div>
                    
                    
                    <div class="listItem">
                    	<c:choose>
                    		<c:when test="${oharr.size() > 0}">
                    			<div class="orderList">
                        			<table border="1">
                                        <tr>
                                            <th>주문일자</th>
                                            <th>주문번호</th>
                                            <th>상품정보</th>
                                            <th>수령인</th>
                                            <th>수량</th>
                                            <th>총금액</th>
                                            <th>배송상태</th>
                                            <th>취소</th>
                                        </tr>
                                        <c:forEach var="o" items="${oharr}">
                                            <form action="OrderDelete.do" name="formname" method="post">
                                                <tr>
                                                    <td>${o.o_date}</td>
                                                    <td>${o.o_date}_${o.o_code}</td>
                                                    <td>
                                                        <a href="ProductInfo.do?p_code=${o.p_code}">
                                                            <img src="img/productimg/${o.p_mainimg}">
                                                        </a>
                                                    </td>
                                                    <td>${o.d_delivname}</td>
                                                    <td>${o.o_qty}</td>
                                                    <td>
                                                        <fmt:formatNumber value="${o.o_total}" pattern="#,##0" />원
                                                    </td>
                                                    <td>${o.delivchk}</td>
                                                    <td>
                                                        <c:if test="${o.delivchk eq '배송준비중'}">
                                                            <button class="btnNormal sizeS" onclick="oh_delete()">취소</button>
                                                            <input type="hidden" name="date" value="${o.o_date}">
                                                			<input type="hidden" name="code" value="${o.o_code}">
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </table>
                        		</div>
                    		</c:when>
                    		<c:otherwise>
                    			<div class="prdEmpty">
                            		<svg xmlns="http://www.w3.org/2000/svg" width="65" height="64" fill="none" viewBox="0 0 65 64" class="icon" role="img"><path d="M63.3 32C63.3 49.0104 49.5104 62.8 32.5 62.8C15.4896 62.8 1.7 49.0104 1.7 32C1.7 14.9896 15.4896 1.2 32.5 1.2C49.5104 1.2 63.3 14.9896 63.3 32Z" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 18.6665V34.6665" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 40V44" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                            		주문 내역이 없습니다.
                        		</div>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div> --%>
            </div>
        </div>
    </div>
    <script>
        
    </script>
</body>
</html>