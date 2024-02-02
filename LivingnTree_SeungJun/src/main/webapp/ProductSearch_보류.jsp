<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .searchcontainer{
    width: calc(100% - 100px);
    height: calc(100% - 100px);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    border: 1px solid #9a9a9a;
   }
   .searchcontainer.on{
      display : none;
   }
   .searchcontainer .search_Wrap{
     width: calc(100% - 100px);
     height: calc(100% - 100px);
     position : relative;
   }
   .searchcontainer .search_Wrap #closebtn{
     width:80px;
     height: 80px;
     border:none;
     background:transparent;
     position: absolute;
     top: 10px;
     right:10px; 
     cursor: pointer;
   }
   .searchcontainer .search_Wrap .search_box{
     width : 800px;
     height: 194px;
     position: absolute;
     top : 50%;
     left : 50%;
     transform: translate(-50%,-50%);
   }
   .searchcontainer .search_Wrap .search_box p {
     margin: 0 0 64px;
     font-size: 40px;
     font-weight: 300;
     color: #575757;
     letter-spacing: -0.005em;
   }
   .searchcontainer .search_Wrap .search_box #keyword{
    width: 800px;
    height: 70px;
    flex: 1;
    font-size: 32px;
    font-weight: 300;
    height: 100%;
    color: #9a9a9a;
    border: none;
    border-bottom: 1px solid lightgray;
    outline: none;
    position : relative;
     padding-bottom: 10px;
   }
   .searchcontainer .search_Wrap .search_box .search{
      position: relative;
   }
   .searchcontainer .search_Wrap .search_box .search #searchbtn{
     position : absolute;
     top : 0;
     right : 0;
     border: none;
     background : transparent;
     cursor: pointer;
   }
   /* input 커서를 클릭시 placeholder의 문자가 사라지게 하는 CSS */
   .searchcontainer .search_Wrap .search_box input:focus::placeholder{
      visibility: hidden;
   }
</style>
</head>
<body>
  <div class="searchcontainer">
     <div class="search_Wrap">
      <button type="button" id="closebtn"><img alt="closebtn" src="img/icon/close.png"></button>
      <div class="search_box">
          <p>Find Product</p>
          <div class="bottom_search_box">
            <div class="search">
               <input type="text" name="keyword" id="keyword" placeholder="좁은 공간 틈새 수납해보세요">
               <button type="button" onclick="" id="searchbtn">
                   <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none" viewBox="0 0 24 24" class="icon" role="img">
                     <path stroke="#575757" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11 19c4.418 0 8-3.582 8-8s-3.582-8-8-8-8 3.582-8 8 3.582 8 8 8z"></path>
                     <path stroke="#575757" stroke-linejoin="round" stroke-width="1.5" d="M22 22l-5-5"></path>
                   </svg>
               </button>
             </div>
          </div>
       </div>
     </div>
  </div>
  <!-- javaScript -->
  <script type="text/javascript">
     /* let closebtn = document.querySelector("#closebtn");
     let searchcontainer = document.querySelector(".searchcontainer");
     
     closebtn.addEventListener('click',()=>{
    	 searchcontainer.classList.add('on');
    	 location.href="Main.jsp";
     }) */
     
    /*  
     $(function(){
    	 $('#closebtn').click(function(){
    		 $('.searchcontainer').addClass('active');
    	 })
     }) */
  
  </script>
</body>
</html>