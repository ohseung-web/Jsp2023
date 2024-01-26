<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<style type="text/css">
  Header{
    height: 110px;
    width : 100%;
    border-bottom: 1px solid lightgray;
  }
    .headerWrap{
    width:1000px;
    margin: 0 auto;
  } 
  #navi{
    border:none;
    border-collapse: collapse;
  }
  .nav{
    font-size: 16px;
    font-weight: bold;
  }
  a{
     display:inline-block;
     width : 70px;
  }
  .nav:hover::after{
     content: '';
     display: block;
     background: #222;
     height: 5px;
     width:70px;
     position: absolute;
     bottom: 1px;
  }
  .logout{
     display:flex;
     justify-content: center;
     align-items: center;
      width: 200px;
      height: 35px;
  }
  .userlogin a{
      display: inline-block;
      width : 150px;
      font-size: 15px;
      margin-right: 5px;
      width:100px;
  }
   .userlogin a{
     text-decoration: none; color: black;
  }
  #cartCount{
    width : 20px;
    height: 20px;
    border : none; 
  }
  #cartCount.addcount{
     border-radius: 50%;
     background: black;
     color:#eee;
     line-height: 20px;
     font-size : 12px;
     text-align: center;
  }
  #cartCount.removecount{
    display : none;
    color:white;
  }
  .cartnav{
    display: inline-block;
    width : 80px; 
  }
</style>
</head>
<body>

<Header>
<div class="headerWrap">
   <table width="1000" id="navi">
     <tr height="70">
        <td colspan="4" align="left"><a href="RentcarMain.jsp" ><img src="img/sk_logo.png" height="65"></a></td>
        <td align="center" width="200">
        <!-- 로그인이 null이면 id = geust로 저장하는 부분 -->
        <%-- <c:if test="${rentlogin == null }">
           <c:set var="rentlogin" value="${rentlogin = 'geust'}"/>
        </c:if>
        ${rentlogin } --%>
        <c:choose>
           <c:when test="${rentlogin == null}">
            <button type="button" onclick="location.href='RentcarMain.jsp?section=MemberLogin.jsp'">로그인</button>   
           </c:when>
           <c:otherwise>
              ${rentlogin }님
            <!--  <div class="logout"> -->
              <%-- <span class="userlogin"><a href="LoginOK.do">${rentlogin }님</a></span> --%>
              <button class="logoutbtn" type="button" onclick="location.href='MemberLogoutProc.do'">로그아웃</button>   
             <!-- </div>  -->
           </c:otherwise>
        </c:choose>      
        </td>
     </tr>
     <tr height="50">
        <td align="center" width="200" >
           <a href="RentListPro.do?category=1" class="nav">소형차</a>
        </td>
        <td align="center" width="200">
           <a href="RentListPro.do?category=2" class="nav">중형차</a>
        </td>
        <td align="center" width="200" >
           <a href="RentListPro.do?category=3" class="nav">대형차</a>
        </td>
        <td align="center" width="200" >
          <a href="JangProc.do" class="nav cartnav">장바구니</a><input type="text" id="cartCount" name="cartCount" value="${rentCount}">
        </td>
        <td align="center" width="200" >
           <a href="WishListProc.do" class="nav cartnav">최근본상품</a>
        </td>
     </tr>
   </table>
</div>
</Header>
  <script type="text/javascript">
  
    let count ="<c:out value='${rentCount}'/>";
    let rentJangCount = document.querySelector("#cartCount");
  
    if(count == 0){
    	rentJangCount.classList.add('removecount');
    }else{
    	rentJangCount.classList.add('addcount');
    }
    
  </script>
</body>
</html>