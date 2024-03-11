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
.myShopContainer .contents .myName .user{
    display: flex;
    justify-content: center;
    align-items: center;
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
    width: calc(100% - 280px);
    max-width: calc(100% - 280px) !important;
    padding-left: 280px !important;
    margin: 0 auto !important;
    min-height: 450px;
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
.myShopArea .orderHistory.show{
   display : block;
} 
myShopArea .orderHistory{
  display: none;
}
.myShopArea .orderHistory .listItem{
	border-top: 2px solid #1a1a1a;
}
/* 오티 수정 CSS */
.orderHistory .listItem .infotablist .orderinfo,
.orderHistory .listItem .infotablist .delivainfo,
.orderHistory .listItem .infotablist .board_info
{
  display : none;
}
.orderHistory .listItem .infotablist .orderinfo.on,
.orderHistory .listItem .infotablist .delivainfo.on,
.orderHistory .listItem .infotablist .board_info.on
{
  display : block;
}
.myShopArea .orderHistory .listItem .orderList table,
.listItem .infotablist .orderinfo table,
.listItem .infotablist .delivainfo table,
.listItem .infotablist .board_info table
{
    width: 100%;
    margin-top: 20px;
    border: 0;
    border-collapse: collapse;
}
.myShopArea .orderHistory .listItem .orderList table tr,
.listItem .infotablist .orderinfo table tr,
.listItem .infotablist .delivainfo table tr,
.listItem .infotablist .board_info table tr
{
    display: table-row;
    vertical-align: middle;
}
.orderList table th, .orderList table td,
.listItem .infotablist .orderinfo table td,
.listItem .infotablist .delivainfo table td,
.listItem .infotablist .board_info table td
{
    height: 29px;
    padding: 5px 10px;
    line-height: 22px;
    vertical-align: middle;
    text-align: center;
    border: 0;
}
.myShopArea .orderHistory .listItem .orderList table th,
.listItem .infotablist .orderinfo table th,
.listItem .infotablist .delivainfo table th,
.listItem .infotablist .board_info table th
{
	height: 50px;
    white-space: nowrap;
    border-bottom: 0;
    font-weight: 400;
    background-color: #f6f6f6;
    text-align: center;
}
.myShopArea .orderHistory .listItem .orderList table td,
.listItem .infotablist .orderinfo table td,
.listItem .infotablist .delivainfo table td,
.listItem .infotablist .board_info table td 
{
    border-bottom: 1px solid #e5e5e5;
    height: 50px;
}
.myShopArea .orderHistory .listItem .orderList table td a,
.listItem .infotablist .orderinfo table td a,
.listItem .infotablist .delivainfo table td a,
.listItem .infotablist .board_info table td a
{
	vertical-align: middle;
}
.myShopArea .orderHistory .listItem .orderList table td img,
.listItem .infotablist .orderinfo table td img,
.listItem .infotablist .delivainfo table td img,
.listItem .infotablist .board_info table td img
{
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
/* 오티 수정 CSS  */
/* 오티수정 CSS */
.myShopContainer .contents .pageing{
    margin: 50px auto;
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
                        <!-- <li><a href="MyShopOrder.do">주문내역 조회</a></li> -->
                        <li><button type="button">주문내역 조회</button></li>
                        <li><a href="#">적립금 내역</a></li>
                        <li><a href="#">쿠폰 내역</a></li>
                        <li><button type="button">배송 주소록 관리</button></li>
                        <!-- <li><a href="MyShopdelivaddress.do">배송 주소록 관리</a></li> -->
                    </ul>
                    <div class="subTitle"><h3>활동 정보</h3></div>
                    <ul class="menu">
                        <li><a href="#">최근 본 상품</a></li>
                        <li><a href="#">나의 위시리스트</a></li>
                        <li><button type="button">나의 게시글</button></li>
                        <!-- <li><a href="MyShopBoard.do">나의 게시글</a></li> -->
                    </ul>
                    <div class="subTitle"><h3>나의 정보</h3></div>
                    <ul class="menu">
                        <li><a href="MemberModify.do">회원정보 수정</a></li>
                        <li><a href="MemberLogoutProc.do">로그아웃</a></li>
                    </ul>
                </div>
                <div class="orderHistory">
                    <div class="titleArea">
                        <h3>${mdto.m_name}님 각종 정보</h3>
                    </div>
                    <div class="listItem">
                    	<c:choose>
                    		<c:when test="${count != 0 or count2 != 0 or count3 != 0}">
                    		  <div class="orderList">
                        			<table border="1">
                                        <tr>
                                            <th>주문개수</th>
                                            <th>배송 주소록 개수</th>
                                            <th>개시글 개수</th>
                                            <!-- <th>수령인</th>
                                            <th>수량</th>
                                            <th>총금액</th>
                                            <th>배송상태</th>
                                            <th>취소</th> -->
                                        </tr>
                                        <tr>
                                            <td>${count}</td>
                                            <td>${count2}</td>
                                            <td>${count3}</td>
                                        </tr>
	                                    </table>
                                   </div>  
                                  </c:when>      
                                  <c:otherwise>
	                    			<div class="prdEmpty">
	                            		<svg xmlns="http://www.w3.org/2000/svg" width="65" height="64" fill="none" viewBox="0 0 65 64" class="icon" role="img"><path d="M63.3 32C63.3 49.0104 49.5104 62.8 32.5 62.8C15.4896 62.8 1.7 49.0104 1.7 32C1.7 14.9896 15.4896 1.2 32.5 1.2C49.5104 1.2 63.3 14.9896 63.3 32Z" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 18.6665V34.6665" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 40V44" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path></svg>
	                            		정보가 없습니다.
	                        	    </div>
                    			</c:otherwise>	
                    	 </c:choose>
                  
		                  <!-- 주문내역 조회 tab -->
		                  <div class="infotablist">
			                  <div class="orderinfo">
			                     <div class="titleArea">
	                                <h3>주문내역 조회</h3>
	                             </div>
	                             <c:choose>
	                              <c:when test="${not empty oharr }">
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
			                                 <td><button class="btnNormal sizeS" onclick="oh_search()">조회</button></td>
			                             </tr>
			                         </form>
			                     </c:forEach>
			                 </table>
			                  <!-- 페이징 코드 [1] [2] [3] ... -->
				               <c:if test="${oharr.size() ne 0}">
				                   <div class="pageing">
				                       <c:if test="${startPage>pageBlock }">
				                           <a href="MyShop.do?pageNum=${startPage-pageBlock}">이전</a>
				                       </c:if>
				           
				                       <ol>
				                           <c:forEach var="i" begin="${startPage}" end="${endPage}">
				                               <li>
				                                   <a href="MyShop.do?pageNum=${i}">${i}</a>
				                               </li>
				                           </c:forEach>
				                       </ol>
				           
				                       <c:if test="${endPage<pageCount}">
				                           <a href="MyShop.do?pageNum=${startPage+pageBlock}">다음</a>
				                       </c:if>
				                   </div>
				               </c:if>
				               </c:when>
			     		  <c:otherwise>
			     		    <p class="nodata">게시물이 없습니다.</p>
			     		  </c:otherwise>     
			            </c:choose> 	
			     	  </div>
			     		 	
			     		   <!-- 배송 주소 tab -->
					         <div class="delivainfo">
						        <div class="titleArea">
			                       <h3>배송 주소록 관리</h3>
			                    </div>
			                      <c:choose>
	                              <c:when test="${not empty aList }">
	                                    <table>
	                                        <tr>
	                                            <th width="70">번호</th>
	                                            <th width="85">배송자 이름</th>
	                                            <th width="135">우편번호</th>
	                                            <th width="600">주소</th>
	                                            <th width="150">전화번호</th>
	                                            <th width="105">이메일</th>
	                                        </tr>
	                                        <c:set var="number2" value="${number2}" />
	                                        <c:forEach var="ddto" items="${aList}">
	                                            <tr>
	                                                <td width="80" class="code">${number2}</td>
	                                                <!-- 답글 들여쓰기 -->
	                                                <td width="85" class="subject">
	                                                    <a href="#">${ddto.d_delivname}</a>
	                                                </td>
	                                                <td width="85">${ddto.d_postcode}</td>
	                                                <td width="600">${ddto.d_defaultaddr}  ${ddto.d_detailaddr}</td>
	                                                <td width="150">${ddto.d_phone}</td>
	                                                <td width="185">${ddto.d_email}</td>
	                                            </tr>
	                                            <c:set var="number2" value="${number2=number2-1}" />
	                                        </c:forEach>
	                                    </table>
				     		     <!-- 페이징 코드 [1] [2] [3] ... -->
					               <c:if test="${aList.size() ne 0}">
					                   <div class="pageing">
					                       <c:if test="${startPage2>pageBlock2 }">
					                           <a href="MyShop.do?pageNum2=${startPage2-pageBlock2}">이전</a>
					                       </c:if>
					           
					                       <ol>
					                           <c:forEach var="i" begin="${startPage2}" end="${endPage2}">
					                               <li>
					                                   <a href="MyShop.do?pageNum2=${i}">${i}</a>
					                               </li>
					                           </c:forEach>
					                       </ol>
					           
					                       <c:if test="${endPage2<pageCount2}">
					                           <a href="MyShop.do?pageNum2=${startPage2+pageBlock2}">다음</a>
					                       </c:if>
					                   </div>
					               </c:if>
					               </c:when> 
					               <c:otherwise>
			     		              <p class="nodata">게시물이 없습니다.</p>
			     		           </c:otherwise>     
			                 </c:choose>	
	          			 </div>      
                         
                       <!-- 나의 게시글 tab -->       
                        <div class="board_info" >
						   <div class="titleArea">
			                  <h3>게시물 관리</h3>
			               </div>
			               <c:choose>
	                          <c:when test="${not empty inquiryList and not empty reviewList }">
			                       <table>
                                        <tr>
                                            <th width="70">번호</th>
                                            <th width="700">제목</th>
                                            <th width="135">분류</th>
                                            <th width="85">작성자</th>
                                            <th width="100">작성일</th>
                                            <th width="55">조회</th>
                                        </tr>
                                        <c:set var="number3" value="${number3}" />
                                        <c:forEach var="idto" items="${inquiryList}">
                                            <tr>
                                                <td width="80" class="code">${number3}</td>
                                                <!-- 답글 들여쓰기 -->
                                                <td width="700" class="subject">
                                                    <a href="InquiryBoardInfo.do?code=${idto.i_code}">${idto.i_title}</a>
                                                </td>
                                                <td width="135"><a href="InquiryBoardList.do">상품 문의</a></td>
                                                <td width="85">${idto.m_name}</td>
                                                <td width="120">${idto.i_date}</td>
                                                <td width="55">${idto.i_readcount}</td>
                                            </tr>
                                            <c:set var="number3" value="${number3=number3-1}" />
                                        </c:forEach>
                                        <c:forEach var="rdto" items="${reviewList}">
                                            <tr>
                                                <td width="80" class="code">${number3}</td>
                                                <td width="700" class="subject">
                                                    <a href="ReviewBoardInfo.do?code=${rdto.r_code}">${rdto.r_title}</a>
                                                </td>
                                                <td width="135"><a href="ReviewBoardList.do">상품 리뷰</a></td>
                                                <td width="85">${rdto.m_name}</td>
                                                <td width="120">${rdto.r_date}</td>
                                                <td width="55">${rdto.r_readcount}</td>
                                            </tr>
                                            <c:set var="number3" value="${number3=number3-1}" />
                                        </c:forEach>
                                    </table>
                                    <!-- 페이징 코드 [1] [2] [3] ... -->
                                    <c:if test="${inquiryList.size() ne 0}">
                                        <div class="pageing">
                                            <c:if test="${startPage3>pageBlock3}">
                                                <a href="MyShop.do?pageNum3=${startPage3-pageBlock3}">이전</a>
                                            </c:if>
                
                                            <ol>
                                                <c:forEach var="i" begin="${startPage3}" end="${endPage3}">
                                                    <li>
                                                        <a href="MyShop.do?pageNum3=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </ol>
                
                                            <c:if test="${endPage3<pageCount3}">
                                                <a href="MyShop.do?pageNum3=${startPage3+pageBlock3}">다음</a>
                                            </c:if>
                                        </div>
                                    </c:if>
                                    </c:when> 
					                <c:otherwise>
			     		              <p class="nodata">게시물이 없습니다.</p>
			     		            </c:otherwise>     
			                     </c:choose>
                                </div>
                           </div>   	       
                    </div>
              </div>                                  

    <script>
        function oh_delete(){
            let formname = document.formname;
            let deleteOrder = confirm('해당 주문을 취소하시겠습니까?');
			if(deleteOrder){
				formname.submit();
			}else{
				location.href = "MyShop.do";
				/* !!!!! 취소 버튼을 눌러도 해당 주문이 취소됨 !!!!! */
			}
        }
   
        // 주문조회, 배송지주소, 게시글 정보 스크립트 
        let myShopMain = document.querySelectorAll(".myShopMain ul li");
        let orderinfo = document.querySelector(".orderinfo");
        let delivainfo = document.querySelector(".delivainfo");
        let boardinfo = document.querySelector(".board_info");
        
        console.log(myShopMain);
        
        for(let i=0;i<myShopMain.length;i++){
        	myShopMain[i].addEventListener("click",() => {
                
                if(i===0){
                	orderinfo.classList.add('on');
                	delivainfo.classList.remove('on');
                    boardinfo.classList.remove('on');
                }
               if(i===3){
                	delivainfo.classList.add('on');
                	orderinfo.classList.remove('on');
                	boardinfo.classList.remove('on');
                }
               if(i===6){
                	boardinfo.classList.add('on');
                	orderinfo.classList.remove('on');
                	delivainfo.classList.remove('on');
                }
            })
        }
        
       
        
    </script>
</body>
</html>