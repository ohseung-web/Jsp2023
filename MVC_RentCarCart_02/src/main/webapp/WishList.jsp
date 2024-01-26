<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .cookiecontainer{
     display: flex;
     justify-content: center;
     align-items: center;
  }
  .cookiecontainer .wish h2{
     text-align: center;
  }

</style>
</head>
<body>

  <div class="cookiecontainer">
      <div class="wish">
        <h2> 관심상품 목록</h2>
        <c:forEach var="arr" items="${arr }">
         <p>${arr.no }</p>
         <p>${arr.img }</p>
         <p>${arr.name}</p>
         <p>${arr.price }</p>
        </c:forEach>
      </div>
  </div>
</body>
</html>