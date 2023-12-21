<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   body{
     display:flex;
     justify-content: center;
     align-content: center;
  }
  h2{
     text-align: center;
  }
  table{
      border-collapse: collapse;
  }
  td{
     text-align: center;
  }
</style>
</head>
<body>

  <div class="container">
    <h2> 모든 회원 보기 </h2>
    <table width="800" border="1">
      <tr height="40">
         <td width="50">아이디</td>
         <td width="200">이메일</td>
         <td width="150">전화번호</td>
         <td width="150">취미</td>
         <td width="150">직업</td>
         <td width="100">나이</td>
      </tr>
      <c:forEach var="a" items="${alist }">
        <tr height="40">
         <td width="50">${a.id }</td>
         <td width="200"><a href="#">${a.email }</a></td>
         <td width="150">${a.tel }</td>
         <td width="150">${a.hobby }</td>
         <td width="150">${a.job }</td>
         <td width="100">${a.age }</td>
        </tr>
      </c:forEach>
    </table>
  </div>

</body>
</html>