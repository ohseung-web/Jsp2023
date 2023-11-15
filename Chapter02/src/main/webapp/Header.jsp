<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  body{
     display:flex;
     justify-content: center;
     height: 100vh;
  }
  table tr:nth-child(2) td {
	width: 110px;
	font-size: 15px;
 }
 table tr:nth-child(2) td:nth-child(7) {
	width:140px;
}
 
</style>
</head>
<body>
   <div class="container">
      <table width="800">
         <tr height="100" >
         <!-- 이미지 로고 -->
            <td colspan="2" align="center">
             <img alt="" src="img/logo.jpg" width="200" height="70">
            </td>
            <td colspan="5" align="center">
              <font size="10">Romantic Camping</font>
            </td> 
          </tr>
          <tr height="50">
            <td align="center">텐트</td>
            <td align="center">의지</td>
            <td align="center">식기류</td>
            <td align="center">침낭</td>
            <td align="center">테이블</td>
            <td align="center">화롯대</td>
            <td align="center"><%=request.getParameter("id") %></td>
          </tr>
      </table>
   </div>
</body>
</html>

