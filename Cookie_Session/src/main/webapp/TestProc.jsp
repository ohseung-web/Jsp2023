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
        //얻어온 쿠키값 출력
        String id = request.getParameter("id");
        String save = request.getParameter("save");
        
        //체크박스 체크되었는지 확인
        if( save != null){
        	//반드시 쿠키를 생성해야 사용할 수 있다.
        	Cookie cookie = new Cookie("id",id);
        	cookie.setMaxAge(60*10);//10분간 유지
        	
        	//사용자에게 쿠키 넘기기
        	response.addCookie(cookie);
        	out.write("쿠키 생성 완료");
        }
    
    %>

</body>
</html>