<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="css/UserModify.css?ver=15541">
<title>회원정보 수정</title>
</head>
<body>
    <div id="join">
        <h3>회원정보 수정</h3>
        <div class="tabletop">
            <p class="left">회원정보 입력</p>
            <p class="right"><font>*</font> 필수 입력사항입니다</p>
        </div>
        <form action="UserModifyProc.do" method="post" name="formname">
            <table>
                <tr><td><font>*</font> 아이디</td><td><input type="text" value="${paul_login }" readonly class="id" name="u_id"></td></tr>
                <tr><td><font>*</font> 변경할 비밀번호</td><td><input type="password" name="u_pw" class="pw" required></td></tr>
                <tr><td><font>*</font> 비밀번호 확인</td><td><input type="password" name="u_pwchk" class="pwchk" required></td></tr>
                <tr><td><font>*</font> 이름</td><td><input type="text" value="${u_name }" readonly class="name" required></td></tr>
                <tr><td><font>*</font> 이메일</td><td><input type="email" name="u_email" class="email" value="${u_email }" required></td></tr>
                <tr><td><font>*</font> 휴대폰번호</td><td>
	                	<input type="tel" name="tel1" class="tel" maxlength="3" value="${tel1 }"> -
	                	<input type="tel" name="tel2" class="tel" maxlength="4" value="${tel2 }"> -
	                	<input type="tel" name="tel3" class="tel" maxlength="4" value="${tel3 }">
				</td></tr>
                <tr><td><font>*</font> 비밀번호 찾기 질문/답변</td><td>
                    <select name="u_question" class="question">
                        <option value="${u_question }">${u_question }</option>
                        <option value="아버지 성함은?">아버지 성함은?</option>
                        <option value="어머니 성함은?">어머니 성함은?</option>
                        <option value="가장 좋아하는 색깔은?">가장 좋아하는 색깔은?</option>
                        <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
                        <option value="기억에 남는 장소는?">기억에 남는 장소는?</option>
                        <option value="존경하는 인물은?">존경하는 인물은?</option>
                    </select>
                </td></tr>
                <tr><td></td><td><input type="text" name="u_answer" class="answer" value="${u_answer }" required></td></tr>
                <tr><td><font>*</font> 우편번호</td><td>
	                	<input type="text" name="u_zipcode" class="zipcode" id="zipcode" value="${u_zipcode }"> &nbsp;
	                	<input type="button" class="zipcodebtn" onclick="DaumPostcode()" value="우편번호찾기">
	                </td></tr>
	                <tr>
	                	<td><font>*</font> 주소</td>
	                	<td>
	                		<input type="text" name="u_roadAddr" class="roadAddr" id="roadAddr" value="${u_roadAddr }"><br>
	                		<input type="text" name="u_detailAddr" class="detailAddr" id="detailAddr" value="${u_detailAddr }"><br>
	                		<input type="text" name="u_extraAddr" class="extraAddr" id="extraAddr" value="${u_extraAddr }" readonly>
	                	</td>
	                </tr>
	            </table>
            <div class="btn-wrap">
            	<input value="회원수정" type="button" class="modify" onclick="inputcheck()">
            	<input value="회원탈퇴" class="leaveuser" type="button" onclick="location.href='LeaveUser.do'">
            </div>
        </form>
    </div>
    <script src="js/Join.js"></script>
</body>
</html>