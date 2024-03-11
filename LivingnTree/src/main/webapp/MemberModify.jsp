<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LivingnTree</title>
<link rel="stylesheet" href="css/reset.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.modifyContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.modifyContainer .contents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0;
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
    width: 720px;
    margin: 0 auto;
}
.titleArea{
    margin: 50px 0 20px;
    text-align: left;
}
.titleArea h3{
    font-size: 16px;
    font-weight: 500;
    color: #000;
}
.titleArea .required{
    display: block;
    margin: -13px 0 0;
    font-size: 14px;
    color: #1a1a1a;
    text-align: right;
}
.memberArea img{
 	width: 4px;
    height: 4px;
    margin-top: -3.5px;
    margin-right: 12px;
    vertical-align: middle;
}
.tableBox{
    border-top: 2px solid #1a1a1a;
}
table{
    width: 100%;
    border: 0;
    border-collapse: collapse;
}
.tableBox table tr th, .tableBox table tr td{
    height: auto;
}
.tableBox table tr th{
    width: 190px;
    padding: 10px 15px;
    font-size: 14px;
    font-weight: 400;
    color: #1a1a1a;
    border-bottom: 1px solid #e5e5e5;
    background-color: #f6f6f6;
    line-height: 22px;
    vertical-align: middle;
}
.tableBox table tr th img{
    display: inline-block;
    width: 4px;
    height: 4px;
    vertical-align: middle;
}
.tableBox table tr td{
    width: auto;
    padding: 10px 20px;
    font-size: 14px;
    font-weight: 400;
    color: #1a1a1a;
    border-bottom: 1px solid #e5e5e5;
    line-height: 22px;
    vertical-align: middle;
}
.tableBox table tr td input[type="text"], .tableBox table tr td input[type="password"]{
    width: 410px;
    height: 40px;
    line-height: 40px;
    padding: 2px 4px 2px 15px;
    border: 1px solid #e0e0e0;
    color: #000;
    font-size: 13px;
    outline: 1px;
}
.tableBox table tr td input[type="text"]:focus, .tableBox table tr td input[type="password"]:focus,
.tableBox table tr td input[type="text"]:hover, .tableBox table tr td input[type="password"]:hover{
    border-color: #000;
    transition: 0.3s;
}
.txtInfo{
    color: #868686;
    font-size: 12px;
    line-height: 22px;
}
p.txtInfo{
    margin-top: 10px;
}
.txtSuccess{
    color: #0985df;
}
.tableBox table .error{
    color: #ec2a1d;
}
.tableBox table #pwq, .tableBox table #pwa{
    width: 450px;
}
#pwq, #phone1{
    max-width: 100%;
    height: 40px;
    padding: 0 30px 0 15px;
    font-size: 13px;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    background: url(img/icon/ico_select.png);
    background-repeat: no-repeat;
    background-position: right 10px center;
    /* background: #fff url(img/icon/ico_select.png) no-repeat right 10px center; */
    background-size: 14px 8px;
    appearance:none;
}
.tableBox table .formMultiple{
    padding-top: 22px;
    padding-bottom: 22px;
}
.tableBox table .formMultiple div{
    margin-bottom: 10px;
}
.tableBox table .formMultiple div:last-child{
    margin-bottom: 0;
}
.tableBox table .formMultiple .postcode_wrap input[type="text"]{
    width: 160px;
}
input[type="text"][readonly]{
    background: #f9f9f9;
}
.tableBox table .btnBasic{
    display: inline-block;
    margin-left: 10px;
    padding: 12px 20px;
    height: 40px;
    font-size: 13px;
    box-sizing: border-box;
    border: 1px solid #bcbcbc;
    line-height: 1;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #000;
    background-color: #fff;
}
.tableBox table #phone1, .tableBox table #phone2, .tableBox table #phone3{
    width: 110px;
    margin: 0 14px;
}
.tableBox table #phone1{
    margin-left: 0;
}
.btnBox{
    display: flex;
    margin-top: 40px;
}
.btnBox input{
    display: inline-block;
    width: 355px;
    height: 56px;
    line-height: 56px;
    font-size: 16px;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    cursor: pointer;
}
.btnBox .normalBtn{
    border: 1px solid #d0ac88;
    background-color: #fff;
    color: #d0ac88;
}
.btnBox .submitBtn{
    margin-left: 10px;
    border: 1px solid transparent;
    background-color: #d0ac88;
    color: #fff;
    font-weight: 700;
}
</style>
</head>
<body>
	<c:choose>
		<%-- <c:when test="${msg != null and msg eq '0'}">
			<script type="text/javascript">
				alert("이미 존재하는 아이디입니다.");
			</script>
		</c:when> --%>
		<c:when test="${msg != null and msg eq '1'}">
			<script type="text/javascript">
				alert("회원정보 수정이 완료되었습니다.");
			</script>
		</c:when>
	</c:choose>

    <div class="modifyContainer">
        <div class="contents">
            <div class="title">
                <h2>회원 정보 수정</h2>
            </div>
            <form action="MemberModifyProc.do" name="formname" class="memberArea">
                <div class="titleArea">
                    <h3>기본정보</h3>
                    <p class="required">
                        <img src="img/icon/ico_required.svg" alt="필수">
                        필수입력사항
                    </p>
                </div>
                <div class="tableBox">
                    <table border="1">
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">아이디</th>   
                            <td>
                                <input type="text" id="id" name="id" value="${mdto.m_id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호</th>   
                            <td>
                                <input type="password" id="pw" name="pw" value="${mdto.m_pw}">
                                <div class="txtInfo">
                                	(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)<br>
                                	입력 가능 특수문자: ~ ` ! @ # $ % ^ ( ) * _ - { } [ ] | ; : < > , . ? /
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호 확인</th>   
                            <td>
                                <input type="password" id="pwchk" name="pwchk">
                                <p id="pwchkMsg" class="txtInfo"></p>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호 확인 질문</th>   
                            <td>
                                <select id="pwq" name="pwq">
                                    <option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
                                    <option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
                                    <option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
                                    <option value="인상깊게 읽은 책 이름은?">인상깊게 읽은 책 이름은?</option>
                                    <option value="다시 태어나고 싶으면 되고 싶은 것은?">다시 태어나고 싶으면 되고 싶은 것은?</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호 확인 답변</th>   
                            <td>
                                <input type="text" id="pwa" name="pwa" value="${mdto.m_pwa}">
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">이름</th>   
                            <td>
                                <input type="text" id="name" name="name" value="${mdto.m_name}">
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">주소</th>   
                            <td class="formMultiple">
                                <div class="postcode_wrap">
                                    <input type="text" id="postcode" name="postcode" value="${mdto.m_postcode}" readonly>
                                    <input type="button" class="btnBasic" onclick="DaumPostcode()" value="주소검색" style="cursor: pointer;"></button>
                                </div>
                                <div class="defaultaddr_wrap">
                                    <input type="text" id="defaultaddr" name="defaultaddr" value="${mdto.m_defaultaddr}" readonly>
                                </div>
                                <div class="detailaddr_wrap">
                                    <input type="text" id="detailaddr" name="detailaddr" value="${mdto.m_detailaddr}">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">휴대전화</th>   
                            <td>
                                <select id="phone1" name="phone1">
                                    <option value="010">010</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                -
                                <input type="text" id="phone2" name="phone2" value="${phone2}" maxlength="4">
                                -
                                <input type="text" id="phone3" name="phone3" value="${phone3}" maxlength="4">
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">이메일</th>   
                            <td>
                                <input type="text" id="email" name="email" value="${mdto.m_email}">
                                <p id="emailMsg" class="txtInfo"></p>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btnBox">
                    <input type="button" class="normalBtn" onclick="history.go(-1)" value="취소">
                    <input type="button" class="submitBtn" onclick="checkMember()" value="회원정보수정">
                </div>
            </form>
        </div>
    </div>
    <script>
    let id = document.getElementById('id');
    let pw = document.getElementById('pw');
    let pwchk = document.getElementById('pwchk');
    let pwa = document.getElementById('pwa');
    let name = document.getElementById('name');
    let defaultaddr = document.getElementById('defaultaddr');
    let detailaddr = document.getElementById('detailaddr');
    let phone1 = document.getElementById('phone1');
    let phone2 = document.getElementById('phone2');
    let phone3 = document.getElementById('phone3');
    let email = document.getElementById('email');
    
    /* let idMsg = document.getElementById("idMsg"); */
    let pwchkMsg = document.getElementById("pwchkMsg");
    let emailMsg = document.getElementById("emailMsg");

 	// 아이디: 영문자로 시작하는 영문자 또는 숫자 4~16자, 숫자로 시작 x
    const regId = /^[a-z]{1}[a-z0-9]{3,15}$/;
    // 패스워드: 영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자
    // 입력 가능 특수문자: ~ ` ! @ # $ % ^ () * _ - {} [] | ; : <> , . ? /
    const regPw = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[~`!@#\$%\^\(\)\*_\-\{\}\[\]\|;:<>,\.\?/])[A-Za-z0-9~`!@#\$%\^\(\)*_\-\{\}\[\]\|;:<>,\.\?/]{8,16}$/;
    // 휴대전화: ex) 010-0000-0000, 010-111-1111
    const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    // 이메일: ex) jsp2024@gmail.com, genius@snu.ac.kr
    const regEmail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]+$/;
    
    // 유효하지 않은 아이디/이메일일 경우 화면에 표시, 비밀번호 불일치 시 화면에 표시
    /* id.addEventListener("focusout", () =>{
        if(id.value !== "" && id.value !== ""){
			if(regId.test(id.value)){
				idMsg.innerHTML = "사용 가능한 아이디입니다.";
                idMsg.classList.remove('error');
			}
			else{
				idMsg.innerHTML = "유효하지 않은 아이디입니다.";
                idMsg.classList.add('error');
			}
		}
		else{
			idMsg.innerHTML = "아이디를 입력해주세요.";
            idMsg.classList.add('error');
		}
    }) */

    pwchk.addEventListener("focusout", () =>{
		if(pw.value === pwchk.value || pw.value === ""){
			pwchkMsg.innerHTML = "";
			pwchkMsg.classList.remove('error');
		}
		else{
			pwchkMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
			pwchkMsg.classList.add('error');
		}
	})

    email.addEventListener("focusout", () =>{
        if(email.value !== "" && email.value !== ""){
				if(regEmail.test(email.value)){
					emailMsg.innerHTML = "";
                    emailMsg.classList.remove('error');
				}
				else{
					emailMsg.innerHTML = "유효한 이메일을 입력해주세요.";
                    emailMsg.classList.add('error');
				}
			}
		else{
			emailMsg.innerHTML = "이메일을 입력해주세요.";
            emailMsg.classList.add('error');
		}
    })
    
    // 주소검색 클릭 시 Daum 주소 API가 뜨도록 설정
    function DaumPostcode(){
    	new daum.Postcode({
    		oncomplete: function (data){
    			let addr = '';
    			if(data.userSelectedType === 'R'){
    				addr = data.roadAddress;
    			}else{
    				addr = data.jibunAddress;
    			}
    			document.getElementById('postcode').value = data.zonecode;
    			document.getElementById('defaultaddr').value = addr;
    			document.getElementById('detailaddr').focus();
    		},
    	}).open();	
    }

    // 가입버튼 누를 시 예외처리
    // 1) 입력값이 null
    // 2) 정규식 오류
    // 3) 패스워드 불일치
    function checkMember(){
    	let formname = document.formname;
    	let phone = phone1.value+"-"+phone2.value+"-"+phone3.value;
    	/* console.log(id.value);
    	console.log(pw.value);
    	console.log(pwchk.value);
    	console.log(pwq.value);
    	console.log(pwa.value);
    	console.log(defaultaddr.value);
    	console.log(phone1.value);
    	console.log(phone2.value);
    	console.log(phone3.value);
    	console.log(phone);
    	console.log(email.value); */
    	// 1)
    	if(id.value === ""){
			alert('아이디를 입력해주세요.');
			return;
		}
    	if(pw.value === "" || pwchk === ""){
			alert('비밀번호 항목은 필수 입력값입니다.');
			return;
		}
    	if(pwa.value === ""){
			alert('비밀번호 확인시 답변 항목은 필수 입력값입니다.');
			return;
		}
    	if(name.value === ""){
			alert('이름을 입력해주세요.');
			return;
		}
    	if(defaultaddr.value === "" || detailaddr.value === ""){
			alert('주소를 입력해주세요.');
			return;
		}
    	if(phone2.value === "" || phone3.value === ""){
			alert('휴대전화를 입력해주세요.');
			return;
		}
    	if(email.value === ""){
			alert('이메일을 입력해주세요.');
			return;
		}
    	// 2)
		if(!regId.test(id.value)){
			alert('유효하지 않은 아이디입니다.');
			return;
		}
		if(!regPw.test(pw.value)){
			alert('유효하지 않은 비밀번호입니다.');
			return;
		}
		if(!regPhone.test(phone)){
			alert('올바른 휴대전화번호를 입력하세요.');
			return;
		}
		if(!regEmail.test(email.value)){
			alert('입력하신 이메일을 사용할 수 없습니다.');
			return;
		}
		// 3)
		if(pw.value !== pwchk.value){
			alert('패스워드가 일치하지 않습니다.');
			return;
		}
		
		formname.submit();
    }
    </script>
</body>
</html>