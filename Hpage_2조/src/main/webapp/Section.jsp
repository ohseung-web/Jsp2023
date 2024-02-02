<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
        #section_wrap{width: 1400px; margin: 30px auto; padding: 0;}
        #section_wrap .product{text-align: center; display: inline-block; margin: 10px 17px;}
        #section_wrap .product img{width: 300px;}
        #section_wrap .product a{text-decoration: none;}
        #section_wrap .product a p{margin: 5px; text-align: center; color: black; font-weight: bold;}
        #section_wrap .product a .p_price{font-weight: normal;}
        #topfooter { width: 1500px; height: 460px; display: flex; margin: 0 auto; }
	    #topfooter .footerone, .footertwo, .footerthree { list-style: none; width: 483px; height: 450px; text-align: center; border-top: 1px solid; margin: 15px; padding: 0; }
	    #topfooter .footerone li, .footertwo li, .footerthree li { width: 380px; height: 75px; margin: 1px auto; line-height: 75px; }
	    #topfooter .footerone li:nth-child(1), .footertwo li:nth-child(1), .footerthree li:nth-child(1) { margin-top: 20px; }
	    #topfooter .footerone li:nth-child(1) span, .footertwo li:nth-child(1), .footerthree li:nth-child(1) { color: red; }
	    #topfooter .footerone li:nth-child(3) p, .footertwo li:nth-child(2) p, .footerthree li:nth-child(2) p { margin: 0; line-height: 30px; }
	    #topfooter .footerone li:nth-child(3) p:nth-child(2), .footerone li:nth-child(3) p:nth-child(3) { font-size: 14px; }
	    #topfooter .footerone li:nth-child(3), .footertwo li:nth-child(2), .footerthree li:nth-child(2), .footerthree li:nth-child(3) { height: 110px; padding-top: 15px; }
	    #topfooter .footertwo li:nth-child(2) p:nth-child(3) { text-decoration: underline; }
	    #topfooter .footertwo input { width: 150px; height: 50px; border: 2px solid black; background: white; font-size: 12px; text-align: center; }
	    #topfooter .footertwo input:hover { cursor: pointer; background: black; color: white; }
	    #topfooter .footerthree li:nth-child(2) p:nth-child(1), .footerthree li:nth-child(2) p:nth-child(3) { font-size: 14px; }
	    #topfooter .footerthree li:nth-child(3) p { margin: 0; font-size: 13px; line-height: 30px; }
    </style>
</head>
<body>
	<div id="section_wrap">
		<c:forEach var="list" items="${list }">
	       	<div class="product">
	        	<a href="GetOne.do?p_no=${list.p_no }">
		        	<p><img src="img/${list.p_img }" alt="img"></p>
		        	<p class="p_name">${list.p_name }</p>
				    <p class="p_price"><fmt:formatNumber value="${list.p_price }" pattern="#,###" />��</p>
			    </a>
			</div>
	    </c:forEach>
	</div>
	<div id="topfooter">
    	<ul class="footerone">
    		<li><b><span>SHOWROOM</span> &amp; OFFICE</b></li>
            <li>����� ������ ������, 1F</li>
            <li>
                <p><b>BUSINESS HOURS</b></p>
                <p>tue &#45; sun / 2pm &#45; 7pm</p>
                <p>mon / OFF</p>
            </li>
        </ul>
        <ul class="footertwo">
            <li><b>CUSTOMER SERVICE</b></li>
            <li>
                <p>tue &#45; fri / 2pm &#45; 7pm</p>
                <p>sat &#45; mon, holiday / OFF</p>
                <p>�ָ� �� �������� �޹��Դϴ�.</p>
            </li>
            <li><b>��� ���Ǵ� Q &amp; A �Խ����� ���� ��Ź�帳�ϴ�.</b></li>
            <li>���� / ��ȭ ����� ���� �ʰ� �ֽ��ϴ�.</li>
            <li><input type="button" value="Q &amp; A �Խ��� �ٷΰ���" onclick="location.href='#'"></li>
        </ul>
        <ul class="footerthree">
            <li><b>BANK ACCOUNT</b></li>
            <li>
                <p>XX����</p>
                <p><b>XXXXXX&#45;XX&#45;XXXXXX</b></p>
                <p><b>XXX&#40;��ƴ&#41;</b></p>
            </li>
            <li>
                <p>�Ա��� 12�ð� �� Ȯ�� ���͵帮�� �ֽ��ϴ�.</p>
                <p>Ȯ���� �ʾ�������, ������ �ֹ��Ͻ� �ֹ��� �������</p>
                <p>�߼�ó�� �ǿ���, �� �� �������� �����ŵ� �˴ϴ�. �����մϴ�.</p>
            </li>
        </ul>
    </div>
</body>
</html>