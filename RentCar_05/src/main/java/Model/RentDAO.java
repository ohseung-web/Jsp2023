package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class RentDAO {

	
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
 
//��� ������ �˻��ϴ� �޼ҵ�
public ArrayList<RentDTO>  getAllCar(){
	 
	 ArrayList<RentDTO> a = new ArrayList<RentDTO>();
		//�����͸� ������ ��ü�� ����
		
		 getCon();
		 
		 try {
			     String sql ="select * from rentcar ";
			     pstm=con.prepareStatement(sql);
			    //���� ����
			    rs = pstm.executeQuery();
			    //�ݺ����� ���鼭 �����͸� ����
			   
			    while(rs.next()) {
			           // �����͸� ������ DTO Ŭ���� ����
				       RentDTO rdto = new RentDTO();
				       rdto.setNo(rs.getInt(1));
					    rdto.setName(rs.getString(2));
				       rdto.setCategory(rs.getInt(3));
				       rdto.setPrice(rs.getInt(4));
				       rdto.setUsepeople(rs.getInt(5));
				       rdto.setCompany(rs.getString(6));
				       rdto.setImg(rs.getString(7));
				       rdto.setInfo(rs.getString(8));
				       //ArrayList�� bean Ŭ������ ����
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
//�ϳ��� �ڵ��� ������ �����ϴ� �޼ҵ�
public RentDTO getOneCar(int no) {
	 
	 //����Ÿ�� ����
	 RentDTO rdto = new RentDTO();
	 getCon();
	 
	 try {
		      String sql ="select * from rentcar where no =?";
		      pstm = con.prepareStatement(sql);
		      pstm.setInt(1,no);
		      
		      rs = pstm.executeQuery();
			    //�ݺ����� ���鼭 �����͸� ����
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
