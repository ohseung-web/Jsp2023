<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Lostpw.css?ver=20">
<title>Paul Hueman</title>
</head>
<body>
    <div id="lost">
        <h3>LOST PASSWORD</h3>
        <p class="h3bottom">회원님의 비밀번호를 찾기 위해서 회원가입시 선택했던 질문과 답변을 입력해주세요.</p>
        <form action="FindpwProc.do" method="post">
            <input type="text" name="u_id" class="id" placeholder="아이디"><br>
            <select name="u_question" class="question">
                        <option value="">질문을 선택해주세요</option>
                <option value="아버지 성함은?">아버지 성함은?</option>
                <option value="어머니 성함은?">어머니 성함은?</option>
                <option value="가장 좋아하는 색깔은?">가장 좋아하는 색깔은?</option>
                <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
                <option value="기억에 남는 장소는?">기억에 남는 장소는?</option>
                <option value="존경하는 인물은?">존경하는 인물은?</option>
            </select>
            <input type="text" name="u_answer" class="answer" placeholder="질문에 대한 답변을 입력하세요.">
            <input type="submit" value="확인">
        </form>
    </div>
</body>
</html>