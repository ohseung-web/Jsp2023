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
<%
        
          /* int num = Integer.parseInt(request.getParameter("num").trim()); //공백제거 후 정수형으로 바꿈  */
         int num =Integer.parseInt(request.getParameter("num").trim());
         /*  session.setAttribute("num", num);
          int num = (Integer)session.getAttribute("num"); */
          
         // 데이터 베이스 접근
         BoardDAO bdao = new BoardDAO();
         //boardBean 타입으로 하나의 게시글을 리턴
         BoardBean bean = bdao.getOneBoard(num);
           
%>
 <center>
      <h2>게시글 보기</h2>
      <table width="600"  border="1"  bgcolor="skyblue">
         <tr height="40">
               <td align="center"  width="120">글번호</td>
               <td align="center"  width="180"><%=bean.getNum() %></td>
               <td align="center"  width="120">조회수</td>
               <td align="center"  width="180"><%=bean.getReadcount() %></td>
          </tr>     
          <tr height="40">
               <td align="center"  width="120">작성자</td>
               <td align="center"  width="180"><%=bean.getWriter()%></td>
               <td align="center"  width="120">작성일</td>
               <td align="center"  width="180"><%=bean.getDate()%></td>
          </tr>  
          <tr height="40">
              <td align="center"  width="120">이메일</td>
               <td align="center"  colspan="3"><%=bean.getEmail()%></td>
           </tr>  
           <tr height="40">
              <td align="center"  width="120">제목</td>
               <td align="center"  colspan="3"><%=bean.getSubject()%></td>
           </tr>  
            <tr height="40">
              <td align="center"  width="120">글내용</td>
               <td align="center"  colspan="3"><%=bean.getContent()%></td>
           </tr>
           <tr height="40">  
            <td align="center"  colspan="4">
                <input type="button"   value="답글쓰기"  
                   onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">
            <input type="button"   value="수정"  onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'" >
            <input type="button"   value="삭제"  onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'">
            <input type="button"   value="목록보기"  onclick="location.href='BoardList.jsp'">
           </td>
           </tr> 
      </table>
 </center>               
</body>
</html>





