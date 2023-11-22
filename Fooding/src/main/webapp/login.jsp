<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin: 0px auto;}
	#login{width: 800px; height: 650px; margin: 20px auto;}
	#login h1{
		margin: 60px 0 5px 0;
	}
	#login #login01, #login #login02{float: left;}
	#login #login01{
		width: 550px;
		margin-right: 19px;
		border: 1px solid gray;
		padding: 55px 40px;
	}
	#login #login01 h3 { margin-bottom: 10px; }
	#login #login01 table .input{
		width: 325px;
		height: 28px;
		margin-bottom: 10px;
		padding-left: 5px;
	}
	#login #login01 table{ margin-left: -3px; }
	#login #login01 table .in{
		margin-right: 10px;
	}
	#login #login01 table .pw{
		background: #f6f6f6;
		border: 1px solid gray;
	}
	#login #login01 table .btn01{
		margin-top: -10px;
		width: 120px; 
		height: 80px;
		background: #00a7b3;
		color: white;
		font-weight: bold;
		border: none;
	}
	#login hr{
		margin: 30px 0 20px 0;
	}
	#login #join, #login .find{
		width: 148px;
		height: 40px;
	}
	#login #join{
		background: #4c4c4c;
		color: white;
		font-weight: bold;
		border: none;
	}
	#login .find{
		background: white;
		color: #4c4c4c;
		font-weight: bold;
		border: 1px solid #4c4c4c;
	}
	#login #nouser{
		margin-top: 50px;
	}
	#login p{
		font-size: 0.8em;
		margin-bottom: 20px;
	}
	#login #login02{
		width: 230px;
	}
	
</style>
</head>
<body>
<div id="login">
<h1>로그인</h1>
<div id="login01">
	<h3>회원 로그인</h3>
	<form action="loginPro.jsp" method="post">
	<table>
		<tr>
			<td><input class="input in" type="text" name="id" placeholder="아이디"></td>
			<td rowspan="2"><input class="btn01" type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td><input class="input in pw" type="password" name="pw" placeholder="비밀번호"></td>
		</tr>
	</table>
	</form>
	<hr>
	<button id="join" onclick="location.href='Main02.jsp?section=FoodingJoinForm.jsp'">회원가입</button>&nbsp;
	<button class="find">아이디 찾기</button>&nbsp;
	<button class="find">비밀번호 찾기</button>
	<h3 id="nouser">비회원 주문조회 하기</h3>
	<table>
		<tr>
			<td><input class="input in" type="text" name="ordername" placeholder="주문자명"></td>
			<td rowspan="2"><input class="btn01" type="submit" value="확인"></td>
		</tr>
		<tr>
			<td><input class="input in pw" type="text" name="ordernum" placeholder="주문번호"></td>
		</tr>
	</table>
	<p>! 주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
</div>
<div id="login02">
	<img src="img/cupon1.JPG">
	<img src="img/cupon2.JPG">
</div>
</div>
</body>
</html>