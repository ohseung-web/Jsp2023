<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<style>
.findIdContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.findIdContainer .contents{
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
    width: 400px;
    margin: 0 auto;
}
.memberArea .findType{
    margin-top: 20px;
}
.memberArea .findType ul{
    overflow: hidden;
    text-align: left;
}
.memberArea .findType ul li.hidden{
    display: none;
}
.memberArea .findType ul li .term{
    display: block;
    width: 100%;
    margin-top: 2px;
    padding-right: 4px;
    line-height: 22px;
    font-size: 13px;
    font-weight: 400;
}
.memberArea .findType ul li .desc{
    width: 100%;
    margin: 5px 0 20px;
}
.memberArea .findType ul li .desc .check{
    margin-top: 10px;
}
.memberArea .findType ul li .desc .code{
    display: flex;
    align-items: center;
    margin: 0 -9px;
}
.memberArea .findType ul li .desc .code input[type="text"]{
    width: 30%;
    margin: 0 9px;
}
input[type="radio"]{
    position: relative;
    opacity: 1;
    width: 18px;
    height: 18px;
    appearance: none;
    background: url("img/icon/bg_radio.png") no-repeat 0 0;
    background-size: 18px 18px;
    vertical-align: middle;
    cursor: pointer;
}
input[type="radio"]:checked{
    background-image: url("img/icon/bg_radio_checked.png");
    transition: 0.2s ease-out;
}
input[type="radio"] + label{
    margin: 0 15px 0 10px;
    vertical-align: middle;
    font-size: 13px;
    /* cursor: default; */
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
.btnBox{
    margin-top: 12px;
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
	<div class="findIdContainer">
        <div class="contents">
            <div class="title">
                <h2>아이디 찾기</h2>
            </div>
            <form action="MemberFindIdProc.do" name="formname" method="post">
                <div class="memberArea">
                    <div class="findType">
                        <ul>
                            <li class="type">
                                <div class="desc">
                                    <div class="check">
                                        <input id="check_method1" name="check_method" value="email" type="radio" checked="checked">
                                        <label for="check_method1">이메일</label>
                                        <input id="check_method2" name="check_method" value="phone" type="radio">
                                        <label for="check_method2">휴대폰번호</label>
                                    </div>
                                </div>
                            </li>
                            <li class="name">
                                <strong class="term">이름</strong>
                                <div class="desc">
                                    <input id="name" name="name" type="text">
                                </div>
                            </li>
                            <li class="email">
                                <strong class="term">이메일로 찾기</strong>
                                <div class="desc">
                                    <input id="email" name="email" type="text">
                                </div>
                            </li>
                            <li class="phone hidden">
                                <strong class="term">휴대폰 번호로 찾기</strong>
                                <div class="desc">
                                    <span class="code">
                                        <input id="phone1" name="phone1" maxlength="3" type="text">-
                                        <input id="phone2" name="phone2" maxlength="4" type="text">-
                                        <input id="phone3" name="phone3" maxlength="4" type="text">
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btnBox">
                        <input type="button" class="submitBtn" onclick="checkFindId()" value="확인">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
    	let check_method1 = document.querySelector("#check_method1");
        let check_method2 = document.querySelector("#check_method2");
        let emailDiv = document.querySelector(".memberArea .findType ul .email");
        let phoneDiv = document.querySelector(".memberArea .findType ul .phone");

        check_method1.addEventListener("change", () =>{
            emailDiv.classList.remove('hidden');
            phoneDiv.classList.add('hidden');
        })
        check_method2.addEventListener("change", () =>{
            emailDiv.classList.add('hidden');
            phoneDiv.classList.remove('hidden');
        })

        function checkFindId(){
            let formname = document.formname;

            const regEmail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]+$/;
            const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

            let name = document.getElementById('name');
            if(name.value === ""){
			    alert('이름을 입력해주세요.');
			    return;
		    }

            if(!emailDiv.classList.contains('hidden')){
                let type="email";
                let email = document.getElementById('email');

                if(email.value === ""){
			        alert('이메일을 입력하세요.');
			        return;
		        }
                if(!regEmail.test(email.value)){
			        alert('이메일 항목이 이메일 형식이 아닙니다.');
			        return;
		        }
            }else{
                let phone1 = document.getElementById('phone1');
                let phone2 = document.getElementById('phone2');
                let phone3 = document.getElementById('phone3');
    	        let phone = phone1.value+"-"+phone2.value+"-"+phone3.value;

    	        console.log(phone);
                if(phone2.value === "" || phone3.value === ""){
			        alert('휴대폰 번호를 입력하세요.');
			        return;
		        }
                if(!regPhone.test(phone)){
			        alert('올바른 형식의 휴대전화 번호를 입력해주십시오.');
			        return;
		        }
            }

            formname.submit();
        }
    </script>
</body>
</html>