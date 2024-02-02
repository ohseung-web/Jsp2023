<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
        #join_wrap{width: 1400px; margin: 0 auto;}
        #join_wrap table{width: 400px; margin: 50px auto; font-size: 0.9em;}
        #join_wrap table .title{font-size: 1.2em; padding: 20px 0;}
        #join_wrap table td{padding: 5px 0;}
        #join_wrap table input{width: 400px; height: 40px; border: 1px solid #cbcbcb; margin-bottom: 5px;}
        #join_wrap table .tel input{width: 112px; margin: 0 2px;}
        #join_wrap table input[type=text], #join_wrap table input[type=email],#join_wrap table input[type=password],#join_wrap table input[type=tel]{padding-left: 15px;}
        #join_wrap table .zipcode input[type=text]{width: 280px; background-color: rgba(250, 250, 250, 0.88);}
        #join_wrap table .zipcode input[type=button]{width: 113px; height: 43px; border: 2px solid #6d6d6d; color: gray; background: none; vertical-align: top;}
        #join_wrap table .adr input[type=text]{background-color: rgba(250, 250, 250, 0.88);}
        #join_wrap .check{width: 410px; margin: 0 auto;}
        #join_wrap .check span{font-size: 0.9em;}
        #join_wrap .check .color{color: #ff6800; font-size: 1em;}
        #join_wrap .check small{font-size: 0.7em; margin-left: 27px;}
        #join_wrap .join{width: 410px; margin: 40px auto; text-align: center;}
        #join_wrap .join input{width: 230px; height: 50px; border: 2px solid black; background: none;}
    </style>
</head>
<body>
    <div id="join_wrap">
        <form action="Join.do" method="post">
            <table>
                <tr><td class="title">회원가입</td></tr>
                <tr><td>아이디*</td></tr>
                <tr><td><input type="text" name="id"></td></tr>
                <tr><td>이메일*</td></tr>
                <tr><td><input type="email" name="email"></td></tr>
                <tr><td>이름*</td></tr>
                <tr><td><input type="text" name="name"></td></tr>
                <tr><td>비밀번호*</td></tr>
                <tr><td><input type="password" name="pw" placeholder="숫자, 특수기호(!@#*-), 영문자 조합 6~12자리"></td></tr>
                <tr><td>비밀번호 확인*</td></tr>
                <tr><td><input type="password" name="pwchk"></td></tr>
                <tr><td>휴대폰 번호*</td></tr>
                <tr>
                    <td class="tel"><input type="tel" name="tel1">-<input type="tel" name="tel2">-<input type="tel" name="tel3">
                    </td>
                </tr>
                <tr><td>우편번호*</td></tr>
                <tr class="zipcode">
                    <td>
                        <input type="text" name="zipcode">
                        <input type="button" value="검색하기" onclick="sample6_execDaumPostcode()">
                    </td>
                </tr>
                <tr><td>주소*</td></tr>
                <tr><td class="adr"><input type="text" name="addr1"></td></tr>
                <tr><td><input type="text" name="addr2"></td></tr>
            </table>
            
            <div class="check">
                <p><input class="allagree" type="checkbox" name="agree"><span>모두 동의합니다.</span></p>
                <p>
                    <input class="agree" type="checkbox" name="agree_terms" value="동의">
                    <span>(필수) <span class="color">이용약관</span>과 <span class="color">개인정보 수집 및 이용</span>에 동의합니다.</span>
                </p>
                <p>
                    <input class="agree" type="checkbox" name="agree_age" value="동의">
                    <span>(필수) 만 14세 이상입니다.</span><br>
                    <small>만 19세 미만의 미성년자가 결제 시 법정대리인이 거래를 취소할</small><br>
                    <small>수 있습니다.</small>
                </p>
                <p>
                    <input class="agree" type="checkbox" name="agrees" value="동의">
                    <span>(선택) 이메일 및 SMS 마케팅 정보 수신에 동의합니다.</span><br>
                    <small>회원은 언제든지 회원 정보에서 수신 거부로 변경할 수 있습니다.</small>
                </p>
            </div>
            
            <div class="join">
                <input type="button" value="가입하기" onclick="check(this.form)">
            </div>
        </form>
    </div>  
    
	<!-- 우편번호 스크립트 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	    	new daum.Postcode({	
	            oncomplete: function(data) {	
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementsByName("zipcode")[0].value = data.zonecode;	
	                document.getElementsByName("addr1")[0].value = roadAddr;
	                document.getElementsByName("addr2")[0].focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- 전체동의 스크립트 -->
	<script>
	    var allagree = document.querySelector(".allagree");
        allagree.addEventListener('click',agreechk);
        
        function agreechk(){
            var agree = document.querySelectorAll(".agree");
            
            for(var i=0; i<agree.length; i++){
                agree[i].checked = allagree.checked;
            }
        }
        
        var agree = document.querySelectorAll(".agree");
        
        for(var i=0; i<agree.length;i++){
            agree[i].addEventListener('click',agreechkdel);
            
            function agreechkdel(){
                var allagree = document.querySelector(".allagree");
                
                for(var j=0; j<agree.length;j++){
                    if(agree[j].checked == false){
                       allagree.checked = false;
                        return;
                    }
                }
                allagree.checked = true;
            }
        }
	</script>
	
	<!-- 정규식 및 예외처리 스크립트 -->
	<script>
        function check(f){
        	var regpw = /^(?=.*[a-zA-Z])(?=.*[!@#*-])(?=.*[0-9]).{6,12}$/; // 숫자 특수기호(!@#*-) 영문자 6~12자리
            
         	var id = document.getElementsByName("id")[0].value;
         	var email = document.getElementsByName("email")[0].value;
         	var name = document.getElementsByName("name")[0].value;
         	var pw = document.getElementsByName("pw")[0].value;
         	var pwchk = document.getElementsByName("pwchk")[0].value;
         	var tel1 = document.getElementsByName("tel1")[0].value;
         	var tel2 = document.getElementsByName("tel2")[0].value;
         	var tel3 = document.getElementsByName("tel3")[0].value;
         	var zipcode = document.getElementsByName("zipcode")[0].value;
         	var addr1 = document.getElementsByName("addr1")[0].value;
         	var addr2 = document.getElementsByName("addr2")[0].value;
         	var agree_terms = document.getElementsByName("agree_terms")[0];
         	var agree_age = document.getElementsByName("agree_age")[0];
            
            if(id==""){
            	alert("아이디를 입력해주세요");
            	return;
            }else if(email==""){
            	alert("이메일을 입력해주세요");
            	return;
            }else if(name==""){
            	alert("이름을 입력해주세요");
            	return;
            }else if(pw==""){
            	alert("비밀번호를 입력해주세요");
            	return;
            }else if(pwchk==""){
            	alert("비밀번호를 다시한 번 입력해주세요");
            	return;
            }else if(tel1=="" || tel2=="" || tel3==""){
            	alert("전화번호를 입력해주세요");
            	return;
            }else if(zipcode==""){
            	alert("우편번호를 입력해주세요");
            	return;
            }else if(addr1=="" || addr2==""){
            	alert("주소를 입력해주세요");
            	return;
            }else if(!regpw.test(pw)){
                alert("비밀번호는 숫자, 특수기호(!@#*-), 영문자 조합 6~12자리만 가능합니다.");
                return;
            }else if(pw!=pwchk){
            	alert("비밀번호가 일치하지 않습니다");
                return;
            }else if(agree_terms.checked==false || agree_age.checked==false){
            	alert("필수 동의항목에 동의하지 않으셨습니다");
                return;
            }else{
            	f.action = 'Join.do';
            	f.submit();  
            }
        }
    </script>
	
</body>
</html>