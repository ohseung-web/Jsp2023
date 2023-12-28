package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class RentDAO {

	
	String id ="test";
	String pw = "1234";
	String url ="jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
//--------------------------------------------------------
	// DB 연결 메소드 작성
	
 public void getCon() {
	 
	 try {
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 con = DriverManager.getConnection(url, id, pw);
		 
	 }catch(Exception e) {
	 e.printStackTrace();
    }
 }
 //--------------------------------------------------------------------------------
 
//모든 차량을 검색하는 메소드
public ArrayList<RentDTO>  getAllCar(){
	 
	 ArrayList<RentDTO> a = new ArrayList<RentDTO>();
		//데이터를 저장할 빈객체를 선언
		
		 getCon();
		 
		 try {
			     String sql ="select * from rentcar ";
			     pstm=con.prepareStatement(sql);
			    //값을 리턴
			    rs = pstm.executeQuery();
			    //반복문을 돌면서 데이터를 저장
			   
			    while(rs.next()) {
			           // 데이터를 저장할 DTO 클래스 생성
				       RentDTO rdto = new RentDTO();
				       rdto.setNo(rs.getInt(1));
					    rdto.setName(rs.getString(2));
				       rdto.setCategory(rs.getInt(3));
				       rdto.setPrice(rs.getInt(4));
				       rdto.setUsepeople(rs.getInt(5));
				       rdto.setCompany(rs.getString(6));
				       rdto.setImg(rs.getString(7));
				       rdto.setInfo(rs.getString(8));
				       //ArrayList에 bean 클래스를 저장
				       a.add(rdto);
				    }
			     
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			   if(rs != null) 
				   try{ rs.close();
			   }catch(SQLException ex) {ex.printStackTrace(); }
			   if(pstm != null) 
				   try{ pstm.close();
			   }catch(SQLException ex) {ex.printStackTrace(); }
			   if(con != null) 
				   try{ con.close();
			   }catch(SQLException ex) {ex.printStackTrace(); }
		   }
		 
		 return a;
	 
}
//-------------------------------------------------------------------------------------------
//하나의 자동차 정보를 리턴하는 메소드
public RentDTO getOneCar(int no) {
	 
	 //리턴타입 선언
	 RentDTO rdto = new RentDTO();
	 getCon();
	 
	 try {
		      String sql ="select * from rentcar where no =?";
		      pstm = con.prepareStatement(sql);
		      pstm.setInt(1,no);
		      
		      rs = pstm.executeQuery();
			    //반복문을 돌면서 데이터를 저장
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
		   if(rs != null) 
			   try{ rs.close();
		   }catch(SQLException ex) {ex.printStackTrace(); }
		   if(pstm != null) 
			   try{ pstm.close();
		   }catch(SQLException ex) {ex.printStackTrace(); }
		   if(con != null) 
			   try{ con.close();
		   }catch(SQLException ex) {ex.printStackTrace(); }
	   }
	
	 return rdto;
}
//---------------------------------------------------------------------------------------------------------

}
