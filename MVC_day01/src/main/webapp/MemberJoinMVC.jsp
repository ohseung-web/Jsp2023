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
  h2{
     text-align: center;
  }
  table{
    border-collapse: collapse;
  }
  td {
     text-align: center;
  }
</style>
</head>
<body>
 <div class="container">
    <h2> 회원 가입 양식</h2>
    <form action="Mproc.do" method="post">
      <table width="400" border="1">
        <tr height="40">
          <td width="150">아이디</td>
          <td width="250"><input type="text" name="id"></td>
        </tr>
         <tr height="40">
          <td width="150">패스워드</td>
          <td width="250"><input type="password" name="pw"></td>
        </tr>
         <tr height="40">
          <td width="150">이메일</td>
          <td width="250"><input type="email" name="email"></td>
        </tr>
         <tr height="40">
          <td width="150">전화번호</td>
          <td width="250"><input type="tel" name="tel"></td>
        </tr>
         <tr height="40">
          <td width="150">주소</td>
          <td width="250"><input type="text" name="address"></td>
        </tr>
          <tr height="40" >
          <td  colspan="2"><input type="submit" value="가입하기"></td>
        </tr>
      </table>
       
    </form>
    
 </div>
</body>
</html>