package model;

public class OrdersDTO {
	private String o_date;
	private int o_code;
	private int p_code;
	private String p_mainimg;
	private String p_name;
	private int p_price;
	private int p_delivfee;
	private int o_qty;
	private int o_total;
	private String m_id;
	
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
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getP_mainimg() {
		return p_mainimg;
	}
	public void setP_mainimg(String p_mainimg) {
		this.p_mainimg = p_mainimg;
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
	public int getP_delivfee() {
		return p_delivfee;
	}
	public void setP_delivfee(int p_delivfee) {
		this.p_delivfee = p_delivfee;
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
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
}
