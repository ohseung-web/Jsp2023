<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   body{
       display:flex;
       justify-content: center;
    }
    table{
      border-collapse: collapse;
    }
    h2{
      text-align: center;
    }
    input[type=button], input[type=submit]{
      cursor: pointer;
      width : 100px;
      height: 25px;
      margin-right: 10px;
    }
    input[type=text], input[type=password]{
      width : 430px;
      height: 25px;
    }
    textarea {
	   text-align: left;
    }
</style>
</head>
<body>
<div class="container">
   <h2> 게시글 수정 </h2>
   <%
       //수정할 해당 글번호를 통하여 해당 게시글 수정
       int num = Integer.parseInt(request.getParameter("num"));
   
      //하나의 게시글의 대한 정보를 리턴
      BoardDAO bdao = new BoardDAO();
      BoardBean bean = bdao.getOneUpdateBoard(num);
   %>
   <form action="BoardUpdateProc.jsp" method="post">
     <table width="600" border="1">
         <tr height="40">
            <td align="center" width="120">작성자</td>
            <td align="center" width="180"><%=bean.getWriter() %></td>
            <td align="center" width="120">작성일</td>
            <td align="center" width="180"><%=bean.getReg_date() %></td>
         </tr>
         <tr height="40">
            <td align="center" width="120">제목</td>
            <td align="left" width="480" colspan="3">
            <input type="text" name="subject" value="<%=bean.getSubject()%>"></td>
         </tr>
          <tr height="40">
            <td align="center" width="120" >패스워드</td>
            <td align="left" width="480" colspan="3">
            <input type="password" name="password"></td>
         </tr>
          <tr height="40">
            <td align="center" width="120">글내용</td>
            <td width="480" colspan="3">
            <textarea rows="10" cols="60" name="content">
              <%=bean.getContent() %>
            </textarea>
         </tr>
         <tr height="40">
            <td align="center" colspan="4">
               <input type="hidden" name="num" value="<%=num%>">
               <input type="submit" value="글수정">
               <input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기">
            </td>
     </table>
   </form>
</div>
</body>
</html>