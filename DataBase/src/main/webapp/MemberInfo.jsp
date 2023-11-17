<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
   body{
      display: flex;
      justify-content: center;
   }
   table{
     border-collapse: collapse;
   }
   h2{
      text-align: center;
   }
   table tr td{
     padding-left: 10px;
   }
   button{
     width:80px;
     height:30px;
     cursor: pointer;
   }
</style>
</head>
<body>
  
  <!-- MemberList.jsp 넘긴 id를 받아온다. 데이터 베이스에서 한 회원의 정보를 가지고 온다. -->
  
  <%
     String id = request.getParameter("id");
  
     MemberDAO mdao = new MemberDAO();
     // 해당하는 id의 회원정보를 리턴
     MemberBean mbean = mdao.oneSelectMember(id);
  %>
  
  <div class="container">
    <h2>회원 정보 상세보기</h2>
    <table width="400" border="1">
      <tr height="50">
        <td align="center" width="150">아이디</td>
        <td  width="250"><%=mbean.getId() %></td>
       </tr> 
       <tr height="50">
        <td align="center" width="150">이메일</td>
        <td  width="250"><%=mbean.getEmail() %></td>
       </tr> 
       <tr height="50">
        <td align="center" width="150">전화</td>
        <td  width="250"><%=mbean.getTel() %></td>
       </tr> 
       <tr height="50">
        <td align="center" width="150">취미</td>
        <td  width="250"><%=mbean.getHabby() %></td>
       </tr> 
       <tr height="50">
        <td align="center" width="150">직업</td>
        <td  width="250"><%=mbean.getJob() %></td>
       </tr> 
       <tr height="50">
        <td align="center" width="150">나이</td>
        <td  width="250"><%=mbean.getAge() %></td>
       </tr> 
       <tr height="50">
        <td align="center" width="150">정보</td>
        <td  width="250"><%=mbean.getInfo() %></td>
       </tr>
       <tr height="50">
        <td align="center" colspan="2">
          <button onclick="location.href='MemberUpdatForm.jsp?id=<%=mbean.getId()%>'">회원수정</button>
          <button onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'">회원삭제</button>
          <button onclick="location.href='MemberList.jsp'">목록보기</button>
          <button onclick="location.href='MemberJoin.jsp'">회원가입</button>
        </td>
       </tr>  
    </table>
    
  </div>
  
  
</body>
</html>