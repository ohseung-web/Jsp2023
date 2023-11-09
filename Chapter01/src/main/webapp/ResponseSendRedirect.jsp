<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body{
      display: flex;
      justify-content: center;
      align-content: center;
  }
  h2{
     text-align: center;
  }
</style>
</head>
<body>

<!-- 
ResponseSendRedirect : 페이지를 이동시키는 메서드로 예를들어 로그인 후 서버측에서
                       다른페이지로 떠 넘겨줄 때 사용한다. 
-->
<div class="contianer" >
     <h2> 로그인 페이지 </h2>
      
     <form action="ResponseLoginProc.jsp" method="post">
         <table width="400" border="1">
           <tr height="60">
               <td align="center" width="150">아이디</td>
               <td align="left" width="250">
                  <input type="text" name="id">
               </td>
           </tr>
           <tr height="60">
               <td align="center" width="150">패스워드</td>
               <td align="left" width="250">
                  <input type="password" name="pw">
               </td>
           </tr>
           <tr height="60">
               <td colspan="2" align="center" width="150">
               <input type="submit" value="전송"> 
               </td>
           </tr>
         </table>
       </form>
</div>

</body>
</html>