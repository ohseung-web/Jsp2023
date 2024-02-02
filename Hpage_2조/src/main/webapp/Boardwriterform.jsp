<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#boardwrite{}
 #boardwrite table{width: 1200px; margin-top: 10px; margin-left: 20px; margin: 100px;}
 #boardwrite #mainmenu{height: 40px; display: inline-block; margin-left: 164px; margin-top: -33px;}
 #boardwrite #titlemenu{display: inline-block;}
  #boardwrite #type{display:flex; margin-top: 1px;} 
 #boardwrite #typement{}
 #boardwrite select{width: 200px; height: 49px; border: 1px solid gray; margin-top: -7px; font-size: 15px;}
 #boardwrite #title{width: 200px; text-align: left; margin-top: 2px;}
 #boardwrite #title_name{width: 653px; height: 45px; display: inline-block;  border: 1px solid gray; text-align: left; background-color: white; font-size: 15px; }
 #boardwrite #mainboard{height:40px;}
 #boardwrite #subboard{width: 400px; colspan:2px; text-align: center;}
 #boardwrite #button{width: 100px; height: 40px; background-color: white; margin-left: 166px; border: 2px solid gray; border-radius: 5px;  color: gray;}
 #boardwrite #button:hover{background-color: gray; color: white;}
 #boardwrite #submit{width: 100px; height: 40px; background-color: white; margin-left: 658px; border: 2px solid black; border-radius: 5px;  color: black;}
 #boardwrite #submit:hover{background-color: black; color: white;}
 #boardwrite textarea{border: 1px solid gray;  margin-top: 10px;}
 #boardwrite #textButton{ width: 200px; height: 40px;}

</style>
</head>
<body>
 <center>
	<div id="boardwrite">
	<form action="Boardwriterproc.do" method='post'>
	<table>
		<tr id="mainmenu">
			<td id="typement">분류</td>
				<td id="type">
				<select name="b_type">
				<option value="선택하세요">선택하세요</option>
				 <option value="상품">상품</option>
				 <option value="배송">배송</option>
				</select>
				</td>
		</tr>
		<tr id="titlemenu">
			 <td id="title">제목
			 	<a href="#"><input id="title_name" type='text' name='b_title' value="문의합니다☻"></a>
			 </td>
		</tr>
	<tr id="mainboard">
		<td id="subboard">
		 <textarea  rows='20' cols='120'  name='b_content'></textarea>
		</td>
	</tr>
	<tr>
	  <td id="textButton">
	   <input id="button" type="button" onclick="location.href='MainList.do?section=Board_list.do'" value="목록으로 가기">
	   <input id="submit" type="submit" value="저장하기">
	  </td>
	</tr>
   </table>

   <input type="hidden" name="id" value="${id} ">
   	</form>
	</div>
</center>
</body>
</html>