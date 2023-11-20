<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
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
   table tr td{
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
 
</style>
</head>
<body>

   <%
      //사용자 컴퓨터의 쿠키 저장소로부터 쿠키 값을 읽어 들인다.
      //몇개인지 모르기때문에 배열을 이용하여 쿠키 값을 저장한다.
      Cookie[] cookies = request.getCookies();
      String id ="";
   
      // 반드시 null처리 한다
      if(cookies != null){
    	  for(int i=0;i<cookies.length;i++){
    		  if(cookies[i].getName().equals("id")){
    			  id = cookies[i].getValue();
    			  break; //원하는 데이터를 찾았기 때문에 반복문을 빠져나온다.
    		  }
    	  }
      }
   
   %>

    <div class="contianer">
       <h2> 쿠키 로그인 </h2>
       <form action="CookieloginProc.jsp">
          <table width="400" border="1">
             <tr height="50">
                <td width="150">아이디</td>
                <td width="250"><input type="text" name="id" value="<%=id%>"></td>
             </tr>
             <tr height="50">
                <td width="150">패스워드</td>
                <td width="250"><input type="password" name="pw"></td>
             </tr>
             <tr height="50">
                <td colspan="2"><input type="checkbox" name="save" value="1">아이디 저장</td>
             </tr>
             <tr height="50">
                <td colspan="2"><input type="submit" value="로그인"></td>
             </tr>             
          </table>
       </form>
    </div>
    
</body>
</html>