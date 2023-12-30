<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .jangList{
        margin: 10px auto;
        width: 800px;
        height: 650px;
    }
    h2{
        text-align: center;
    }
    .janglisttable{
       border-collapse: collapse;
    }
    .janglisttable .title{
      background: #eee;
      border-top: 2px solid black;
      border-bottom: 1px solid gray;
    }
    .janglisttable tr{
      border-bottom: 1px solid gray;
    }
    .cntcontainer{
       display : flex;
       justify-content: cneter;
       align-items: center;
       width : 114px;
    }
    .minus, .plus, .spancnt{
       margin : 0;
       background: transparent;
       cursor: pointer;
       border : none;
       border : 1px solid gray;
       font-size: 17px;
       text-align: center;
    }
    .minus{
       border-radius: 5px 0 0 5px;
    }
     .minus, .plus{
       width : 32px;
       height: 30px;
     }
     .plus{
       border-radius: 0 5px 5px 0;
     }
    .spancnt{
       width : 50px;
       height: 30px;
       border-left : none;
       border-right : none;
    }
    .bottombtn{
       width: 80px;
       height: 30px;
       cursor: pointer;
    }
</style>
</head>
<body>

   <div class="jangList">
       <h2>장바구니</h2>
    
		<table width="800"  class="janglisttable">
			<tr height="40" class="title">
				<td align="center"  width="10">체크</td>
				<td align="center" width="50">상품번호</td>
				<td align="center" width="50">상품명</td>
				<td align="center" width="50">상품수량</td>
				<td align="center" width="50">상품가격</td>
				<td align="center" width="50">총금액</td>
			</tr>
			<c:set var="index" value="0"/>
			<c:forEach var="jdto" items="${jalist}">
			  <form action ="RentDeleteJang.do" method="post">
				<!-- 하나씩 처리해야 되니까 form 태그는 forEach 문 내부에 배치시킨다. -->
					<tr height="40">
						<td align="center"  width="10">
							<input type="checkbox"  name="chk" value="${jdto.no}">
						</td>
						<td align="center" width="50" >${jdto.no }</td>
						<td align="center" width="50">
							<img alt="" src="img/${jdto.img }" width="60"  height="60">
						</td>
						<td align="center" width="50" >
						    <div class="cntcontainer">
						       <input type="button" value="-" class="minus" onclick="fn_update(false,${index},this.form)">
						       <input type="text"   name="cnt" value="${jdto.cnt }" class="spancnt" >
						       <input type="button" value="+" class="plus" onclick="fn_update(true,${index},this.form)">
						       <input type="hidden" name="no" value="${jdto.no}" class="carno" />
						    </div>
						</td>    
						<td align="center" width="50"><fmt:formatNumber value="${jdto.price }" pattern="#,##0" /></td>
						<td align="center" width="50" id="total"><fmt:formatNumber value="${jdto.price * jdto.cnt }" pattern="#,##0" /></td>
					</tr> 
					<c:set var="index" value="${index = index + 1}"/>
				</form>
			</c:forEach>
			<tr height="40">
				<td align="center" colspan="6">
					<input type="button"   value="선택삭제" class="bottombtn" onclick="fn_delete()">
					<input type="button"   value="목록보기" onclick="location.href='RentListPro.do'" class="bottombtn" >
					<input type="button"   value="주문하기" onclick="OrderList()" class="bottombtn" >
				</td>
			 </tr>
		</table>
    </div>		
  
 	<%-- <input type="text" value="${jdto.cnt }"  name="cnt"  size="2"  id="jangcnt">개         --%>      
	<!-- <input type="button" value="수정"  onclick="location.href='RentUpdate.do?no=${jdto.no }&cnt=${qty }'"> -->
	<%-- <input type="hidden" name="no" value="${jdto.no}" class="carno" /> --%>
	<!-- <input type="submit" value="수정" formaction="RentUpdate.do"/>  -->
	
		
 <script>
 
 	// 자바스크립트 변수는 JSP 변수(EL값)을 직접적으로는 사용할 수 없다.
 	// 반대로 JSP 변수는 자바스크립트에서 사용할 수 있다.
    let minus = document.querySelectorAll(".minus");
    let plus = document.querySelectorAll(".plus");
    let cntinput = document.querySelectorAll(".spancnt");
    let total = document.querySelectorAll("#total");
   
    // 자바스크립트에세 EL로 받아온 값을 변수로 사용하는 방법
	let loginId = "<c:out value='${rentlogin}' />";
	
	// 주문하기
    function OrderList(){
		
		// 주문하기전 로그인 확인 에러체크
    	if(loginId == ""){
    		// 로그인되면 메인화면, 아니면 Error.jsp로 이동하는 Servlet으로 이동
    		/* location.href='LoginOK.do'; */
    		
    		alert("로그인 후 사용하세요!");
    		location.href='RentcarMain.jsp?section=MemberLogin.jsp';	
    		
        }else {
    		let param="";
        	let chk_list = document.getElementsByName("chk");
        	
        	for(let i=0; i<chk_list.length; i++){
        		if(chk_list[i].checked){
        			param = (param + chk_list[i].value+" ");
        		}
        	}
    		
    		location.href='OrderListPro.do?chk='+param;
        }	
  }
	
    
    // 삭제 버튼을 클릭해도 삭제가 안되는 이유는 삭제버튼이 form태그 바깥쪽에 위치하기 때문이다.
    // 이를 해결하기 위해 자바스크립트에서 삭제함수를 만들어 사용한다.
    function fn_delete(){
    	let param="";
    	let chk_list = document.getElementsByName("chk");
    	
    	for(let i=0; i<chk_list.length; i++){
    		if(chk_list[i].checked){
    			param = (param + chk_list[i].value+" ");
    		}
    	}
    	
    	location.href='RentDeleteJang.do?chk='+param;
    } 
  
    	
    
    	
    
    // plus, minus버튼클릭시 수량 증가/감소 시킨다.
    // 증가/감소된 수량을 RentUpdate.do를 이용하여 데이터 베이스에 넘기는 함수
    // f는 this.form의 매개변수이다.
    function fn_update(isBool,i,f){
    	
    	if(isBool == false){
    		
    		if( parseInt(cntinput[i].value) > 1 ){
	    		 cntinput[i].value = parseInt(cntinput[i].value)-1;
			}else{
	            window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.");
			}
    		
    	}else {
    		
    		if( parseInt(cntinput[i].value) < 9999){
		           cntinput[i].value = parseInt(cntinput[i].value) + 1;
				}else{
					window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.");	
				}
    		
    	}
    	
    	f.action ='RentUpdate.do';
    	f.submit();
    }
    
    
    
    
    /* function fn_rentUpdate(f) {
    	f.action = "RentUpdate.do";
    	f.submit();  // 서브밋은 input들을 파라미터를 붙여서 보내니까 따로 안 보내도 된다.
    }  */
    
    
   /* for(let i=0; i<minus.length; i++){
	        // 마이너스 버튼 클릭시 수량 감소
    		minus[i].addEventListener("click",()=>{
    			if( parseInt(cntinput[i].value) > 1 ){
    	    		 cntinput[i].value = parseInt(cntinput[i].value)-1;
    			}else{
    	            window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.");
    			}
            })
            
            // 플러스 버튼 클릭시 수량 증가
            plus[i].addEventListener("click",() =>{
    			if( parseInt(cntinput[i].value) < 9999){
    		           cntinput[i].value = parseInt(cntinput[i].value) + 1;
    				}else{
    					window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.");	
    				}
    	    })
    	 
    } */ 
    
 
 </script>
   
</body>
</html>