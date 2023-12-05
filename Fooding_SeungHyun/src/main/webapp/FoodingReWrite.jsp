<%@page import="fooding.FoodingBean"%>
<%@page import="fooding.FoodingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        *{box-sizing: border-box;}
        #board {width: 1400px; margin: 0 auto;}
        #board h2{margin: 50px 0 25px 0}
        #board table{width: 1400px; border-collapse: collapse;}
        #board table td:first-child, #board table td:nth-child(3){text-align: center; font-weight: bold; width: 200px; background: #fbfbfb;}
        #board table td{height: 45px;}
        #board table td span, #board table td .input01{padding-left: 15px;}
        #board table tr:nth-child(1) input,#board table tr:nth-child(2) input{width: 800px; height: 40px;}
        #board table tr:nth-child(5) input{width: 450px; height: 40px;}
        #board table input[type=button], #board table .btn01{width: 110px; height: 35px; font-size: 16px; font-weight: bold; background-color: #00a7b3; color:white; border-radius: 5px; border:none;}
        #board table input{border: none;}
        #board table textarea{border:none;}
        #board .td01{width: 100px;}
        #board .title{width: 200px;}
        input[type=text]{
           text-align: left;
        }
    </style>
</head>
<body>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    int ref = Integer.parseInt(request.getParameter("ref"));
    int re_step = Integer.parseInt(request.getParameter("re_step"));
    String userId = (String)session.getAttribute("id");
    FoodingDAO fdao = new FoodingDAO();
    FoodingBean fbean = fdao.dbjoin(userId);
%>
<div id="board">
 <h2>답변글 입력하기</h2>
 <form action="BoardRewriteProc.jsp" method="post">
      <table border="1">
          <tr>
          	<td class="title">작성자</td>
          	<td colspan="2"><span><%=fbean.getName()%></span></td>
          </tr>
          <tr><td class="title">제목</td><td colspan="5"><input class="input01" type="text" name="subject" value="[답변]" ></td></tr>
          <tr><td class="title">답글내용</td><td colspan="5"><textarea class="input01" name="content" cols="160" rows="25"></textarea></td></tr>
          <tr>
              <td class="title">이메일</td><td colspan="2"><span><%=fbean.getEmail()%></span></td>
              <td >전화번호</td><td class="td01" colspan="2"><span><%=fbean.getTel()%></span></td>
          </tr>
          <tr><td class="title">비밀번호</td><td colspan="5"><input class="input01" type="password" name="password"></td></tr>
          <tr>
          	<td colspan="6">
		            <input type="hidden" name="num" value="<%=num %>">
	       	 		<input type="hidden" name="ref" value="<%=ref %>">
	       	 		<input type="hidden" name="re_step" value="<%=re_step %>">
	       	 		<input type="hidden" name="id" value="<%=userId %>">
	       	 		<input type="hidden" name="name" value="<%=fbean.getName()%>">
	       	 		<input type="hidden" name="tel" value="<%=fbean.getTel() %>">
	       	 		<input type="hidden" name="email" value="<%=fbean.getEmail() %>">
	       	 		
	       	 		<input class="btn01" type="submit" value="답글쓰기완료">&nbsp;&nbsp;
	         		<input class="btn01" type="reset" value="취소">&nbsp;&nbsp;
	         		<input type="button" value="목록보기" onclick="location.href='Main02.jsp?section=FoodingBoardList.jsp'">
          	</td>
          </tr>
      </table>
  </form>
</div> 
</body>
</html>