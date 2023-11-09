<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- response.sendRedirect()를 만나는 순간 <h2>태그는 버퍼에서 사라진다. -->
   <h2> 로그인 처리 페이지 </h2>
<%
     request.setCharacterEncoding("UTF-8");
     /* 임의적으로 id와 pass를 설정한다. => DB가 존재하지 않기때문에 임의로 작성 */
     String dbid ="aaaa";
     String dbpass ="1234";
     
     /* 시영지러브타 남아온 데이터를 입력 받아줌  */
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     
     if(dbid.equals(id) && dbpass.equals(pw)){
    	 /* id와 pw가 일치하면 main 페이지를 보여준다. id를 ?id=id get방식으로 넘김 */
    	 response.sendRedirect("ResponseMain.jsp?id="+id);
     }else{
%>
     <script>
       alert("아이디와 패스워드가 일치하지 않습니다.");
       history.go(-1);
     </script>   
<%      	 
     }
%>


</body>
</html>