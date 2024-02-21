<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<style>
.headerContainer{
	border-bottom: 0 !important;
}
.sectionContainer{
    width: 100%;
    background-color: #fff;
    position: relative;
    margin: 0 auto;
}
/* .sectionContainer .sectionContainerWrap{
    max-width: 1480px;
    width: 92%;
    position: relative;
} */
.sectionContainer > div{
	margin: 0 auto 120px;
}
.sectionContainer .main_banner{
    position: relative;
    overflow: hidden;
    width: 1920px;
    /* height: calc(100vh - 230px); */
    height: 760px;
    /* height: auto; */
}
.sectionContainer .main_banner .banner_slider{
    width: 100%;
    position: relative;
    visibility: visible;
}
.sectionContainer .main_banner .banner_slider li{
    float: none;
    position: absolute;
    display: block;
    z-index: 50;
    opacity: 0;
    visibility: hidden;
    transition: all 1s;
}
.sectionContainer .main_banner .banner_slider li.on{
    z-index: 50;
    display: block;
    opacity: 1;
    visibility: visible;
    transition: all 1s;
}
.sectionContainer .main_banner .banner_slider li a{
    cursor: pointer;
}
.sectionContainer .main_banner img{
    width: 100%;
    height: auto;
    display: block;
    object-fit: cover;
}
.sectionContainer .main_banner .banner_pager{
    position: absolute;
    bottom: 20px;
    width: 100%;
    z-index: 100;
    padding-top: 20px;
    text-align: center;
}
.sectionContainer .main_banner .banner_pager .banner_pager_item{
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 0 5px;
    background-color: rgba(0, 0, 0, 0.2);
    border-radius: 50%;
    cursor: pointer;
}
.sectionContainer .main_banner .banner_pager .banner_pager_item.on{
    background-color: rgba(0, 0, 0, 0.8);
}
.sectionContainer .main_product_list{
    max-width: 1480px;
    width: 92%;
}
.main_title{
    margin-bottom: 50px;
}
.main_title .title{
    position: relative;
    padding-top: 20px;
    font-size: 30px;
    font-weight: 500;
    color: #000;
}
.main_title .title::after{
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 20px;
    height: 2px;
    background: #d0ac88;
}
.main_title .subtitle{
    font-size: 14px;
    font-weight: 300;
    color: #888;
    margin-top: 12px;
}
.sectionContainer .main_product_list .product_list .product{
    margin-top: 22px;
}
.sectionContainer .main_product_list .product_list .product .prdList{
	display: flex;
}
.sectionContainer .main_product_list .product_list .product .prdList li{
    width: 25%;
    margin-bottom: 70px;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item{
    margin: 0 10px;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .thumbnail{
    position: relative;
    margin-bottom: 10px;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .thumbnail a img{
    width: 100%;
    max-width: 100%;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .thumbnail .icon_box{
    opacity: 0;
    position: absolute;
    top: inherit;
    bottom: 0%;
    left: 0%;
    z-index: 2;
    width: 100%;
    height: 12%;
    background: rgba(1,1,1,0.5);
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    transition: all 0.3s;
}
.sectionContainer .main_product_list .product_list .product .prdList li:hover .prdList_item .thumbnail .icon_box{
    opacity: 1;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .thumbnail .icon_box .cart{
    display: block;
    position: relative;
    font-size: 14px;
    font-weight: 500;
    color: #fff;
    background-color: transparent;
    border-top: 1px solid transparent;
    border-bottom: 1px solid #fff;
    box-sizing: border-box;
    cursor: pointer;
    margin: 0 10px;
    width: auto;
    height: auto;
    padding: 5px;
    transition: all 0.3s;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .thumbnail .icon_box .cart:hover{
    border-top: 1px solid #fff;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description{
    margin-top: 30px;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description .name{
    display: block;
    font-weight: normal;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description .name a{
    font-size: 13px;
    color: #000;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description .spec{
    margin-top: 10px;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description .spec div{
    margin-bottom: 5px;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description .spec .price span{
    font-size: 16px;
    color: #000;
    font-weight: bold;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description .spec .mileage span{
    font-size: 12px;
    color: #555;
}
.sectionContainer .main_product_list .product_list .product .prdList li .prdList_item .description .spec .mileage span img{
    width: 11px;
    height: 11px;
    margin-bottom: 2px;
}
.sectionContainer .main_product_list .product_list .more{
    text-align: center;
}
.sectionContainer .main_product_list .product_list .more .btnMore{
    display: inline-block;
    min-width: auto;
    padding: 23px 165px;
    border: 2px solid #e5e5e5;
    text-align: center;
    transition: all 400ms;
    font-size: 20px;
    font-weight: 300;
    color: #000;
    background-color: #fff;
}
.sectionContainer .main_product_list .product_list .more .btnMore:hover{
    border: 2px solid #bbb;
}
.sectionContainer .main_image_gallery{
    max-width: 1480px;
    width: 92%;
}
.sectionContainer .main_image_gallery .main_image_list{
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
}
.sectionContainer .main_image_gallery .main_image_list li{
    flex: 0 1 33.3334%;
    max-width: 500px;
    margin-bottom: 30px;
    padding: 0 10px 
}
.sectionContainer .main_image_gallery .main_image_list li a{
    position: relative;
    display: block;
    text-align: center;
}
.sectionContainer .main_image_gallery .main_image_list li a img{
    position: relative;
    overflow: hidden;
    display: block;
    width: 100%;
    height: 100%;
}
.sectionContainer .main_image_gallery .main_image_list li a .main_3dan_banner_txt{
    position: absolute;
    bottom: 0;
    right: 0;
    margin-left: 60px;
    padding: 35px 0 20px 35px;
    background-color: #fff;
    text-align: left;
}
.sectionContainer .main_image_gallery .main_image_list li a .main_3dan_banner_txt .txt{
    font-size: 26px;
    font-weight: 500;
    line-height: 1.2;
    color: #000;
}
.sectionContainer .main_image_gallery .main_image_list li a .main_3dan_banner_txt .more{
    font-size: 16px;
    font-weight: 300;
    line-height: 1.5;
    color: rgb(51, 51, 51);
    margin-top: 20px;
}
.sectionContainer .main_image_gallery .main_image_list li a:hover .main_3dan_banner_txt .more{
    text-decoration: underline;
}
.sectionContainer .main_product_category{
    display: flex;
    max-width: 1480px;
    width: 92%;
}
.sectionContainer .main_product_category .main_product_inner{
    display: flex;
    justify-content: flex-start;
    flex-direction: column;
    width: 24%;
    margin: 0 1% 30px 0;
}
.sectionContainer .main_product_category .main_product_inner .main_product_tab{
    display: flex;
    flex-wrap: wrap;
}
.sectionContainer .main_product_category .main_product_inner .main_product_tab li{
    width: 50%;
    margin-bottom: 40px;
}
.sectionContainer .main_product_category .main_product_inner .main_product_tab li button{
    overflow: visible;
    border: 0;
    outline: none;
    font-size: 20px;
    font-weight: 300;
    color: #000;
    background: none;
    cursor: pointer;
}
.sectionContainer .main_product_category .main_product_inner .main_product_tab li button.on{
    font-weight: 500;
    color: #d0ac88;
}
.sectionContainer .main_product_category .main_product_inner .main_product_tab li button::after{
    content: "";
    position: relative;
    display: block;
    bottom: -8px;
    width: 100%;
    height: 2px;
    background-color: #d0ac88;
    transform: scaleX(0);
    transform-origin: 100% 0;
    transition: transform 0.3s;
    transition-timing-function: cubic-bezier(.45,.46,.05,.96);
}
.sectionContainer .main_product_category .main_product_inner .main_product_tab li button.on::after{
    transform: scaleX(1);
    transform-origin: 0 0;
    transition: transform 0.5s;
}
.sectionContainer .main_product_category .content_list{
    width: 75%;
}
.sectionContainer .main_product_category .content_list .tabcontent{
    display: none;
}
.sectionContainer .main_product_category .content_list .tabcontent.on{
    display: block;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList{
    position: relative;
    display: flex;
    width: 100%;
    height: auto;
    z-index: 1;
    text-align: left;
    box-sizing: content-box;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li{
    width: 25%;
    margin-bottom: 30px;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item{
    margin: 0 10px;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .thumbnail{
    position: relative;
    margin-bottom: 10px;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .thumbnail a img{
    width: 100%;
    max-width: 100%;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .thumbnail .icon_box{
    opacity: 0;
    position: absolute;
    top: inherit;
    bottom: 0%;
    left: 0%;
    z-index: 2;
    width: 100%;
    height: 12%;
    background: rgba(1,1,1,0.5);
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    transition: all 0.3s;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li:hover .prdList_item .thumbnail .icon_box{
    opacity: 1;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .thumbnail .icon_box .cart{
    display: block;
    position: relative;
    font-size: 14px;
    font-weight: 500;
    color: #fff;
    background-color: transparent;
    border-top: 1px solid transparent;
    border-bottom: 1px solid #fff;
    box-sizing: border-box;
    cursor: pointer;
    margin: 0 10px;
    width: auto;
    height: auto;
    padding: 5px;
    transition: all 0.3s;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .thumbnail .icon_box .cart:hover{
    border-top: 1px solid #fff;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description{
    margin-top: 30px;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description .name{
    display: block;
    font-weight: normal;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description .name a{
    font-size: 13px;
    color: #000;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description .spec{
    margin-top: 10px;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description .spec div{
    margin-bottom: 5px;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description .spec .price span{
    font-size: 16px;
    color: #000;
    font-weight: bold;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description .spec .mileage span{
    font-size: 12px;
    color: #555;
}
.sectionContainer .main_product_category .content_list .tabcontent .prdList li .prdList_item .description .spec .mileage span img{
    width: 11px;
    height: 11px;
    margin-bottom: 2px;
}
.sectionContainer .main_text{
    max-width: 1480px;
    width: 92%;
    background-color: rgb(250, 247, 243);
}
.sectionContainer .main_text .main_long_banner{
    padding: 56px 45px;
}
.sectionContainer .main_text .main_long_banner .main_long_banner_txt01{
    font-size: 22px;
    font-weight: 500;
    color: #000;
    margin-bottom: 25px;
}
.sectionContainer .main_text .main_long_banner .main_long_banner_txt02 p{
    font-size: 14px;
    font-weight: 300;
    color: #777;
    line-height: 1.5em;
}
.sectionContainer .main_text .main_long_banner .main_long_banner_link a{
    display: inline-block;
    font-size: 12px;
    font-weight: 300;
    line-height: 1;
    margin-top: 30px;
    padding-bottom: 5px;
    border-bottom: 1px solid #777;
    color: #777;
}
</style>
</head>
<body>
    <div class="sectionContainer">
		<div class="main_banner">
            <ul class="banner_slider">
                <li class="on"><a href="#"><img src="img/banner/main_banner_01.jpeg"></a></li>
                <li><a href="#"><img src="img/banner/main_banner_02.jpeg"></a></li>
                <li><a href="#"><img src="img/banner/main_banner_03.jpeg"></a></li>
                <li><a href="#"><img src="img/banner/main_banner_04.jpeg"></a></li>
                <li><a href="#"><img src="img/banner/main_banner_05.jpeg"></a></li>
                <li><a href="#"><img src="img/banner/main_banner_06.jpeg"></a></li>
                <li><a href="#"><img src="img/banner/main_banner_07.jpeg"></a></li>
            </ul>
            <div class="banner_pager">
                <div class="banner_pager_item on"></div>
                <div class="banner_pager_item"></div>
                <div class="banner_pager_item"></div>
                <div class="banner_pager_item"></div>
                <div class="banner_pager_item"></div>
                <div class="banner_pager_item"></div>
                <div class="banner_pager_item"></div>
            </div>
		</div>
		<div class="main_product_list">
        	<div class="main_title">
            	<div class="title">Hot Sale</div>
            	<div class="subtitle">세일 중인 상품들을 만나보세요</div>
        	</div>
        	<div class="product_list">
            	<div class="product">
                	<ul class="prdList">
                    	<li>
                        	<div class="prdList_item">
                            	<div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/basket_01.jpg" alt="test01">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test01</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>10,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">100원 (1%)</span></div>
                                	</div>
                            	</div>
                        	</div>
                    	</li>
                    	<li>
                        	<div class="prdList_item">
                            	<div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/basket_02.jpg" alt="test02">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test02</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>20,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">200원 (1%)</span></div>
                                	</div>
                            	</div>
                        	</div>
                    	</li>
                    	<li>
                        	<div class="prdList_item">
                            	<div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/basket_03.jpg" alt="test03">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test03</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>30,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">300원 (1%)</span></div>
                                	</div>
                            	</div>
                        	</div>
                    	</li>
                    	<li>
                        	<div class="prdList_item">
                            	<div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/basket_04.jpg" alt="test04">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test04</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>40,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">400원 (1%)</span></div>
                                	</div>
                            	</div>
                        	</div>
                    	</li>
                	</ul>
            	</div>
            	<div class="more">
                	<a href="#" class="btnMore">More +</a>
            	</div>
        	</div>
		</div>
        <div class="main_image_gallery">
            <div class="main_title">
            	<div class="title">Lifestyle</div>
            	<div class="subtitle">리빙앤트리 제품 속 새로운 삶의 모습</div>
        	</div>
            <ul class="main_image_list">
                <li>
                    <a href="#">
                        <img src="img/lifestyle/ez-image-contents-01.jpg" alt="">
                        <div class="main_3dan_banner_txt">
                            <div class="txt">캠핑갈 때 어때요?</div>
                            <div class="more">자세히 살펴보기</div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="img/lifestyle/ez-image-contents-02.jpg" alt="">
                        <div class="main_3dan_banner_txt">
                            <div class="txt">깔끔한 정리의 시작</div>
                            <div class="more">자세히 살펴보기</div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="img/lifestyle/ez-image-contents-03.jpg" alt="">
                        <div class="main_3dan_banner_txt">
                            <div class="txt">펜트리 정리, 대용량 수납</div>
                            <div class="more">자세히 살펴보기</div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="main_product_category">
            <div class="main_product_inner">
                <div class="main_title">
                    <div class="title">Best Select</div>
                    <div class="subtitle">고객님들이 셀렉한 베스트 아이템</div>
                </div>
                <ul class="main_product_tab">
                    <!-- tabcontent01 -->
                    <li><button type="button" class="on">서랍장</button></li>
                    <!-- tabcontent02 -->
                    <li><button type="button">리빙박스</button></li>
                    <!-- tabcontent03 -->
                    <li><button type="button">휴지통</button></li>
                </ul>
            </div>
            <div class="content_list">
                <!-- tabcontent01 -->
                <div class="tabcontent on">
                    <ul class="prdList">
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/drawer_01.jpg" alt="test_a1">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_a1</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>10,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">100원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/drawer_02.jpg" alt="test_a2">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_a2</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>20,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">200원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/drawer_03.jpg" alt="test_a3">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_a3</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>30,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">300원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/basket_04.jpg" alt="test_a4">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_a4</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>40,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">400원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--  -->
                <!-- tabcontent02 -->
                <div class="tabcontent">
                    <ul class="prdList">
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/livingbox_01.jpg" alt="test_b1">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_b1</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>10,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">100원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/livingbox_02.jpg" alt="test_b2">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_b2</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>20,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">200원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/livingbox_03.jpg" alt="test_b3">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_b3</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>30,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">300원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/livingbox_04.jpg" alt="test_b4">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_b4</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>40,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">400원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--  -->
                <!-- tabcontent03 -->
                <div class="tabcontent">
                    <ul class="prdList">
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/bin_01.jpg" alt="test_c1">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_c1</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>10,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">100원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/bin_02.jpg" alt="test_c2">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_c2</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>20,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">200원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/bin_03.jpg" alt="test_c3">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_c3</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>30,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">300원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                        <li>
                            <div class="prdList_item">
                                <div class="thumbnail">
                                	<a href="#">
                                    	<img src="img/productimg/bin_04.jpg" alt="test_c4">
                                	</a>
                                	<div class="icon_box">
                                    	<span class="cart">ADD</span>
                                	</div>
                            	</div>
                            	<div class="description">
                                	<div class="name"><a href="#">Test_c4</a></div>
                                	<div class="spec">
                                    	<div class="price"><span>40,000원</span></div>
                                    	<div class="mileage"><span><img src="img/icon/ico_point.gif" alt="">400원 (1%)</span></div>
                                	</div>
                            	</div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--  -->
            </div>
        </div>
        <div class="main_text">
            <div class="main_long_banner">
                <div class="main_long_banner_txt01">고객님들의 솔직한 후기</div>
                <div class="main_long_banner_txt02">
                    <p>
                        리빙앤트리의 제품은<br>
                        50여 년의 축적된 기술과 노하우가<br>
                        바탕이 된 플라스틱 생활용품<br>
                        국내 자체 생산 전문 브랜드입니다.<br>
                        <br>
                        <br>
                    </p>
                </div>
                <div class="main_long_banner_link"><a href="#">자세히 보기</a></div>
            </div>
        </div>
    </div>
    <script>
        // .main_banner에서 클릭함에 따라 / 시간에 따라 banner 변경해주기
        let sliders = document.querySelectorAll('.sectionContainer .main_banner .banner_slider li');
        let pagers = document.querySelectorAll('.sectionContainer .main_banner .banner_pager .banner_pager_item');
        let k = 0;
        let myTimer;

        for(let i=0;i<sliders.length;i++){
            pagers[i].addEventListener('click', () => {
                for(let j=0;j<sliders.length;j++){
                    sliders[j].classList.remove('on');
                    pagers[j].classList.remove('on');
                }
                sliders[i].classList.add('on');
                pagers[i].classList.add('on');
                k = i;
            })
        }
        // $(function(){
        //     $('.sectionContainer .banner .banner_pager .banner_pager_item:nth-child(n)').click(function(){
        //         $('.sectionContainer .banner .banner_slider li:nth-child(n)').fadeToggle();
        //         $('.sectionContainer .banner .banner_slider li:nth-child(n)').siblings().fadeOut();
        //         $(this).addClass('on');
        //         $(this).siblings().removeClass('on');
        //     })
        // })
        imageChange();
        function imageChange(){
            if(k===7){
                k = 0;
            }
            else{
                pagers[k].click();
                k++;
            }
            myTimer = setTimeout(imageChange,5000);
        }

        // .main_product_category에서 .main_product_tab에 있는 버튼을 클릭함에 따라 .tabcontent 변경해주기
        let product_tabs = document.querySelectorAll('.sectionContainer .main_product_category .main_product_inner .main_product_tab li button');
        let tabcontents = document.querySelectorAll('.sectionContainer .main_product_category .content_list .tabcontent');

        for(let i=0;i<product_tabs.length;i++){
            product_tabs[i].addEventListener('click', () => {
                for(let j=0;j<tabcontents.length;j++){
                    tabcontents[j].classList.remove('on');
                    product_tabs[j].classList.remove('on');
                }
                tabcontents[i].classList.add('on');
                product_tabs[i].classList.add('on');
            })
        }
    </script>
</body>
</html>