
<%@page import="fooding.FoodingBoardBean"%>
<%@page import="fooding.FoodingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style>
        *{box-sizing: border-box;}
        #board {width: 1400px; margin: 0 auto;}
        #board h2{margin: 50px 0 25px 0}
        #board table{width: 1400px; border-collapse: collapse;}
        #board table td:first-child, #board table td:nth-child(3){text-align: center; font-weight: bold; width: 200px; background: #fbfbfb;}
        #board table td{height: 45px;}
        #board table td span, #board table td .input01{padding-left: 15px; font-size: 15px;}
        #board table tr:nth-child(1) input,#board table tr:nth-child(2) input{width: 800px; height: 40px;}
        #board table tr:nth-child(5) input{width: 450px; height: 40px;}
        #board table input[type=button], #board table .btn01{width: 100px; height: 35px; font-size: 16px; font-weight: bold; background-color: #00a7b3; color:white; border-radius: 5px; border:none;}
        #board table input{border: none;}
        #board table textarea{border:none;}
        #board .td01{width: 100px;}
        #board .title{width: 200px;}
    </style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	FoodingDAO fdao = new FoodingDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	//String id = request.getParameter("id");
	String userId = (String)session.getAttribute("id");
	//String dbId = fdao.chkId(userId);
	FoodingBoardBean bean = fdao.getOneBoard(num);
%>
<%
  if(userId == null){ 
%>
	<script>
		alert("로그인 후 열람가능!");
		location.href="Main02.jsp?section=FoodingBoardList.jsp";
	</script> 

<%	
}else if(userId.equals("admin123")){
%>	
<div id="board">
 <h2><%=bean.getId() %>님의 1:1 답변 내용</h2>
 <form action="BoardUpdatePro.jsp" method="post">
      <table border="1">
          <tr>
          	<td class="title">이름</td>
          	<td colspan="2"><span><%=bean.getName() %></span></td>
          	<td >작성일</td>
          	<td class="td01" colspan="2"><span><%=bean.getReg_date() %></span></td>
          </tr>
          <tr><td class="title">제목</td><td colspan="5">&nbsp;&nbsp;<%=bean.getSubject() %></td></tr>
          <tr><td class="title">문의내용</td><td colspan="5"><textarea class="input01" name="content" cols="160" rows="25"><%=bean.getContent() %></textarea></td></tr>
          <tr>
              <td class="title">이메일</td><td colspan="2"><span><%=bean.getEmail() %></span></td>
              <td >전화번호</td><td class="td01" colspan="2"><span><%=bean.getTel() %></span></td>
          </tr>
          <tr><td class="title">비밀번호</td><td colspan="5"><input class="input01" type="password" name="password"></td></tr>
          <tr>
          	<td colspan="6">
		            <%-- <input type="hidden" name="num" value="<%=bean.getNum() %>"> --%>
	       	 		<input type="hidden" name="id" value="<%=bean.getId() %>">
	       	 		<input type="button" value="답글쓰기" onclick="location.href='Main02.jsp?section=FoodingReWrite.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>'">
	         		<input class="btn01" type="submit" value="수정하기">
	         		<button class="btn01" onclick="javascript: form.action='BoardDeletePro.jsp'">삭제하기</button>
	         		<input type="button" value="목록보기" onclick="location.href='Main02.jsp?section=FoodingBoardList.jsp'">
          	</td>
          </tr>
      </table>
  </form>
</div>  
	
<%
  }else if(bean.getId().equals(userId) || bean.getChkid().equals(userId)){
%>	
<div id="board">
   <h2><%=bean.getId() %>님의 1:1 문의 내용</h2>
   <form action="BoardUpdatePro.jsp" method="post">
        <table border="1">
            <tr>
            	<td class="title">이름</td>
            	<td colspan="2"><span><%=bean.getName() %></span></td>
            	<td >작성일</td>
            	<td class="td01" colspan="2"><span><%=bean.getReg_date() %></span></td>
            </tr>
            <tr><td class="title">제목</td><td colspan="5">&nbsp;&nbsp;<%=bean.getSubject() %></td></tr>
            <tr><td class="title">문의내용</td><td colspan="5"><textarea class="input01" name="content" cols="160" rows="25"><%=bean.getContent() %></textarea></td></tr>
            <tr>
                <td class="title">이메일</td><td colspan="2"><span><%=bean.getEmail() %></span></td>
                <td >전화번호</td><td class="td01" colspan="2"><span><%=bean.getTel() %></span></td>
            </tr>
            <tr><td class="title">비밀번호</td><td colspan="5"><input class="input01" type="password" name="password"></td></tr>
            <tr>
            	<td colspan="6">
		            <input type="hidden" name="num" value="<%=bean.getName() %>">
	       	 		<input type="hidden" name="id" value="<%=bean.getId() %>">
	         		<input class="btn01" type="submit" value="수정하기">
	         		<button class="btn01" onclick="javascript: form.action='BoardDeletePro.jsp'">삭제하기</button>
	         		<input type="button" value="목록보기" onclick="location.href='Main02.jsp?section=FoodingBoardList.jsp'">
            	</td>
            </tr>
        </table>
    </form>
</div> 
<%	
} else if(!bean.getId().equals(userId)){	 
%>
	<script>
		alert("당신의 게시글이 아닙니다.");
		location.href="Main02.jsp?section=FoodingBoardList.jsp";
	</script>  	
<% } %>  
</body>
</html>