<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.joinContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.joinContainer .contents{
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
select #pwq, select #phone1{
    max-width: 100%;
    height: 40px;
    padding: 0 30px 0 15px;
    font-size: 13px;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    background: url("/img/icon/ico_select.png");
    background-repeat: no-repeat;
    background-position: right 10px center;
    /* background: #fff url(img/icon/ico_select.png) no-repeat right 10px center; */
    background-size: 14px 8px;
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
    <div class="joinContainer">
        <div class="contents">
            <div class="title">
                <h2>회원 가입</h2>
            </div>
            <form action="MemberJoinProc.do" class="memberArea">
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
                                <input type="text" id="id" name="id">
                                <div class="txtInfo">(영문소문자/숫자, 4~16자)</div>
                                <p id="idMsg" class="txtInfo txtSuccess"></p>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호</th>   
                            <td>
                                <input type="text" id="pw" name="pw">
                                <div class="txtInfo">(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)</div>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호 확인</th>   
                            <td>
                                <input type="text" id="pwchk" name="pwchk">
                                <p id="pwchkMsg" class="txtInfo"></p>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호 확인 질문</th>   
                            <td>
                                <select id="pwq" name="pwq">
                                    <option value="pwq_01">기억에 남는 추억의 장소는?</option>
                                    <option value="pwq_02">가장 기억에 남는 선생님 성함은?</option>
                                    <option value="pwq_03">받았던 선물 중 기억에 남는 독특한 선물은?</option>
                                    <option value="pwq_04">인상깊게 읽은 책 이름은?</option>
                                    <option value="pwq_05">다시 태어나고 싶으면 되고 싶은 것은?</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">비밀번호 확인 답변</th>   
                            <td>
                                <input type="text" id="pwa" name="pwa">
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">이름</th>   
                            <td>
                                <input type="text" id="name" name="name">
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">주소</th>   
                            <td class="formMultiple">
                                <div class="postcode_wrap">
                                    <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
                                    <input type="button" class="btnBasic" onclick="DaumPostcode()" value="주소검색" style="cursor: pointer;"></button>
                                </div>
                                <div class="defaultaddr_wrap">
                                    <input type="text" id="defaultaddr" name="defaultaddr" placeholder="기본주소" readonly>
                                </div>
                                <div class="detailaddr_wrap">
                                    <input type="text" id="detailaddr" name="detailaddr" placeholder="나머지 주소">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">휴대전화</th>   
                            <td>
                                <select id="phone1" name="phone1">
                                    <option value="1">010</option>
                                    <option value="2">016</option>
                                    <option value="3">017</option>
                                    <option value="4">018</option>
                                    <option value="5">019</option>
                                </select>
                                -
                                <input type="text" id="phone2" name="phone2" maxlength="4">
                                -
                                <input type="text" id="phone3" name="phone3" maxlength="4">
                            </td>
                        </tr>
                        <tr>
                            <th><img src="img/icon/ico_required.svg" alt="필수">이메일</th>   
                            <td>
                                <input type="text" id="email" name="email">
                                <p id="emailMsg" class="txtInfo"></p>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btnBox">
                    <input type="button" class="normalBtn" onclick="history.go(-1)" value="취소">
                    <input type="submit" class="submitBtn" value="가입하기">
                </div>
            </form>
        </div>
    </div>
    <script>
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
    </script>
</body>
</html>