<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .addressContainer{
       margin: 10px auto;
       width : 600px;
       height: 650px;
    }
    h2{
       text-align: center;
    }
    #ordertable{
      border-collapse:collapse;
      text-align: center;
    }
    .btn{
       width:80px;
       height:25px;
       cursor: pointer; 
    }
    #phone01,#phone02,#phone03{
       width:70px;
       height: 30px;
    }
    #rent{
      border-left:none;
      border-right: none;
      font-weight: bold;
    }
    .info{
       padding-left: 10px;
    }
    input{
       width: 250px;
       height: 30px;
    }
    .dup{
      width : 120px;
      height: 30px;
      cursor: pointer;
    }
</style>
</head>
<body>
  <div class="addressContainer">
   <h2> 주문 상세내역</h2>
   <form action="ToOrderListProc.do" name="oder" method="post">
      <table width="600" border="1" id="ordertable">
       <tr height="40">
         <td width="50">상품번호</td>
         <td width="50">상품이미지</td>
         <td width="50">상품명</td>
         <td width="50">상품수량</td>
         <td width="50">상품가격</td>
         <td width="50">총금액</td>
       </tr>
         <c:forEach var="ck" items="${ac }">
             <tr height="40">
               <td width="50">${ck.no }
                <input type="hidden" name="no" value="${ck.no }">
               </td>
               <td width="50">
                <img src="img/${ck.img }" width="60" height="60">
                <input type="hidden" name="img" value="${ck.img }">
               </td>
               <td width="50">${ck.name }
                <input type="hidden" name="name" value="${ck.name }">
               </td>
               <td width="50">${ck.cnt }개
                <input type="hidden" name="cnt" value="${ck.cnt }">
               </td>
               <td width="50">${ck.price }
                <input type="hidden" name="price" value="${ck.price }">
               </td>
               <td width="50">${ck.price * ck.cnt}</td>
             </tr>
         </c:forEach>
              <tr height="60">
                <td align="center" colspan="6" id="rent">배송지 정보</td>
             </tr>
             <tr height="40">
                <td width="100">이름</td>
                <td width="300" colspan="5" align="left" class="info">
                 <input type="text" name="buy_name" id="buy_name">
                </td>
             </tr>
             <tr height="40">
                <td width="100">연락처</td>
                <td width="300" colspan="5" align="left" class="info">
                 <input type="text" name="phone01" id="phone01" value="010">-
                 <input type="text" name="phone02" id="phone02" maxlength="4">-
                 <input type="text" name="phone03" id="phone03" maxlength="4">
                </td>
             </tr>
             <tr height="40">
                <td width="100">이메일</td>
                <td width="300" colspan="5" align="left" class="info">
                 <input type="email" name="email" id="email">
                </td>
             </tr>
             <tr height="40">
                <td width="100">우편번호</td>
                <td width="300" colspan="5" align="left" class="info">
                 <input type="text" name="postcode" id="postcode" placeholder="우편번호">&nbsp;
                 <input type="button"  onclick="DaumPostcode()" class="dup" value="우편번호 찾기">
                </td>
             </tr>
             <tr height="40">
                <td width="100">주소</td>
                <td width="300" colspan="5" align="left" class="info">
                 <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
                </td>
             </tr>
             <tr height="40">
                <td width="100">상세주소</td>
                <td width="300" colspan="5" align="left" class="info">
                 <input type="text" name="detailAddress" id="detailAddress" placeholder="상제주소">
                </td>
             </tr>
             <tr height="40">
                <td colspan="6">
                 <input type="button" class="btn" value="이전" onclick="location.href='JangProc.do'">
                 <input type="button" class="btn" value="주문" onclick="checkMember()">
                 <input type="reset"  class="btn" value="다시입력" >
                </td>
             </tr>
      </table>
   </form>
  </div>
  
  <script type="text/javascript">
  
  // 우편번호 찾기 API코드
    function DaumPostcode(){
    	
    	new daum.Postcode({
            oncomplete: function (data) {
              // var roadAddr = data.roadAddress; // 도로명 주소 변수
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              var addr = '';
              if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
              } else {
                addr = data.jibunAddress;
              }
              document.getElementById('postcode').value = data.zonecode;
              document.getElementById('roadAddress').value = addr;
              document.getElementById('detailAddress').focus();
            },
          }).open();
    }
  
    function checkMember(){
    	
    	let regExpName = /^[가-힣]*$/; /* 한글만 받겠다. */
    	let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
    	let regExpEmail = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/;
    	
    	let form = document.order;
    	let name = document.getElementById('buy_name').value;
    	let email = document.getElementById('email').value;
    	let phone01 = document.getElementById('phone01').value;
    	let phone02 = document.getElementById('phone02').value;
    	let phone03 = document.getElementById('phone03').value;
    	let phone = phone01+"-"+phone02+"-"+phone03;
    	
    	if(!regExpName.test(name)){
    		alert("이름은 한글로만 입력하세요");
    		return
    	}
    	if(!regExpPhone.test(phone)){
    		alert("연락처 입력을 확인해 주세요 ");
    		return
    	}
    	if(!regExpEmail.test(email)){
    		alert("이메일 입력을 확인해 주세요");
    		return
    	}
    	
    	form.submit();
    }
  
  </script>
  
</body>
</html>