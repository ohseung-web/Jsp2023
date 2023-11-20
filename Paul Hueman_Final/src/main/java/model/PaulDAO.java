package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PaulDAO {
	
	//db연동 준비
	String dbid = "test";
	String dbpw= "1234";
	String dburl = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;

//---------------------------------------------------------------------------------------------
	//db연결
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(dburl, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//---------------------------------------------------------------------------------------------
	//회원가입 insert into paul_user values(u_id, u_pw, u_name, u_email, u_tel, u_question, u_answer, u_zipcode, u_roadaddr, u_detailaddr, u_extraaddr);
	public void insertUser(PaulDTO pdto) {
		getCon();
		
		try {
			String sql = "Insert Into paul_user Values(?,?,?,?,?,?,?,?,?,?,?)";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, pdto.getU_id());
			pstm.setString(2, pdto.getU_pw());
			pstm.setString(3, pdto.getU_name());
			pstm.setString(4, pdto.getU_email());
			pstm.setString(5, pdto.getU_tel());
			pstm.setString(6, pdto.getU_question());
			pstm.setString(7, pdto.getU_answer());
			pstm.setString(8, pdto.getU_zipcode());
			pstm.setString(9, pdto.getU_roadaddr());
			pstm.setString(10, pdto.getU_detailaddr());
			pstm.setString(11, pdto.getU_extraaddr());
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		
	}
	
//---------------------------------------------------------------------------------------------
	//회원 가입 중복 방지	
	public String existUser(String u_id) {
		getCon();
		
		String notjoin = "";
		try {
			String sql = "Select u_id From paul_user Where u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {notjoin = "사용할 수 없는 아이디입니다.";}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		return notjoin;
	}
	
	
//---------------------------------------------------------------------------------------------
	//로그인
	public String getpw(String u_id) {
		getCon();

		String u_pw = "";
		try {
			String sql = "Select u_pw From paul_user Where u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {u_pw = rs.getString(1);}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		return u_pw;
	}
	
//---------------------------------------------------------------------------------------------
	//회원정보 불러오기
	public PaulDTO getUserData(String u_id) {
		getCon();
		
		PaulDTO pdto = new PaulDTO();
		
		try {
			String sql = "Select * From paul_user where u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			rs = pstm.executeQuery();
			
			while(rs.next()){
				pdto.setU_id(rs.getString(1));
				pdto.setU_pw(rs.getString(2));
				pdto.setU_name(rs.getString(3));
				pdto.setU_email(rs.getString(4));
				pdto.setU_tel(rs.getString(5));
				pdto.setU_question(rs.getString(6));
				pdto.setU_answer(rs.getString(7));
				pdto.setU_zipcode(rs.getString(8));
				pdto.setU_roadaddr(rs.getString(9));
				pdto.setU_detailaddr(rs.getString(10));
				pdto.setU_extraaddr(rs.getString(11));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		return pdto;
	}
	
//---------------------------------------------------------------------------------------------
	//회원정보 수정하기 u_pw, u_email, u_tel, u_question, u_answer, u_zipcode, u_roadaddr, u_detailaddr, u_extraaddr, u_id
	public void setUserModify(PaulDTO pdto) {
		getCon();
		
		try {
			String sql = "Update paul_user Set u_pw=?, u_email=?, u_tel=?, u_question=?, u_answer=?, u_zipcode=?, u_roadaddr=?, u_detailaddr=?, u_extraaddr=? Where u_id=?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, pdto.getU_pw());
			pstm.setString(2, pdto.getU_email());
			pstm.setString(3, pdto.getU_tel());
			pstm.setString(4, pdto.getU_question());
			pstm.setString(5, pdto.getU_answer());
			pstm.setString(6, pdto.getU_zipcode());
			pstm.setString(7, pdto.getU_roadaddr());
			pstm.setString(8, pdto.getU_detailaddr());
			pstm.setString(9, pdto.getU_extraaddr());
			pstm.setString(10, pdto.getU_id());
			pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		
	}
	
//---------------------------------------------------------------------------------------------
	//회원 탈퇴
	public void leaveUser(String u_id) {
		getCon();
		try {
			String sql = "SELECT o_no FROM paul_order WHERE u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			rs = pstm.executeQuery();
			ArrayList<PaulDTO> ordernum = new ArrayList<>();
			while(rs.next()) {
				PaulDTO pdto = new PaulDTO();
				pdto.setO_no(rs.getInt("o_no"));
				ordernum.add(pdto);
			}
			for(int i = 0; i < ordernum.size();i++) {
				sql = "DELETE FROM paul_orderproduct WHERE o_no = ?";
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, ordernum.get(i).getO_no());
				pstm.executeUpdate();
			}
			sql = "DELETE FROM paul_order WHERE u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			pstm.executeUpdate();
			sql = "DELETE FROM paul_cart WHERE u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			pstm.executeUpdate();
			sql = "DELETE FROM paul_board WHERE u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			pstm.executeUpdate();
			sql = "DELETE FROM paul_user WHERE u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		
	}
//---------------------------------------------------------------------------------------------
	//회원 비밀번호 찾기
	public PaulDTO findpw(String u_id) {
		getCon();
		
		PaulDTO pdto = new PaulDTO();
		
		try {
			String sql = "Select u_pw, u_question, u_answer From paul_user Where u_id = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				pdto.setU_pw(rs.getString("u_pw"));
				pdto.setU_question(rs.getString("u_question"));
				pdto.setU_answer(rs.getString("u_answer"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		return pdto;
	}
//---------------------------------------------------------------------------------------------
	//ID 찾기
	public ArrayList<PaulDTO> findid(String u_tel, String u_email) {
		getCon();
		
		ArrayList<PaulDTO> findid_list = new ArrayList<PaulDTO>();
		
		try {
			String sql = "Select u_id From paul_user Where u_tel = ? AND u_email = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_tel);
			pstm.setString(2, u_email);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				PaulDTO pdto = new PaulDTO();
				pdto.setU_id(rs.getString("u_id"));
				
				findid_list.add(pdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {rs.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(pstm != null) {
				try {pstm.close();}catch(SQLException se) {se.printStackTrace();}
			}
			if(con != null) {
				try {con.close();}catch(SQLException se) {se.printStackTrace();}
			}
		}
		return findid_list;
	}
}
