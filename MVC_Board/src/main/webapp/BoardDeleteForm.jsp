<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
   body{
       display:flex;
       justify-content: center;
    }
    table{
      border-collapse: collapse;
    }
    h2{
      text-align: center;
    }
    input[type="password"]{
       width:400px;
       height: 20px;
    }
</style>
</head>
<body>

<div class="container">
   <h2> 게시글 삭제 </h2>
   <form action="BoardDeleteProcCon.do" method="post">
      <table width="600" border="1">
         <tr height="40">
            <td width="120" align="center">작성자</td>
            <td width="180" align="center">${bdto.writer }</td>
            <td width="120" align="center">작성일</td>
            <td width="180" align="center">${bdto.reg_date }</td>
         </tr>
         <tr height="40">
          <td width="120" align="center">제목</td>
          <td align="left" colspan="3">${bdto.subject }</td>
         </tr> 
         <tr height="40">
          <td width="120" align="center">패스워드</td>
          <td align="left" colspan="3"><input type="password" name="userPw"></td>
         </tr> 
         <tr height="40">
          <td align="center" colspan="4">
          <input type="hidden" name="num" value="${bdto.num }">
          <input type="hidden" name="dbPw" value="${bdto.password }">
          <input type="submit" value="글삭제">&nbsp;&nbsp;
          <input type="button" onclick="location.href='BoardListCon.do'" value="목록보기">
          </td>
         </tr> 
      </table>
   </form>
</div>
</body>
</html>