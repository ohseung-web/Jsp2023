<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<style>
.myShopContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.myShopContainer .contents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0;
}
.myShopContainer .contents .prdEmpty{
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 60px 0;
	border-top: 1px solid #e6e6e6;
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
.myShopContainer .contents .myName .user{
    display: flex;
    justify-content: center;
}
.myShopContainer .contents .myName .user img{
    width: 60px;
    height: 60px;
    border-radius: 50%;
}
.myShopContainer .contents .myName .user .userName{
    margin-left: 16px;
    font-size: 20px;
    font-weight: 700;
    color: #1a1a1a;
    text-align: left;
}
.myShopContainer .contents .myShopArea{
    position: relative;
    width: calc(92% - 280px);
    max-width: calc(1480px - 280px) !important;
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
    margin-top: 10px;
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
.myShopArea .orderHistory.off{
    display : none;
}
.myShopArea .orderAddress {
   display : none;
}
.myShopArea .orderAddress.on{
    display : block;
} 
</style>
</head>
<body>
    <div class="myShopContainer">
        <div class="contents">
            <div class="myName">
                <div class="user">
                    <div class="userThumb">
                        <img src="img/icon/img_member_default.gif">
                    </div>
                    <div class="userName">안녕하세요, ${mdto.m_name} 님!</div>
                </div>
            </div>
            <div class="myShopArea">
                <div class="myShopMain">
                    <div class="subTitle"><h3>나의 쇼핑 정보</h3></div>
                    <ul class="menu">
                        <li><a href="#">주문내역 조회</a></li>
                        <li><a href="#">적립금 내역</a></li>
                        <li><a href="#">쿠폰 내역</a></li>
                        <li><button type="button" class="listbtn">배송 주소록 관리</button></li>
                    </ul>
                    <div class="subTitle"><h3>활동 정보</h3></div>
                    <ul class="menu">
                        <li><a href="#">최근 본 상품</a></li>
                        <li><a href="#">나의 위시리스트</a></li>
                        <li><a href="#">나의 게시글</a></li>
                    </ul>
                    <div class="subTitle"><h3>나의 정보</h3></div>
                    <ul class="menu">
                        <li><a href="#">회원정보 수정</a></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
                </div>
                <div class="orderHistory">
                    <div class="titleArea">
                        <h3>주문내역 조회</h3>
                    </div>
                    <div class="listItem">
                        <div class="prdEmpty">
                            <svg xmlns="http://www.w3.org/2000/svg" width="65" height="64" fill="none" viewBox="0 0 65 64" class="icon" role="img"><path d="M63.3 32C63.3 49.0104 49.5104 62.8 32.5 62.8C15.4896 62.8 1.7 49.0104 1.7 32C1.7 14.9896 15.4896 1.2 32.5 1.2C49.5104 1.2 63.3 14.9896 63.3 32Z" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 18.6665V34.6665" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 40V44" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                            주문 내역이 없습니다.
                        </div>
                        <div class="orderList"></div>
                    </div>
                </div>
                <div class="orderAddress">
                    <div class="titleArea">
                        <h3>배송 주소록 관리</h3>
                    </div>
                    <div class="listItem">
                        <div class="prdEmpty">
                               <p>${mdto.m_name}</p>
                               <p>${mdto.m_postcode}</p>
                               <p>${mdto.m_defaultaddr}</p>
                               <p>${mdto.m_phone}</p>
                               <p>${mdto.m_email}</p>
                        </div>
                        <div class="orderList"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
       let orderhistory = document.querySelector(".orderHistory");
       let listbtn = document.querySelector(".listbtn");
       let orderaddress = document.querySelector(".orderAddress");
       
       listbtn.addEventListener('click',() =>{
    	   orderhistory.classList.add('off');
    	   orderaddress.classList.add('on');
       })
       
    </script>
</body>
</html>