package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

	String dbid = "test";
	String dbpw= "1234";
	String dburl = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(dburl, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//---------------------------------------------------------------------------------------------
	// 모든 게시글 불러오기
	
	public ArrayList<PaulDTO> getAllList() {
		ArrayList<PaulDTO> a = new ArrayList<PaulDTO>();
		getCon();
		try {
			String sql="select * from paul_board Order by b_no DESC";
			pstm= con.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				PaulDTO pdto = new PaulDTO();
				pdto.setB_no(rs.getInt(1));
				pdto.setB_subject(rs.getString(2));
				pdto.setU_id(rs.getString(3));
				pdto.setB_date(rs.getString(4));
				a.add(pdto);
			}
		}catch (Exception e) {
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
		return a;
	}
	
//---------------------------------------------------------------------------------------------
	//	게시글 추가 생성
	
	public void InsertBoard(PaulDTO pdto) {
		getCon();
		try {
			String sql0 = "Select max(b_no) from paul_board"; 
			pstm = con.prepareStatement(sql0);
			rs = pstm.executeQuery();
			
			int cnt = 0;
			if(rs.next()) { // 테이블에 값이 존재할때
				cnt = rs.getInt(1)+1;
			}else { //존재 하지 않을때 
				cnt = 1;
			}
			String sql="insert into paul_board values(?,?,?,SYSDATE,?)";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, cnt);
			pstm.setString(2, pdto.getB_subject());
			pstm.setString(3, pdto.getU_id());
			pstm.setString(4, pdto.getB_contents());
			pstm.executeUpdate();
		}catch (Exception e) {
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
	//	하나의 게시글 불러오기

	public PaulDTO getOneBoard(int b_no) {
		PaulDTO pdto = new PaulDTO();
		getCon();
		try {
			String sql="select * from paul_board where b_no = ?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, b_no);
			rs = pstm.executeQuery();

			if(rs.next()) {
				pdto.setB_no(rs.getInt(1));
				pdto.setB_subject(rs.getString(2));
				pdto.setU_id(rs.getString(3));
				pdto.setB_date(rs.getString(4));
				pdto.setB_contents(rs.getString(5));
			}
		}catch (Exception e) {
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
	// 작성자 아이디 가져오기 (사용 X)
		
	public String getOneId(int b_no) {
		String id=null;
		getCon();
		try {
			String sql="select u_id from paul_board where b_no = ?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, b_no);
			rs = pstm.executeQuery();

			if(rs.next()) {
				id = rs.getString(1);
			}
		}catch (Exception e) {
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
		return id;
	}
		
//---------------------------------------------------------------------------------------------		
	//	게시글 삭제
		
	public void DeleteBoard(int b_no) {
		getCon();
		try {
			String sql="delete from paul_board where b_no=?";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, b_no);
			pstm.executeUpdate();
		}catch (Exception e) {
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
	//	게시글 수정
	
	public void UpdateBoard(String b_subject, String b_contents, int b_no) {
		getCon();
		try {
			String sql="update paul_board set b_subject = ?, b_contents = ? where b_no = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, b_subject);
			pstm.setString(2, b_contents);
			pstm.setInt(3, b_no);
			pstm.executeUpdate();
		}catch (Exception e) {
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
	//	게시글 비밀번호 확인 (사용X)
	
	public String getId(String u_pw) {
		getCon();
		String id ="";
		try {
			String sql="select u_id from paul_user where u_pw = ?";
			pstm = con.prepareStatement(sql);
			pstm.setString(1, u_pw);
			rs = pstm.executeQuery();
			if(rs.next()) {
				id = rs.getString(1);
			}
		}catch (Exception e) {
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
		return id;
	}
	
//---------------------------------------------------------------------------------------------	
//	게시글 총 갯수
	public int getpagecnt() {
		getCon();
		int pages = 0;
		try {
			String sql="select count(*) from paul_board";
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs.next()) {pages = rs.getInt(1);}
			
		}catch (Exception e) {
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
		return pages;
	}

}
