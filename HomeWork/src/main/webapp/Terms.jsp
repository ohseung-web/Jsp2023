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
  label{
     display:inline-block;
     width: 70px;
     height: 30px;
  }
  input{
    width: 200px;
    height: 25px;
  }
  input[type=submit]{
    width: 80px;
    height: 30px;
    cursor: pointer;
    text-align: center;
    margin: 20px 100px;
  }
  h3{
    text-align: center;
  }

</style>
</head>
<body>
<div class="container">
 <h3>신규 회원 정보를 입력하세요</h3>
	<form method="post" action="TermsProc.jsp">
		<label for="label-id">아이디</label>
		<input type="text" name="id" id="label-id" /><br/>
		<label for="label-pw">비밀번호</label>
		<input type="password" name="pw" id="label-pw" /><br/>
		<label for="label-name">이름</label>
		<input type="text" name="name" id="label-name" /><br/>
		<input type="submit" value="회원가입" />
	</form>
</div>
</body>
</html>