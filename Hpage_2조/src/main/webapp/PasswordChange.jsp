<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#pwchange_wrap {width: 510px; margin: 0 auto;}
	#pwchange_wrap .pwchangeinput p { font-size: 14px; margin: 15px 0; }
    #pwchange_wrap .pwchangeinput input { width: 500px; height: 40px; border: 1px solid #ccc; outline: none; }
    #pwchange_wrap .pwchangebtn { width: 500px; text-align: center; margin: 30px 0; }
    #pwchange_wrap .pwchangebtn input { width: 150px; height: 50px; border: 2px solid black; color: black; background: white; font-size: 14px; cursor: pointer; outline: none; }
    #pwchange_wrap .pwchangebtn input:hover { background: black; color: white; }
</style>
</head>
<body>
	<div id="pwchange_wrap">
        <form action="PasswordChange.do" method="post">
        	<p>비밀번호 변경</p>
        	<div class="pwchangeinput">
            	<p>현재 비밀번호</p>
                <input type="password" name="password">
                <p>새 비밀번호</p>
                <input type="password" name="newpassword" placeholder="비밀번호는 숫자만 입력가능합니다">
                <p>새 비밀번호 확인</p>
                <input type="password" name="newrepassword">
            </div>
            <div class="pwchangebtn">
                <input type="submit" value="변경하기">
            </div>
        </form>
    </div>
</body>
</html>