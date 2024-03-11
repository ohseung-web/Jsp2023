<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LivingnTree</title>
<link rel="stylesheet" href="css/reset.css">
<style>
.footerContainer{
    width: 100%;
    display: flex;
    justify-content: center;
    background-color: #f9f9f9;
}
.footerContainer .footerContainerWrap{
    max-width: 1480px;
    width: 92%;
    padding: 100px 0;
}
.footerContainer .footerContainerWrap .top {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    flex-wrap: nowrap;
    flex-direction: row;
}
.footerContainer .footerContainerWrap .top .info_left{
    width: 40%;
    margin-right: 20px;
}
.footerContainer .footerContainerWrap .top .info_left .bt_logo{
    margin-bottom: 50px;
}
.footerContainer .footerContainerWrap .top .info_left .bt_logo img{
    width: 272px;
    height: 60px;
}
.footerContainer .footerContainerWrap .bt_title{
    font-size: 14px;
    font-weight: 700;
    color: #000;
    line-height: 24px;
    margin-bottom: 10px;
}
.footerContainer .footerContainerWrap span{
    font-size: 13px;
    font-weight: 300;
    color: #1a1a1a;
    line-height: 24px;
}
.footerContainer .footerContainerWrap span.field{
    font-weight: 600;
}
.footerContainer .footerContainerWrap .top .info_left .sm_txt a{
	font-size: 13px;
    font-weight: 300;
    color: #000;
    line-height: 24px;
}
.footerContainer .footerContainerWrap .top .info_right{
    width: 60%;
}
.footerContainer .footerContainerWrap .top .info_right .bt_util{
    margin-bottom: 50px;
}
.footerContainer .footerContainerWrap .top .info_right .bt_util ul{
    display: flex;
    justify-content: flex-end;
}
.footerContainer .footerContainerWrap .top .info_right .bt_util ul li{
    margin-left: 35px;
}
.footerContainer .footerContainerWrap .top .info_right .bt_util ul li a{
    display: block;
    font-size: 13px;
    font-weight: 300;
    color: #000;
    line-height: 1;
    white-space: nowrap;
}
.footerContainer .footerContainerWrap .top .info_right .bt_util ul li a strong{
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #000;
    line-height: 1;
    white-space: nowrap;
}
.footerContainer .footerContainerWrap .top .info_right .txt_wrap{
    display: flex;
    justify-content: space-between;
}
.footerContainer .footerContainerWrap .top .info_right .txt_wrap .cs_txt{
    margin-right: 55px;
}
.footerContainer .footerContainerWrap .top .info_right .txt_wrap .bank_txt{
    margin-right: 55px;
}
.footerContainer .footerContainerWrap .top .info_right .txt_wrap .sns_txt a{
    font-size: 13px;
    font-weight: 300;
    color: #000;
    line-height: 24px;
    display: block;
}
.footerContainer .footerContainerWrap .bottom{
    margin-top: 40px;
}
.footerContainer .footerContainerWrap .bottom .copyright{
    font-size: 13px;
    font-weight: 300;
    color: #000;
    line-height: 24px;
    text-align: left;
}
</style>
</head>
<body>
<div class="footerContainer">
	<div class="footerContainerWrap">
        <div class="top">
            <div class="info_left">
                <div class="bt_logo">
                    <a href="#"><img src="img/logo/logo_bottom.jpg" alt="리빙앤트리"></a>
                </div>
                <div class="sm_txt">
                    <div class="bt_title">쇼핑몰 기본정보</div>
                    <span class="field">상호명</span>
                    <span class="value">우림LND</span>&nbsp;
                    <span class="field">대표자명</span>
                    <span class="value">김민곤</span><br>
                    <span class="field">사업장 주소</span>
                    <span class="value">482841 경기도 양주시 광적면 부흥로925번길 199</span><br>
                    <span class="field">대표 전화</span>
                    <span class="value">02-2038-4430</span><br>
                    <span class="field">사업자 등록번호</span>
                    <span class="value">127-41-41352</span><br>
                    <span class="field">통신판매업 신고번호</span>
                    <span class="value">
                        제2013-경기양주-0136호
                        <a href="#none" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1274141352', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a>
                    </span><br>
                    <span class="field">개인정보보호책임자</span>
                    <span class="value">우림LND</span>
                </div>
            </div>
            <div class="info_right">
                <div class="bt_util">
                    <ul>
                        <li><a href="#">회사소개</a></li>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#"><strong>개인정보처리방침</strong></a></li>
                        <li><a href="#">이용안내</a></li>
                    </ul>
                </div>
                <div class="txt_wrap">
                    <div class="cs_txt">
                        <div class="bt_title">고객센터 정보</div>
                        <span class="field">상담/주문전화</span>&nbsp;
                        <span class="value">02-2038-4430</span><br>
                        <span class="field">상담/주문 이메일</span><br>
                        <span class="value">woorimlnd@naver.com</span><br>
                        <span class="field">CS운영시간</span><br>
                        <span class="value">
                            평일 : 오전 10 : 00 ~ 오후 17 : 00<br>
                            점심 : 오후 12 : 30 ~ 오후 13 : 30<br>
                            휴무 : 토 / 일 / 공휴일은 휴무<br>
                            <br>
                            반품배송지 : 경기도 양주시 광적면 가납리 108-2 우림(도로명) 경기도 양주시 광적면 그루고개로 166<br>
                            ( 반드시 지정택배사를 이용해주세요! )
                        </span>
                    </div>
                    <div class="bank_txt">
                        <div class="bt_title">결제 정보</div>
                        <span class="field">무통장 계좌정보</span><br>
                        <span class="value">기업은행 008-080098-01-014 우림LND</span>
                    </div>
                    <div class="sns_txt">
                        <div class="bt_title">SNS</div>
                        <a href="https://www.instagram.com/livingntree/" target="_blank">instagram</a>
                        <a href="https://www.youtube.com/channel/UCBYvCQBXtWLYBKMtDlQkqkw" target="_blank">youtube</a>
                        <a href="https://www.facebook.com/livingntree" target="_blank">facebook</a>
                        <a href="https://pf.kakao.com/_dViWK/chat" target="_blank" style="">kakao</a>
                        <a href="https://blog.naver.com/woorim6046" target="_blank">blog</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom">
            <span class="copyright">Copyright © 리빙앤트리. All Rights Reserved. Hosting by Cafe24 Corp.</span>
        </div>
    </div>
</div>
</body>
</html>