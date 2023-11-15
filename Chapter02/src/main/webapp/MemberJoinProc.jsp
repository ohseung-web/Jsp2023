<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h2>회원 정보 보기</h2>
   
   <%
       request.setCharacterEncoding("UTF-8");
   %>
   
   <!-- request로 넘어온 데이터를 자바 빈즈와 매핑시켜주는 useBean -->
   <!-- 객체생성 MemberBean mbean = new MemberBean()과 같은 의미이다. -->
    <jsp:useBean id="mbean" class="bean.MemberBean">
     <!-- Jsp 내용을 자바빈 클래스(MemberBean)에 데이터 맵핑(넣어준다) -->
     <jsp:setProperty name="mbean" property="*" /><!-- *는 자동으로 모두 맵핑시켜주세요 -->
     
      <h2>당신의 아이디는 : <jsp:getProperty property="id" name="mbean" /> </h2>
      <h2>당신의 패스워드 : <jsp:getProperty property="pw" name="mbean" /> </h2>
      <h2>당신의 전화번호 : <%=mbean.getTel() %></h2>
      <h2>당신의 주   소 : <%=mbean.getAddress() %></h2>
     
    </jsp:useBean>

</body>
</html>

