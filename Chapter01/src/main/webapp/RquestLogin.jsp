<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.contianer{
  margin: 0 auto;
  width:500px;
  height: 300px;
}
</style>
</head>
<body>
     <!-- form태그의 action은 이페이지에서 작성한 정보를 
           떠넘겨주는 파일명을 기술하는 공간  -->
      <!-- form태그의 method는 전송방식을 지정하는 공간이다.  --> 
      <!-- method : get, post 방식 두가지중 하나를 사용한다. -->  
      <!-- get방식은 URL에 id와 password가 보이는 방식 --> 
      <!-- post방식은 URL에 id와 password가 감추는 방식 -->  
      <!-- submit 버튼을 클릭하면 action의 RequestLoginProc.jsp가 실행된다. -->
      
  <div class="contianer" >
     <h2> 로그인 페이지 </h2>
      
     <form action="RequestLoginProc.jsp" method="post">
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