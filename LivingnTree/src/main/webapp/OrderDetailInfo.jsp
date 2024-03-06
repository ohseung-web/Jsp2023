<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/reset.css"> -->
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
/* .myShopArea .orderHistory .listItem .orderList table{
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
} */
/* .myShopArea .orderHistory .listItem .orderList table th{
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
} */
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
.orderDetailList .orderArea,
.orderDelivlList .orderArea,
.orderProductList .orderArea
{
    margin: 64px 0 16px 0;
    text-align: left;
}
.orderDetailInfo {
   width : 1000px;
   margin : 0 auto;
  /*  border : 1px solid red; */
}
.orderDetailInfo .orderDetailWrap{
	display: table;
	table-layout: fixed;
	padding: 10px;
	width: 800px;
	border: 10px solid #f6f6f6;
}
.orderDetailInfo .titleArea .order{
   color:red;
}
.orderDetailInfo .titleArea .ordertitle {
   font-size: 30px;
   font-weight: 700;
}
.orderDetailInfo .orderDetailWrap .membername{
   color:blue;
}
.myShopArea .orderDetailInfo table
{
    width: 800px;
    margin-top: 20px;
    /* border: 0; */
    border-color : lightgray;
    border-collapse: collapse;
}
.myShopArea .orderDetailInfo .orderDetailList .listItem table tr{
    display: table-row;
    vertical-align: middle;
}
.myShopArea .orderDetailInfo .orderDetailList .listItem table td{
    height: 50px;
    padding: 5px 10px;
    line-height: 50px;
    vertical-align: middle;
    text-align: center;
    border: 0;
    background-color: #f6f6f6;
}
.myShopArea .orderDetailInfo table td img{
   width : 150px;
   height: 150px;
}
.myShopArea .orderDetailInfo .orderArea h3{
   font-weight: 800;
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
                
                <!-- 주문 상세 조회  -->
                <div class="orderDetailInfo">
                    <div class="titleArea">
                        <h3> <span class="ordertitle">ORDER INFORMATION</span> 회원님의 <em class="order">주문내역</em>을 상세 조회하실 수 있습니다 </h3> 
                    </div>
                    <div class="orderDetailWrap">
                      <span><em class="membername">[${mdto.m_name}]</em>님께서 <fmt:formatDate value="${orderDate}" pattern="yyyy년 MM월 dd일"/>에 주문하신 내역 입니다.</span>
                    </div>
                    <div class="orderDetailList">
                       <div class="orderArea">
                        <h3>주문자정보</h3>
                       </div>
                      <div class="listitem">
                         <table border="1">
                            <tr height="40">
                              <td align="center" bgcolor="#f6f6f6">주문번호</td>
                              <td align="center"><fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd"/>_${odto.o_code}</td>
                              <td align="center" bgcolor="#f6f6f6">주문일자</td>
                              <td align="center"><fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            <tr height="40">
                              <td align="center" bgcolor="#f6f6f6">주문자</td>
                              <td colspan="3" align="center" >${mdto.m_name}</td>
                            </tr>
                            <tr height="40">
                              <td align="center" bgcolor="#f6f6f6">주문메모</td>
                              <td colspan="3"></td>
                            </tr>
                         </table>
                      </div>
                    </div>
                    
                    <div class="orderDelivlList">
                       <div class="orderArea">
                        <h3>배송자정보</h3>
                       </div>
                      <div class="listitem">
                         <table border="1">
                            <tr height="40">
                              <td align="center" bgcolor="#f6f6f6">수취인</td>
                              <td align="center">${odto.d_delivname}</td>
                              <td align="center" bgcolor="#f6f6f6">연락처</td>
                              <td align="center">${odto.d_phone}</td>
                            </tr>
                            <tr height="40">
                              <td align="center" bgcolor="#f6f6f6">주소</td>
                              <td colspan="3" align="center">${odto.d_defaultaddr}  ${odto.d_detailaddr}</td>
                            </tr>
                            <tr height="40">
                              <td align="center" bgcolor="#f6f6f6">배송메시지</td>
                              <td colspan="3"></td>
                            </tr>
                         </table>
                      </div>
                    </div>
                    <div class="orderProductList">
                       <div class="orderArea">
                        <h3>주문상품정보</h3>
                       </div>
                      <div class="listitem">
                         <table border="1">
                            <tr height="40">
                              <td align="center" bgcolor="#f6f6f6"  width="300">주문상품정보</td>
                              <td align="center" bgcolor="#f6f6f6" width="200">주문상품이름</td>
                              <td align="center" bgcolor="#f6f6f6" width="150">주문수량</td>
                              <td align="center" bgcolor="#f6f6f6" width="150">주문가격</td>
                            </tr>
                            <tr height="60">
                              <td align="center"><img src="img/productimg/${odto.p_mainimg}"></td>
                              <td align="center">${odto.p_name}</td>
                              <td align="center">${odto.o_qty}개</td>
                              <td align="center"><fmt:formatNumber value="${odto.o_total}" pattern="#,##0" />원</td>
                            </tr>
                         </table>
                      </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
       
    <script>
    	
    
    </script>
</body>
</html>