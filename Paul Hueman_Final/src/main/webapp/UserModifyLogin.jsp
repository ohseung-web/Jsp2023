<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/UserModifyLogin.css?ver=1">
<title>로그인</title>
</head>
<body>
    <div id="login">
        <h3>CONFIRM PASSWORD</h3>
        <p class="h3bottom">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인합니다.</p>
        <form action="UserModifyLogin.do" method="post">
            <input type="text" value="${paul_login }" name="u_id" class="id"><br>
            <input type="password" placeholder="비밀번호" name="u_pw" class="pw"><br>
            <input type="submit" value="확인">
        </form>
    </div>
</body>
</html>