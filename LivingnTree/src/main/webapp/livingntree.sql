create schema livingntree default character set utf8mb4 collate utf8mb4_general_ci;

-- 회원가입 테이블
create table member(
m_id varchar(20) primary key,
m_pw varchar(20),
m_pwq varchar(50),
m_pwa varchar(50),
m_name varchar(20),
m_postcode int,
m_defaultaddr varchar(100),
m_detailaddr varchar(100),
m_phone varchar(20),
m_email varchar(50));

-- 배송지 테이블
create table delivaddress(
d_code int auto_increment primary key,
d_delivname varchar(20),
d_postcode int,
d_defaultaddr varchar(100),
d_detailaddr varchar(100),
d_phone varchar(20),
d_checkcode int,
m_id varchar(20));

-- 상품 테이블
create table product(
p_code int auto_increment primary key,
p_category int,
p_name varchar(50),
p_mainimg varchar(50),
p_detailimg varchar(50), 
p_price int,
p_occ varchar(20), -- 원산지
p_delivfee int);

-- 장바구니 테이블
create table cart(
c_code int auto_increment primary key,
p_code int,
c_qty int,
c_total int,
m_id varchar(20));

-- 구매 테이블
create table orders(
o_date date,
o_code int,
p_code int,
o_qty int,
o_total int,
d_code int,
m_id varchar(20),
primary key(o_date,o_code,p_code));

-- 문의 게시판 테이블
create table inquiry(
i_code int auto_increment primary key,
i_pw varchar(20),
p_code int,
i_title varchar(100),
i_content varchar(500),
m_name varchar(20),
i_date date,
i_readcount int,
ref int,
re_step int,
m_id varchar(20));

-- 리뷰 게시판 테이블
create table review(
r_code int auto_increment primary key,
r_pw varchar(20),
p_code int,
r_title varchar(100),
r_content varchar(500),
m_name varchar(20),
r_date date,
r_readcount int,
m_id varchar(20));

insert into product
(p_category, p_name, p_mainimg, p_detailimg, p_price, p_occ, p_delivfee)
values
(1, '{1+1} 무빙 리빙박스 중 35L 낮은형', 'event_01.jpg', 'moving_M_35L_low_event.jpg', 32900, '국내', 0), 
(1, '{1+1} 무빙 리빙박스 소 20L 낮은형', 'event_02.jpg', 'moving_S_20L_low_event.jpg', 28900, '국내', 3000), 
(1, '{1+1} 무빙 리빙박스 중 40L 높은형', 'event_03.jpg', 'moving_M_40L_high_event.jpg', 35900, '국내', 0), 
(1, '{1+1} 무빙 리빙박스 소 25L 높은형', 'event_04.jpg', 'moving_S_25L_high_event.jpg', 29900, '국내', 0), 
(1, '{1+1} 미니미 펠리컨박스', 'event_05.jpg', 'minimi_pelican_event.jpg', 4500, '국내', 3000), 
(1, '{1+1} 펠리컨박스 35L', 'event_06.jpg', 'pelican_35L_event.jpg', 24900, '국내', 0), 
(1, '{1+1} 펠리컨박스 중 44L_민트', 'event_07.jpg', 'pelican_M_44L_mint_event.jpg', 26900, '국내', 0),
(1, '{1+1} 펠리컨박스 대 66L', 'event_08.jpg', 'pelican_L_66L_event.jpg', 46000, '국내', 0), 
(1, '{1+1} 펠리컨박스 중 44L', 'event_09.jpg', 'pelican_M_44L_event.jpg', 33000, '국내', 0), 
(1, '{1+1} 펠리컨박스 소 28L', 'event_10.jpg', 'pelican_S_28L_event.jpg', 22000, '국내', 0), 
(1, '{1+1} 끈이 있어 편리한 분리수거 비닐봉투 ( 3종 )', 'event_11.jpg', 'plasticbag_event.jpg', 24800, '국내', 3000), 
(1, '{1+1} 파스텔 리빙박스 52L', 'event_12.jpg', 'pastel_52L_event.jpg', 30900, '국내', 0), 
(1, '{1+1} 파스텔 리빙박스 32L', 'event_13.jpg', 'pastel_32L_event.jpg', 26900, '국내', 0), 
(1, '{1+1} 미니미박스 M', 'event_14.jpg', 'minimi_interior_M_event.jpg', 4500, '국내', 3000), 
(1, '{1+1} 미니미박스 S', 'event_15.jpg', 'minimi_interior_S_event.jpg', 3500, '국내', 3000), 
(1, '{1+1} 인테리어 수납함 36L_블루', 'event_16.jpg', 'interior_36L_blue_event.jpg', 28900, '국내', 0), 
(1, '{1+1} 인테리어 수납함 66L', 'event_17.jpg', 'interior_66L_event.jpg', 43000, '국내', 0), 
(1, '{1+1} 인테리어 수납함 36L', 'event_18.jpg', 'interior_36L_event.jpg', 34900, '국내', 0), 
(1, '{1+1} 인테리어 수납함 16L', 'event_19.jpg', 'interior_16L_event.jpg', 20000, '국내', 0), 
(1, '{1+1} 블렌딩 분리수거 휴지통', 'event_20.jpg', 'blendingbin_event.jpg', 22900, '국내', 3000),
(2, '{모음전} 얼음틀 얼음트레이 ( 9종 )', 'collection_01.jpg', 'lid_iceball_tray_collection_9.jpg', 2500, '국내', 3000),
(2, '{모음전} 무빙 리빙박스 (소/중/대)', 'collection_02.jpg', 'moving_collection_5.jpg', 18900, '국내', 0),
(2, '{모음전} 홈스타일 DIY 서랍장 3단 ( 4종 )', 'collection_03.jpg', 'homestyle_collection_4_3.jpg', 31900, '국내', 0),
(2, '{모음전} 와이드 서랍장 ( 6종 )', 'collection_04.jpg', 'wide_collection_6.jpg', 59900, '국내', 0),
(2, '{모음전} 냄새사냥 제습탈취제', 'collection_05.jpg', 'dehumidify_collection_4.jpg', 4900, '국내', 3000),
(2, '{모음전} 홈스타일 DIY 서랍장 4단 ( 4종 )', 'collection_06.jpg', 'homestyle_collection_4_4.jpg', 39900, '국내', 0),
(2, '{모음전} 인테리어 수납함 (16L/33L/66L)', 'collection_07.jpg', 'interior_collection_3.jpg', 11900, '국내', 0),
(2, '{모음전} 끈이 있어 편리한 분리수거 비닐봉투', 'collection_08.jpg', 'plasticbag_collection_3.jpg', 12900, '국내', 3000),
(2, '{모음전} 프리미엄 체스트 ( 3종 )', 'collection_09.jpg', 'premium_collection_3.jpg', 49000, '국내', 0),
(2, '{모음전} 마인 컬러 서랍장 ( 4종 )', 'collection_10.jpg', 'minecolor_collection_4.jpg', 19900, '국내', 0),
(2, '{모음전} 홈스타일 DIY 서랍장 ALL ( 8종 )', 'collection_11.jpg', 'homestyle_collection_8.jpg', 29900, '국내', 0),
(2, '{모음전} 더모어 수납함 (바스켓/4.5L/10L/32L/52L)', 'collection_12.jpg', 'themore_collection_5.jpg', 2200, '국내', 3000),
(2, '{모음전} 블랙 서랍장 ( 7종 )', 'collection_13.jpg', 'black_collection_7.jpg', 23900, '국내', 0),
(2, '{모음전} 조립식 서랍장 ( 4종 )', 'collection_14.jpg', 'assemble_collection_4.jpg', 29900, '국내', 0),
(2, '{모음전} 펠리컨박스_3종(대/중/소)', 'collection_15.jpg', 'pelican_SML_collection_3.jpg', 13900, '국내', 0),
(2, '{모음전} 베이직 서랍장 ( 3단/4단/5단 )', 'collection_16.jpg', 'basic_collection_3.jpg', 42900, '국내', 0),
(2, '{모음전} 퓨어 서랍장 ( 8종 )', 'collection_17.jpg', 'pure_collection_8.jpg', 33900, '국내', 0),
(3, '펠리컨박스 35L_내츄럴', 'livingbox_01.jpg', 'pelican_35L_natural.jpg', 16900, '국내', 0),
(3, '펠리컨박스 35L_라임', 'livingbox_02.jpg', 'pelican_35L_lime.jpg', 16900, '국내', 0),
(3, '펠리컨박스 35L_민트', 'livingbox_03.jpg', 'pelican_35L_mint.jpg', 16900, '국내', 0),
(3, '펠리컨박스 35L_블루', 'livingbox_04.jpg', 'pelican_35L_blue.jpg', 16900, '국내', 0),
(3, '펠리컨박스 대 66L', 'livingbox_05.jpg', 'pelican_L_66L.jpg', 22900, '국내', 0),
(3, '펠리컨박스 중 44L', 'livingbox_06.jpg', 'pelican_M_44L.jpg', 17900, '국내', 0),
(3, '펠리컨박스 소 28L', 'livingbox_07.jpg', 'pelican_S_28L.jpg', 13900, '국내', 0),
(3, '무빙 리빙박스 대 60L 높은형', 'livingbox_08.jpg', 'moving_L_60L_high.jpg', 25900, '국내', 0),
(3, '무빙 리빙박스 중 40L 높은형', 'livingbox_09.jpg', 'moving_M_40L_high.jpg', 22900, '국내', 0),
(3, '무빙 리빙박스 소 25L 높은형', 'livingbox_10.jpg', 'moving_S_25L_high.jpg', 19900, '국내', 0),
(3, '무빙 리빙박스 중 35L 낮은형', 'livingbox_11.jpg', 'moving_M_35L_low.jpg', 21900, '국내', 0),
(3, '무빙 리빙박스 소 20L 낮은형', 'livingbox_12.jpg', 'moving_S_20L_low.jpg', 18900, '국내', 0),
(3, '파스텔 리빙박스 52L_그린', 'livingbox_13.jpg', 'pastel_52L_green.jpg', 18900, '국내', 0),
(3, '파스텔 리빙박스 52L_핑크', 'livingbox_14.jpg', 'pastel_52L_pink.jpg', 18900, '국내', 0),
(3, '파스텔 리빙박스 52L_블루', 'livingbox_15.jpg', 'pastel_52L_blue.jpg', 18900, '국내', 0),
(3, '파스텔 리빙박스 52L_화이트', 'livingbox_16.jpg', 'pastel_52L_white.jpg', 18900, '국내', 0),
(3, '파스텔 리빙박스 32L_그린', 'livingbox_17.jpg', 'pastel_32L_green.jpg', 16900, '국내', 0),
(3, '파스텔 리빙박스 32L_핑크', 'livingbox_18.jpg', 'pastel_32L_pink.jpg', 16900, '국내', 0),
(3, '파스텔 리빙박스 32L_블루', 'livingbox_19.jpg', 'pastel_32L_blue.jpg', 16900, '국내', 0),
(3, '파스텔 리빙박스 32L_화이트', 'livingbox_20.jpg', 'pastel_32L_white.jpg', 16900, '국내', 0),
(4, '마인 컬러 서랍장 4단 40', 'drawer_01.jpg', 'minecolor_40_4.jpg', 57900, '국내', 0),
(4, '마인 컬러 서랍장 3단 40', 'drawer_02.jpg', 'minecolor_40_3.jpg', 45900, '국내', 0),
(4, '마인 컬러 서랍장 1단 40 ( 2P )', 'drawer_03.jpg', 'minecolor_40_1_2P.jpg', 43900, '국내', 0),
(4, '마인 서랍장 1단 40_두칸형', 'drawer_04.jpg', 'mine_40_1_double.jpg', 26900, '국내', 0),
(4, '베이직 서랍장 5단', 'drawer_05.jpg', 'basic_5.jpg', 62900, '국내', 0),
(4, '베이직 서랍장 4단', 'drawer_06.jpg', 'basic_4.jpg', 41900, '국내', 0),
(4, '베이직 서랍장 3단', 'drawer_07.jpg', 'basic_3.jpg', 37900, '국내', 0),
(4, '리사이클링 레트로 서랍장 3단', 'drawer_08.jpg', 'recyclingretro_3.jpg', 14900, '국내', 3000),
(4, '리사이클링 서랍장 3단 ( 2종 )', 'drawer_09.jpg', 'recycling_event_2_3.jpg', 14900, '국내', 3000),
(4, '블랙서랍장 4단 40 _두칸형', 'drawer_10.jpg', 'black_40_4_double.jpg', 75900, '국내', 0),
(4, '블랙서랍장 3단 40_높은형', 'drawer_11.jpg', 'black_40_3_high.jpg', 73900, '국내', 0),
(4, '블랙서랍장 3단 40_두칸형', 'drawer_12.jpg', 'black_40_3_double.jpg', 55900, '국내', 0),
(4, '블랙서랍장 4단 35_두칸형', 'drawer_13.jpg', 'black_35_4_double.jpg', 54900, '국내', 0),
(4, '블랙서랍장 3단 35 _두칸형', 'drawer_14.jpg', 'black_35_3_double.jpg', 45900, '국내', 0),
(4, '블랙서랍장 4단 27', 'drawer_15.jpg', 'black_27_4.jpg', 31900, '국내', 3000),
(4, '블랙서랍장 3단 27', 'drawer_16.jpg', 'black_27_3.jpg', 23900, '국내', 3000),
(5, '튼튼한 페달 휴지통 11L', 'bin_01.jpg', 'pedalbin_11L.jpg', 14500, '국내', 3000),
(5, '캔 휴지통 ( 테이블용 )', 'bin_02.jpg', 'minicanbin.jpg', 4500, '국내', 3000),
(5, '미니 우유 휴지통', 'bin_03.jpg', 'minimilkbin.jpg', 3200, '국내', 3000),
(5, '멀티휴지통 ( 종이컵수거함+쓰레기통 )', 'bin_04.jpg', 'multibin.jpg', 15900, '국내', 3000),
(5, '사각 스윙 휴지통 75L 스카이블루', 'bin_05.jpg', 'swingbin_75L.jpg', 21900, '국내', 3000),
(5, '사각 스윙휴지통 100L', 'bin_06.jpg', 'swingbin_100L.jpg', 39900, '국내', 0),
(5, '블렌딩 분리수거함 ( 페달형 2단 )', 'bin_07.jpg', 'blending_pedal_2.jpg', 69900, '국내', 0),
(5, '블렌딩 분리수거함 ( 서랍형 1단 )', 'bin_08.jpg', 'blending_drawer_1.jpg', 29900, '국내', 0),
(5, '블렌딩 분리수거함 ( 페달형 1단 )', 'bin_09.jpg', 'blending_pedal_1.jpg', 25900, '국내', 0),
(5, '블렌딩 분리수거함 ( 스윙형 1단 )', 'bin_10.jpg', 'blending_swing_1.jpg', 25900, '국내', 0),
(5, '블렌딩 분리수거 휴지통_베이지', 'bin_11.jpg', 'blendingbin_beige.jpg', 13900, '국내', 3000),
(5, '블렌딩 분리수거 휴지통_그레이', 'bin_12.jpg', 'blendingbin_gray.jpg', 13900, '국내', 3000),
(5, '리드휴지통 100L', 'bin_13.jpg', 'lidbin_100L.jpg', 41900, '국내', 0),
(5, '리드휴지통 75L', 'bin_14.jpg', 'lidbin_75L.jpg', 21900, '국내', 3000),
(5, '리드휴지통 50L', 'bin_15.jpg', 'lidbin_50L.jpg', 19900, '국내', 3000),
(5, '리드휴지통 20L', 'bin_16.jpg', 'lidbin_20L.jpg', 8500, '국내', 3000),
(6, '스마트 바스켓 특대_블루', 'basket_01.jpg', 'smartbasket_XL_blue.jpg', 4500, '국내', 3000),
(6, '스마트 바스켓 중_블루', 'basket_02.jpg', 'smartbasket_M_blue.jpg', 2900, '국내', 3000),
(6, '스마트 바스켓 소_블루', 'basket_03.jpg', 'smartbasket_S_blue.jpg', 2200, '국내', 3000),
(6, '스마트 바스켓 특대_그린', 'basket_04.jpg', 'smartbasket_XL_green.jpg', 4500, '국내', 3000),
(6, '스마트 바스켓 중_그린', 'basket_05.jpg', 'smartbasket_M_green.jpg', 2900, '국내', 3000),
(6, '스마트 바스켓 소_그린', 'basket_06.jpg', 'smartbasket_S_green.jpg', 2200, '국내', 3000),
(6, '멀티 바스켓 대_베이지', 'basket_07.jpg', 'multibasket_L_beige.jpg', 17900, '국내', 3000),
(6, '멀티 바스켓 소_그린', 'basket_08.jpg', 'multibasket_S_green.jpg', 12900, '국내', 3000),
(6, '멀티 바스켓 대_옐로우', 'basket_09.jpg', 'multibasket_L_yellow.jpg', 17900, '국내', 3000),
(6, '멀티 바스켓 소_옐로우', 'basket_10.jpg', 'multibasket_S_yellow.jpg', 12900, '국내', 3000),
(6, '멀티 바스켓 대_다크블루', 'basket_11.jpg', 'multibasket_L_darkblue.jpg', 17900, '국내', 3000),
(6, '멀티 바스켓 소_다크블루', 'basket_12.jpg', 'multibasket_S_darkblue.jpg', 12900, '국내', 3000),
(6, '멀티 바스켓 대_다크그린', 'basket_13.jpg', 'multibasket_L_darkgreen.jpg', 17900, '국내', 3000),
(6, '멀티 바스켓 소_다크그린', 'basket_14.jpg', 'multibasket_S_darkgreen.jpg', 12900, '국내', 3000),
(6, '내츄럴 바스켓 대_녹색', 'basket_15.jpg', 'naturalbasket_L_green.jpg', 5500, '국내', 3000),
(6, '내츄럴 바스켓 중_녹색', 'basket_16.jpg', 'naturalbasket_M_green.jpg', 4900, '국내', 3000),
(6, '내츄럴 바스켓 소_녹색', 'basket_17.jpg', 'naturalbasket_S_green.jpg', 4500, '국내', 3000),
(6, '내츄럴 바스켓 대_적색', 'basket_18.jpg', 'naturalbasket_L_red.jpg', 5500, '국내', 3000),
(6, '내츄럴 바스켓 중_적색', 'basket_19.jpg', 'naturalbasket_M_red.jpg', 4900, '국내', 3000),
(6, '내츄럴 바스켓 소_적색', 'basket_20.jpg', 'naturalbasket_S_red.jpg', 4500, '국내', 3000),
(7, '이동식 선반 4단_그린', 'living_01.jpg', 'trolleyshelf_4_green.jpg', 25900, '국내', 3000),
(7, '이동식 선반 3단_그린', 'living_02.jpg', 'trolleyshelf_3_green.jpg', 21900, '국내', 3000),
(7, '이동식 선반 4단_핑크', 'living_03.jpg', 'trolleyshelf_4_pink.jpg', 25900, '국내', 3000),
(7, '이동식 선반 3단_핑크', 'living_04.jpg', 'trolleyshelf_3_pink.jpg', 21900, '국내', 3000),
(7, '슬림카트 3단', 'living_05.jpg', 'slimcart_3.jpg', 19900, '국내', 3000),
(7, '슬림카트 2단', 'living_06.jpg', 'slimcart_2.jpg', 13900, '국내', 3000),
(7, '다용도 수납선반', 'living_07.jpg', 'multishelf.jpg', 12900, '국내', 3000),
(7, '끈이 있어 편리한 분리수거 비닐봉투 100L', 'living_08.jpg', 'plasticbag_100L.jpg', 12900, '국내', 3000),
(7, '끈이 있어 편리한 분리수거 비닐봉투 50L', 'living_09.jpg', 'plasticbag_50L.jpg', 12900, '국내', 3000),
(7, '끈이 있어 편리한 분리수거 비닐봉투 20L', 'living_10.jpg', 'plasticbag_20L.jpg', 12900, '국내', 3000),
(7, '냄새사냥 제습탈취제 ( 신발장,주방,차량용 )', 'living_11.jpg', 'dehumidify_2.jpg', 4900, '국내', 3000),
(7, '냄새사냥 제습탈취제 ( 옷장,이불장용 )', 'living_12.jpg', 'dehumidify_3.jpg', 7900, '국내', 3000),
(7, '냄새사냥 제습탈취제 ( 매트리스,침구용 )', 'living_13.jpg', 'dehumidify_5.jpg', 7900, '국내', 3000),
(7, '360도 회전손잡이 세탁바구니_그레이', 'living_14.jpg', 'rotation_handle_laundry_basket_gray.jpg', 16900, '국내', 3000),
(7, '360도 회전손잡이 세탁바구니_민트', 'living_15.jpg', 'rotation_handle_laundry_basket_mint.jpg', 16900, '국내', 3000),
(7, '360도 회전손잡이 세탁바구니 _화이트', 'living_16.jpg', 'rotation_handle_laundry_basket_white.jpg', 16900, '국내', 3000),
(7, '세탁바구니', 'living_17.jpg', 'soft_laundry_basket_1P.jpg', 14500, '국내', 3000),
(8, '마스크 파우치 모음전', 'etc_01.jpg', 'mask_pouch.jpg', 2000, '국내', 3000),
(8, '덜튼 키친타이머', 'etc_02.jpg', 'dulton_kitchen_timer.jpg', 11900, '중국', 3000),
(8, '덜튼 스텐 엔틱 인테리어 계량 주방 저울 2kg', 'etc_03.jpg', 'dulton_scale_2kg.jpg', 35900, '중국', 3000),
(8, '키즈의자_그린', 'etc_04.jpg', 'kidchair_green.jpg', 7500, '국내', 3000),
(8, '키즈의자_블루', 'etc_05.jpg', 'kidchair_blue.jpg', 7500, '국내', 3000),
(8, '샤워기 거치대 홀더 트레이', 'etc_06.jpg', 'shawer_holder.jpg', 1500, '국내', 3000),
(8, '샤베트볼 얼음트레이 L', 'etc_07.jpg', 'sherbet_ball_L.jpg', 1900, '국내', 3000),
(8, '얼음틀 얼음트레이 대', 'etc_08.jpg', 'icebox_tray_L.jpg', 5500, '국내', 3000),
(8, '얼음틀 얼음트레이 중', 'etc_09.jpg', 'icebox_tray_M.jpg', 3390, '국내', 3000),
(8, '슈퍼아이스볼 중', 'etc_10.jpg', 'super_iceball_M.jpg', 1890, '국내', 3000),
(8, '리드 아이스볼 특대', 'etc_11.jpg', 'lid_iceball_tray_XL.jpg', 4500, '국내', 3000),
(8, '리드 아이스볼 대', 'etc_12.jpg', 'lid_iceball_tray_L.jpg', 3500, '국내', 3000),
(8, '리드 아이스볼 소', 'etc_13.jpg', 'lid_iceball_tray_S.jpg', 2500, '국내', 3000),
(8, 'T-Shirt 의류 정리대', 'etc_14.jpg', 'T-shirt_clothes_rack.jpg', 40000, '국내', 0),
(9, '{부속} 조립식 서랍장 34', 'part_01.jpg', 'assembly_drawer-acc_34.jpg', 2000, '국내', 3000),
(9, '{부속} 조립식 서랍장 55', 'part_02.jpg', 'assembly_drawer-acc_55.jpg', 1500, '국내', 3000),
(9, '{부속} 퓨어 서랍장 52 서랍', '', '', 5000, '국내', 3000),
(9, '{부속} 리드,월드휴지통 분리수거 스티커', '', '', 1000, '국내', 3000),
(9, '{부속} 이동식선반 바퀴', 'part_05.jpg', 'placerwagon_wheel.jpg', 1200, '국내', 3000),
(9, '{부속} 더모어수납함 뚜껑 (대형/특대형 공용)', 'part_06.jpg', 'themore-ALL.jpg', 3500, '국내', 3000),
(9, '{부속} 이동식선반 3단/4단 기둥 공용', 'part_07.jpg', 'placerwagon_pillar.jpg', 2300, '국내', 3000),
(9, '{부속} 펜트리 바스켓 M / L_뚜껑', 'part_08.jpg', 'pantrybasket_lid.jpg', 2500, '국내', 3000),
(9, '{부속} 펜트리 바스켓 S_뚜껑', 'part_09.jpg', 'pantrybasket_lid_s.jpg', 1800, '국내', 3000),
(9, '{부속} 우드탑서랍장 55_우드', 'part_10.jpg', 'woodtop55.jpg', 6000, '국내', 3000),
(9, '{부속} 더모어 수납함 85L,115L 뚜껑 공용', 'part_11.jpg', 'themore-85L.jpg', 8000, '국내', 3000),
(9, '{부속} 퓨어 서랍장 52_상판 (3단/4단 공용)', 'part_12.jpg', 'pure_3_52.jpg', 4600, '국내', 3000),
(9, '{부속} 슬림 멀티 틈새 서랍장 - 서랍', 'part_13.jpg', 'D-newslim_all.jpg', 4700, '국내', 3000),
(9, '{부속} 블랙서랍장 40높은형, 40 서랍', 'part_14.jpg', 'black-3-40.jpg', 13900, '국내', 3000),
(9, '{부속} 오픈도어 수납함 부속제품', 'part_15.jpg', 'open_parts.jpg', 13000, '국내', 3000);



 