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
                <tr><td class="title">ȸ������</td></tr>
                <tr><td>���̵�*</td></tr>
                <tr><td><input type="text" name="id"></td></tr>
                <tr><td>�̸���*</td></tr>
                <tr><td><input type="email" name="email"></td></tr>
                <tr><td>�̸�*</td></tr>
                <tr><td><input type="text" name="name"></td></tr>
                <tr><td>��й�ȣ*</td></tr>
                <tr><td><input type="password" name="pw" placeholder="����, Ư����ȣ(!@#*-), ������ ���� 6~12�ڸ�"></td></tr>
                <tr><td>��й�ȣ Ȯ��*</td></tr>
                <tr><td><input type="password" name="pwchk"></td></tr>
                <tr><td>�޴��� ��ȣ*</td></tr>
                <tr>
                    <td class="tel"><input type="tel" name="tel1">-<input type="tel" name="tel2">-<input type="tel" name="tel3">
                    </td>
                </tr>
                <tr><td>�����ȣ*</td></tr>
                <tr class="zipcode">
                    <td>
                        <input type="text" name="zipcode">
                        <input type="button" value="�˻��ϱ�" onclick="sample6_execDaumPostcode()">
                    </td>
                </tr>
                <tr><td>�ּ�*</td></tr>
                <tr><td class="adr"><input type="text" name="addr1"></td></tr>
                <tr><td><input type="text" name="addr2"></td></tr>
            </table>
            
            <div class="check">
                <p><input class="allagree" type="checkbox" name="agree"><span>��� �����մϴ�.</span></p>
                <p>
                    <input class="agree" type="checkbox" name="agree_terms" value="����">
                    <span>(�ʼ�) <span class="color">�̿���</span>�� <span class="color">�������� ���� �� �̿�</span>�� �����մϴ�.</span>
                </p>
                <p>
                    <input class="agree" type="checkbox" name="agree_age" value="����">
                    <span>(�ʼ�) �� 14�� �̻��Դϴ�.</span><br>
                    <small>�� 19�� �̸��� �̼����ڰ� ���� �� �����븮���� �ŷ��� �����</small><br>
                    <small>�� �ֽ��ϴ�.</small>
                </p>
                <p>
                    <input class="agree" type="checkbox" name="agrees" value="����">
                    <span>(����) �̸��� �� SMS ������ ���� ���ſ� �����մϴ�.</span><br>
                    <small>ȸ���� �������� ȸ�� �������� ���� �źη� ������ �� �ֽ��ϴ�.</small>
                </p>
            </div>
            
            <div class="join">
                <input type="button" value="�����ϱ�" onclick="check(this.form)">
            </div>
        </form>
    </div>  
    
	<!-- �����ȣ ��ũ��Ʈ -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	    	new daum.Postcode({	
	            oncomplete: function(data) {	
	                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
	                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
	                document.getElementsByName("zipcode")[0].value = data.zonecode;	
	                document.getElementsByName("addr1")[0].value = roadAddr;
	                document.getElementsByName("addr2")[0].focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- ��ü���� ��ũ��Ʈ -->
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
	
	<!-- ���Խ� �� ����ó�� ��ũ��Ʈ -->
	<script>
        function check(f){
        	var regpw = /^(?=.*[a-zA-Z])(?=.*[!@#*-])(?=.*[0-9]).{6,12}$/; // ���� Ư����ȣ(!@#*-) ������ 6~12�ڸ�
            
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
            	alert("���̵� �Է����ּ���");
            	return;
            }else if(email==""){
            	alert("�̸����� �Է����ּ���");
            	return;
            }else if(name==""){
            	alert("�̸��� �Է����ּ���");
            	return;
            }else if(pw==""){
            	alert("��й�ȣ�� �Է����ּ���");
            	return;
            }else if(pwchk==""){
            	alert("��й�ȣ�� �ٽ��� �� �Է����ּ���");
            	return;
            }else if(tel1=="" || tel2=="" || tel3==""){
            	alert("��ȭ��ȣ�� �Է����ּ���");
            	return;
            }else if(zipcode==""){
            	alert("�����ȣ�� �Է����ּ���");
            	return;
            }else if(addr1=="" || addr2==""){
            	alert("�ּҸ� �Է����ּ���");
            	return;
            }else if(!regpw.test(pw)){
                alert("��й�ȣ�� ����, Ư����ȣ(!@#*-), ������ ���� 6~12�ڸ��� �����մϴ�.");
                return;
            }else if(pw!=pwchk){
            	alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
                return;
            }else if(agree_terms.checked==false || agree_age.checked==false){
            	alert("�ʼ� �����׸� �������� �����̽��ϴ�");
                return;
            }else{
            	f.action = 'Join.do';
            	f.submit();  
            }
        }
    </script>
	
</body>
</html>