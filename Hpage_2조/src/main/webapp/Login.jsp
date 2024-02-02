<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
        #login_wrap{width: 1400px; margin: 0 auto;}
        #login_wrap table{width: 380px; margin: 100px auto; text-align: center;}
        #login_wrap table tr:first-child td{text-align: left; padding: 20px 0; font-size: 1.2em;}
        #login_wrap table td{font-size: 0.9em; padding: 5px 0;}
        #login_wrap table input{width: 370px; height: 40px; border: 1px solid #acacac;}
        #login_wrap table a{color: #ff7a00; text-decoration: none;}
        #login_wrap table .login input[type=button]{width: 230px; height: 50px; border: 2px solid black; color: black; background: white; cursor: pointer;margin-top: 20px; margin-bottom: 0px;}
        #login_wrap table .login input[type=button]:hover { background: black; color: white; }
        #login_wrap table input[type=button]{width: 230px; height: 50px; border: 2px solid gray; color: gray; background: white; cursor: pointer;}
        #login_wrap table input[type=button]:hover { background: gray; color: white; }
        #login_wrap table tr:nth-child(3) td,#login_wrap table tr:nth-child(5) td{text-align: left;}
		#login_wrap table input{outline: none;}
        #login_wrap table a{outline: none;}
    </style>
</head>
<body>
	<div id="login_wrap">
		<form action="Login.do" method="post">
			<table>
                <tr><td colspan="2">로그인</td><tr>
				<tr><td colspan="2">아이디</td></tr>
				<tr><td colspan="2"><input type="text" name="id"></td></tr>
				<tr><td colspan="2">비밀번호</td></tr>
				<tr><td colspan="2"><input type="password" name="pw"></td></tr>
				<tr>
					<td><a href="MainList.do?section=FindId.jsp">아이디를 잊으셨나요?</a></td>
					<td><a href="MainList.do?section=FindPw.jsp">비밀번호를 잊으셨나요?</a></td>
				</tr>
				<tr><td colspan="2" class="login"><input type="button" value="로그인하기" onclick="check(this.form)"></td></tr>
				<tr><td colspan="2"><input type="button"  value="회원 가입하기" onclick="location.href='MainList.do?section=Join.jsp'"></td></tr>			
			</table>		
		</form>
	</div>
	<script>
        function check(f){

        	var id = document.getElementsByName("id")[0].value;
         	var pw = document.getElementsByName("pw")[0].value;

         	if(id==""){
            	alert("아이디를 입력해주세요");
            	return;
            }else if(pw==""){
            	alert("비밀번호를 입력해주세요");
            	return;
            }else{
            	f.submit();  
            }
        }
        
    </script>
</body>
</html>