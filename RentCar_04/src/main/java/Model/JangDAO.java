package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JangDAO {

	
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
//상품 한개의 정보를 저장 (insert)하는 메소드를 작성
public void inserJang(JangDTO jdto) {
	 // DB연결
	 getCon();
	 
	 try {
		 //쿼리준비
		 String sql = "insert into rentjang values(?,?,?,?,?)";
		 //쿼리를 실행 할 객체
		 pstm = con.prepareStatement(sql);
		 // ?에 대입
		 pstm.setInt(1, jdto.getNo());
		 pstm.setString(2, jdto.getImg());
		 pstm.setString(3, jdto.getName());
		 pstm.setInt(4, jdto.getCnt());
		 pstm.setInt(5, jdto.getPrice());
		 // 쿼리 실행
		/* System.out.println("db no:"+jdto.getNo());
		 System.out.println("db img:"+jdto.getImg());
		 System.out.println("db name:"+jdto.getName());
		 System.out.println("db cnt:"+jdto.getCnt());
		 System.out.println("db price:"+jdto.getPrice());*/
		 
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
 //----------------------------------------------------------------------------------------------------
//모든 차량을 검색하는 메소드
public ArrayList<JangDTO>  getAllJang(){
	 
	 ArrayList<JangDTO> a = new ArrayList<JangDTO>();
		//데이터를 저장할 빈객체를 선언
		
		 getCon();
		 
		 try {
			     String sql ="select * from rentjang ";
			     pstm=con.prepareStatement(sql);
			    //값을 리턴
			    rs = pstm.executeQuery();
			    //반복문을 돌면서 데이터를 저장
			   
			    while(rs.next()) {
			           // 데이터를 저장할 DTO 클래스 생성
			    	       JangDTO  jdto = new JangDTO();
			    	       jdto.setNo(rs.getInt(1));
			    	       jdto.setImg(rs.getString(2));
			    	       jdto.setName(rs.getString(3));
			    	       jdto.setCnt(rs.getInt(4));
			    	       jdto.setPrice(rs.getInt(5));
			    	       
				  
				         //ArrayList에 bean 클래스를 저장
				          a.add(jdto);
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
// 삭제
public void deleteJang(int no) {
	
	getCon();
	
	try {
		
		  String sql ="delete from rentjang where no =?";
		  pstm = con.prepareStatement(sql);
		  pstm.setInt(1, no);
		  pstm.executeUpdate();
		  con.commit();
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
	
}
//-------------------------------------------------------------------------------------------------------
// 장바구니 번호로 이용 해당 개수 가운트 시키는 메소드 작성

public int getSel(int no) {
	
	  int cnt =0;
	  getCon();
	  
	  try {
		     String sql = "select count(*) from rentjang where no =?";
		     pstm = con.prepareStatement(sql);
		     pstm.setInt(1, no);
		     rs = pstm.executeQuery();
		     
		     if(rs.next()) {
		    	   cnt = rs.getInt(1);			  
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
	  
	  return cnt;
}
//------------------------------------------------------------------------------------------------------------
// 누적 업데이트
public JangDTO updateJang(int cnt, int no) {
	
	  JangDTO  jdto = new JangDTO();
	  getCon();
	
	try {
	     String sql = "update rentjang set cnt = cnt + ? where no =?";
	     pstm = con.prepareStatement(sql);
	     pstm.setInt(1, cnt);
	     pstm.setInt(2, no);
	     
	     pstm.executeUpdate();
	
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
	
	 return jdto;
}
//-----------------------------------------------------------------------------------------------
// 수량만 변경하는 업데이트 메소드 작성
public JangDTO updateCount(int cnt, int no) {
	
	  JangDTO  jdto = new JangDTO();
	  getCon();
	
	  System.out.println("dbcnt:"+cnt);
	  System.out.println("dbno:"+no);
	  
	try {
	     String sql = "update rentjang set cnt = ? where no =?";
	     pstm = con.prepareStatement(sql);
	     pstm.setInt(1, cnt);
	     pstm.setInt(2, no);
	     pstm.executeUpdate();
	     
	     
	
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
	
	 return jdto;
}
//--------------------------------------------------------------------------------------------------
}

























