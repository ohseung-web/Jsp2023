<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .container2{
    padding:0 140px;
    width:1000px;
    height: 550px;
    margin: 60px auto;
  }
   h2{
      text-align: center;
   }
   #logintable{
     border : 1px solid gray;
     border-collapse: collapse;
   }
   #logintable tr td{
     text-align: center;
   }
   input[type=text],input[type=password]{
      width:200px;
      height: 30px;
   }
   input[type=submit]{
      cursor: pointer;
      width:80px;
      height: 30px;
   }
   #login{
      width : 400px;
      height: 150px;
      margin : 60px auto;
   }
</style>
</head>
<body>
<div class="container2">
       <h2> 로그인 </h2>
       <form action="MemberloginProc.jsp" method="post" id="login">
          <table width="400" border="1" id="logintable">
             <tr height="50">
                <td width="150">아이디</td>
                <td width="250"><input type="text" name="id" ></td>
             </tr>
             <tr height="50">
                <td width="150">패스워드</td>
                <td width="250"><input type="password" name="pw"></td>
             </tr>
             <tr height="50">
                <td colspan="2"><input type="submit" value="로그인"></td>
             </tr>             
          </table>
       </form>
    </div>
</body>
</html>