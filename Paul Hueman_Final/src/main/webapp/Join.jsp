<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="css/Join.css?ver=20">
<title>회원가입</title>
</head>
<body>
    <div id="join">
        <h3>JOIN</h3>
        <p class="h3bottom">회원가입하시면 폴 휴먼의 다양한 혜택을 누리실수 있습니다.</p>
        <div class="tabletop">
            <p class="left">회원정보 입력</p>
            <p class="right"><font>*</font> 필수 입력사항입니다</p>
		</div>
			<form action="JoinProc.do" method="post" name="formname" >
	            <table>
	                <tr><td><font>*</font> 아이디</td><td><input type="text" name="u_id" class="id" value="${u_id}"> <input type="button" value="아이디 중복 확인" onclick="idOK()" class="idbtn"></td></tr>
	                <tr><td><font>*</font> 비밀번호</td><td><input type="password" name="u_pw" class="pw"></td></tr>
	                <tr><td><font>*</font> 비밀번호 확인</td><td><input type="password" name="u_pwchk" class="pwchk"></td></tr>
	                <tr><td><font>*</font> 이름</td><td><input type="text" name="u_name" class="name"></td></tr>
	                <tr><td><font>*</font> 이메일</td><td><input type="email" name="u_email" class="email"></td></tr>
	                <tr><td><font>*</font> 휴대폰번호</td><td>
	                	<input type="tel" name="tel1" class="tel" maxlength="3"> -
	                	<input type="tel" name="tel2" class="tel" maxlength="4"> -
	                	<input type="tel" name="tel3" class="tel" maxlength="4">
	                </td></tr>
	                <tr><td><font>*</font> 비밀번호 찾기 질문/답변</td><td>
	                    <select name="u_question" class="question">
	                        <option value="">질문을 선택해주세요</option>
	                        <option value="아버지 성함은?">아버지 성함은?</option>
	                        <option value="어머니 성함은?">어머니 성함은?</option>
	                        <option value="가장 좋아하는 색깔은?">가장 좋아하는 색깔은?</option>
	                        <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
	                        <option value="기억에 남는 장소는?">기억에 남는 장소는?</option>
	                        <option value="존경하는 인물은?">존경하는 인물은?</option>
	                    </select>
	                </td></tr>
	                <tr><td></td><td><input type="text" name="u_answer" class="answer" placeholder="질문에 대한 답변을 입력하세요."></td></tr>
	                <tr><td><font>*</font> 우편번호</td><td>
	                	<input type="text" name="u_zipcode" class="zipcode" id="zipcode"> &nbsp;
	                	<input type="button" class="zipcodebtn" onclick="DaumPostcode()" value="우편번호찾기">
	                </td></tr>
	                <tr>
	                	<td><font>*</font> 주소</td>
	                	<td>
	                		<input type="text" name="u_roadAddr" class="roadAddr" id="roadAddr"><br>
	                		<input type="text" name="u_detailAddr" class="detailAddr" id="detailAddr"><br>
	                		<input type="text" name="u_extraAddr" class="extraAddr" id="extraAddr" readonly>
	                	</td>
	                </tr>
	            </table>
	            <div class="submit"><input value="회원가입" type="button" class="submitbtn" onclick="inputcheck()"></div>
	        </form>
	    </div>
<script src="js/Join.js"></script>
<c:if test="${null != inputnull}">
	<script>
		alert("${inputnull}");
	</script>
</c:if>
<c:if test="${null != notjoin}">
	<script>
		alert("${notjoin}");
		document.getElementsByClassName("id")[0].style.border="1px solid red";
	</script>
</c:if>
<c:if test="${null != okjoin}">
	<script>
		alert("${okjoin}");
		document.getElementsByClassName("id")[0].value = "${u_id}";
		document.getElementsByClassName("id")[0].style.border="none";
		document.getElementsByClassName("id")[0].readOnly = true;
		document.getElementsByClassName("idbtn")[0].style.display="none";
	</script>
</c:if>
</body>
</html>