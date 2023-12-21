<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  ul{
   display: inline-block;
   padding: 30px;
    padding-left: 60px;
  }
  ul,li{
  list-style: none;
  }
  li{
  padding-right: 60px;
  padding-left: 60px;
  }
  #cnt{
  width: 10px;
  }
</style>
</head>
<body>

<center>
<h1>상품 상세 페이지</h1>
<form action="jang.do" method="post">
<ul>
<li>${img }</li><br>
<li>${name }</li><br>
<li>${price}원</li><br>
<li><input type = "button" value="+" onclick="plus()"><input type = "text" value="0" id="cnt" name="cnts"><input type = "button" value="-" onclick="minus()">
<input type = "submit" value="장바구니 담기" ><input type="hidden" name="num" value="${num }">
</li><br>
<li><input type = "button" value="메인으로" onclick="location.href='ProductList.do'"></li>

</ul>
</center>
</form>
<script>
  function plus() {
	cnt.value = parseInt(cnt.value) + parseInt(1);
}
  function minus() {
	  if(cnt.value<=0){
		  alert("수량은 0보다 적을 수 없습니다");
	  }else{
		  cnt.value = cnt.value - 1;	  
	  }
	
}
</script>
</body>
</html>