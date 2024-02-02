
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#Boardlist{margin-left: 420px; border-bottom: 3px solid gray; width: 1004px;}
#Boardlist #board_wrap{border-collapse:collapse; width: 1000px; margin-top: 50px; margin-top: 80px;}
#Boardlist .submenu01{text-align: center; width: 10px;}
#Boardlist .submenu02{text-align: center; width: 10px;}
#Boardlist .submenu03{text-align: center; width: 70px;}
#Boardlist .submenu04{text-align: center; width: 10px;}
#Boardlist .submenu05{text-align: center; width: 10px;} 
#Boardlist span{font-size: 15px;}
#Boardfooter {margin-left: 170px; margin-top: 25px;}
#Boardfooter #search{width: 100px; height: 48px; margin-left: 6px; background: white; border: 2px solid black;}
#Boardfooter #button{width: 100px; height: 46px; background: white; border: 2px solid black; margin-left: 556px;}
#Boardfooter #button:hover{background-color: black; color: white;}
#Boardfooter #textbox{border: 2px solid gray; width: 230px; height: 44px; margin-left: 250px; margin-top: 18px;}
a{text-decoration: none; color: black;}
a:hover{color: blue;}
tr{border-bottom: 1px solid lightgray;}
tr:nth-of-type(1){border-bottom: 3px solid gray;}
td{height:40px;}
th{padding: 15px 0;}
</style>
</head>
<body>

 <div id="Boardlist">
  <form action="Board_list.do" method="post">
   <table id="board_wrap">

  <tr id="mainmenu" >
   <th class="submenu01"><span>번호</span></th>
   <th class="submenu02"><span>분류</span></th>
   <th class="submenu03"><span>제목</span></th>
   <th class="submenu04"><span>글쓴이</span></th>
   <th class="submenu05"><span>등록일</span></th>
  </tr>
 
  <c:forEach var='bdto' items="${bdtoarr }">
   <tr >
    <td class="submenu01">${bdto.b_no }</td>
    <td class="submenu02">${bdto.b_type }</td>
    <td class="submenu03"><a href ="Boarduserinfo.do?b_no=${bdto.b_no }&&id=${bdto.id }">${bdto.b_title }</a></td>
    <td class="submenu04">${bdto.id }</td>
    <td class="submenu05">${bdto.b_regdate }</td>

   </tr>
  </c:forEach>
<input type="hidden" value="${bdto.id }" name="id">
 </table>
 </form>
 </div>

    <div id="Boardfooter">
  <input type="text" id="textbox"><input type="submit" value="검색" id="search">
  <input type="button" value="질문 쓰기" onclick= "location.href = 'MainList.do?section=Boardwriterform.jsp'" id="button">
  </div> 
  
</body>
</html>