package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentCarDAO {
   
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
    
    //최신순 3대의 자동차를 리턴하는 메소드
    public ArrayList<CarListBean> getSelectCar(){
    	getConnect();
    	ArrayList<CarListBean> a = new ArrayList<>();
    	
    	try {
    	     String sql ="select * from rentcar order by no desc";
    	     pstmt = con.prepareStatement(sql);
    	     rs = pstmt.executeQuery();
    	     int count = 0;
    	     while(rs.next()) {
    	    	 CarListBean cbean = new CarListBean();
    	    	 cbean.setNo(rs.getInt(1));
    	    	 cbean.setName(rs.getString(2));
    	    	 cbean.setCategory(rs.getInt(3));
    	    	 cbean.setPrice(rs.getInt(4));
    	    	 cbean.setUsepeople(rs.getInt(5));
    	    	 cbean.setCompany(rs.getString(6));
    	    	 cbean.setImg(rs.getString(7));
    	    	 cbean.setInfo(rs.getString(8));
    	    	 a.add(cbean);
    	    	 
    	    	 count++;
    	    	 if(count > 2) {
    	    		 break;
    	    	 }
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
    
    //
}
