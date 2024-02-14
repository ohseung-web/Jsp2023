package model;

public class OrderdetailDTO {
   
   private String o_date; // 구매일자
   private int o_code; // 구매코드
   private String p_mainimg; // 상품이미지
   private int o_qty; // 총 구매 수량
   private int o_total; // 총 구매 금액
   private String d_delivname; // 배송자 이름
   private String d_defaultaddr; // 배송지 주소1
   private String d_detailaddr; //  배송지 주소2
   private String d_phone; // 전화번호
   private String delivchk; // 배송여부

public String getO_date() {
	return o_date;
}
public void setO_date(String o_date) {
	this.o_date = o_date;
}
public int getO_code() {
	return o_code;
}
public void setO_code(int o_code) {
	this.o_code = o_code;
}
public String getP_mainimg() {
	return p_mainimg;
}
public void setP_mainimg(String p_mainimg) {
	this.p_mainimg = p_mainimg;
}
public int getO_qty() {
	return o_qty;
}
public void setO_qty(int o_qty) {
	this.o_qty = o_qty;
}
public int getO_total() {
	return o_total;
}
public void setO_total(int o_total) {
	this.o_total = o_total;
}
public String getD_delivname() {
	return d_delivname;
}
public void setD_delivname(String d_delivname) {
	this.d_delivname = d_delivname;
}
public String getD_defaultaddr() {
	return d_defaultaddr;
}
public void setD_defaultaddr(String d_defaultaddr) {
	this.d_defaultaddr = d_defaultaddr;
}
public String getD_detailaddr() {
	return d_detailaddr;
}
public void setD_detailaddr(String d_detailaddr) {
	this.d_detailaddr = d_detailaddr;
}
public String getD_phone() {
	return d_phone;
}
public void setD_phone(String d_phone) {
	this.d_phone = d_phone;
}
public String getDelivchk() {
	return delivchk;
}
public void setDelivchk(String delivchk) {
	this.delivchk = delivchk;
}
   
   
   
   
   
}
