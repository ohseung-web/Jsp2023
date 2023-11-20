<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin: 0 auto;}
	button:hover, input[type=button]:hover, input[type=submit]:hover{cursor: pointer;}
	button:focus, input[type=button]:focus, input[type=submit]:focus{outline: none;}
	header{
		width: 1400px;
		height: 110px;
		margin: 0 auto;
		border-bottom: 1px solid #cecece;
	}
	header #img{
		text-align: center;
		margin-bottom: 10px;
	}
	header #nav ul li{
		list-style: none;
		float: left;
	}
	header #nav ul li a{
		color: black;
		text-decoration: none;
	}
	header #nav01 ul li{
		margin-right: 70px;
		font-wieght: bold;
		font-size: 1.1em;
	}
	header #nav02 ul{ float:right; margin-right: 35px;}
	header #nav02 ul li{
		margin-left: 50px;
		font-wieght: bold;
		font-size: 1.1em;
	}
</style>
</head>
<body>
   <%
	request.setCharacterEncoding("UTF-8");

	String logout = request.getParameter("logout");
	
	if(logout != null){
		session.setAttribute("id", null);
		session.setMaxInactiveInterval(0);
	}
	
	String id = (String)session.getAttribute("id");
	
%>
<header>
	<div id="img">
		<a href="main.jsp?section=section.jsp"><img src="img/logo.JPG"></a>
	</div>
	<div id="nav">
		<nav id="nav01">
			<ul>
				<li><a href="#">카테고리 전체</a></li>
				<li><a href="main.jsp?section=newgoods.jsp">신상품</a></li>
				<li><a href="main.jsp?section=bestgoods.jsp">베스트</a></li>
				<li><a href="main.jsp?section=sales.jsp">세일</a></li>
				<li><a href="main.jsp?section=brand.jsp">입점브랜드</a></li>
				<li><a href="#">푸딩콕</a></li>
			</ul>
		</nav>
		<nav id="nav02">
			<ul>
<%
			if(id == null){
%>
				<li><a href="main.jsp?section=login.jsp">로그인</a></li>
				<li><a href="main.jsp?section=joinform.jsp">회원가입</a></li>
				<li><a href="main.jsp?section=BoardList.jsp">1:1문의</a></li>
<% 
			}else{
%>	
				<li><a href="#"><%=id %>님 로그인!</a></li>
				<li><a href="main.jsp?logout=1">로그아웃</a></li>
				<li><a href="main.jsp?section=BoardList.jsp">1:1문의</a></li>
<% 
			}
%>
			</ul>
		</nav>
	</div>
</header>
</body>
</html>