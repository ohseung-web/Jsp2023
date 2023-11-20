package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class CartDAO {
	
	// 변수 설정
	private Connection con = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	// 접속 메서드
	private void getCon() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "test", "1234");
	}
	
	// 장바구니 기존 데이터 체크 메서드
	public int getCount(String p_name, String p_color, String log) {
		int count = 0;
		try {
			getCon();
			String sql = "SELECT c_cnt FROM paul_cart WHERE p_name = ? AND p_color = ? AND u_id = ? AND c_status = 0";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, p_name);
			pstm.setString(2, p_color);
			pstm.setString(3, log);
			rs = pstm.executeQuery();
			if(rs.next()) count = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return count;
	}
	
	// 장바구니 상품 신규 추가 메서드
	public void insertCart(int c_cnt,String p_name,String p_color, int p_price, String u_id ){
		try {
			getCon();
			String sql = "Insert Into paul_cart Values(seq_cart.NEXTVAL,?,?,?,?,?,0)";	
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, p_name);
			pstm.setInt(2, p_price);
			pstm.setString(3, p_color);
			pstm.setString(4, u_id);
			pstm.setInt(5, c_cnt);
			
			pstm.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
	
	// 장바구니 수량 추가 메서드(상품 화면에서)
	public void AddCount(String p_name, String p_color, String log, int c_cnt){
		try {
			getCon();
			String sql = "UPDATE paul_cart SET c_cnt = c_cnt + ? WHERE p_name = ? AND p_color = ? AND u_id = ? AND c_status = 0";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, c_cnt);
			pstm.setString(2, p_name);
			pstm.setString(3, p_color);
			pstm.setString(4, log);
			pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
	
	// 장바구니 목록 조회 메서드	
	public  ArrayList<PaulDTO> getCart(String u_id){
		ArrayList<PaulDTO> cartList = new ArrayList<>();
		try {
			getCon();
			String sql = "SELECT * FROM paul_cart WHERE u_id = ? and c_status = 0 ORDER BY c_no DESC";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			rs = pstm.executeQuery();
			while(rs.next()) {
				PaulDTO pdto = new PaulDTO();
			/*			c_no number primary key, --장바구니코드
						p_name VARCHAR2(15), -- 상품이름
						p_price NUMBER, -- 상품 가격
						p_color VARCHAR2(10), --상품색상
						u_id varchar2(20) references paul_user(u_id), --구매자(id)
						c_cnt number(4), -- 수량
						c_status number(1) --구매상태 .  안삼 ->0 ,  삼->1	*/
				pdto.setC_no(rs.getInt("c_no"));
				pdto.setP_name(rs.getString("p_name"));
				pdto.setP_color(rs.getString("p_color"));		
				pdto.setC_cnt(rs.getInt("c_cnt"));
				pdto.setP_price(rs.getInt("p_price"));
				cartList.add(pdto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return cartList;
	}	
	
	// 장바구니 수량 변경 메서드
	public void updateCart(int cnt, int no){
		try {
			getCon();
			String sql = "update paul_cart set c_cnt=? where c_no =?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, cnt);
			pstm.setInt(2, no);
			pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
	
	// 장바구니 상품 삭제 메서드
	public void deleteCart(int no){
		try {
			getCon();
			String sql = "delete from paul_cart where c_no = ?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, no);
			pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
	
	// 구매 목록 조회 메서드
	public PaulDTO[] getOrderlist(int[] item){
		PaulDTO[] orderlist = new PaulDTO[item.length];
		try {
			getCon();
			String sql = "SELECT * FROM paul_cart WHERE c_no = ?";
			for(int i = 0; i < orderlist.length; i++) {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, item[i]);
				rs = pstm.executeQuery();
				if(rs.next()){
					PaulDTO pdto = new PaulDTO();
					pdto.setC_no(rs.getInt("c_no"));
					pdto.setP_name(rs.getString("p_name"));
					pdto.setP_color(rs.getString("p_color"));		
					pdto.setC_cnt(rs.getInt("c_cnt"));
					pdto.setP_price(rs.getInt("p_price"));
					orderlist[i] = pdto;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return orderlist;
	}
	
	// 회원 정보 호출 메서드
	public PaulDTO getUser(String id) {
		PaulDTO user = new PaulDTO();
		try {
			getCon();
			String sql = "SELECT * FROM paul_user WHERE u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			if(rs.next()) {
				user.setU_name(rs.getString("u_name"));
				user.setU_zipcode(rs.getString("u_zipcode"));
				user.setU_roadaddr(rs.getString("u_roadaddr"));				
				user.setU_detailaddr(rs.getString("u_detailaddr"));
				user.setU_extraaddr(rs.getString("u_extraaddr"));
				user.setU_tel(rs.getString("u_tel"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return user;
	}
	
	// 주문번호 생성 메서드
	public int getOrderNumber() {
		Date date = new Date();		
		SimpleDateFormat df = new SimpleDateFormat("yyMMdd");
		int num = Integer.parseInt(df.format(date)) * 10000;
		int next = num + 10000;
		try {
			getCon();
			String sql = "SELECT o_no FROM paul_order WHERE o_no BETWEEN ? AND ?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, num);
			pstm.setInt(2, next);
			rs = pstm.executeQuery();
			if(rs.next()) {
				sql = "SELECT MAX(o_no) FROM paul_order WHERE o_no BETWEEN ? AND ?";
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, num);
				pstm.setInt(2, next);
				rs = pstm.executeQuery();
				if(rs.next()) num = rs.getInt("MAX(o_no)");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		num++;
		return num;
	}
	
	// 주문(order 테이블 삽입) 메서드
	public void InsertOrder(int num, String user, String zipcode, String addr, String tel, int total, String payer, String log) {
		try {
			getCon();
			String sql = "INSERT INTO paul_order VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, num);
			pstm.setString(2, user);
			pstm.setString(3, zipcode);
			pstm.setString(4, addr);
			pstm.setString(5, tel);
			pstm.setInt(6, total);
			pstm.setString(7, payer);
			pstm.setString(8, log);
			pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
	
	// 주문상품(orderproduct 테이블 삽입) 메서드
	public void InsertOrderProduct(String[] item, String[] color, int[] cnt, int[] sum, int num) {
		try {
			getCon();
			String sql = "INSERT INTO paul_orderproduct VALUES (seq_orderproduct.NEXTVAL, ?, ?, ?, ?, ?)";
			for(int i = 0; i < item.length; i++) {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, item[i]);
				pstm.setString(2, color[i]);
				pstm.setInt(3, cnt[i]);
				pstm.setInt(4, sum[i]);
				pstm.setInt(5, num);
				pstm.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
	
	// 장바구니 상품 구매처리 메서드	
	public void convertCart(int[] no) {
		try {
			getCon();
			String sql = "UPDATE paul_cart SET c_status = 1 WHERE c_no = ?";
			for(int i = 0; i < no.length; i++) {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, no[i]);
				pstm.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); }
				catch(Exception e) { e.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(con != null) {
				try { con.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
}
