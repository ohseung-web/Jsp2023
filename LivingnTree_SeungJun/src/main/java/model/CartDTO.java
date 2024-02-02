package model;

public class CartDTO {
	private int c_code;
	private int p_code;
	private String p_name;
	private String p_mainimg;
	private int p_price;
	private int p_delivfee;
	private int c_qty;
	private int c_total;
	private String m_id;
	
	public int getC_code() {
		return c_code;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_mainimg() {
		return p_mainimg;
	}
	public void setP_mainimg(String p_mainimg) {
		this.p_mainimg = p_mainimg;
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
	public int getC_qty() {
		return c_qty;
	}
	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}
	public int getC_total() {
		return c_total;
	}
	public void setC_total(int c_total) {
		this.c_total = c_total;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
}
