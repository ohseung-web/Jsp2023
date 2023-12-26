<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <center>  
<h2>모든 상품 보기</h2>
   <hr>
   <table width="800" border="1">
     <tr height="40">
      <td align="center" width="50">상품번호</td>
      <td align="center" width="50">상품이미지</td>
      <td align="center" width="50">상품명</td>
      <td align="center" width="50">상품가격</td>
      <td align="center" width="50">제조사</td>
      <td align="center" width="50">상품설명</td>
     </tr>
     <!-- 반복문 코딩 입력 위치 -->
     <c:forEach var="rdto"  items="${a }">
        <%--  out.print("no"+${rdto.no })
         out.print("no"+${rdto.img }) --%>
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
      <input type="button"  value="장바구니 보기" onclick="location.href='Jang.do'">
   </table>
 </center>
   


   
</body>
</html>