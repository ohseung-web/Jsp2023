<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Findpw.css?ver=20">
<title>Paul Hueman</title>
</head>
<body>
    <div id="find">
        <h3>${nott }Find ID</h3>
        <p class="h3bottom">
        	${first}<c:forEach var="list" items="${findid_list}">"${list.u_id}"&nbsp;&nbsp;</c:forEach>${end}
        </p>
    </div>
</body>
</html>