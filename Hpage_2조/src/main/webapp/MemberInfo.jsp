<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#memberinfowrap { display: flex; width: 1200px; margin: 50px auto; }
	#memberinfowrap .membermenuwrap { width: 600px; }
	#memberinfowrap .membermenuwrap .membermenu { list-style: none; padding-left: 0; }
	#memberinfowrap .membermenuwrap .membermenu>li { height: 325px; }
	#memberinfowrap .membermenuwrap .membermenu>li a { text-decoration: none; color: black; }
	#memberinfowrap .membermenuwrap .membermenu>li>p { height: 15px; font-size: 15px; }
	#memberinfowrap .membermenuwrap .membermenu>li .buylist, .writelist { width: 600px; height: 250px; font-size: 14px; overflow: auto; }
	#memberinfowrap .membermenuwrap .membermenu>li .buylist p, .writelist p { height: 20px; }
	#memberinfowrap .membermenuwrap .membermenu>li .buylist .img { width: 30px; height: 30px; vertical-align: middle; }
	#memberinfowrap .membermenuwrap .membermenu>li .buylist .empty, .writelist .empty { width: 590px; height: 20px; text-align: center; line-height: 325px; }
	#memberinfowrap .membermenuwrap .membermenu>.pwchange, .membermenu>.withdraw { height: 30px; }
	#memberinfowrap .memberwrap { width: 510px; margin: 0 auto; }
    #memberinfowrap .memberwrap .memberinput p { font-size: 14px; margin: 15px 0; }
    #memberinfowrap .memberwrap .memberinput input { width: 500px; height: 40px; border: 1px solid #ccc; outline: none; }
    #memberinfowrap .memberwrap .memberinput .phone { width: 150px; }
    #memberinfowrap .memberwrap .memberinput .zipcode { width: 343px; outline: none; }
    #memberinfowrap .memberwrap .memberinput .zipcodebtn { width: 150px; height: 44px; border: 2px solid gray; color: gray; background: white; vertical-align: middle; cursor: pointer; outline: none; }
    #memberinfowrap .memberwrap .memberinput .zipcodebtn:hover { background: gray; color: white; }
    #memberinfowrap .memberwrap .memberinput .address { margin: 0 0 10px 0; outline: none; }
    #memberinfowrap .memberwrap .changebtn { text-align: center; margin: 50px auto; }
    #memberinfowrap .memberwrap .changebtn input { width: 150px; height: 50px; border: 2px solid black; color: black; background: white; font-size: 14px; cursor: pointer; outline: none; }
    #memberinfowrap .memberwrap .changebtn input:hover { background: black; color: white; }
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id="memberinfowrap">
		<div class="membermenuwrap">
			<ul class="membermenu">
				<li>
					<b>주문내역</b>
					<c:choose>
						<c:when test="${empty arl }">
							<div class="buylist">
								<p class="empty">주문내역이 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<p>
								구매일자 &nbsp;|&nbsp; 상품이미지 &nbsp;|&nbsp; 상품명 &nbsp;|&nbsp; 색상 &nbsp;|&nbsp; 수량 &nbsp;|&nbsp; 금액 
							</p>
							<div class="buylist">
								<c:forEach var="arl" items="${arl }">
									<p>
										${arl.buy_date} &nbsp;|&nbsp; <img class="img" alt="image" src="img/${arl.b_img}"> &nbsp;|&nbsp; ${arl.b_name} &nbsp;
										|&nbsp;
										<c:choose>
											<c:when test="${arl.b_color == 'ncolor' }">
												색상없음
											</c:when>
											<c:otherwise>
												${arl.b_color}
											</c:otherwise>
										</c:choose> 
										&nbsp;|&nbsp;${arl.b_cnt}개 &nbsp;|&nbsp; <fmt:formatNumber value="${arl.b_price }" />원
									</p>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<b>내가 쓴 글</b>
					<c:choose>
						<c:when test="${empty al }">
							<div class="writelist">
								<p class="empty">작성 글이 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<p>
								글번호 &nbsp;|&nbsp; 글제목 &nbsp;|&nbsp; 작성일자 
							</p>
							<div class="writelist">
								<c:forEach var="tdto" items="${al }">
									<p>${tdto.b_no}번 글 &nbsp;|&nbsp; ${tdto.b_title} &nbsp;|&nbsp; ${tdto.b_regdate}</p>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
				<li class="pwchange"><a href="javascript:popupOpen();"><b>비밀번호 변경하기</b></a></li>
				<li class="withdraw"><a href="MainList.do?section=Withdraw.jsp"><b>탈퇴하기</b></a></li>
			</ul>
		</div>
       	<div class="memberwrap">
       		<form action="UpdateMember.do" method="post">
	            <p class="member"><b>회원 정보</b></p>
	            <div class="memberinput">
	            	<p>아이디</p>
	                <input type="text" name="id" value="${tdto.id }" readonly="readonly">
	                <p>이메일</p>
	                <input type="text" name="email" value="${tdto.email }">
	                <p>이름</p>
	                <input type="text" name="name" value="${tdto.name }">
	                <p>휴대폰 번호</p>
	                <c:set var="phonevalue" value="${tdto.phone }"/>
                    <input class="phone" type="text" name="tel1" value="${fn:substring(phonevalue,0,3)}"> &#45; 
                    <input class="phone" type="text" name="tel2" value="${fn:substring(phonevalue,4,8)}"> &#45; 
                    <input class="phone" type="text" name="tel3" value="${fn:substring(phonevalue,9,13)}">
	                <p>우편번호</p>
	                <input class="zipcode" type="text" name="zipcode" id="zipcde" value="${tdto.zipcode }" readonly="readonly">
	                <input class="zipcodebtn" type="button" value="검색하기" onclick="postcode()">
	                <p>주소</p>
	                <input class="address" type="text" name="address1" id="roadaddr" value="${tdto.roadaddress }" readonly="readonly">
	                <input class="address" type="text" name="address2" id="detailAddr" value="${tdto.detailaddress }">
	            </div>
	            <div>
	                <p>마케팅 정보 수신 동의</p>
	                <p>
	                	<c:choose>
	                		<c:when test="${empty tdto.agree_email && empty tdto.agree_message }">
	                			<input class="checkemail" type="checkbox" name="checkemail" value=""> 이메일
			                    &nbsp;&nbsp;&nbsp;
			                    <input class="checktext" type="checkbox" name="checkmessage" value=""> 문자메시지
	                		</c:when>
	                		<c:when test="${empty tdto.agree_email }">
	                			<input class="checkemail" type="checkbox" name="checkemail" value="이메일"> 이메일
			                    &nbsp;&nbsp;&nbsp;
			                    <input class="checktext" type="checkbox" name="checkmessage" value="문자" checked> 문자메시지
	                		</c:when>
	                		<c:when test="${empty tdto.agree_message }">
	                			<input class="checkemail" type="checkbox" name="checkemail" value="이메일" checked> 이메일
			                    &nbsp;&nbsp;&nbsp;
			                    <input class="checktext" type="checkbox" name="checkmessage" value="문자"> 문자메시지
	                		</c:when>
	                		<c:otherwise>
	                			<input class="checkemail" type="checkbox" name="checkemail" value="이메일" checked> 이메일
			                    &nbsp;&nbsp;&nbsp;
			                    <input class="checktext" type="checkbox" name="checkmessage" value="문자" checked> 문자메시지
	                		</c:otherwise>
	                	</c:choose>
	                </p>
	            </div>
	            <div class="changebtn"><input type="submit" name="changesave" value="변경사항 저장하기"></div>
            </form>
       	</div>
    </div>
    <script type="text/javascript">
    	function popupOpen(){
	    	var popUrl = "PasswordChange.jsp";
	    	var popOption = "width = 530, height = 460, top = 300, left = 750, resizable = no, scrollbars = no, status = no";
	    		window.open(popUrl,"popup",popOption);
    	}
    	
    	function postcode() {
				new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                // 상단에 작성된 id 값(변경 가능함)
	                // 다른 곳에서도 사용 가능
	                document.getElementById('zipcde').value = data.zonecode;
	                document.getElementById("roadaddr").value = roadAddr;
	                document.getElementById("detailAddr").focus();
	            }
	        }).open();
		}
    </script>
</body>
</html>