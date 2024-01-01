package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class scoreDAO {

	 String id = "test";
	   String password ="1234";
	   String url ="jdbc:oracle:thin:@localhost:1521:XE";
	   
	   Connection con = null ;
	   PreparedStatement pstm =null;
	   ResultSet rs =null ;
	   
public void getCon() {
	
	try {
		
		    Class.forName("oracle.jdbc.driver.OracleDriver");
	         con = DriverManager.getConnection(url, id, password);
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}
 
 // 회원  한 사람의 정보를 저장하는 메소드

public void insertMember(ScoreDTO sdto) {
	 
	 getCon();
	 
	 try {
		 //쿼리준비
		 String sql ="insert into score values(?,?,?,?,?,?,?,?)";
		 //쿼리실행 할 객체
		 pstm = con.prepareStatement(sql);
		 // ?에 대입
		 pstm.setString(1, sdto.getNum());
		 pstm.setString(2,sdto.getName());
		 pstm.setInt(3,sdto.getSub1());
		 pstm.setInt(4,sdto.getSub2());
		 pstm.setInt(5,sdto.getSub3());
		 pstm.setInt(6, sdto.getTotal());
		 pstm.setDouble(7, sdto.getAverage());
	     pstm.setString(8, sdto.getGrade());
	/*	 pstm.setInt(6,sdto.getTotal());
		 pstm.setDouble(7,sdto.getAverage());*/
		 //쿼리 실행
		 pstm.executeUpdate();
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		   if(rs != null) 
			   try{ rs.close();
		   }catch(SQLException ex) { }
		   if(pstm != null) 
			   try{ pstm.close();
		   }catch(SQLException ex) { }
		   if(con != null) 
			   try{ con.close();
		   }catch(SQLException ex) { }
	   }
	   
	 }

//----------------------------------------------------------------------------------------
//모든 회원의 정보를 리턴하는 메소드 작성
public ArrayList<ScoreDTO> getAllStudent(){
	 
	 //리턴타입을 선언한다.
	 ArrayList<ScoreDTO> a = new ArrayList<ScoreDTO>();
	 
	 getCon();
	 try {
		 //쿼리준비
		 String sql = "select * from score";
		 //쿼리객체 준비
		 pstm = con.prepareStatement(sql);
		 //쿼리 실행 후 결과 리턴
		 rs = pstm.executeQuery();
		 
		 while(rs.next()) {
			ScoreDTO sdto = new ScoreDTO();
			sdto.setNum(rs.getString(1));
			sdto.setName(rs.getString(2));
			sdto.setSub1(rs.getInt(3));
			sdto.setSub2(rs.getInt(4));
			sdto.setSub3(rs.getInt(5));
			sdto.setTotal(rs.getInt(6));
			sdto.setAverage(rs.getDouble(7));
			sdto.setGrade(rs.getString(8));
			
			 //ArrayList DTO클래스에 저장
			 a.add(sdto);
		 }
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 if(rs != null) {
			 try {
				 rs.close();
			 }catch(Exception e) {}
		 }	 
		 if(pstm != null) {
			 try {
				 pstm.close();
			 }catch(Exception e) {}	
		 }	 
		if(con != null) {
			 try {
				 con.close();
			 }catch(Exception e) {}	 
		}	 
	 }
	 
	 return a;
	 
}
//--------------------------------------------------------------------------------------
//학번이 같은 이름

public String getNum(String num) {
	 
	 //리턴할 변수 선언
	 String name = "";
	 getCon();
	 
	 try {
		 //쿼리준비
		 String sql ="select name from score where num = ?";
		 //쿼리 실행할 객체
		 pstm = con.prepareStatement(sql);
		 //?대응 값
		 pstm.setString(1, num);
		 rs = pstm.executeQuery();
		 //패스워드 값 저장
		 if(rs.next()) {
			 name= rs.getString(1);
		 }
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 if(rs != null) {
			 try {
				 rs.close();
			 }catch(Exception e) {}
		 }	 
		 if(pstm != null) {
			 try {
				 pstm.close();
			 }catch(Exception e) {}	
		 }	 
		if(con != null) {
			 try {
				 con.close();
			 }catch(Exception e) {}	 
		}	
	 }
	 return name;
}
//-----------------------------------------------------------------------
//개인목록 받아오는 메소드
public ScoreDTO getOneScore(String num) {
	 
	 // 리턴받을 객체를 선언
	 ScoreDTO sdto = new ScoreDTO();
	 // DB연결
	 getCon();
	 
	 try {
		 
		 //쿼리준비
		 String sql = "select * from score where num = ?";
		 //쿼리실행 객체
		 pstm = con.prepareStatement(sql);
		 // ?대입 값 추출
		 pstm.setString(1, num);
		 
		 //쿼리 실행 후 결과 리턴
		 rs = pstm.executeQuery();
		 
		 if(rs.next()) {
			sdto.setNum(rs.getString(1));
			sdto.setName(rs.getString(2)); 
			sdto.setSub1(rs.getInt(3)); 
			sdto.setSub2(rs.getInt(4)); 
			sdto.setSub3(rs.getInt(5)); 
			sdto.setTotal(rs.getInt(6)); 
			sdto.setAverage(rs.getDouble(7));
			sdto.setGrade(rs.getString(8)); 
		 }
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 if(rs != null) {
			 try {
				 rs.close();
			 }catch(Exception e) {}
		 }	 
		 if(pstm != null) {
			 try {
				 pstm.close();
			 }catch(Exception e) {}	
		 }	 
		if(con != null) {
			 try {
				 con.close();
			 }catch(Exception e) {}	 
		}	
	 }
		  
	 return sdto;
}
//-------------------------------------------------------------------------
//개인 정보 수겅하는 메소드
public void updateScore(String num, int sub1, int sub2, int sub3) {
	 
	 getCon();
	 
	 try {
		 
		 //쿼리준비
		 String sql = "update score set sub1 = ?, sub2 = ?, sub3 =? where num =? ";
		 pstm = con.prepareStatement(sql);
		 
		 // ?대응 값
		 pstm.setInt(1, sub1);
		 pstm.setInt(2, sub2);
		 pstm.setInt(3, sub3);
		 pstm.setString(4, num);
		 
		 //쿼리실행
		 pstm.executeUpdate();
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 if(rs != null) {
			 try {
				 rs.close();
			 }catch(Exception e) {}
		 }	 
		 if(pstm != null) {
			 try {
				 pstm.close();
			 }catch(Exception e) {}	
		 }	 
		if(con != null) {
			 try {
				 con.close();
			 }catch(Exception e) {}	 
		}	
	 }
}
//-------------------------------------------------------------------------
//개인정보 삭제 메소드
public void deleteScore(String num) {
	 getCon();
	 
	 try {
		 //삭제 쿼리
		 String sql ="delete from score where num = ?";
		 pstm = con.prepareStatement(sql);
		 //? 대응 값
		 pstm.setString(1, num);
		 //쿼리실행
		 pstm.executeUpdate();
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally {
		 if(rs != null) {
			 try {
				 rs.close();
			 }catch(Exception e) {}
		 }	 
		 if(pstm != null) {
			 try {
				 pstm.close();
			 }catch(Exception e) {}	
		 }	 
		if(con != null) {
			 try {
				 con.close();
			 }catch(Exception e) {}	 
		}	
	 }
}

}
