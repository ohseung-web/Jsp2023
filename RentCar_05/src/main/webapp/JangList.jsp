<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
  <h2>장바구니</h2>
  <hr>
		<table width="800" border="1">
			<tr height="40">
				<td align="center"  width="10">체크</td>
				<td align="center" width="50">상품번호</td>
				<td align="center" width="50">상품명</td>
				<td align="center" width="50">상품수량</td>
				<td align="center" width="50">상품가격</td>
				<td align="center" width="50">총금액</td>
			</tr>
			<c:forEach var="jdto" items="${a}">
				<!-- 하나씩 처리해야 되니까 form 태그는 forEach 문 내부에 배치시켜주세요. -->
				<form action ="RentDeletePro.do" method="post">
					<tr height="40">
						<td align="center"  width="10">
							<input type="checkbox"  name="chk" value="${jdto.no}">
						</td>
						<td align="center" width="50" >${jdto.no }</td>
						<td align="center" width="50">
							<img alt="" src="img/${jdto.img }" width="60"  height="60">
						</td>
						<td align="center" width="50" >      
							<input type="text" value="${jdto.cnt }"  name="cnt"  size="2"  id="jangcnt">개              
							<!-- <input type="button" value="수정"  onclick="location.href='RentUpdate.do?no=${jdto.no }&cnt=${qty }'"> -->
							<input type="hidden" name="no" value="${jdto.no}" />
							<input type="button" value="수정" onclick="fn_rentUpdate(this.form)" /> 
						</td>
						<td align="center" width="50">${jdto.price }</td>
						<td align="center" width="50">${jdto.price * jdto.cnt }</td>
					</tr> 
					<tr height="40">
						<td align="center" colspan="6">
							<input type="submit"   value="삭제" >
							<input type="button"   value="목록보기" onclick="location.href='RentListPro.do'">
						</td>
					</tr>
			   </form>
			</c:forEach>
		</table>
 </center>
 <script>
 	// 자바스크립트 변수는 JSP 변수(EL값)로 사용할 수 없어요.
 	// 반대로 JSP 변수는 자바스크립트에서 사용할 수 있어요.
 	// var qty = document.getElementById("jangcnt").value;
    // var cnt = qty;
    // console.log(cnt);
    
    function fn_rentUpdate(f) {
    	f.action = 'RentUpdate.do';
    	f.submit();  // 서브밋은 input들을 파라미터를 붙여서 보내니까 따로 안 보내셔도 되요.
    }
    
    
 </script>

</body>
</html>