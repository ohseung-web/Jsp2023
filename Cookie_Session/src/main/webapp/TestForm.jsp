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
         // 사용자 컴퓨터로부터 쿠키 값을 배열로 읽어들인다.
         Cookie [] cookies = request.getCookies();
         String id="";
         // 반드시 null 처리 => 처음엔 쿠키값이 존재하지 않을 수 있기 때문에
         if( cookies != null){
        	   for(int i=0; i< cookies.length; i++){
              	   if(cookies[i].getName().equals("id")){ //쿠키 이름 가져오기
              		   id = cookies[i].getValue(); // 쿠키 값 가져오기
              		   break;
              	   }
               } 
         }
      
     %>

      <div class="contianer">
       <h2> 쿠키 로그인 </h2>
       <form action="TestProc.jsp">
          <table width="400" border="1" id="popUp">
             <tr height="50">
                <td width="150">아이디</td>
                <td width="250"><input type="text" name="id" value="<%=id %>"></td>
             </tr>
             <tr height="50">
                <td width="150">패스워드</td>
                <td width="250"><input type="password" name="pw"></td>
             </tr>
             <tr height="50">
                <td colspan="2"><input type="checkbox" name="save" value="1">아이디 저장 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="close" value="2" id="close" >오늘 닫기</td>
             </tr>
             <tr height="50">
                <td colspan="2"><input type="submit" value="로그인"></td>
             </tr>             
          </table>
       </form>
    </div>
    <script type="text/javascript">
        
    </script>
      
</body>
</html>