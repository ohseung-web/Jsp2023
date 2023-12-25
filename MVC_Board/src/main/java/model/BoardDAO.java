package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.security.sasl.SaslException;
import javax.sql.DataSource;

public class BoardDAO {
   
	Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    public void getConnect() {
    	try {
    		//외부에서 데이터를 읽어들여야 하기에
    		Context initctx = new InitialContext();
    		//톰캣 서버에 정보를 담아놓은 곳으로 이동
    		Context envctx = (Context) initctx.lookup("java:comp/env");
    		//데이터 소스 객체를 선언한다.
    		DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
    		//데이터 소스를 기준으로 커넥션을 연결해 주세요
    		con = ds.getConnection();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    //전체 게시글의 개수를 리턴하는 메소드
    public int getAllCount() {
    	getConnect();
    	int count = 0;
    	try {
    		 
    		 String sql ="select count(*) from board";
    		 pstmt = con.prepareStatement(sql);
    		 rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 count = rs.getInt(1);
    		 }
    		 
//    		 System.out.println(count);
    		 
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			   if(con != null) con.close();
    			   if(pstmt != null) pstmt.close();
    			   if(rs != null) rs.close();
    		}catch(SQLException se){
    			se.printStackTrace();
    		}
    	}
    	return count;
    }
    
    //
    public ArrayList<BoardDTO> getAllBoard(int start, int pageSize){
    	getConnect();
    	
    	ArrayList<BoardDTO> a = new ArrayList<BoardDTO>();
    	
    	try { 
   		     String sql ="select * from board order by ref desc, re_level asc, re_step asc limit ?,?";
   		     pstmt = con.prepareStatement(sql);
   		     pstmt.setInt(1, start-1);
   		     pstmt.setInt(2, pageSize);
   		     rs = pstmt.executeQuery();
   		     
   		     while(rs.next()) {
   		        BoardDTO bdto = new BoardDTO();
   		        bdto.setNum(rs.getInt(1));
   		    	bdto.setWriter(rs.getString(2));
   		    	bdto.setEmail(rs.getString(3));
   		    	bdto.setSubject(rs.getString(4));
   		    	bdto.setPassword(rs.getString(5));
   		    	bdto.setReg_date(rs.getDate(6).toString());
   		    	bdto.setRef(rs.getInt(7));
   		    	bdto.setRe_step(rs.getInt(8));
   		    	bdto.setRe_level(rs.getInt(9));
   		    	bdto.setReadcount(rs.getInt(10));
   		    	bdto.setContent(rs.getString(11));
   		    	a.add(bdto);
   		     }
   		     
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
    	return a;
    }
    
    // 하나의 게시글을 저장하는 메소드 호출
    public void  insrtBoard(BoardDTO bdto) {
    	
    	getConnect();
    	int ref = 0;
    	int re_step = 1;//새글
    	int re_level = 1;//새글
    	try { 
   		 
         String refsql ="select max(ref) from board";
   		 pstmt = con.prepareStatement(refsql);
   		 rs = pstmt.executeQuery();
   		 if(rs.next()) {
   			 ref = rs.getInt(1)+1; //가장 큰 값에 1을 더한다.
   		 }
   		 //데이터를 삽입하는 쿼리
   		 String sql ="insert into board values(null,?,?,?,?,current_date(),?,?,?,0,?)";
   		 pstmt = con.prepareStatement(sql);
   		 pstmt.setString(1, bdto.getWriter());
   		 pstmt.setString(2, bdto.getEmail());
   		 pstmt.setString(3, bdto.getSubject());
   		 pstmt.setString(4, bdto.getPassword());
   		 pstmt.setInt(5, ref);
   		 pstmt.setInt(6, re_step);
   		 pstmt.setInt(7, re_level);
   		 pstmt.setString(8, bdto.getContent());
   		 pstmt.executeUpdate();
   		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
    }
    
    // 하나의 게시글을 리턴받는 메소드 작성
    public BoardDTO getOneBoard(int num) {
    	getConnect();
    	BoardDTO bdto = new BoardDTO();
    	try {
    		// 게시글을 클릭하는 순간 조회수 증가
    		String countsql ="update board set readcount = readcount + 1 where num=?";
    		pstmt = con.prepareStatement(countsql);
    		pstmt.setInt(1, num);
    		pstmt.executeUpdate();
    		
    		//한 게시글에 대한 정보를 리턴해주는 쿼리를 작성
    		String sql = "select * from board where num=? ";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, num);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			bdto.setNum(rs.getInt(1));
   		    	bdto.setWriter(rs.getString(2));
   		    	bdto.setEmail(rs.getString(3));
   		    	bdto.setSubject(rs.getString(4));
   		    	bdto.setPassword(rs.getString(5));
   		    	bdto.setReg_date(rs.getDate(6).toString());
   		    	bdto.setRef(rs.getInt(7));
   		    	bdto.setRe_step(rs.getInt(8));
   		    	bdto.setRe_level(rs.getInt(9));
   		    	bdto.setReadcount(rs.getInt(10));
   		    	bdto.setContent(rs.getString(11));
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
    	return bdto;
    }
    
    // 답변글을 저장하는 메소드
    public void reInsertBoard(BoardDTO bdto) {
    	getConnect();
    	int ref = bdto.getRef();
    	int re_step = bdto.getRe_step();
    	int re_level = bdto.getRe_level();
    	
    	try { 
    		
   		 // 핵심코드
         String levelsql ="update board set re_level = re_level+1 where ref=? and re_level > ?";
   		 pstmt = con.prepareStatement(levelsql);
   		 pstmt.setInt(1, ref);
   		 pstmt.setInt(2, re_level);
   		 pstmt.executeUpdate(); 
   		
   		 //데이터를 삽입하는 쿼리
   		 String sql ="insert into board values(null,?,?,?,?,current_date(),?,?,?,0,?)";
   		 pstmt = con.prepareStatement(sql);
   		 pstmt.setString(1, bdto.getWriter());
   		 pstmt.setString(2, bdto.getEmail());
   		 pstmt.setString(3, bdto.getSubject());
   		 pstmt.setString(4, bdto.getPassword());
   		 pstmt.setInt(5, ref);
   		 pstmt.setInt(6, re_step+1); //기본 부모글의 step 보다 1씩 증가
   		 pstmt.setInt(7, re_level+1); //기본 부모글의 step 보다 1씩 증가
   		 pstmt.setString(8, bdto.getContent());
   		 pstmt.executeUpdate();
   		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
    }
    
  // 조회수를 증가하지 않는 하나의 게시글을 리턴받는 메소드 작성
    public BoardDTO getOneUpdateBoard(int num) {
    	getConnect();
    	BoardDTO bdto = new BoardDTO();
    	
    	try {
    		//하나의 게시글에 대한 정보를 리턴해주는 쿼리를 작성
    		String sql = "select * from board where num=? ";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, num);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			bdto.setNum(rs.getInt(1));
   		    	bdto.setWriter(rs.getString(2));
   		    	bdto.setEmail(rs.getString(3));
   		    	bdto.setSubject(rs.getString(4));
   		    	bdto.setPassword(rs.getString(5));
   		    	bdto.setReg_date(rs.getDate(6).toString());
   		    	bdto.setRef(rs.getInt(7));
   		    	bdto.setRe_step(rs.getInt(8));
   		    	bdto.setRe_level(rs.getInt(9));
   		    	bdto.setReadcount(rs.getInt(10));
   		    	bdto.setContent(rs.getString(11));
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
    	return bdto;
    }
    
    // 하나의 게시글을 수정하는 메소드
    public void updateBoard(int num, String subject, String content) {
    	
    	getConnect();
    	try {
    		String sql = "update board set subject = ?, content =? where num=? ";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, subject);
    		pstmt.setString(2, content);
    		pstmt.setInt(3, num);
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
    }
    
    // 하나의 게시글을 삭제하는 메소드
    public void deleteBoard(int num) {
    	getConnect();
    	
    	try {
    		String sql = "delete from board where num=? ";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, num);
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
    }
    
    
}
