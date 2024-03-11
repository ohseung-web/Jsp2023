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
.myShopContainer .contents .myShopArea{
    position: relative;
    width: calc(100% - 280px);
    max-width: calc(100% - 280px) !important;
    padding-left: 280px !important;
    margin: 0 auto !important;
    min-height: 500px;
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
.myShopArea .orderHistory .listItem{
	border-top: 2px solid #1a1a1a;
}
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
}
/* 오티수정 CSS */
.myShopContainer .contents .pageing{
    margin: 0 auto;
    text-align: center;
}
.myShopContainer .contents .pageing > a:first-child{
    background: url(img/icon/btn_page_prev.png) no-repeat center center;
}
.myShopContainer  .contents .pageing > a{
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
.myShopContainer .contents .pageing ol{
    display: inline-block;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
}
.myShopContainer .contents .pageing li{
    display: inline-block;
    margin: 0 0 0 -1px;
    vertical-align: top;
}
.myShopContainer .contents .pageing li a{
    display: block;
    width: 40px;
    padding: 12px 0;
    font-size: 14px;
    color: #6d6d6d;
    border: 1px solid #e5e5e5;
    line-height: 14px;
    background: #fff;
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
                <div class="orderHistory">
                    <div class="titleArea">
                        <h3>주문내역 조회</h3>
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
                                            <th>주문취소</th>
                                            <th>주문상세</th>
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
                                                    <td><a  href="orderDetailInfo.do?o_date=${o.o_date}&o_code=${o.o_code}&p_code=${o.p_code}"  class="btnNormal sizeS" >조회</a></td>
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
                </div>
            </div>
            <!-- 페이징 코드 [1] [2] [3] ... -->
                <c:if test="${oharr.size() ne 0}">
                    <div class="pageing">
                        <c:if test="${startPage>pageBlock }">
                            <a href="MyShopOrder.do?pageNum=${startPage-pageBlock}">이전</a>
                        </c:if>
            
                        <ol>
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                <li>
                                    <a href="MyShopOrder.do?pageNum=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </ol>
            
                        <c:if test="${endPage<pageCount}">
                            <a href="MyShopOrder.do?pageNum=${startPage+pageBlock}">다음</a>
                        </c:if>
                    </div>
                </c:if>
        </div>
    </div>
    <script>
    	function oh_delete(){
        	let formname = document.formname;
        	let deleteOrder = confirm('해당 주문을 취소하시겠습니까?');
			if(deleteOrder){
				formname.submit();
			}else{
				location.href = "MyShopOrder.do";
				/* !!!!! 취소 버튼을 눌러도 해당 주문이 취소됨 !!!!! */
			}
    	}
    </script>
</body>
</html>