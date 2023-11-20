<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Lostid.css?ver=20">
<title>Paul Hueman</title>
</head>
<body>
    <div id="lost">
        <h3>LOST ID</h3>
        <p class="h3bottom">회원님의 아이디를 찾기 위해서 회원가입시 작성했던 휴대폰번호와 이메일을 입력해주세요.</p>
        <form action="FindidProc.do" method="post">
            <input type="tel" name="u_tel" class="tel" placeholder="휴대폰번호 (010-xxxx-xxxx)"><br>
            <input type="email" name="u_email" class="email" placeholder="이메일"><br>
            <input type="submit" value="확인">
        </form>
    </div>
</body>
</html>