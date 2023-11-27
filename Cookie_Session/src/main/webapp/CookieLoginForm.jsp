<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
<style type="text/css">
   body{
      display:flex;
      justify-content: center;
   }
   h2{
      text-align: center;
   }
   table{
     border-collapse: collapse;
   }
   table tr td{
     text-align: center;
   }
   input[type=text],input[type=password]{
      width:200px;
      height: 30px;
   }
   input[type=submit]{
      cursor: pointer;
      width:80px;
      height: 30px;
   }
   input[thpe=checkbox]{
     
   }
 
</style>
</head>
<body>

   <%
      //사용자 컴퓨터의 쿠키 저장소로부터 쿠키 값을 읽어 들인다.
      //몇개인지 모르기때문에 배열을 이용하여 쿠키 값을 저장한다.
      Cookie[] cookies = request.getCookies();
      String id ="";
   
      // 반드시 null처리 한다
      if(cookies != null){
    	  for(int i=0;i<cookies.length;i++){
    		  if(cookies[i].getName().equals("id")){
    			  id = cookies[i].getValue();
    			  break; //원하는 데이터를 찾았기 때문에 반복문을 빠져나온다.
    		  }
    	  }
      }
   
   %>

    <div class="contianer">
       <h2> 쿠키 로그인 </h2>
       <form action="CookieloginProc.jsp">
          <table width="400" border="1" id="popUp">
             <tr height="50">
                <td width="150">아이디</td>
                <td width="250"><input type="text" name="id" value="<%=id%>"></td>
             </tr>
             <tr height="50">
                <td width="150">패스워드</td>
                <td width="250"><input type="password" name="pw"></td>
             </tr>
             <tr height="50">
                <td colspan="2"><input type="checkbox" name="save" value="1">아이디 저장 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="close" value="2" id="close" >오늘 닫기</td>
             </tr>
             <tr height="50">
                <td colspan="2"><input type="submit" value="로그인"></td>
             </tr>             
          </table>
       </form>
    </div>
    
    <script type="text/javascript">
    
  //쿠키값 가저오는 함수
    function getCookie(name){
    	// match : 문자열의 처음부터 정규식과 매치되는지 조사하여 매칭되는 항목을 배열로 저장
    	let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        console.log('쿠키값'+value);
    	return value? value[2]:null;
    }

     //모달 창 닫기 함수
       let cookieModal = document.querySelector('#popUp');
       let cookieCheck = document.querySelector('#close');
       
           
      // 체크박스 클릭하면 모달창 닫기 함수
       cookieCheck.addEventListener('click',() =>{
    	  //만료시간 하루 24시간, 단 ms로 지정한다.
    	  let date = new Date(Date.now()+24*60*60*1000);
    	  // toUTCString() 메소드는 날짜를 문자열로 변환하여 UTC 시간대로 해석한다.
    	  date = date.toUTCString();
    	  //document.cookie는 key=value뒤에 나열하고 ;로 구분한다.
    	  document.cookie = `modalClose=T; expires=${date}`;
    	  closeModal();
       }) 
       
       // 모달 창닫기 함수
        function closeModal(){
    	   cookieModal.style.display='none';
       }
       
     // 즉시 쿠키 실행하는 함수 (즉시 실행 함수)
      (function (){
    	// 쿠기값이 없으면 모달창 오픈, 있으면 모달창 닫기
    	   if(getCookie('modalClose')) closeModal();
       })();
     
    </script>
    
</body>
</html>