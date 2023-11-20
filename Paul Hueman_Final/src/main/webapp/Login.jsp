<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Login.css?ver=10">
<title>로그인</title>
</head>
<body>
    <div id="login">
        <h3>LOGIN</h3>
        <p class="h3bottom">로그인하시면 폴 휴먼의 다양한 혜택을 누리실수 있습니다.</p>
        <form action="LoginProc.do" method="post">
            <input type="text" placeholder="아이디" name="u_id" class="id"><br>
            <input type="password" placeholder="비밀번호" name="u_pw" class="pw"><br>
            <input type="submit" value="로그인"> <input type="button" value="회원 가입" onclick="location.href='Main.jsp?section=Join.jsp'">
            <div class="bottom">
                <p>아이디/비밀번호를 잊어버리셨나요? <span><a href="Main.jsp?section=Lostid.jsp">아이디 찾기</a> / <a href="Main.jsp?section=Lostpw.jsp">비밀번호 찾기</a></span></p>
            </div>
        </form>
    </div>
</body>
</html>