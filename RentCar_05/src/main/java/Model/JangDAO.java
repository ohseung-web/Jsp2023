package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JangDAO {

	
	//String id ="test";
	//String pw = "1234";
	String id="javaweb0525";
	String pw = "1111";
	String url ="jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
//--------------------------------------------------------
	// DB ���� �޼ҵ� �ۼ�
	
 public void getCon() {
	 
	 try {
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 con = DriverManager.getConnection(url, id, pw);
		 
	 }catch(Exception e) {
	 e.printStackTrace();
    }
 }
 //--------------------------------------------------------------------------------
//��ǰ �Ѱ��� ������ ���� (insert)�ϴ� �޼ҵ带 �ۼ�
public void inserJang(JangDTO jdto) {
	 // DB����
	 getCon();
	 
	 try {
		 //�����غ�
		 String sql = "insert into rentjang values(?,?,?,?,?)";
		 //������ ���� �� ��ü
		 pstm = con.prepareStatement(sql);
		 // ?�� ����
		 pstm.setInt(1, jdto.getNo());
		 pstm.setString(2, jdto.getImg());
		 pstm.setString(3, jdto.getName());
		 pstm.setInt(4, jdto.getCnt());
		 pstm.setInt(5, jdto.getPrice());
		 // ���� ����
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
//��� ������ �˻��ϴ� �޼ҵ�
public ArrayList<JangDTO>  getAllJang(){
	 
	 // ArrayList<JangDTO> a = new ArrayList<JangDTO>();
	
	 ArrayList<JangDTO> a = null;  // 목록이 없으면 null 을 리턴해 줘야 하므로.
	 
	 
		//�����͸� ������ ��ü�� ����
		
		getCon();
	 		 
		 try {
			     String sql ="select * from rentjang";
			     pstm=con.prepareStatement(sql);
			    //���� ����
			    rs = pstm.executeQuery();
			    //�ݺ����� ���鼭 �����͸� ����
			   
			    if (rs.next()) {
			    	
			    	a = new ArrayList<JangDTO>();
			    	
			    	do {
			    		JangDTO  jdto = new JangDTO();
			    	       jdto.setNo(rs.getInt(1));
			    	       jdto.setImg(rs.getString(2));
			    	       jdto.setName(rs.getString(3));
			    	       jdto.setCnt(rs.getInt(4));
			    	       jdto.setPrice(rs.getInt(5));
				  
				          a.add(jdto);
			    	} while (rs.next());
			    	
			    }
			    /*
			    while(rs.next()) {
		           // �����͸� ������ DTO Ŭ���� ����
		    	       JangDTO  jdto = new JangDTO();
		    	       jdto.setNo(rs.getInt(1));
		    	       jdto.setImg(rs.getString(2));
		    	       jdto.setName(rs.getString(3));
		    	       jdto.setCnt(rs.getInt(4));
		    	       jdto.setPrice(rs.getInt(5));
		    	       
			  
			         //ArrayList�� bean Ŭ������ ����
			          a.add(jdto);
			    }
			    */
			     
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 
			 try {
				 if (rs != null) { rs.close(); }
				 if (pstm != null) { pstm.close(); }
				 if (con != null) { con.close(); }
			 } catch (SQLException ex) {ex.printStackTrace(); }
			 
			 /*
			 
			   if(rs != null) 
				   try{ rs.close();
			   }catch(SQLException ex) {ex.printStackTrace(); }
			   if(pstm != null) 
				   try{ pstm.close();
			   }catch(SQLException ex) {ex.printStackTrace(); }
			   if(con != null) 
				   try{ con.close();
			   }catch(SQLException ex) {ex.printStackTrace(); }
			   
			   */
			 
		   }
		 
		 return a;
	 
}
//-------------------------------------------------------------------------------------------
// ����
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
// ��ٱ��� ��ȣ�� �̿� �ش� ���� ����Ʈ ��Ű�� �޼ҵ� �ۼ�

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
// ���� ������Ʈ
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
// ������ �����ϴ� ������Ʈ �޼ҵ� �ۼ�
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

























