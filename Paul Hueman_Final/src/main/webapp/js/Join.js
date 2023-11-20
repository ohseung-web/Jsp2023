//주소 api 값 받아오기
function DaumPostcode(){
	new daum.Postcode({
		oncomplete: function(data) {
	        var roadAddr = data.roadAddress; // 도로명 주소 변수
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			var extraRoadAddr = ''; // 참고 항목 변수
			// 법정동명이 있을 경우 추가한다.(법정리는 제외) 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만들어 입력란에 값을 삽입한다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
				document.getElementById("extraAddr").value = extraRoadAddr;
			}
	        document.getElementById('zipcode').value = data.zonecode;
	        document.getElementById("roadAddr").value = roadAddr;
	        document.getElementById("detailAddr").focus();
		}
	}).open();
}

//아이디중복 확인
function idOK(){ 
	var id = document.getElementsByClassName("id")[0].value;
	if(!id){
		alert("아이디를 입력하세요!");
		history.back();
	}else{
		location.href="ExistUserProc.do?u_id="+id;
	}
}

//input태그에서 공백, 정규식 체크
function inputcheck(){
	var formname = document.formname;
	
	var id = document.getElementsByClassName("id")[0];
	var pw = document.getElementsByClassName("pw")[0]
	var pwchk = document.getElementsByClassName("pwchk")[0];
	var name = document.getElementsByClassName("name")[0];
	var email = document.getElementsByClassName("email")[0];
	var tel1 = document.getElementsByClassName("tel")[0];
	var tel2 = document.getElementsByClassName("tel")[1];
	var tel3 = document.getElementsByClassName("tel")[2];
	var question = document.getElementsByClassName("question")[0];
	var answer = document.getElementsByClassName("answer")[0];
	var zipcode = document.getElementsByClassName("zipcode")[0];
	var roadAddr = document.getElementsByClassName("roadAddr")[0];
	var detailAddr = document.getElementsByClassName("detailAddr")[0];
	

	if(!id.value){
		alert("아이디를 입력하세요");
		id.focus();
		return;
	}
	if(!pw.value){
		alert("비밀번호를 입력하세요");
		pw.focus();
		return;
	}
	if(!pwchk.value){
		alert("비밀번호 확인을 입력하세요");
		pwchk.focus();
		return;
	}
	if(!name.value){
		alert("이름을 입력하세요");
		name.focus();
		return;
	}
	if(!email.value){
		alert("이메일을 입력하세요");
		email.focus();
		return;
	}
	if(!tel1.value){
		alert("휴대폰번호를 입력하세요");
		tel1.focus();
		return;
	}
	if(!tel2.value){
		alert("휴대폰번호를 입력하세요");
		tel2.focus();
		return;
	}
	if(!tel3.value){
		alert("휴대폰번호를 입력하세요");
		tel3.focus();
		return;
	}
	if(!question.value){
		alert("비밀번호 찾기 질문을 선택해주세요");
		question.focus();
		return;
	}
	if(!answer.value){
		alert("질문에 대한 답변을 입력하세요.");
		answer.focus();
		return;
	}
	if(!zipcode.value){
		alert("우편변호를 입력하세요");
		zipcode.focus();
		return;
	}
	if(!roadAddr.value){
		alert("주소를 입력하세요");
		roadAddr.focus();
		return;
	}
	if(!detailAddr.value){
		alert("상세주소를 입력하세요");
		detailAddr.focus();
		return;
	}
	if(pw.value != pwchk.value){
		alert("비밀번호와 비밀번호 확인이 같지 않습니다. 다시 입력해주세요");
		pw.value = '';
		pwchk.value = '';
		pw.focus();
		return;
	}
	
	// 정규식
	var regExpId = /^[a-z|A-z]/; //아이디 첫 글자 시작은 무조건 영어
	var regExpName = /^[가-힣]*$/; /* 한글만 받겠다. */
	var regExpTel1 = /^\d{3}$/;
	var regExpTel2 = /^\d{4}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	if(!regExpId.test(id.value)){
		alert("아이디의 첫 글자는 영어로 입력해주세요.");
		//name.style.borderColor="red";
		name.focus();
		return;
	}
	if(!regExpName.test(name.value)){
		alert("이름은 한글로만 입력가능 합니다.");
		//name.style.borderColor="red";
		name.focus();
		return;
	}
	if(!regExpTel1.test(tel1.value) && !regExpTel2.test(tel2.value) && !regExpTel2.test(tel3.value)){
		alert("휴대폰번호는 숫자만 입력가능 합니다.");
		name.focus();
		return;
	}
	if(!regExpEmail.test(email.value)){
		alert("이메일 형식을 확인해주세요! ");
		name.focus();
		return;
	}
	formname.submit();
	
}