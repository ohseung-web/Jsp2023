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
    //1. 넘겨받은 값 추출
    int coffee = Integer.parseInt(request.getParameter("coffee"));
    int su = Integer.parseInt(request.getParameter("su"));
    int money = Integer.parseInt(request.getParameter("money"));
   
    //2. 계산처리
    String menu = ""; //음료명
    int dan = 0; //1개 가격
    int total = 0; //총 금액
    int change = 0; //거스름돈
   
    //메뉴에 따라 가격 설정
    switch (coffee) {
    case 1 : menu = "아메리카노"; dan=3000; break;
    case 2 : menu = "카페라떼"; dan=3300; break;
    case 3 : menu = "에스프레소"; dan=2500; break;
    case 4 : menu = "얼그레이"; dan=3500; break;
    }
   
    //총금액
    total = dan * su;
    change = money - total;
   
%>

     <h2>주문계산 결과</h2>
         <ul>
            <li>커피종류 : <%=menu %></li>
            <li>1개 가격 : <%=dan %></li>
            <li>수량 : <%=su %></li>
            <li>총 금액 : <%=total %></li>
            <li>입금액 : <%=money %></li>
            <li>거스름돈 : <%=change %></li>
         </ul>
    

</body>
</html>