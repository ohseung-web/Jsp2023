<%@page import="model.MemberBean"%>
<%@page import="java.util.ArrayList"%>
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
</style>
</head>
<body>
  
  <!-- 1.데이터 베이스에서 모든회원의 정보를 가져오기 
       2.테이블 태그를 이용하여 화면에 회원들의 정보를 출력
  -->
  <%
     MemberDAO mdao = new MemberDAO();
     //회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길인 ArrayList()를
     //이용하여 데이터를 저장해준다.
     ArrayList<MemberBean>  alist = mdao.allSelectMember();
  %>
  
  <div class="container">
  <h2>모든 회원 보기</h2>
     <table width="800" border="1">
       <tr height="50">
          <td align="center" width="150">아이디</td>
          <td align="center" width="250">이메일</td>
          <td align="center" width="200">전화번호</td>
          <td align="center" width="200">취미</td>
       </tr>
       <%
          for(int i=0; i<alist.size(); i++){
        	//ArrayList에 담긴 빈클래스를 하나씩 추출
        	MemberBean bean = alist.get(i);  
       %> 	  
        <tr height="50">
          <td align="center" width="150"><a href="MemberInfo.jsp?id=<%=bean.getId()%>">
          <%=bean.getId() %></a>
          </td>
          <td align="center" width="250"><%=bean.getEmail() %></td>
          <td align="center" width="200"><%=bean.getTel() %></td>
          <td align="center" width="200"><%=bean.getHabby() %></td>
       </tr>
     <% } %>
     </table>
  </div>
  
  
</body>
</html>