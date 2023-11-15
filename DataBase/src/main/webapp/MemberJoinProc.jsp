<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");

    //habby 부분은 별도로 읽어 들여 다시 빈클래스에 저장한다.
    String [] habby = request.getParameterValues("habby");
    //배열에 있는 내용을 하나의 스트링으로 저장한다.
    String texthabby="";
    for(int i=0; i<habby.length; i++){
    	texthabby += habby[i]+" ";
    }
%>

<!-- useBean을 이용하여 한꺼번에 데이터 받아오기 -->
<jsp:useBean id="mbean" class="model.MemberBean">
  <jsp:setProperty name="mbean" property="*" />
</jsp:useBean>

<%
    //기존 취미는 주소번지가 저장되기에 위의 배열의 내용을 하나의 스트링으로 저장한 변수를 다시 입력
    mbean.setHabby(texthabby);
 
    //데이터 베이스 클래스 객체 생성
    MemberDAO mdao = new MemberDAO();
    mdao.insertMember(mbean);
    
    //회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동
    response.sendRedirect("MemberList.jsp");
%>

    


</body>
</html>






