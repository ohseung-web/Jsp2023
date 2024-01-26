<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
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
	margin: 45px 0 40px;
    text-align: center;
	font-weight: 700;
    font-size: 32px;
    color: #1f1f1f;
}
/* paging CSS 시작  */
.pageing{
  width:80%;
  margin: 0 auto;
}
.pageing .pageingWrap{
 /*  widdth:80%; */
  margin : 50px 0 150px 0;
  display:flex;
  justify-content: center;
  align-items: cente;
}
.pageing  .pageingWrap img{
   width:40px;
   height: 40px;
   line-height: 40px;
}
.pageing .pageingWrap .pagenum{
  /*  display: inline-block; */
   width:40px;
}
.pageing .pageingWrap .pagenum .pagenumbering{
   height: 40px;
   color: #6d6d6d;
   border: 1px solid #e5e5e5;
   text-align: center;
   line-height: 40px;
   font-size: 15px;
}
.pageing .pageingWrap .pagenum .pagenumbering.on{
  border: 1px solid #000;
}
/* paging CSS 종료  */

/* 오티 상품개수 출력 CSS 수정부분 */
.productCollocate{
    width: 80%;
	margin: 0 auto;
}
.productinfo{
  margin-top: 100px;
  display:flex;
  justify-content: space-around;
  gap: 78%;
  align-items: center;
}
.productCollocate .productinfo .catecount{
   max-width: 100%;
   padding:0 10px;
   height: 40px;
   font-size: 13px;
   line-height: 40px;
   color:gray;
}
.productCollocate .productinfo .catecount span{
   font-weight: bold;
   font-size: 13px;
   color:black;
}
.orders{
	/* width: 80%; */
	/* margin: 0 auto; */
	text-align: right; 
}
/* 상품부분 CSS 끝  */
 .orders select{
    max-width: 100%;
    height: 40px;
    padding: 0 30px 0 15px;
    font-size: 13px;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    background : url("/img/icon/ico_select.png"); /* url이미지 입력시 "/img/~" 이렇게 지정할 것*/
    background-repeat: no-repeat;
    background-position: right 10px center; 
    /* background: #fff url(img/icon/ico_select.png) no-repeat right 10px center; */
    background-size: 14px 8px; 
}   
.productWrap{
	width: 80%;
	margin: 0 auto;
/*     border: 1px solid red; */
}
.productContainer{
	display: flex;
	justify-content: flex-start;
    width: 100%;
    flex-flow: row wrap;
    margin-left: 20px;
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
    font-size: 14px;
    font-weight: 500;
    color: #fff;
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
	width: 200px;
	margin: 0 auto;
}
.pageing a{
	font-size: 20px;
}
</style>
</head>
<body>
<!-- 카테고리 이름 -->
<c:choose>
	<c:when test="${category eq 1}">
		<c:set var="catename" value="${catename='기획전'}" />
	</c:when>
	<c:when test="${category eq 2}">
		<c:set var="catename" value="${catename='모음전'}" />
	</c:when>
	<c:when test="${category eq 3}">
		<c:set var="catename" value="${catename='리빙박스'}" />
	</c:when>
	<c:when test="${category eq 4}">
		<c:set var="catename" value="${catename='서랍장'}" />
	</c:when>
	<c:when test="${category eq 5}">
		<c:set var="catename" value="${catename='휴지통'}" />
	</c:when>
	<c:when test="${category eq 6}">
		<c:set var="catename" value="${catename='바스켓'}" />
	</c:when>
	<c:when test="${category eq 7}">
		<c:set var="catename" value="${catename='생활용품'}" />
	</c:when>
	<c:when test="${category eq 8}">
		<c:set var="catename" value="${catename='기타용품'}" />
	</c:when>
	<c:when test="${category eq 9}">
		<c:set var="catename" value="${catename='부속제품'}" />
	</c:when>
</c:choose>
<div class="title">
	<h2>${catename}</h2>
</div>
<div class="productCollocate">
 <div class="productinfo">
    <div class="catecount">
       총&nbsp;&nbsp;<span>${cateCount}</span>개의 상품
    </div>
    <div class="orders">
	<select id="orderby" name="orderby">
		<option value="1">- 정렬방식 -</option>
    	<option value="2">높은가격</option>
    	<option value="3">낮은가격</option>
	</select>
   </div>
 </div>
</div>   
<div class="productWrap">
	<div class="productContainer">
		<c:forEach var="pdto" items="${plist}">
			<div class="prdList_item">
    			<div class="thumbnail">
      			<a href="#">
        			<img src="img/productimg/${pdto.p_mainimg}" alt="">
      			</a>
      			<div class="icon_box">
        			<span class="cart">ADD</span>
      			</div>
    			</div>
    			<div class="description">
      			<div class="name"><a href="#">${pdto.p_name}</a></div>
      			<div class="spec">
        			<div class="price"><span><fmt:formatNumber value="${pdto.p_price}" pattern="#,##0"/>원</span></div>
      			</div>
    			</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- 페이징 -->
      <div class="pageing"> 
        <div class="pageingWrap">
         <c:if test="${startPage > pageBlock }">
			<a href="LivProductListProc.do?pageNum=${startPage - pageBlock}&p_category=${category}"><img src="img/icon/btn_page_prev.png"></a>
		 </c:if>
		
         <c:forEach var="i" begin="${startPage}" end="${endPage}">
        	<a href="LivProductListProc.do?pageNum=${i}&p_category=${category}" class="pagenum"><div class="pagenumbering"> ${i} </div></a>
         </c:forEach>

         <c:if test="${endPage < pageCount}">
        	<a href="LivProductListProc.do?pageNum=${startPage + pageBlock}&p_category=${category}"><img src="img/icon/btn_page_next.png"></a>
         </c:if>
        </div>
     </div>
<script type="text/javascript">
    
    $(function(){
    	$('.pageing .pageingWrap .pagenum .pagenumbering').click(function(){
    		$(this).addClass('on');
    		$(this).siblings().removeClass('on');
    	})
    })
    
</script>
</body>
</html>