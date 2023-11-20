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
       
         // 아이디 저장 체크 박스가 체크되었는지 판단여부
         String save = request.getParameter("save");
         // 아이디 값을 저장
         String id = request.getParameter("id");
         
         // 체크되었는지를 비교판단한다.
         if(save != null){
        	 //쿠키를 사용하려면 쿠키 클래스를 생성해야 한다.
             // 단, 반드시 new Cookie("key값","해당하는 value값")으로 정의 해야한다.
             Cookie cookie = new Cookie("id",id);  	
        	 //쿠키 유효시간 설정
        	 cookie.setMaxAge(60*2); // 10분간 유효
        	 
        	 //사용자에게 cookie값을 넘겨 준다.
        	 response.addCookie(cookie);
        	// response.sendRedirect("")
        	
        	out.write("쿠키 생성 완료");
         }
       
    %>
       
</body>
</html>