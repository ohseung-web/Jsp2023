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
   }
</style>
</head>
<body>

  <div class="container">
  <form action="ResponseProc.jsp" method="post">
     <table width="400" border="1">
       <tr height="50">
          <td align="center" width="150">아이디</td>
          <td width="250"><input type="text" name="id">
          </td>  
       </tr>
       <tr height="50">
          <td align="center" width="150">비밀번호</td>
          <td width="250"><input type="password" name="pw">
          </td>  
       </tr>
       <tr height="50">
          <td align="center" colspan="2">
            <input type="submit" value="로그인">&nbsp;&nbsp;
            <input type="reset" value="취소">
          </td>  
       </tr>
     </table>
  </form> 
  </div>

</body>
</html>











