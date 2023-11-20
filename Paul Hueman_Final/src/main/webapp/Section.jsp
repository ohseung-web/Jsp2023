<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/*스크롤 기능은 살리고, 스크롤바 숨기기*/
    body{ background-image: url(img/mainwoman.jpg); background-repeat: no-repeat; background-size: 100%; margin: 0; -ms-overflow-style: none;  background-position-y: -60px;}
    body::-webkit-scrollbar{display: none;}
	section{height: 100%; position:relative; padding-bottom:75px;}
	footer{position:absolute; bottom:-75px;}
	 @media (min-width: 1300px and max-width: 2000px) {
	 	section{width:100%; height:100%; }
	 }
</style>
</head>
<body>
<section></section>
</body>
</html>