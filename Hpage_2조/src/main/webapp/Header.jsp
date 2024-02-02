<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
        #header_wrap{width: 1400px; margin: 0 auto; padding: 0;}
        #header_wrap p{display: block; height: 120px;}
        #header_wrap img{width: 300px; float: right; margin-right: 165px;}
        #header_wrap .left{display: inline-block; width:1000px;}
        #header_wrap .right{display: inline-block; width:380px; text-align: right; vertical-align: bottom; line-height: 70px;}
        #header_wrap ul li{list-style: none; display: inline-block; padding: 0 10px;}
        #header_wrap .mainmenu{margin-right: 195px; height: 30px; text-align: right;}
        #header_wrap .left .mainmenu li a{color: black; text-decoration: none; font-weight: bold;}
        #header_wrap .rightmenu li a{font-size: 0.8em; text-decoration: none; color: black;}
        #header_wrap .rightmenu li .id:hover { text-decoration: underline; }
        #header_wrap .nav{margin-right: 50px; height: 20px; text-align: right;}
        #header_wrap .nav ul li{display: inline-block;}
        #header_wrap .nav ul li a{color: black; text-decoration: none; font-weight: bold; font-size: 0.75em;}
        /* #header_wrap .nav ul li:first-child a{color: #d30000;} */
        #header_wrap .cartcnt{line-height:14px;font-size: 0.9em; width: 16px; height:16px; display: inline-block;}
    </style>
</head>
<body>
    <div id="header_wrap">
            <div class="left">
            	<p><a href="MainList.do"><img src="img/image_1595172475968.jpg" alt="logo"></a></p>
                <ul class="mainmenu">
                    <li><a href="#">STORE</a></li>
                    <li><a href="#">ABOUT</a></li>
                    <li><a href="Board_list.do">Q & A</a></li>
                </ul>
                <div class="nav">
		            <ul>
		                <li><a href="MainList.do">ALL</a></li>
		                <li><a href="GetCategory.do?p_category=STICKER">STICKER</a></li>
		                <li><a href="GetCategory.do?p_category=STATIONERY">STATIONERY</a></li>
		                <li><a href="GetCategory.do?p_category=POUCH">POUCH</a></li>
		                <li><a href="GetCategory.do?p_category=FABRIC">FABRIC</a></li>
		                <li><a href="GetCategory.do?p_category=CASE">CASE</a></li>
		                <li><a href="GetCategory.do?p_category=CUP">CUP</a></li>
		                <li><a href="GetCategory.do?p_category=ETC">ETC</a></li>
		            </ul>
        		</div>
            </div>
    	<div class="right">
    		<ul class="rightmenu">
				<li><a href="#">SEARCH</a></li>
				<c:if test="${empty id}">
					<li><a href="MainList.do?section=Login.jsp">LOGIN</a></li>
				</c:if>
				<c:if test="${null ne id}">
					<li><a href="MemberInfo.do" class="id">${id }님</a></li>
					<li><a href="Login.do?id=-1">LOGOUT</a></li>
				</c:if>
				<li>
					<a href="AllCart.do">CART</a>
					<c:if test="${empty cartcnt}">
						<span class="cartcnt"></span>
					</c:if>
					<c:if test="${null ne cartcnt}">
						<span class="cartcnt">(${cartcnt })</span>
					</c:if>
				</li>
            </ul>
    	</div>        
    </div>
</body>

</html>