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
   		     String sql ="select * from board order by ref desc, re_step asc limit ?,?";
   		     pstmt = con.prepareStatement(sql);
   		     pstmt.setInt(1, start+1);
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
    
    //
}
