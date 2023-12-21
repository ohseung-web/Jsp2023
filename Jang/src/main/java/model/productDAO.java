package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class productDAO {
	String id ="test";
	String password = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con =null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	//DB 드라이브 연결, DB con 연결 getCon()
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<productDTO> list(){
		ArrayList<productDTO> a = new ArrayList<productDTO>();
		
		getCon();
		try {
		
			String sql = "select * from product";
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				productDTO pdto = new productDTO();
				pdto.setPro_no(rs.getString(1));
				pdto.setImg(rs.getString(2));
				pdto.setName(rs.getString(3));
				pdto.setPrice(rs.getInt(4));
				
			a.add(pdto);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
			
				}
			}
			if(pstm != null) {
				try {
					pstm.close();
				} catch (Exception e) {
			
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (Exception e) {
			
				}
			}
		}
		return a;
	}
	//
	
	public productDTO getInfo(String pro_no){
		productDTO pdto = new productDTO();
		getCon();
		try {
		
			String sql = "select * from product where pro_no =?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, pro_no);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				
				pdto.setPro_no(rs.getString(1));
				pdto.setImg(rs.getString(2));
				pdto.setName(rs.getString(3));
				pdto.setPrice(rs.getInt(4));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
			
				}
			}
			if(pstm != null) {
				try {
					pstm.close();
				} catch (Exception e) {
			
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (Exception e) {
			
				}
			}
		}
		return pdto;
	}

}
