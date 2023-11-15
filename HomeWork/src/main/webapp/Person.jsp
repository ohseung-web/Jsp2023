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
     form{
        line-height: 2.5em;
     }
	label {
		width: 100px;
		height: 30px;
		display: inline-block;
	}
	input[type=text]{
	   width: 200px;
	   height: 25px;
	}
	input[type=button]{
	   width: 100px;
	   height: 30px;
	   cursor: pointer;
	}
	input[type=radio]{
	  width: 15px;
	  height: 15px;
	}

</style>
</head>
<body>

    <form id="myForm" method="post">
		<label for="lbl_name">이름</label>
		<input type="text" name="name" id="lbl_name" /><br/>
		<label for="lbl_age">나이</label>
		<input type="text" name="age" id="lbl_age" /><br/>
		<label for="lbl_height">키</label>
		<input type="text" name="height" id="lbl_height" /><br/>
		<label><input type="radio" name="gender" value="남" />남</label>
		<label><input type="radio" name="gender" value="여" />여</label><br/>
		<input type="button" value="전송하기1" onclick="fn_send1(this.form)" />
		<input type="button" value="전송하기2" onclick="fn_send2(this.form)" />
	</form>

    <script type="text/javascript">
	function fn_send1(f) {
		f.action = 'PersonMan.jsp';
		f.submit();
	}
	function fn_send2(f) {
		f.action = 'PersonWoman.jsp';
		f.submit();
	}
  </script>

</body>
</html>