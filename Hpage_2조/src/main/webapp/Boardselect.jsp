<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
*{margin: 0 outo;}
 #Boardinfo{/* border: 1px solid black; */ width: 800px; height: 540px; margin-left: 550px; margin-top: 60px; margin-bottom: 40px; border-radius: 5px;}
  select{margin-left: 20px; width: 103px; font-size: 25px;}

 #Boardinfo #title{display: inline-block; font-size: 25px;}
 #Boardinfo #button{text-align: right;  margin-right: 2px;}
 #Boardinfo #button .mainbutton{width: 100px; height:40px; font-size: 17px; margin-top: 38px; background-color: white; border: none; border: 1px solid gray; margin-right: 17px; border-radius: 5px;}
 #Boardinfo #button .mainbutton:hover{background-color: gray; color: white;}
 #Boardinfo #infotitle{font-size: 35px; margin-left: 20px; border-bottom: 1px solid gray; display: inline-block;}
 #Boardinfo #contentinfo{margin-left: 20px; font-size: 20px; margin-top: 10px; border: 1px solid gray; width: 754px; height: 343px; text-align: center; border-radius: 5px;}
 #Boardinfo #userinfo{margin-left: 312px; margin-top: -10px; font-size: 17px; display: inline-block; }
 #outbutton{margin-left: 570px; background-color: white; border: none; font-size: 15px; margin-top: -102px; margin-bottom: 40px; border: 1px solid gray; width: 125px; height:40px; border-radius: 5px;}
 #outbutton:hover{background-color: gray; color: white;}
</style>
</head>
<body>
 <div id="Boardinfo">
 <form action="BoardUpdate.do" method="post" >
  <tr id="select">
	    <td id="type">
		 <select name="b_type" id="b_type">
		  <option value="선택하세요">선택하세요</option>
			<c:if test="${tdto.b_type == '상품'}">
			 <option value="상품" selected>상품</option>
			 <option value="배송" >배송</option>
			</c:if>
			<c:if test="${tdto.b_type == '배송'}">
			 <option value="상품">상품</option>
			 <option value="배송" selected>배송</option>
			</c:if>
			<c:if test="${tdto.b_type == null}">
			<option value="선택하세요" selected>선택하세요</option>
			 <option value="상품">상품</option>
			 <option value="배송" >배송</option>
			</c:if>
		 </select>
	    </td>
</tr>

<p id="title">${tdto.b_title }</p>

<p id="userinfo">${tdto.id }&nbsp;/&nbsp;${tdto.b_regdate }</p>

<input id="contentinfo" type="text" name="b_content" value="${tdto.b_content }">

<input type="hidden" name="b_no" value="${tdto.b_no }">


 <div id="button">
  
 
  <input class="mainbutton" type="submit" value="수정완료">
  
 </div>

</form>
 </div>
  
  <input id="outbutton" type="button" value="《 목록으로 가기" onclick="location.href='MainList.do?section=Board_list.do'">
 
</body>

</html>