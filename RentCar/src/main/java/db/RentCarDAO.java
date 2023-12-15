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
    
    //cagegory별 자동차 list를 저장하는 메소드
    public ArrayList<CarListBean> getCategoryCar(int cate){
    	getConnect();
    	ArrayList<CarListBean> a = new ArrayList<>();
    	try {
   	     String sql ="select * from rentcar where category = ?";
   	     pstmt = con.prepareStatement(sql);
   	     pstmt.setInt(1, cate);
   	     rs = pstmt.executeQuery();
  
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
    
  // 모든 carList 정보를 저장하는 메소드 작성
    public ArrayList<CarListBean> getAllCar(){
    	getConnect();
    	ArrayList<CarListBean> a = new ArrayList<>();
    	try {
   	     String sql ="select * from rentcar";
   	     pstmt = con.prepareStatement(sql);
   	     rs = pstmt.executeQuery();
  
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
    
    //하나의 자동차 정보를 리턴하는 메소드
    public CarListBean getOneCar(int num) {
    	getConnect();
    	
    	CarListBean bean = new CarListBean();
    	try {
      	     String sql ="select * from rentcar where no = ?";
      	     pstmt = con.prepareStatement(sql);
      	     pstmt.setInt(1, num);
      	     rs = pstmt.executeQuery();
      	    if(rs.next()) {
      	    	 bean.setNo(rs.getInt(1));
      	    	 bean.setName(rs.getString(2));
      	    	 bean.setCategory(rs.getInt(3));
      	    	 bean.setPrice(rs.getInt(4));
      	    	 bean.setUsepeople(rs.getInt(5));
      	    	 bean.setCompany(rs.getString(6));
      	    	 bean.setImg(rs.getString(7));
      	    	 bean.setInfo(rs.getString(8));
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
    	return bean;
    }
    
    // memberjoin 테이블을 이용하여 회원정보가 존재하는지 확인하는 메소드
    public int getMember(String id, String pw) {
    	getConnect();
    	
    	int result = 0; // 0이면 회원없음
    	
    	try {
     	     String sql ="select count(*) from memberjoin where id=? and pw=?";
     	     pstmt = con.prepareStatement(sql);
     	     pstmt.setString(1, id);
     	     pstmt.setString(2, pw);   
     	     rs = pstmt.executeQuery();
     	     if(rs.next()) {
     	    	 result = rs.getInt(1); // 0또는 1값이 저장됨
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
    	
    	return result;
    }
    
    //하나의 에약정보를 저장하는 메소드
    public void setReserveCar(CarReserveBean bean) {
    	getConnect();
    	
    	try {
    	     
    		String sql ="insert into carreserve values(null,?,?,?,?,?,?,?,?,?)";
    	     pstmt = con.prepareStatement(sql);
    	     pstmt.setInt(1, bean.getNo());
    	     pstmt.setString(2, bean.getId());
    	     pstmt.setInt(3, bean.getCarcnt());
    	     pstmt.setInt(4, bean.getDday());
    	     pstmt.setString(5, bean.getRday());
    	     pstmt.setInt(6, bean.getUsein());
    	     pstmt.setInt(7, bean.getUsewifi());
    	     pstmt.setInt(8, bean.getUsenavi());
    	     pstmt.setInt(9, bean.getUsebaby());
    	     pstmt.executeUpdate();
 
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
    }
    
    //회원의 예약정보를 리턴하는 메소드
    public ArrayList<CarViewBean> getAllReserve(String id){
    	getConnect();
    	ArrayList<CarViewBean> a = new ArrayList<>();
    	
    	try {
   	         
    		String sql ="select * from rentcar r inner join carreserve c on r.no = c.no\r\n"
    				     + "  where id=? and current_date() < rday";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    		   CarViewBean bean = new CarViewBean();
    		   bean.setNo(rs.getInt(1));
    		   bean.setName(rs.getString(2));
    		   bean.setPrice(rs.getInt(4));
    		   bean.setImg(rs.getString(7));
    		   bean.setCarcnt(rs.getInt(12));
    		   bean.setDday(rs.getInt(13));
    		   bean.setRday(rs.getString(14));
    		   bean.setUsein(rs.getInt(15));
    		   bean.setUsewifi(rs.getInt(16));
    		   bean.setUsenavi(rs.getInt(17));
    		   bean.setUsebaby(rs.getInt(18));
    		   a.add(bean);
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
    
    
    // 하나의 예약 삭제 메소드
    public void carRemoveReserve(int no) {
    	getConnect();
    	
    	try {
  	        
    		 String sql ="delete from carreserve where no=?";
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setInt(1, no);
    		 pstmt.executeUpdate();
    		
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
    }

    //
   
}
