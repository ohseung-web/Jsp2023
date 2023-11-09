<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body{
     display:flex;
     justify-content: center;
     align-content: center;
  }
  h2{
     text-align: center;
  }
  table{
      border-collapse: collapse;
  }
</style>
 
</head>
<body>

<%
     /*  post방식으로 데이터가 넘어올때 한글이 깨지는 현상을 막는 코드 */
     request.setCharacterEncoding("UTF-8");

     /* 각종 사용자로부터 넘어온 데이터를 저장한다. */
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     String pwchk = request.getParameter("pwchk");
     String email = request.getParameter("email");
     String tel = request.getParameter("tel");
     
     /* getParameterValues(): name이 같은 value값을 []배열로 받아준다. */
     String [] hobby = request.getParameterValues("hobby");
     
     String job = request.getParameter("job");
     String age = request.getParameter("age");
     String info = request.getParameter("info");
     
     if(!pw.equals(pwchk)){
%>
     <script type="text/javascript">
        alert("비밀번호가 틀립니다.");
        history.go(-1); /* 이전페이지로 이동 */
     </script>   
<%      	 
     }
%>

<div class="container02">
    <h2> 회원 정보 보기 </h2>
    <table width="500" border="1">
      <tr height="50">
            <td width="150" align="center">아이디</td>
            <td width="350" align="center"><%=id %>
            </td>
         </tr>
         <tr height="50">
            <td width="150" align="center">Email</td>
            <td width="350" align="center"><%=email %>
            </td>
         </tr>
         <tr height="50">
            <td width="150" align="center">전화번호</td>
            <td width="350" align="center"><%=tel %>
            </td>
         </tr>
         <tr height="50">
            <td width="150" align="center">관심분야</td>
            <td width="350" align="center">

           <%
               for(int i=0; i<hobby.length; i++){
            	   out.write(hobby[i]+" ");
               }
           
           %>

            </td>
         </tr>
         <tr height="50">
            <td width="150" align="center">직업</td>
            <td width="350" align="center"><%=job %>
            </td>
         </tr>
         <tr height="50">
            <td width="150" align="center">연령</td>
            <td width="350" align="center"><%=age %>
            </td>
         </tr>
         <tr height="50">
            <td width="150" align="center">히고싶은말</td>
            <td width="350" align="center"><%=info %>
            </td>
         </tr>

    </table>

</div>


</body>
</html>