<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .rentcontainer{
        margin: 10px auto;
        width: 800px;
        height: 1400px;
    }
    h2{
        text-align: center;
    }
    .renttable{
       border-collapse: collapse;
    }
    .rentcontainer input{
       margin: 10px auto;
       margin-left : 380px;
    }
     .pageing{
       width : 300px;
       text-align: center;
       margin : 10px auto;
       
    }
    .rentcontainer .pageing a{
        display: inline-block;
       /*  width : 100px;
        height: 30px; */
        width : 25px;
        height: 25px;
        line-height: 25px;
        margin-right: 5px;
        border : 1px solid gray;
    }
    .rentcontainer .pageing a:hover{
       background: darkgray;
       color : #fff;
       font-weight : 800;
    }
</style>
</head>
<body>

  <div class="rentcontainer">
     <h2>모든 상품 보기</h2>
   <table width="800" border="1" class="renttable">
     <tr height="40">
      <td align="center" width="50">상품번호</td>
      <td align="center" width="50">상품이미지</td>
      <td align="center" width="50">상품명</td>
      <td align="center" width="50">상품가격</td>
      <td align="center" width="50">제조사</td>
      <td align="center" width="50">상품설명</td>
     </tr>
     <!-- 반복문 코딩 입력 위치 -->
     <c:forEach var="rdto"  items="${alist }">
       <tr height="40">
        <td align="center" width="50">${rdto.no }</td>
        <td align="center" width="50"><a href="RentInfo.do?no=${rdto.no }">
             <img alt="" src="img/${rdto.img }" width="60"  height="60"></a></td>
        <td align="center" width="50">${rdto.name }</td>
        <td align="center" width="50">${rdto.price }</td>
        <td align="center" width="50">${rdto.company }</td>
        <td align="center" width="80">${rdto.info }</td>
       </tr> 
     </c:forEach> 
   </table> 
    ${startPage} <br/>
    ${endPage} <br />
    ${pageCount }<br/>
    ${pageBlock }
    <div class="pageing">
		<!-- 페이지 카운터링 소스 작성 [1] [2] [3] [다음] ....... -->

		<!-- [이전]이라는 링크를 만들건지 파악-->
		<c:if test="${startPage > pageBlock }">
			<a href="RentListPro.do?pageNum=${startPage - pageBlock}"> ◀ 
			</a>
		</c:if>

		<!-- 페이징 처리 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="RentListPro.do?pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- [다음]이라는 페이지를 만들건지 파악 -->
		<c:if test="${endPage < pageCount }">
			<a href="RentListPro.do?pageNum=${startPage + pageBlock}"> ▶
			</a>
		</c:if>		
		
		<!-- The more 방식 페이징 -->
		<%-- <c:forEach var="i" begin="${startPage}" end="${endPage}">
		    <a href="RentListPro.do?pageNum=1">The more</a>
			<c:if test="${endPage < pageCount }">
			  <c:forEach var="j" begin="${startPage + 1}" end="${startPage + 1}">
			    <a href="RentListPro.do?pageNum=1">The more</a>
			  </c:forEach>   
			</c:if>
		</c:forEach> --%>
    </div>
  </div>

</body>
</html>