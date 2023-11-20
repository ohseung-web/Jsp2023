package model;

public class PaulDTO {
	//ȸ�� ���̺�
	private String u_id;	//ȸ�� ���̵�
	private String u_pw;	//ȸ�� ��й�ȣ
	private String u_pwchk;	//ȸ�� ��й�ȣ Ȯ��
	private String u_name;	//ȸ�� �̸�
	private String u_email;	//ȸ�� �̸���
	private String u_tel;	//ȸ�� �޴���ȭ��ȣ
	private String u_question; //ȸ�� ��й�ȣ ã�� ����
	private String u_answer; //ȸ�� ��й�ȣ ã�� �亯
	private String u_zipcode;	//ȸ�� �����ּ�
	private String u_roadaddr;	//ȸ�� �ּ�
	private String u_detailaddr;	//ȸ�� �ּ�
	private String u_extraaddr;	//ȸ�� �ּ�
	
	//�Խ��� ���̺�
	private int b_no;		  //�Խñ� ��ȣ -- primary key(sequence )
	private String b_subject; //�Խñ� ����
	//private String u_id;	  //�ۼ��� ���̵� -- foreign key
	private String b_date;	  //�ۼ���
	private String b_contents;//�Խñ� ����
	
	//��ǰ
	private String p_code;		//��ǰ �ڵ�
	private String p_name;		//��ǰ��
	private int p_cate;			//��ǰ ī�װ�
	private String p_color1;	//��ǰ ����1
	private String p_color2;	//��ǰ ����2
	private String p_color3;	//��ǰ ����3
	private int p_price;		//��ǰ ����
	private int p_width;		//lens width
	private int p_nose;			//nose bridge
	private int p_frame;		//frame side
	private String p_material;	
	
	//��ٱ��� ���̺�
	private int c_no;		//��ٱ��� ��ȣ --primary key(sequence)
	//private String u_id;	//ȸ���� ��ٱ��� -- foreign key
	private int c_cnt;		//��ٱ��Ͽ� ���� ��ǰ ����
	private String p_color;
	private int c_status ;// ���Ż��� .  �Ȼ� ->0 ,  ��->1
	
	//�ֹ� ���̺�
	private int o_no;			//�ֹ���ȣ
	private String o_name; 		//�ֹ��ڸ�
	private String o_zipcode;	//�ֹ��� �����ȣ
	private String o_addr;		//�ֹ��� �ּ�
	private String o_tel;		//�ֹ��� ��ȭ��ȣ
	private int o_total;		//�� ����
	private String o_payer;		//�Ա��ڸ�
	
	//�ֹ���ǰ ���̺�
	private int op_no;
	private String op_name;
	private String op_color;
	private int op_cnt;
	private int op_sum;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_pwchk() {
		return u_pwchk;
	}
	public void setU_pwchk(String u_pwchk) {
		this.u_pwchk = u_pwchk;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_question() {
		return u_question;
	}
	public void setU_question(String u_question) {
		this.u_question = u_question;
	}
	public String getU_answer() {
		return u_answer;
	}
	public void setU_answer(String u_answer) {
		this.u_answer = u_answer;
	}
	public String getU_zipcode() {
		return u_zipcode;
	}
	public void setU_zipcode(String u_zipcode) {
		this.u_zipcode = u_zipcode;
	}
	public String getU_roadaddr() {
		return u_roadaddr;
	}
	public void setU_roadaddr(String u_roadaddr) {
		this.u_roadaddr = u_roadaddr;
	}
	public String getU_detailaddr() {
		return u_detailaddr;
	}
	public void setU_detailaddr(String u_detailaddr) {
		this.u_detailaddr = u_detailaddr;
	}
	public String getU_extraaddr() {
		return u_extraaddr;
	}
	public void setU_extraaddr(String u_extraaddr) {
		this.u_extraaddr = u_extraaddr;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_contents() {
		return b_contents;
	}
	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_cate() {
		return p_cate;
	}
	public void setP_cate(int p_cate) {
		this.p_cate = p_cate;
	}
	public String getP_color1() {
		return p_color1;
	}
	public void setP_color1(String p_color1) {
		this.p_color1 = p_color1;
	}
	public String getP_color2() {
		return p_color2;
	}
	public void setP_color2(String p_color2) {
		this.p_color2 = p_color2;
	}
	public String getP_color3() {
		return p_color3;
	}
	public void setP_color3(String p_color3) {
		this.p_color3 = p_color3;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_width() {
		return p_width;
	}
	public void setP_width(int p_width) {
		this.p_width = p_width;
	}
	public int getP_nose() {
		return p_nose;
	}
	public void setP_nose(int p_nose) {
		this.p_nose = p_nose;
	}
	public int getP_frame() {
		return p_frame;
	}
	public void setP_frame(int p_frame) {
		this.p_frame = p_frame;
	}
	public String getP_material() {
		return p_material;
	}
	public void setP_material(String p_material) {
		this.p_material = p_material;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getC_cnt() {
		return c_cnt;
	}
	public void setC_cnt(int c_cnt) {
		this.c_cnt = c_cnt;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public int getC_status() {
		return c_status;
	}
	public void setC_status(int c_status) {
		this.c_status = c_status;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_zipcode() {
		return o_zipcode;
	}
	public void setO_zipcode(String o_zipcode) {
		this.o_zipcode = o_zipcode;
	}
	public String getO_addr() {
		return o_addr;
	}
	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}
	public String getO_tel() {
		return o_tel;
	}
	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}
	public int getO_total() {
		return o_total;
	}
	public void setO_total(int o_total) {
		this.o_total = o_total;
	}
	public String getO_payer() {
		return o_payer;
	}
	public void setO_payer(String o_payer) {
		this.o_payer = o_payer;
	}
	public int getOp_no() {
		return op_no;
	}
	public void setOp_no(int op_no) {
		this.op_no = op_no;
	}
	public String getOp_name() {
		return op_name;
	}
	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}
	public String getOp_color() {
		return op_color;
	}
	public void setOp_color(String op_color) {
		this.op_color = op_color;
	}
	public int getOp_cnt() {
		return op_cnt;
	}
	public void setOp_cnt(int op_cnt) {
		this.op_cnt = op_cnt;
	}
	public int getOp_sum() {
		return op_sum;
	}
	public void setOp_sum(int op_sum) {
		this.op_sum = op_sum;
	}
	
}
