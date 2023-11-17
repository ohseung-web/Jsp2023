<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>
	
	<jsp:useBean id="foodingVO" class="fooding.FoodingVO">
		<jsp:setProperty name="foodingVO" property="*" />
	</jsp:useBean>
	
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		if(name.equals("")) {
	%>
			<script type="text/javascript">
				alert("이름을 입력하세요");
				history.back();
			</script>
	<%
		}else if(id.equals("")) {
	%>
			<script type="text/javascript">
				alert("아이디를 입력하세요");
				history.back();
			</script>
	<%
		}else if(password.equals("")) {
	%>
			<script type="text/javascript">
				alert("비밀번호를 입력하세요");
				history.back();
			</script>
	<%
		}else if(phone.equals("")) {
	%>
			<script type="text/javascript">
				alert("전화번호를 입력하세요");
				history.back();
			</script>
	<%
		}else if(email.equals("")) {
	%>
			<script type="text/javascript">
				alert("이메일을 입력하세요");
				history.back();
			</script>
	<%
		}else if(address.equals("")) {
	%>
			<script type="text/javascript">
				alert("주소를 입력하세요");
				history.back();
			</script>
	<%
		}else {
		
			/* FoodingDAO fdao = new FoodingDAO();
			fdao.insertJoin(foodingVO); */
			
	%>
			<script type="text/javascript">
				alert("회원가입이 완료되었습니다.");
				location.href="main.jsp";
			</script>
	<%
		}
	%>

</body>
</html>