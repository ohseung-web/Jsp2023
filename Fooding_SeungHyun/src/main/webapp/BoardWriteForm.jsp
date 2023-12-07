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
        #board {width: 1400px; margin:0 auto;}
        #board h2{margin: 50px 0 25px 0}
        #board table{width: 1400px; border-collapse: collapse;}
        #board table td:first-child, #board table td:nth-child(3){text-align: center; font-weight: bold; width: 200px; background: #fbfbfb;}
        #board table td{height: 45px;}
        #board table td span, #board table td .input01{padding-left: 15px;}
        #board table tr:nth-child(1) input, #board table tr:nth-child(2) input, #board table tr:nth-child(6) input{width: 1000px; height: 40px;}
        #board table tr:nth-child(5) input{width: 450px; height: 40px;}
        #board table input[type=submit]{width: 100px; height: 40px; font-size: 18px; font-weight: bold; background-color: #00a7b3; color:white; border-radius: 5px;}
        #board table input{border: none;}
        #board table tr:last-child td{border-bottom: none; height: 100px;}
        #board table textarea{border:none;}
    </style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	FoodingDAO fdao = new FoodingDAO();
	
	String id = (String)session.getAttribute("id");
	String sectionid = (String)session.getAttribute("id");
	
	//FoodingVO fvo = fdao.dbJoin(id);
%>
<%
if(sectionid==null || !sectionid.equals(id)){
%>
	<script>
		alert("로그인 후 작성가능!");
		location.href="main.jsp?section=BoardList.jsp";
	</script> 
<% 								
}else if(sectionid.equals(id)){
%> 
<div id="board">
   <h2>1:1 문의 등록하기</h2>
    <form action="BoardWritePro.jsp" method="post">
        <table border="1">
            <tr><td>이름</td><td colspan="4"><span></span></td></tr>
            <tr><td>제목</td><td colspan="4"><input class="input01" type="text" name="subject"></td></tr>
            <tr><td>문의내용</td><td colspan="4"><textarea class="input01" name="content" cols="160" rows="18"></textarea></td></tr>
            <tr><td>첨부파일</td><td colspan="4"><input class="input01" type="file"></td></tr>
            <tr>
                <td>이메일</td><td><span></span></td>
                <td>전화번호</td><td><span></span></td>
            </tr>
            <tr><td>비밀번호</td><td colspan="3"><input class="input01" type="password" name="b_password"></td></tr>
            <tr><td colspan="4"><input type="submit" value="완료">
            <input type="hidden" value="" name="id"></td></tr>
        </table>
    </form>
</div>
<% 								
}
%> 
</body>
</html>