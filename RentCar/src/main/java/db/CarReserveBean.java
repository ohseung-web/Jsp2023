package db;

public class CarReserveBean {

	private int reserveno; //기본키
	private int no; // 자동차번호
	private String id;
	private int carcnt;
	private int dday;//대여기간
	private String rday;//대여일 Date  type으로는 받아 오질 못함
	private int usein;
	private int usewifi;
	private int usenavi;
	private int usebaby;
	
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCarcnt() {
		return carcnt;
	}
	public void setCarcnt(int carcnt) {
		this.carcnt = carcnt;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public int getUsein() {
		return usein;
	}
	public void setUsein(int usein) {
		this.usein = usein;
	}
	public int getUsewifi() {
		return usewifi;
	}
	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}
	public int getUsenavi() {
		return usenavi;
	}
	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	public int getUsebaby() {
		return usebaby;
	}
	public void setUsebaby(int usebaby) {
		this.usebaby = usebaby;
	}
	
	
}
