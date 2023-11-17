<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body { display: flex; justify-content: center; }
	.wrap { margin: 0 auto; }
	.wrapbox {
		width: 600px; height: 660px;
		border: 1px solid #C9C9C9; border-top: 2px solid #00A7B3;
	}
	.h1 { width: 100%; height: auto; margin: 30px 0; text-align: center; }
	.h1 span { color: #00A7B3; }
	.ptext { font-size: 18px; color: #878787; letter-spacing: -1px; margin: 20px 0; text-align: center;}
	.box { width: 410px; height: auto; }
	.boxp {
		text-align: left; font-size: 20px;
		font-weight: bold; margin: 0; color: #00A7B3;
	}
	.btn { text-align: center; }
	input {
		width: 390px; height: 45px;
		margin: 10px 0; padding-left: 10px;
		border: 1px solid #919191; background: #F6F6F6;
	}
	input[type=reset], input[type=submit] {
		width: 100px; height: 45px;
		margin: 10px 5px; font-size: 14px;
		font-weight: bold;
	}
	input[type=reset] { background: white; color: #35A9B1; border: 1px solid #35A9B1; }
	input[type=submit] { background: #35A9B1; color: white; border: none; }
	input[type=reset]:hover { cursor: pointer; color: #00929C; border-color: #00929C; }
	input[type=submit]:hover { background: #00929C; cursor: pointer; }
	#pwtext { font-size: 13px; }
	#pwtext span { color: red; }
	.box{
	   margin: 0 auto;
	}
</style>
</head>
<body>
   <div class="wrap">
		<h1 class="h1"><span>푸딩팩토리</span> 정보입력</h1>
		<div class="wrapbox">
			<p class="ptext">지금 회원가입하신 후 푸딩팩토리의 다양한 식자재 메뉴를 만나보세요.</p>
			<form action="FoodingjoinProc.jsp" method="post">
				<div class="box">
					<p class="boxp">필수항목</p>
					<input type="text" name="name" placeholder="이름"><br>
					<input type="text" name="id" placeholder="아이디"><br>
					<input id="passwd" type="password" name="password" placeholder="비밀번호"><br>
					<input id="repasswd" type="password" name="repassword" placeholder="비밀번호확인"><br><div id="pwtext"></div>
					<input type="text" name="phone" placeholder="휴대전화번호"><br>
					<input type="email" name="email" placeholder="이메일"><br>
					<input type="text" name="address" placeholder="주소"><br>
				</div>
				<div class="btn">
					<input type="reset" value="취소" onclick="location.href='main.jsp'">
					<input type="submit" value="회원가입">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var pwtext = document.querySelector("#pwtext");
		var box = document.querySelector(".box");
		
		box.addEventListener("focusout", function() {
			var passwd = document.querySelector("#passwd");
			var repasswd = document.querySelector("#repasswd");
			
			if(passwd.value == "" && repasswd.value == "") {
				pwtext.innerHTML = "<span>비밀번호를 입력해주세요.</span>";
			}else if(passwd.value == "" || repasswd.value == "") {
				pwtext.innerHTML = "<span>비밀번호를 입력해주세요.</span>";
			}else if(passwd.value == repasswd.value) {
				pwtext.innerHTML = "비밀번호가 일치합니다.";
			}else {
				pwtext.innerHTML = "<span>비밀번호가 일치하지 않습니다.</span>";
			}
		});
	</script>
</body>
</html>