<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LivingnTree</title>
<style>
.findPwqContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.findPwqContainer .contents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0 150px;
}
.title{
    margin: 45px 0 40px;
    text-align: center;
}
.title h2{
	font-weight: 700;
    font-size: 32px;
    color: #1f1f1f;
}
.memberArea{
    width: 898px;
    margin: 0 auto;
}
.memberArea .typeMember{
    margin-top: 20px;
    padding: 74px 0;
    border: 1px solid #e5e5e5;
}
.memberArea .typeMember ul{
    overflow: hidden;
    width: 421px;
	margin: 0 auto;
    text-align: left;
}
.memberArea .typeMember ul li .term{
    display: block;
    width: 100%;
    margin-top: 2px;
    padding-right: 4px;
    line-height: 22px;
    font-size: 13px;
    font-weight: 400;
}
.memberArea .typeMember ul li .desc{
    width: 100%;
    margin: 5px 0 20px;
}
input[type="text"]{
    width: 100%;
    height: 40px;
    appearance: none;
    line-height: 40px;
    padding: 2px 4px 2px 15px;
    border: 1px solid #e0e0e0;
    color: #000;
    font-size: 13px;
    outline: 1px;
}
input[type="text"]:focus, input[type="text"]:hover{
    border-color: #000;
    transition: 0.3s;
}
.btnBox input{
    display: inline-block;
    width: 100%;
    height: 50px;
    line-height: 50px;
    font-size: 14px;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    cursor: pointer;
}
.btnBox .submitBtn{
    border: 1px solid transparent;
    background-color: #d0ac88;
    color: #fff;
    font-weight: 700;
}
</style>
</head>
<body>
	<div class="findPwqContainer">
        <div class="contents">
            <div class="title">
                <h2>비밀번호 찾기</h2>
            </div>
            <form action="MemberFindPwqProc.do" name="formname" method="post">
            	<input name="id" value="${mdto.m_id}" type="hidden">
            	<input name="pw" value="${mdto.m_pw}" type="hidden">
            	<input name="pwq" value="${mdto.m_pwq}" type="hidden">
            	<input name="pwa" value="${mdto.m_pwa}" type="hidden">
            	<input name="name" value="${mdto.m_name}" type="hidden">
            	<input name="postcode" value="${mdto.m_postcode}" type="hidden">
            	<input name="defaultaddr" value="${mdto.m_defaultaddr}" type="hidden">
            	<input name="detailaddr" value="${mdto.m_detailaddr}" type="hidden">
            	<input name="phone" value="${mdto.m_phone}" type="hidden">
            	<input name="email" value="${mdto.m_email}" type="hidden">
                <div class="memberArea">
                    <div class="typeMember">
                        <ul>
                        	<li class="id">
                                <strong class="term">질문</strong>
                                <div class="desc">${mdto.m_pwq}</div>
                            </li>
                            <li class="name">
                                <strong class="term">답변</strong>
                                <div class="desc">
                                    <input id="inputPwa" name="inputPwa" type="text">
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btnBox">
                        <input type="button" class="submitBtn" onclick="checkFindPwq()" value="확인">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
    	console.log("${mdto.m_id}");
    
        function checkFindPwq(){
            let formname = document.formname;

            let pwa = document.getElementById('inputPwa');
            if(inputPwa.value === ""){
			    alert('답변 항목은 필수 입력값입니다.');
			    return;
		    }

            formname.submit();
        }
    </script>
</body>
</html>