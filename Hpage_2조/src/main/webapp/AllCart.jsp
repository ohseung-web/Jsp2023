<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#cartwrap { width: 1400px; height: 1800px; margin: 0 auto; }
	#cartwrap h2 { width: 100%; padding-left: 25px; }
	#cartwrap .empty { width: 100%; text-align: center; margin: 150px 0; }
	#cartwrap p { margin-bottom: 25px; }
	#cartwrap .cartlist { width: 1350px; height: 640px; margin: 50px auto; }
	#cartwrap .cartlist .free { width: 100%; margin: 5px 0; }
    #cartwrap .cartlist table { width: 100%; border-collapse: collapse; }
    #cartwrap .cartlist table th { height: 45px; background-color: #fbfbfb; border-top: 1px solid black; font-size: 1.1em; border-bottom: 1px solid lightgray; }
    #cartwrap .cartlist table th:nth-child(1) { width: 50px; }
    #cartwrap .cartlist table th:nth-child(2) { width: 950px; }
    #cartwrap .cartlist table th:nth-child(3) { width: 150px; }
    #cartwrap .cartlist table th:nth-child(4) { width: 200px; }
    #cartwrap .cartlist table .trheight { height: 150px; }
    #cartwrap .cartlist table .trheight a { text-decoration: none; color: black; }
    #cartwrap .cartlist table .trheight td { height: 45px; border-bottom: 1px solid lightgray; text-align: center; }
    #cartwrap .cartlist table .trheight td:nth-child(2) { width: 110px; }
    #cartwrap .cartlist table .trheight td:nth-child(2) img { width: 110px; height: 110px; }
    #cartwrap .cartlist table .trheight td:nth-child(3) { width: 890px; text-align: left; padding-left: 30px; }
    #cartwrap .cartlist table .trheight td:nth-child(3) .pinfo { margin: 0; }
    #cartwrap .cartlist table .trheight td:nth-child(3) .pinfo .pinfobtn { padding: 0; border: none; outline: none; background: none; cursor: pointer; }
    #cartwrap .cartlist table .trheight td:nth-child(3) .pinfo span { font-size: 14px; }
    #cartwrap .cartlist table .trheight td:nth-child(4) .cartlistcntbtn { display: flex; }
    #cartwrap .cartlist table .trheight td:nth-child(4) .cartlistcntbtn .cartcntbtn { width: 150px; padding: 0; }
    #cartwrap .cartlist table .trheight td:nth-child(4) .cartlistcntbtn .cartcntbtn input[type=button] { display: inline-block; outline: none; cursor: pointer; width: 35px; height: 35px; line-height: 20px; color: #ccc; font-size: 1.2em; border: 1px solid #ccc; background-color: rgba(240, 248, 255, 0); }
    #cartwrap .cartlist table .trheight td:nth-child(4) .cartlistcntbtn .cartcntbtn #cntnum { border: none; outline: none; width: 35px; height: 35px; display: inline-block; text-align: center; line-height: 26px; background-color: white; }
    #cartwrap .cartlist table tr .buycontent { height: 45px; text-align: right; border-bottom: none; }
    #cartwrap .cartlist table tr #buydelivery { height: 45px; text-align: right; border-bottom: 1px solid lightgray; }
    #cartwrap .cartlist table #buycontent td { text-align: right; }
    #cartwrap .cartlist table #buycontent td input { width: 150px; height: 50px; border: 2px solid black; color: black; background: white; font-size: 14px; cursor: pointer; outline: none; }
    #cartwrap .cartlist table #buycontent td input:hover { background: black; color: white; }
</style>
</head>
<body>
 	<div id="cartwrap">
 		<c:choose>
 			<c:when test="${empty al}">
 				<h2>장바구니 (${count})</h2>
 				<p class="empty">장바구니가 비어 있습니다.</p>
 			</c:when>
 			<c:otherwise>
 				<h2>장바구니 (${count})</h2>
 				<div class="cartlist">
		 			<form action="OrderList.do" method="post">
		 				<p class="free"> &lowast; 50,000원 이상 구매 시 배송비 무료</p>
		 				<table>
		 					<tr>
		 						<th><input class="chk" type="checkbox" name="chk" value="${tdto.c_no}"></th>
		 						<th colspan="4">상품정보</th>
		 						<th>수량</th>
		 						<th>가격</th>
				            </tr>
				            <c:forEach var="tdto" items="${al }">
				            	<tr class="trheight">
				            		<td>
				            			<input class="chkno" type="checkbox" name="chkno" value="${tdto.c_no}">
				            		</td>
				            		<td>
				            			<a href="GetOne.do?p_no=${tdto.c_no }"><img alt="image" src="img/${tdto.c_img}"></a>
				            		</td>
				            		<td colspan="3">
										<p class="pinfo">
											<a href="GetOne.do?p_no=${tdto.c_no }">${tdto.c_name}</a>
										</p>
										<c:choose>
								       		<c:when test="${tdto.c_color == 'ncolor' }">
								       			<p class="pinfo">
								       				<small>CHOOSE &#33; &#58;</small> <span>색상없음</span>
								       			</p>
								       		</c:when>
								       		<c:otherwise>
								       			<p class="pinfo">
								       				<small>CHOOSE &#33; &#58;</small> <span>${tdto.c_color}</span>
								       			</p>
								       		</c:otherwise>
								       	</c:choose>
										<p class="pinfo"><input class="pinfobtn" type="button" value="삭제하기" onclick="location.href='CartDelete.do?c_no=${tdto.c_no }'"></p>
									</td>                
				                    <td>
				                    	<div class="cartlistcntbtn">
				                    		<span class="cartcntbtn">
				                    			<input type="button" value="-" onclick="location.href='CartDownUpdate.do?c_no=${tdto.c_no }&c_cnt=${tdto.c_cnt}&c_color=${tdto.c_color}'">
				                    			<input id="no" type="hidden" name="no" value="${tdto.c_no }">
				                    			<input id="cntnum" type="text" name="cntnum" value="${tdto.c_cnt}" readonly="readonly">
				                    			<input type="button" value="+" onclick="location.href='CartUpUpdate.do?c_no=${tdto.c_no }&c_cnt=${tdto.c_cnt}&c_color=${tdto.c_color}'">
				                            </span>
				                        </div>
				                    </td>
				                    <td>
				                    	<fmt:formatNumber value="${tdto.c_price}" />원
				                    	<input type="hidden" name="price" value="${tdto.c_price}">
				                    </td>
				                </tr>
				            </c:forEach>
				            <tr>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="buycontent" colspan="3">상품 합계</td>
				            	<td class="buycontent"><fmt:formatNumber value="${sum_price }" />원</td>
				            </tr>
				            <tr>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="contentnone">&nbsp;</td>
				            	<td id="buydelivery" colspan="3">배송비</td>
				            	<c:choose>
				            		<c:when test="${sum_price >= 50000 }">
				            			<td id="buydelivery">0원</td>
				            		</c:when>
				            		<c:otherwise>
				            			<td id="buydelivery">3,000원</td>
				            		</c:otherwise>
				            	</c:choose>
				            </tr>
				            <tr>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="contentnone">&nbsp;</td>
				            	<td class="buycontent" colspan="3">합계</td>
				            	<c:choose>
				            		<c:when test="${sum_price >= 50000 }">
				            			<td class="buycontent"><fmt:formatNumber value="${sum_price}" />원</td>
				            		</c:when>
				            		<c:otherwise>
				            			<td class="buycontent"><fmt:formatNumber value="${sum_price + 3000}" />원</td>
				            		</c:otherwise>
				            	</c:choose>
				            </tr>
				            <tr id="buycontent">
				            	<td colspan="7"><input type="submit" value="주문하기"></td>
				            </tr>
				        </table>
		 			</form>
			    </div>
 			</c:otherwise>
 		</c:choose>
 	</div>
 	<script type="text/javascript">
	    var allchk = document.querySelector(".chk");
	    allchk.addEventListener('click', allchkno);
	    
	    function allchkno(){
	        var chkno = document.querySelectorAll(".chkno");
	        
	        for(var i=0; i<chkno.length; i++){
	        	chkno[i].checked = allchk.checked;
	        }
	    }
	    
	    var chkno = document.querySelectorAll(".chkno");
	    
	    for(var i=0; i<chkno.length;i++){
	    	chkno[i].addEventListener('click', chkdel);
	        
	        function chkdel(){
	            var allchk = document.querySelector(".chk");
	            
	            for(var j=0; j<chkno.length;j++){
	                if(chkno[j].checked == false){
	                	allchk.checked = false;
	                    return;
	                }
	            }
	            allchk.checked = true;
	        }
	    }
 	</script>
</body>
</html>