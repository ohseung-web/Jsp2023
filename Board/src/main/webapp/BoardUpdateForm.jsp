<%@page import="Model.BoardBean"%>
<%@page import="Model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>게시글 수정</h2>
<hr>
<%
        // 해당 게시글번호를 통하여  게시글을 수정
        int num = Integer.parseInt(request.getParameter("num"));
        
        // 하나의 게시글의 대한 정보를 리턴
        BoardDAO bdao= new BoardDAO();
        BoardBean bean = bdao.getOneUpdateBoard(num);
%>
<form action="BoardUpdatePro.jsp" method="post">

<table width="600"  border="1" bgcolor="skyblue">
      <tr height="40">
          <td width="120"  align="center">작성자</td>
          <td width="180"  align="center"><%=bean.getNum() %></td>
          <td width="120"  align="center">작성일</td>
          <td width="180"  align="center"><%=bean.getDate() %></td>
         </tr>
         <tr height="40">
            <td width="120" align="center" >제목</td>
            <td width="480" align="left"  colspan="3"  >&nbsp; <input  type="text"  name="subject"  value="<%=bean.getSubject() %>"   size="60"></td>
         </tr>  
         <tr height="40">
            <td width="120" align="center" >패스워드</td>
            <td width="480" align="left"  colspan="3"  >&nbsp; <input  type="password"  name="password" ></td>
         </tr>
         <tr height="40">
            <td width="120" align="center" >글내용</td>
            <td width="480" align="left"  colspan="3" ><textarea rows="10" cols="60"  name="content"><%=bean.getContent() %></textarea></td>
         </tr>
         <tr height="40">
              <td colspan="4" align="center" >
               <input type="hidden"  name="num"  value="<%=bean.getNum() %>">
               <input type="submit"  value="글수정" >&nbsp;&nbsp;
               <input type="button" onclick="location.href='BoardList.jsp'" value="전체보기">
               </td>
           </tr>                     
</table>
</form>
</center>
</body>
</html>