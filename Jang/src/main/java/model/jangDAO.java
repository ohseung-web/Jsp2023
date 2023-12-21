package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class jangDAO {
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
	public void insertjang(jangDTO a) {
		getCon();
		try {
		
			String sql = "insert into jang values(?,?,?,?,?)";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, a.getImg() );
			pstm.setString(2, a.getName());
			pstm.setInt(3, a.getPrice());
			pstm.setInt(4, a.getCnt());
			pstm.setString(5, a.getPro_no());
			pstm.executeUpdate();
			
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
		
		
	}
	public ArrayList<jangDTO> list(){
		ArrayList<jangDTO> a = new ArrayList<jangDTO>();
		
		getCon();
		try {
		
			String sql = "select * from jang";
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				jangDTO jdto = new jangDTO();
				jdto.setImg(rs.getString(1));
				jdto.setName(rs.getString(2));
				jdto.setPrice(rs.getInt(3));
				jdto.setCnt(rs.getInt(4));
				jdto.setPro_no(rs.getString(5));
				
			a.add(jdto);	
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
}
