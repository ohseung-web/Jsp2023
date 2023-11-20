package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BuyDAO {
	
	// 변수 설정
	private Connection con = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	// 접속 메서드
	private void getCon() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "test", "1234");
	}
	public  ArrayList<PaulDTO> getOrder(String u_id){
		ArrayList<PaulDTO> orderlist = new ArrayList<>();
		try {
			getCon();
			String sql = "SELECT * FROM paul_order WHERE u_id = ? ORDER BY o_no DESC";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			rs = pstm.executeQuery();
			while(rs.next()) {
				PaulDTO pdto = new PaulDTO();
				pdto.setO_no(rs.getInt("o_no"));
				pdto.setO_name(rs.getString("o_name"));
				pdto.setO_addr(rs.getString("o_addr"));		
				pdto.setO_tel(rs.getString("o_tel"));
				pdto.setO_total(rs.getInt("o_total"));
				orderlist.add(pdto);
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
	
	
	public ArrayList<PaulDTO> getOrderProduct(int[] orderNum){
		ArrayList<PaulDTO> productlist = new ArrayList<>();
		try {
			getCon();
			String sql = "SELECT * FROM paul_orderproduct WHERE o_no = ?";
			for(int i = 0; i < orderNum.length; i++) {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, orderNum[i]);
				rs = pstm.executeQuery();
				while(rs.next()) {
					PaulDTO pdto = new PaulDTO();
					pdto.setOp_name(rs.getString("op_name"));
					pdto.setOp_color(rs.getString("op_color"));
					pdto.setOp_cnt(rs.getInt("op_cnt"));
					pdto.setOp_sum(rs.getInt("op_sum"));
					pdto.setO_no(rs.getInt("o_no"));
					productlist.add(pdto);
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
		return productlist;
	}	
	
	
}
