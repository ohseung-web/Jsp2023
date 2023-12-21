<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  table{
   border-collapse: collapse; 
    border-right-style: none;
  border-left-style: none;
  }td{
  border-right-style: none;
  border-left-style: none;
  padding: 30px;
 
  }
  
  .cnt{
  width: 10px;
  }
   img{
  width: 50px;
  height: 50px;
  }
</style>
</head>

<body>
<center>
<table border="1">
<c:set var="cnt" value="1"/>
<tr><td>이름</td><td>제품사진</td><td>가격</td><td>수량</td><td>총금액</td></tr>
<c:forEach var="jang" items="${a }" >
<tr><td>${jang.name }</td><td>${jang.img }</td><td>${jang.price }</td>
<td>



<input type = "button" value="+" onclick="plus2(${cnt})"><input type = "text" value="${jang.cnt}" id="cnt${cnt }" name="cnts" class="cnt"><input type = "button" value="-" onclick="minus2(${cnt})">

</td><td><div id="sum">${jang.cnt * jang.price }</div></td>
</tr>
<c:set var="cnt" value="${cnt = cnt+1 }"/>
</c:forEach>
<tr><td colspan="5" align="center">
<input type = "button" value="메인으로" onclick="location.href='ProductList.do'">
<input type = "button" value="구매하기" onclick="location.href='ProductList.do'">
</td></tr>
</table>
</center>

<script>
  function plus2(num) {
	  
	  cnt = document.getElementById("cnt"+num);
	  console.log(cnt);
	  
	cnt.value = parseInt(cnt.value) + parseInt(1);
	console.log(cnt.value);
	
}
  function minus2(num) {
	  cnt = document.getElementById("cnt"+num);
	  if(cnt.value<=0){
		  alert("수량은 0보다 적을 수 없습니다");
	  }else{
		  cnt.value = cnt.value - 1;	  
	  }
	  console.log(cnt);
	  console.log(cnt.value);
}
</script>

</body>
</html>