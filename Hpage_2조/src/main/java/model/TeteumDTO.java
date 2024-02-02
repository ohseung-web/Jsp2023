package model;

import java.sql.Date;

public class TeteumDTO {
	
	private String p_no; // 상품번호 PK
	private String p_name; // 상품명
	private int p_price; // 상품가격
	private String p_colorone; // 상품색1
	private String p_colortwo; // 상품색2
	private String p_img; // 상품이미지
	private String p_category; // 상품 카테고리
	
	private String id; // 아이디
	private String email; // 이메일
	private String name; // 이름
	private String password; // 비밀번호
	private String phone; // 핸드폰번호
	private String zipcode; // 우편번호
	private String roadaddress;
	private String detailaddress;
	private String agree_terms; // 약관동의여부(필수)
	private String agree_age; // 약관동의여부(필수)
	private String agree_email; // 약관동의여부(선택)
	private String agree_message; // 약관동의여부(선택)
	
	private int c_num;
	private String c_no; // 상품번호
	private String c_name; // 상품명
	private int c_cnt; // 상품수량
	private int c_price; // 상품가격
	private String c_color; // 상품색상
	private String c_img; // 상품 이미지
	
	private Date buy_date;
	private	int buy_num;
	private String b_num;
	private String b_img;
	private String b_name;
	private String b_color;
	private int b_cnt;
	private int b_price;
	
	private String d_name;
	private String d_phone;
	private String d_zipcode;
	private String d_roadaddress;
	private String d_detailaddress;
	private String d_deliveryrequest;
	
	private int b_no;
	private String b_type;
	private String b_title;
	private String b_content;
	private Date b_regdate;
	
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_colorone() {
		return p_colorone;
	}
	public void setP_colorone(String p_colorone) {
		this.p_colorone = p_colorone;
	}
	public String getP_colortwo() {
		return p_colortwo;
	}
	public void setP_colortwo(String p_colortwo) {
		this.p_colortwo = p_colortwo;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	
	//----------------------------------------------------
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadaddress() {
		return roadaddress;
	}
	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	/*public String getAgreeone() {
		return agreeone;
	}
	public void setAgreeone(String agreeone) {
		this.agreeone = agreeone;
	}
	public String getAgreetwo() {
		return agreetwo;
	}
	public void setAgreetwo(String agreetwo) {
		this.agreetwo = agreetwo;
	}
	public String getAgreethree() {
		return agreethree;
	}
	public void setAgreethree(String agreethree) {
		this.agreethree = agreethree;
	}*/
	public String getAgree_terms() {
		return agree_terms;
	}
	public void setAgree_terms(String agree_terms) {
		this.agree_terms = agree_terms;
	}
	public String getAgree_age() {
		return agree_age;
	}
	public void setAgree_age(String agree_age) {
		this.agree_age = agree_age;
	}
	public String getAgree_email() {
		return agree_email;
	}
	public void setAgree_email(String agree_email) {
		this.agree_email = agree_email;
	}
	public String getAgree_message() {
		return agree_message;
	}
	public void setAgree_message(String agree_message) {
		this.agree_message = agree_message;
	}
	
	//---------------------------------------------
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_cnt() {
		return c_cnt;
	}
	public void setC_cnt(int c_cnt) {
		this.c_cnt = c_cnt;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public String getC_color() {
		return c_color;
	}
	public void setC_color(String c_color) {
		this.c_color = c_color;
	}
	public String getC_img() {
		return c_img;
	}
	public void setC_img(String c_img) {
		this.c_img = c_img;
	}
	
	//------------------------------------------
	
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public int getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}
	public String getB_num() {
		return b_num;
	}
	public void setB_num(String b_num) {
		this.b_num = b_num;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_color() {
		return b_color;
	}
	public void setB_color(String b_color) {
		this.b_color = b_color;
	}
	public int getB_cnt() {
		return b_cnt;
	}
	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	
	//-------------------------------------------
	
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_phone() {
		return d_phone;
	}
	public void setD_phone(String d_phone) {
		this.d_phone = d_phone;
	}
	public String getD_zipcode() {
		return d_zipcode;
	}
	public void setD_zipcode(String d_zipcode) {
		this.d_zipcode = d_zipcode;
	}
	public String getD_roadaddress() {
		return d_roadaddress;
	}
	public void setD_roadaddress(String d_roadaddress) {
		this.d_roadaddress = d_roadaddress;
	}
	public String getD_detailaddress() {
		return d_detailaddress;
	}
	public void setD_detailaddress(String d_detailaddress) {
		this.d_detailaddress = d_detailaddress;
	}
	public String getD_deliveryrequest() {
		return d_deliveryrequest;
	}
	public void setD_deliveryrequest(String d_deliveryrequest) {
		this.d_deliveryrequest = d_deliveryrequest;
	}
	
	//-------------------------------------------
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	
	
	
	
}
