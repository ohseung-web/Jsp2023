<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/82fd850f0d.js" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<style>
.title h2{
	margin: 80px 0 40px;
    text-align: center;
	font-weight: 700;
    font-size: 32px;
    color: #1f1f1f;
}
.orders{
	width: 76%;
	margin: 0 auto;
	text-align: right;
}
.orders .prdCount{
	float: left;
	font-size: 13px;
	color: #7d7d7d;
}
.orders .prdCount strong{
	margin-left: 8px;
	font-size: 13px;
	font-weight: bold;
	color: #000;
}
.orders #orderby{
    max-width: 100%;
    height: 40px;
    padding: 0 30px 0 15px;
    font-size: 13px;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    background-image: url("img/icon/ico_select.png");
    background-repeat: no-repeat;
    background-position: right 10px center; 
    /* background: #fff url(img/icon/ico_select.png) no-repeat right 10px center; */
    background-size: 14px 8px;
    appearance: none;
}
.productWrap{
	width: 80%;
	margin: 30px auto;
	/* border: 1px solid red; */
}
.productContainer{
	display: flex;
	justify-content: flex-start;
    width: 100%;
    flex-flow: row wrap;
    margin-left: 15px;
}
.productContainer .prdList_item{
	width: 23%;
    margin: 50px 10px;
}
.productContainer .prdList_item .thumbnail{
    position: relative;
    margin-bottom: 10px;
}
.productContainer .prdList_item .thumbnail a img{
    width: 100%;
    max-width: 100%;
}
.productContainer .prdList_item .thumbnail .icon_box{
    opacity: 0;
    position: absolute;
    top: inherit;
    bottom: 0%;
    left: 0%;
    z-index: 2;
    width: 100%;
    height: 12%;
    background: rgba(1,1,1,0.5);
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    transition: all 0.3s;
}
.productContainer .prdList_item:hover .thumbnail .icon_box{
    opacity: 1;
}
.productContainer .prdList_item .thumbnail .icon_box .cart{
    display: block;
    position: relative;
    background-color: transparent;
    border-top: 1px solid transparent;
    border-bottom: 1px solid #fff;
    box-sizing: border-box;
    cursor: pointer;
    margin: 0 10px;
    width: auto;
    height: auto;
    padding: 5px;
    transition: all 0.3s;
}
.productContainer .prdList_item .thumbnail .icon_box .cart:hover{
    border-top: 1px solid #fff;
}
.productContainer .prdList_item .thumbnail .icon_box .cart a{
	font-size: 14px;
    font-weight: 500;
    color: #fff;
}
.productContainer .prdList_item .description{
    margin-top: 30px;
}
.productContainer .prdList_item .description .name{
    display: block;
    font-weight: normal;
}
.productContainer .prdList_item .description .name a{
    font-size: 13px;
    color: #000;
}
.productContainer .prdList_item .description .spec{
    margin-top: 10px;
}
.productContainer .prdList_item .description .spec div{
    margin-bottom: 5px;
}
.productContainer .prdList_item .description .spec .price span{
    font-size: 16px;
    color: #000;
    font-weight: bold;
}
.productContainer .prdList_item .description .spec .mileage span{
    font-size: 12px;
    color: #555;
}
.productContainer .prdList_item .description .spec .mileage span img{
    width: 11px;
    height: 11px;
    margin-bottom: 2px;
}
.pageing{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	margin-top: 60px;
	margin-bottom: 50px;
	text-align: center;
}
.pageing div{
    width: 40px;
    height: 40px;
}
.pageing .prevBtn{
	font-size: 0;
	/* background-image: url(img/icon/btn_page_next.png);
	background-repeat: no-repeat;
	background-position: center center;
    background-size: 40px; */
}
.pageing .nextBtn{
	font-size: 0;
	/* background-image: url(img/icon/btn_page_next.png);
	background-repeat: no-repeat;
	background-position: center center;
    background-size: 40px; */
}
.pageing a{
	display: inline-block;
	width: 100%;
    height: 100%;
    font-size: 14px;
    line-height: 40px;
    text-align: center;
    background: #fff;
}
.pageing a img{
	width: 40px;
	height: 40px;
}

/* search box CSS 시작 - 오티 */
.product_search{
  width: 80%;
  height: 120px;
  margin: 80px auto;
  border-bottom: 1px solid #eee;
  margin-bottom: 40px;
}
.product_search  .bottom_search_box  .search{
    margin:0 auto;
    width: 650px;
    position: relative;
    margin-bottom: 0;
   }
.product_search .bottom_search_box  .search #keyword{
    width: 650px;
    height: 54px;
    font-size: 16px;
    color: black;
    border: none;
    border-bottom: 1px solid black;
    outline: none;
    position : relative;
    margin : 0;
   }
.product_search  .bottom_search_box  .search #findbtn{
     position : absolute;
     width: 40px;
     height: 40px;
     top : 0;
     right : 0;
     border: none;
     background : transparent;
     cursor: pointer;
     top : 50%;
     right : 0;
     transform: translate(0,-50%);
     /* border:1px solid red; */
   }
 /* search box CSS 종료 - 오티 */  
</style>
</head>
<body>

<!-- 상품 검색 -->
<div class="title">
	<h2>상품검색</h2>
</div>
<div class="product_search">
  <div class="bottom_search_box">
            <div class="search">
               <input type="text" name="keyword" id="keyword" value="${keyword}">
               <button type="button"  id="findbtn">
                   <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="none" viewBox="0 0 24 24" class="icon" role="img">
                     <path stroke="#575757" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11 19c4.418 0 8-3.582 8-8s-3.582-8-8-8-8 3.582-8 8 3.582 8 8 8z"></path>
                     <path stroke="#575757" stroke-linejoin="round" stroke-width="1.5" d="M22 22l-5-5"></path>
                   </svg>
                </button>   
             </div>
      </div>
</div>

<!-- 정렬방식 -->
<c:choose>
	<c:when test="${order eq 1}">
		<div class="orders">
			<p class="prdCount">상품 검색 결과 <strong>${count}</strong></p>
			<select id="orderby">
				<option value="1" selected>- 정렬방식 -</option>
    			<option value="2">높은가격</option>
    			<option value="3">낮은가격</option>
			</select>
		</div>
	</c:when>
	<c:when test="${order eq 2}">
		<div class="orders">
			<p class="prdCount">상품 검색 결과 <strong>${count}</strong></p>
			<select id="orderby">
				<option value="1">- 정렬방식 -</option>
    			<option value="2" selected>높은가격</option>
    			<option value="3">낮은가격</option>
			</select>
		</div>
	</c:when>
	<c:when test="${order eq 3}">
		<div class="orders">
			<p class="prdCount">상품 검색 결과 <strong>${count}</strong></p>
			<select id="orderby">
				<option value="1" selected>- 정렬방식 -</option>
    			<option value="2">높은가격</option>
    			<option value="3" selected>낮은가격</option>
			</select>
		</div>
	</c:when>
</c:choose>

<div class="productWrap">
	<div class="productContainer">
		<c:forEach var="sdto" items="${Slist}">
			<div class="prdList_item">
    			<div class="thumbnail">
      			<a href="ProductInfo.do?p_code=${sdto.p_code}">
        			<img src="img/productimg/${sdto.p_mainimg}" alt="">
      			</a>
      			<div class="icon_box">
        			<span class="cart"><a href="CartProc.do?code=${sdto.p_code}&cnt=${1}&price=${sdto.p_price}">ADD</a></span>
      			</div>
    			</div>
    			<div class="description">
      			<div class="name"><a href="ProductInfo.do?p_code=${sdto.p_code}">${sdto.p_name}</a></div>
      			<div class="spec">
        			<div class="price"><span><fmt:formatNumber value="${sdto.p_price}" pattern="#,##0"/>원</span></div>
      			</div>
    			</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- 페이징 -->
<div class="pageing"> 
	
	<div class="prevBtn">
		<c:if test="${startPage > pageBlock }">
			<a href="SearchProductProc.do?pageNum=${startPage - pageBlock}&order=${order}&keyword=${keyword}"><img src="img/icon/btn_page_prev.png"></a>
		</c:if>
	</div>
	
	<div class="pageNum">
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
    		<a href="SearchProductProc.do?pageNum=${i}&order=${order}&keyword=${keyword}"> ${i} </a>
    	</c:forEach>
	</div>	
	
	<div class="nextBtn">
		<c:if test="${endPage < pageCount}">
    		<a href="SearchProductProc.do?pageNum=${startPage + pageBlock}&order=${order}&keyword=${keyword}"><img src="img/icon/btn_page_next.png"></a>
    	</c:if>
	</div>
	
</div>

<script>
    let order = document.querySelector(".orders #orderby");
    let orderValue;
    let keyword ="<c:out value='${keyword}' />";   
    
    order.addEventListener("change", () =>{
    	orderValue = order.options[order.selectedIndex].value;
    	location.href = "SearchProductProc.do?order="+orderValue + '&keyword='+ keyword;
    })
    
    /* 상품 검색(search) */
      let findbtn = document.querySelector(".product_search .bottom_search_box .search #findbtn");
      let inputkeyword = document.querySelector(".product_search .bottom_search_box .search #keyword");
      
      findbtn.addEventListener('click',() =>{
    	   location.href="SearchProductProc.do?keyword=" + inputkeyword.value;
       }) 
       
</script>
</body>
</html>