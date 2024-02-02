<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#withdraw_wrap { width: 500px; margin: 70px auto; }
	#withdraw_wrap .withdrawp { margin-left: 50px; }
	#withdraw_wrap .withdrawinput { width: 400px; margin: 0 auto; text-align: center; }
	#withdraw_wrap .withdrawinput p:nth-child(1) { font-size: 14px; margin: 15px 0; text-align: left; }
    #withdraw_wrap .withdrawinput input { width: 400px; height: 40px; border: 1px solid #ccc; outline: none; }
    #withdraw_wrap .withdrawbtn { width: 400px; text-align: center; margin: 30px auto; }
    #withdraw_wrap .withdrawbtn input { width: 150px; height: 50px; border: 2px solid black; color: black; background: white; font-size: 14px; cursor: pointer; outline: none; }
    #withdraw_wrap .withdrawbtn input:hover { background: black; color: white; }
</style>
</head>
<body>
	<div id="withdraw_wrap">
        <form action="Withdraw.do" method="post">
        	<p class="withdrawp">회원탈퇴</p>
        	<div class="withdrawinput">
            	<p>비밀번호</p>
                <input type="password" name="password">
                <p><small>탈퇴가 완료된 계정은 다시 복구할 수 없습니다.</small></p>
                <p><small>탈퇴하시겠습니까?</small></p>
            </div>
            <div class="withdrawbtn">
                <input type="submit" value="탈퇴하기">
            </div>
        </form>
    </div>
</body>
</html>