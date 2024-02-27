<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<script src="https://kit.fontawesome.com/82fd850f0d.js" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<style>
.headerContainer{
    display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
    background-color: #fff;
    border: 0;
    border-bottom: 1px solid #e8e8e8;
    position: relative;
    z-index: 998;
}
.headerContainer .headerContainerWrap{
    max-width: 1480px;
    width: 92%;
    position: relative;
}
.headerContainer .headerContainerWrap .top_area{
    display: flex;
    justify-content: flex-end;
    align-items: center;
    width: 100%;
    height: 70px;
}
.headerContainer .headerContainerWrap .top_area .top_util{
    display: flex;
}
.headerContainer .headerContainerWrap .top_area .top_util li a{
    margin-left: 15px;
    font-size: 13px;
    color: #666;
}
/* .headerContainer .headerContainerWrap .top_area .top_util .board a i{
    display: inline-block;
    overflow: hidden;
    width: 5px;
    height: 5px;
    margin-left: 10px;
    text-indent: 120%;
    white-space: nowrap;
} */
/* .headerContainer .headerContainerWrap .top_area .top_util .board a i:before{
	width: 5px;
    height: 5px;
} */
/* .headerContainer .headerContainerWrap .top_area .top_util .board.on a i{
    margin-top: 4px;
    transform: rotate(180deg);
} */
.headerContainer .headerContainerWrap .top_area .top_util .board .fa-solid {
    /* transform:scaleY(-1); */
    /* transform:rotate(-180deg); */
    transition:transform 0.3s; 
}
.headerContainer .headerContainerWrap .top_area .top_util .board.on .fa-solid {
    /* transform:scaleY(-1); */
    transform:rotate(180deg);
    transition:transform 0.3s; 
}
.headerContainer .headerContainerWrap .top_area .top_util .board.on ul{
    display: block;
}
.headerContainer .headerContainerWrap .top_area .top_util .board ul{
    display: none;
    position: absolute;
    top: 60px;
    right: -33px;
    z-index: 1;
    width: 170px;
    padding: 28px 25px 8px;
    background-color: #fff;
    box-shadow: 5px 3px 20px rgba(0,0,0,0.05);
}
.headerContainer .headerContainerWrap .top_area .top_util .board ul li{
    position: relative;
    padding-bottom: 20px;
}
.headerContainer .headerContainerWrap .top_area .top_util .board ul li a{
    display: block;
    overflow: hidden;
    font-size: 13px;
    color: #888;
    font-weight: 300;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.headerContainer .headerContainerWrap .top_area .top_util .board ul li a:hover{
    color: #dcc1a6;
}
.headerContainer .headerContainerWrap .top_nav_box{
    position: relative;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-wrap: wrap;
}
.headerContainer .headerContainerWrap .top_nav_box .top_logo{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 80px;
}
.headerContainer .headerContainerWrap .top_nav_box .top_logo img{
    width: 272px;
    height: 60px;
}
.headerContainer .headerContainerWrap .top_nav_box .top_category{
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    margin: 0 165px;
}
.headerContainer .headerContainerWrap .top_nav_box .top_category ul{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}
.headerContainer .headerContainerWrap .top_nav_box .top_category ul li{
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80px;
    padding: 0 15px;
}
.headerContainer .headerContainerWrap .top_nav_box .top_category ul li a{
    display: block;
    font-size: 15px;
    font-weight: 400;
    line-height: 76px;
    color: #1a1a1a;
    white-space: nowrap;
}
.headerContainer .headerContainerWrap .top_nav_box .top_category ul li a::after{
	content: "";
    position: relative;
    display: block;
    bottom: 15px;
    width: 100%;
    height: 2px;
    background-color: #d0ac88;
    transform: scaleX(0);
    transform-origin: 100% 0;
    transition: transform 0.3s;
    transition-timing-function: cubic-bezier(.45,.46,.05,.96);
}
.headerContainer .headerContainerWrap .top_nav_box .top_category ul li.on a::after{
    transform: scaleX(1);
    transform-origin: 0 0;
    transition: transform 0.5s;
}
.headerContainer .headerContainerWrap .top_nav_box .top_mypage{
    position: absolute;
    top: 80px;
    right: 0;
    display: flex;
    align-items: center;
    height: 80px;
}
.headerContainer .headerContainerWrap .top_nav_box .top_mypage li{
    position: relative;
    display: flex;
    height: 100%;
}
.headerContainer .headerContainerWrap .top_nav_box .top_mypage li a{
    position: relative;
    display: flex;
    align-items: center;
    font-size: 16px;
    font-weight: 400;
    color: #1a1a1a;
    padding: 0 16px;
}
.headerContainer .headerContainerWrap .top_nav_box .top_mypage li a .cartCount{
    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    top: 40px;
    right: 8px;
    width: 18px;
    height: 18px;
    margin-left: 5px;
    border-radius: 50%;
    background-color: #000;
    color: #fff;
    text-align: center;
    line-height: 1;
    font-size: 12px;
}
.headerContainer .headerContainerWrap .top_nav_box .top_mypage li button{
    position: relative;
    display: flex;
    align-items: center;
    font-size: 16px;
    font-weight: 400;
    border: 0;
    color: #1a1a1a;
    background-color: #fff;
    padding: 0 16px;
    cursor: pointer;
}
/* modal CSS 시작  */
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
    /*  opacity: 0; */
    display: none; 
     transition: 0.7s;
   /* 화면에 보이지 않게 지정*/
    background: white;
   }
   .searchcontainer.on{
      /* opacity : 1; */
      display : block;
      z-index: 1000;
   }
   .searchcontainer .search_Wrap{
     width: calc(100% - 100px);
     height: calc(100% - 100px);
     top: 50%;
     left: 50%;
     transform: translate(-50%,-50%);
     position : relative;
   }
   .searchcontainer .search_Wrap #closebtn{
     width:80px;
     height: 80px;
     border:none;
     background:transparent;
     position: absolute;
     top: 40px;
     right: 0px; 
     cursor: pointer;
   }
   .searchcontainer .search_Wrap .search_box{
     width : calc(100% - 900px);
     /* width: 800px;  */
     height: 194px;
     position: absolute;
     top : 50%;
     left : 50%;
     transform: translate(-50%,-50%);
   }
   .searchcontainer .search_Wrap .search_box p {
     margin: 0 0 64px;
     font-size: 40px;
     /* font-weight: 300; */
     /* color: #575757; */
     color: gray;
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
     width: 40px;
     height: 40px;
     top : 0;
     right : 0;
     border: none;
     background : transparent;
     cursor: pointer;
   }
   .searchcontainer .search_Wrap .search_box .search #searchbtn i{
      font-size: 40px;
   }
   .overlay{
     background-color: white;
     position: fixed;
     width: 100%;
     height: 100vh;
     top: 0;
     left: 0;
     opacity: 0;
     visibility: hidden;
   }
  .overlay.on{
    opacity: 1;
    visibility: visible;
    z-index: 999;
   }
   /* input 커서를 클릭시 placeholder의 문자가 사라지게 하는 CSS */
   .searchcontainer .search_Wrap .search_box input::placeholder{
      color : lightgray;
      font-size: 35px;
   }
   .searchcontainer .search_Wrap .search_box input:focus::placeholder{
      visibility: hidden;
   }
   /* 스크롤은 안보이고 스크롤기능은 실행됨 */
   /* body::-webkit-scrollbar{display: none;} */
   /* 화면에 스크롤바 감추기 css */
  .scrollStop {
    height: 100%;
    overflow: hidden;
   }
  /* modal CSS 종료  */
</style>
</head>
<body>
<div class="headerContainer">
    <div class="headerContainerWrap">
        <div class="top_area">
            <ul class="top_util">
            	<c:choose>
            		<c:when test="${loginId != null}">
            			<li class="join"><a href="MemberModify.do">내정보수정</a></li>
                		<li class="login"><a href="MemberLogoutProc.do">로그아웃</a></li>
            		</c:when>
            		<c:otherwise>
            			<li class="join"><a href="Main.jsp?section=MemberJoin.jsp" style="font-weight: bold;
                    	color: rgb(194, 107, 107);">회원가입</a></li>
                		<li class="login"><a href="Main.jsp?section=MemberLogin.jsp">로그인</a></li>
            		</c:otherwise>
            	</c:choose>
                <li class="order"><a href="MyShopOrder.do">주문조회</a></li>
                <c:if test="${loginId != null}">
                	<li class="mypage"><a href="MyShop.do">마이페이지</a></li>
                </c:if>
                <li class="recent"><a href="#">최근본상품</a></li>
                <li class="board">
                    <a href="#" style="font-weight: bold;">
                        고객센터
                        <i class="fa-solid fa-angle-down" aria-hidden="false"></i>
                    </a>
                    <ul class="boardinfo">
                        <li><a href="ReviewBoardList.do">상품 리뷰</a></li>
                        <li><a href="InquiryBoardList.do">상품 문의</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="top_nav_box">
            <div class="top_logo"><a href="MainList.do"><img src="img/logo/logo_top.jpg" alt="리빙앤트리"></a></div>
            <div class="top_category">
                <ul>
                    <li><a href="LivProductListProc.do?p_category=1">기획전</a></li>
                    <li><a href="LivProductListProc.do?p_category=2">모음전</a></li>
                    <li><a href="LivProductListProc.do?p_category=3">리빙박스</a></li>
                    <li><a href="LivProductListProc.do?p_category=4">서랍장</a></li>
                    <li><a href="LivProductListProc.do?p_category=5">휴지통</a></li>
                    <li><a href="LivProductListProc.do?p_category=6">바스켓</a></li>
                    <li><a href="LivProductListProc.do?p_category=7">생활용품</a></li>
                    <li><a href="LivProductListProc.do?p_category=8">기타용품</a></li>
                    <li><a href="LivProductListProc.do?p_category=9">부속제품</a></li>
                    <li><a href="ReviewBoardList.do">상품리뷰</a></li>
                </ul>
            </div>
            <ul class="top_mypage">
                <li>
                    <a href="Main.jsp?section=MemberLogin.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon" role="img">
                            <circle cx="11.5" cy="6.5" r="3.75" stroke="#000" stroke-width="1.5"></circle>
                            <path stroke="#000" stroke-width="1.5" d="M1.78 21.25c.382-4.758 4.364-8.5 9.22-8.5h1c4.856 0 8.838 3.742 9.22 8.5H1.78z"></path>
                        </svg>
                    </a>
                </li>
                <li>
                    <a href="CartProc.do">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon" role="img">
                            <path fill="#000" d="M23.073 22.253l-1.946-14.31c-.04-.38-.368-.667-.758-.667h-3.656v-1.74c0-2.543-2.115-4.613-4.713-4.613-2.599 0-4.713 2.07-4.713 4.613v1.74H3.63c-.39 0-.717.288-.758.667L.927 22.253c-.022.21.047.42.192.577.144.157.35.247.566.247h20.63c.216 0 .421-.09.566-.247.145-.157.214-.366.192-.576zM8.81 5.537c0-1.72 1.431-3.122 3.19-3.122 1.758 0 3.19 1.401 3.19 3.122v1.74H8.81v-1.74zm-6.28 16.05l1.786-12.82h2.97v1.644c0 .412.342.746.762.746.421 0 .762-.334.762-.746V8.767h6.38v1.643c0 .412.34.746.761.746.42 0 .762-.334.762-.746V8.767h2.97l1.786 12.819H2.53z"></path>
                        </svg>
                        <c:if test="${cartCount != null && cartCount > 0}">
                            <span class="cartCount">${cartCount}</span>
                        </c:if>
                    </a>
                </li>
                <li id="modal">
                    <button type="button" id="modalbtn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon" role="img">
                            <path stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11 19c4.418 0 8-3.582 8-8s-3.582-8-8-8-8 3.582-8 8 3.582 8 8 8z"></path>
                            <path stroke="#000" stroke-linejoin="round" stroke-width="1.5" d="M22 22l-5-5"></path>
                        </svg>
                    </button>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- modal search창 만들기 -->
<div class="searchcontainer">
     <div class="search_Wrap">
      <button type="button" id="closebtn"><img alt="closebtn" src="img/icon/close.png"></button>
      <div class="search_box">
          <p>Find Product</p>
          <div class="bottom_search_box">
           <form action="SearchProductProc.do" method="post" name="formname2">
            <div class="search">
               <input type="text" name="keyword" id="keyword" placeholder="좁은 공간 틈새 수납해보세요">
               <button type="button"  id="searchbtn">
                   <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none" viewBox="0 0 24 24" class="icon" role="img">
                     <path stroke="#575757" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11 19c4.418 0 8-3.582 8-8s-3.582-8-8-8-8 3.582-8 8 3.582 8 8 8z"></path>
                     <path stroke="#575757" stroke-linejoin="round" stroke-width="1.5" d="M22 22l-5-5"></path>
                   </svg>
                </button>   
             </div>
            </form> 
          </div>
       </div>
     </div>
  </div>
 <div class="overlay"></div>   
<script>
    $(function(){
        $('.headerContainer .headerContainerWrap .top_area .top_util .board a').click(function(){
            $('.headerContainer .headerContainerWrap .top_area .top_util .board').toggleClass('on');
        })
        
        $('.headerContainer .headerContainerWrap .top_area .top_util .board ul').click(function(){
            $('.headerContainer .headerContainerWrap .top_area .top_util .board').removeClass('on');
        })

        $('.headerContainer .headerContainerWrap .top_nav_box .top_category ul li').mouseenter(function(){
            $(this).addClass('on');
        })

        $('.headerContainer .headerContainerWrap .top_nav_box .top_category ul li').mouseleave(function(){
            $(this).removeClass('on');
        })
        
         /* modal창 화면에 보이기/숨기기 */
        $('.headerContainer .headerContainerWrap .top_nav_box .top_mypage li #modalbtn').click(function(){
            $('.searchcontainer').addClass('on');
            $('.overlay').addClass('on');
            /* 검색버튼 클릭하면 스크롤바감추고 스크롤 기능도 멈춤 */
            $('body').addClass('scrollStop');
        })
        $('#closebtn').click(function(){
            $('.searchcontainer').removeClass('on');
            $('.overlay').removeClass('on');
            /* 종료버튼 클릭하면 스크롤바 감추기 해제 */
            $('body').removeClass('scrollStop');
        })
        /* 모달창에서 상품검색한 자료 SearchProductProc.do로 전송  */
        $('.searchcontainer .search_Wrap  .search_box .bottom_search_box .search #searchbtn').click(function(){
        	formname2.submit();
        })
    })
</script>
</body>
</html>