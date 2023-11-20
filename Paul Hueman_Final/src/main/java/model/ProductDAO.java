package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	
	// 변수 설정
	private Connection con = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	// 접속 메서드
	private void getCon() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "test", "1234");
	}
	
	// 전체 목록 조회 메서드
	public ArrayList<PaulDTO> getList(int cate){
		ArrayList<PaulDTO> list = new ArrayList<>();
		try {
			getCon();
			String sql = "SELECT * FROM paul_product WHERE p_cate = ? ORDER BY p_code DESC";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, cate);
			rs = pstm.executeQuery();
			while(rs.next()) {
				PaulDTO pdto = new PaulDTO();
				pdto.setP_code(rs.getString("p_code"));
				pdto.setP_name(rs.getString("p_name"));
				pdto.setP_color1(rs.getString("p_color1"));
				pdto.setP_color2(rs.getString("p_color2"));
				pdto.setP_color3(rs.getString("p_color3"));
				pdto.setP_price(rs.getInt("p_price"));
				list.add(pdto);
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
		return list;
	}
	
	// 물품 조회 메서드
	public PaulDTO getItem(String code){
		PaulDTO pdto = new PaulDTO();
		try {
			getCon();
			String sql = "SELECT * FROM paul_product WHERE p_code = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, code);
			rs = pstm.executeQuery();
			if(rs.next()) {
				pdto.setP_code(rs.getString("p_code"));
				pdto.setP_name(rs.getString("p_name"));
				pdto.setP_cate(rs.getInt("p_cate"));
				pdto.setP_color1(rs.getString("p_color1"));
				pdto.setP_color2(rs.getString("p_color2"));
				pdto.setP_color3(rs.getString("p_color3"));
				pdto.setP_price(rs.getInt("p_price"));
				pdto.setP_width(rs.getInt("p_width"));
				pdto.setP_nose(rs.getInt("p_nose"));
				pdto.setP_frame(rs.getInt("p_frame"));
				pdto.setP_material(rs.getString("p_material"));
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
		return pdto;
	}
}
