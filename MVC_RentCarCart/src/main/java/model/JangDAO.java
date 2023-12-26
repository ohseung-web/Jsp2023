package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JangDAO {

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
    
    ////////////////////////////////////////////////////////////////////
 // 모든 장바구니의 정보를 검색하는 메소드
    public ArrayList<JangDTO> getAllJang(){
    	getConnect();
    	
    	ArrayList<JangDTO> a = new ArrayList<JangDTO>();
    	
    	try {
    	 
    		 String sql = "select * from rentjang order by no";
    		 pstmt = con.prepareStatement(sql);
    		 rs = pstmt.executeQuery();
    		 
    		 while(rs.next()) {
    			 JangDTO jdto = new JangDTO();
    			 jdto.setNo(rs.getInt(1));
    			 jdto.setImg(rs.getString(2));
    			 jdto.setName(rs.getString(3));
    			 jdto.setCnt(rs.getInt(4));
    			 jdto.setPrice(rs.getInt(5));
    			 
    			 a.add(jdto);
    		 }
    		  
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con != null) con.close();
    			if(pstmt != null) pstmt.close();
    			if(rs != null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return a;
    }
    
    // 하나의 자동차 정보를 저장하는 메소드
    public void insertJang(JangDTO jdto){
    	getConnect();
   
    	try {
       	 
   		 String sql = "insert into rentjang values(?,?,?,?,?)";
   		 pstmt = con.prepareStatement(sql);
   	     pstmt.setInt(1, jdto.getNo());
   	     pstmt.setString(2, jdto.getImg());
    	 pstmt.setString(3, jdto.getName());
   		 pstmt.setInt(4, jdto.getCnt());
   		 pstmt.setInt(5, jdto.getPrice());
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
    
    //
}
