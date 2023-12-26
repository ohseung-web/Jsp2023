package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentDAO {

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
    
    //////////////////////////////////////////////////////////////////////
    // 모든 차량의 정보를 검색하는 메소드
    public ArrayList<RentDTO> getAllCar(){
    	getConnect();
    	
    	ArrayList<RentDTO> a = new ArrayList<RentDTO>();
    	
    	try {
    	 
    		 String sql = "select * from rentcar";
    		 pstmt = con.prepareStatement(sql);
    		 rs = pstmt.executeQuery();
    		 
    		 while(rs.next()) {
    			 RentDTO rdto = new RentDTO();
    			 rdto.setNo(rs.getInt(1));
    			 rdto.setName(rs.getString(2));
    			 rdto.setCategory(rs.getInt(3));
    			 rdto.setPrice(rs.getInt(4));
    			 rdto.setUsepeople(rs.getInt(5));
    			 rdto.setCompany(rs.getString(6));
    			 rdto.setImg(rs.getString(7));
    			 rdto.setInfo(rs.getString(8));
    			 
    			 a.add(rdto);
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
    
    // 하나의 자동차 정보를 리턴하는 메소드
    public RentDTO getOneCar(int no) {
    	getConnect();
    	
    	RentDTO rdto = new RentDTO();
    	try {
       	 
   		 String sql = "select * from rentcar where no=?";
   		 pstmt = con.prepareStatement(sql);
   		 pstmt.setInt(1, no);
   		 rs = pstmt.executeQuery();
   		 
   		 if(rs.next()) {
   			 rdto.setNo(rs.getInt(1));
   			 rdto.setName(rs.getString(2));
   			 rdto.setCategory(rs.getInt(3));
   			 rdto.setPrice(rs.getInt(4));
   			 rdto.setUsepeople(rs.getInt(5));
   			 rdto.setCompany(rs.getString(6));
   			 rdto.setImg(rs.getString(7));
   			 rdto.setInfo(rs.getString(8));
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
    	return rdto;
    }
	
   // 
 // memberjoin 테이블을 이용하여 회원 비밀번호를 리턴하는 메소드
    public String getMemberPw(String id) {
    	getConnect();
    	
    	String chkpw = ""; // 0이면 회원없음
    	
    	try {
     	     String sql ="select pw from memberjoin where id=?";
     	     pstmt = con.prepareStatement(sql);
     	     pstmt.setString(1, id);
     	     rs = pstmt.executeQuery();
     	     if(rs.next()) {
     	    	 chkpw = rs.getString(1); // 0또는 1값이 저장됨
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
    	return chkpw;
    } 
    
}
