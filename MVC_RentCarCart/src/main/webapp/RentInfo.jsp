<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<style>
<style type="text/css">
  .infocontainer{
        margin: 10px auto;
    }
    .infocontainer form{
       margin: 10px auto;
       width: 1000px;
       height: 650px;
    }
    input[type=submit], input[type=button]{
      width : 100px;
      height: 30px;
      text-align: center;
    }
</style>
</head>
<body>
   <div class="infocontainer">
    아이디 : ${rentlogin }
      <form action="JangProc.do"  method="post">
      <table width="1000">
        <tr height="100">
        <td align="center" colspan="3">
           <font size="5"   color="gray">${rdto.name } 차량 선택</font>
        </td>
        </tr>   
       <tr>
           <td rowspan="6"  width="500">
               <img alt="" src="img/${rdto.img }" width="450">
            </td>
             <td width="250"  align="center">차량이름</td>
              <td width="250"  align="center">${rdto.name }</td>  
          </tr>
           <tr>
                <td width="250"  align="center">차량수량</td>
                <td width="250"  align="center">
                <select name="cnt" id="cnt">
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3">3</option>
                </select>
                </td>
              </tr>
                 <td width="250"  align="center">대여가격</td>
                  <td width="250"  align="center">${rdto.price }원</td> 
               </tr>
               <tr>
                 <td width="250"  align="center">제조회사</td>
                  <td width="250"  align="center">${rdto.company }</td> 
               </tr>
                <tr>
                 <td align="center" colspan="2">
                   <input type="hidden"  name="no"  value="${rdto.no }">
                   <input type ="hidden"  name="img"  value="${rdto.img }" >
                   <input type ="hidden"  name="name"  value="${rdto.name }" >
                   <input type ="hidden"  name="price"  value="${rdto.price }" >
                   <input type ="hidden"  name="id"  value="${rentlogin }" >
                   <input type="button"   value="BUY NOW" onclick="BuyNow()" >
                   <input type="submit"   value="장바구니 담기">
                  <%--  <input type="button"   value="BUY NOW" onclick="location.href='RentcarMain.jsp?section=MemberLogin.jsp?no=${rdto.no}'"> --%>
                   <%-- <input type="button"   value="목록보기" onclick="location.href='RentListPro.do?category=${rdto.category}'"> --%>
                   <input type="button"  name="wish"  value="관심상품" onclick="location.href='WishListProc.do?no=${rdto.no }&img=${rdto.img }&name=${rdto.name }&price=${rdto.price }'">
                 </td>
                 </tr>
        </table>
      </form> 
   </div>
   <script type="text/javascript">
   
   /* 바로구매(BUYNOW)를 클릭 -> 로그인이 안되어 있으면 로그인하고 바로 구매서블릿으로 이동  */
   /* 로그인이 되어있을 때 바로구매하면 구매서블릿으로 이동 */
   
   // let cnt = document.querySelector("#cnt");
    let cnt = document.getElementsByName("cnt")[0];
    let cntvalue;
    let loginId = "<c:out value='${rentlogin}' />";
    let chk = "<c:out value='${rdto.no}' />";
    /* 	cnt.addEventListener("change", () =>{
        	cntvalue = cnt.options[cnt.selectedIndex].value;
        }) */
    
    // jQuery로 해당 셀렉트 박스에 change event binding 하기
   $(function(){
	  /* 제일 첫번째 옵션의 값을 가저오는 방법 */
	   cntvalue = $("select[name=cnt] option:eq(0)").val();
	  /* select의 옵션의 값을 변경할때 마다 변경하는 값을 가저오는 방법 */
       $("select[name=cnt]").change(function(){
    	  cntvalue != $(this).val();
    	  cntvalue = $(this).val();
       })
    })
  
    function BuyNow(){
   
        if(loginId == ""){
        	alert("로그인 후 사용하세요!");
    		location.href='RentcarMain.jsp?section=MemberLogin.jsp?chk='+chk + '&cnt='+cntvalue ;	
        }else{
        	location.href='OrderListPro.do?chk='+chk + '&loginId='+loginId + '&cnt='+cntvalue;
        }
    }
   
   </script>
</body>
</html>