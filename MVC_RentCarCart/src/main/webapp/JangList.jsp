<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
				<!-- 하나씩 처리해야 되니까 form 태그는 forEach 문 내부에 배치시킨다. -->
				<form action ="RentDeletePro.do" method="post">
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
						       <input type="button" value="-" class="minus" onclick="minusfn(${index})">
						       <input type="text" value="${jdto.cnt }" class="spancnt">
						       <input type="button" value="+" class="plus" onclick="plusfn(${index})">
						       <input type="hidden" name="no" value="${jdto.no}" class="carno" />
						    </div>
							<%-- <input type="text" value="${jdto.cnt }"  name="cnt"  size="2"  id="jangcnt">개         --%>      
							<!-- <input type="button" value="수정"  onclick="location.href='RentUpdate.do?no=${jdto.no }&cnt=${qty }'"> -->
							
							<!-- <input type="button" value="수정" onclick="fn_rentUpdate(this.form)" />  -->
						</td>
						<td align="center" width="50">${jdto.price }</td>
						<td align="center" width="50">${jdto.price * jdto.cnt }</td>
					</tr> 
			   </form>
			   <c:set var="index" value="${index = index + 1 }"/>
			</c:forEach>
			<tr height="40">
				<td align="center" colspan="6">
					<input type="submit"   value="삭제" class="bottombtn" >
					<input type="button"   value="목록보기" onclick="location.href='RentListPro.do'" class="bottombtn" >
				</td>
			 </tr>
		</table>
    </div>		
 		
 <script>
 	// 자바스크립트 변수는 JSP 변수(EL값)로 사용할 수 없어요.
 	// 반대로 JSP 변수는 자바스크립트에서 사용할 수 있어요.
 	// var qty = document.getElementById("jangcnt").value;
    // var cnt = qty;
    // console.log(cnt);
    
    let minus = document.querySelectorAll(".minus");
    let plus = document.querySelectorAll(".plus");
    let cntinput = document.querySelectorAll(".spancnt");
    let carNumber = document.querySelectorAll(".carno");
    let quantity = 1;
    console.log(minus);
    console.log(plus);
    
    function fn_rentUpdate(f) {
    	f.action = 'RentUpdate.do';
    	f.submit();  // 서브밋은 input들을 파라미터를 붙여서 보내니까 따로 안 보내도 된다.
    }

    // 마이너스 버튼 클릭시 수량 감소
    function minusfn(index){
    	if(cntinput[index].value == 1){
    		alert("최대 수량 : 1대 입니다.");
		}else{
			quantity--;
            cntinput[index].value = quantity;
            console.log(quantity);
		}
    }
    
    function plusfn(index){
    	if(cntinput[index].value >=1){
			   quantity++;
	           cntinput[index].value = quantity;
	           console.log(quantity);
			}
    }
    
    /* for(let i=0; i<minus.length; i++){
    	
    		minus[i].addEventListener("click",()=>{
    			if(cntinput[i].value >= 1){
    				quantity--;
                    cntinput[i].value = quantity;
                    console.log(quantity);
    			}else{
    				alert("최대 수량 : 1대 입니다.");
    			}
                
            })
    	
    }
    
    // 플러스 버튼 클릭시 수량 증가
    for(let i=0; i<plus.length; i++){
    	
    		plus[i].addEventListener("click",() =>{
    			if(cntinput[i].value >=1){
    			   quantity++;
     	           cntinput[i].value = quantity;
     	           console.log(quantity);
    			}
    	           
    	    })
        
    } */
    
 </script>
   
</body>
</html>