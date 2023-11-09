<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h2>
        1. 서버 도메인 이름:
        <%=request.getServerName()%></h2>
    <h2>
        2. 서버 포트 번호:
        <%=request.getServerPort()%></h2>
    <h2>
        ★★3. 요청 URL 주소:
        <%=request.getRequestURL()%></h2>
    <h2>
        ★★4. 요청 URI 주소:
        <%=request.getRequestURI()%></h2>
    <h2>
        ★★5. 접속 ip 주소:
        <%=request.getRemoteAddr()%></h2>
    <h2>
        6. 클라이언트가 요청한 프로토콜:
        <%=request.getProtocol()%></h2>
    <h2>
        ★★7. 요청 방식(GET or POST):
        <%=request.getMethod()%></h2>

</body>
</html>