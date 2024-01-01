<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
   table{
       border-collapse: collapse; border-color: 1px solid : gray;
   }
   

</style>
</head>
<body>
<center>
   <h2>학생 정보 보기</h2>
   <hr>
   <table width="800" border="1">
     <tr height="40">
     <td align="center" width="50">번호</td>
      <td align="center" width="50">이름</td>
      <td align="center" width="50">과목1</td>
      <td align="center" width="50">과목2</td>
      <td align="center" width="50">과목3</td>
      <td align="center" width="50">총점</td>
      <td align="center" width="50">평균</td>
      <td align="center" width="50">학점</td>
     </tr>
     <!-- 반복문 코딩 입력 위치 -->
   int cnt = 0
       cnt = cnt + 1 
     <c:set var="cnt"  value="0" />  
     <c:forEach var="student" items="${a }">
     <c:set var ="cnt"  value="${cnt +1 }" />
       <tr height="40">
       <td align="center"  width="50">${cnt }</td>
        <td align="center" width="50"><a href="scoreInfo.do?num=${student.num}">${student.name }</a></td>
        <td align="center" width="50">${student.sub1 }</td>
        <td align="center" width="50">${student.sub2  }</td>
        <td align="center" width="50">${student.sub3  }</td>
        <td align="center" width="50">${student.total  }</td>
        <td align="center" width="50">${student.average  }</td>
        <td align="center" width="50">${student.grade  }</td>
       </tr> 
     </c:forEach> 
   </table>
       <br><br>
       <button onclick="location.href='ScoreForm.jsp'" >입력폼</button>
 </center>
</body>
</html>