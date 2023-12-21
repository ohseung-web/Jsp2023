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
    <h2> 회원 가입 결과</h2>
      <table width="400" border="1">
        <tr height="40">
          <td width="150">아이디</td>
          <td width="250">${mdto.id }</td>
        </tr>
         <tr height="40">
          <td width="150">패스워드</td>
          <td width="250">${mdto.pw }</td>
        </tr>
         <tr height="40">
          <td width="150">이메일</td>
          <td width="250">${mdto.email }</td>
        </tr>
         <tr height="40">
          <td width="150">전화번호</td>
          <td width="250">${mdto.tel }</td>
        </tr>
         <tr height="40">
          <td width="150">주소</td>
          <td width="250">${mdto.address }</td>
        </tr>
      </table>
       
 
    
 </div>
</body>
</html>