package model;

public class InquiryDTO {
	private int i_code;
	private String i_pw;
	private int p_code;
	private String i_title;
	private String i_content;
	private String m_name;
	private String i_date;
	private int i_readcount;
	private int ref;
	private int re_step;
	private String m_id;
	
	
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public int getI_code() {
		return i_code;
	}
	public void setI_code(int i_code) {
		this.i_code = i_code;
	}
	public String getI_pw() {
		return i_pw;
	}
	public void setI_pw(String i_pw) {
		this.i_pw = i_pw;
	}
	public String getI_title() {
		return i_title;
	}
	public void setI_title(String i_title) {
		this.i_title = i_title;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getI_date() {
		return i_date;
	}
	public void setI_date(String i_date) {
		this.i_date = i_date;
	}
	public int getI_readcount() {
		return i_readcount;
	}
	public void setI_readcount(int i_readcount) {
		this.i_readcount = i_readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
}
