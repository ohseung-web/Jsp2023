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
 
 // ȸ��  �� ����� ������ �����ϴ� �޼ҵ�

public void insertMember(ScoreDTO sdto) {
	 
	 getCon();
	 
	 try {
		 //�����غ�
		 String sql ="insert into score values(?,?,?,?,?,?,?,?)";
		 //�������� �� ��ü
		 pstm = con.prepareStatement(sql);
		 // ?�� ����
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
		 //���� ����
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
//��� ȸ���� ������ �����ϴ� �޼ҵ� �ۼ�
public ArrayList<ScoreDTO> getAllStudent(){
	 
	 //����Ÿ���� �����Ѵ�.
	 ArrayList<ScoreDTO> a = new ArrayList<ScoreDTO>();
	 
	 getCon();
	 try {
		 //�����غ�
		 String sql = "select * from score";
		 //������ü �غ�
		 pstm = con.prepareStatement(sql);
		 //���� ���� �� ��� ����
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
			
			 //ArrayList DTOŬ������ ����
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
//�й��� ���� �̸�

public String getNum(String num) {
	 
	 //������ ���� ����
	 String name = "";
	 getCon();
	 
	 try {
		 //�����غ�
		 String sql ="select name from score where num = ?";
		 //���� ������ ��ü
		 pstm = con.prepareStatement(sql);
		 //?���� ��
		 pstm.setString(1, num);
		 rs = pstm.executeQuery();
		 //�н����� �� ����
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
//���θ�� �޾ƿ��� �޼ҵ�
public ScoreDTO getOneScore(String num) {
	 
	 // ���Ϲ��� ��ü�� ����
	 ScoreDTO sdto = new ScoreDTO();
	 // DB����
	 getCon();
	 
	 try {
		 
		 //�����غ�
		 String sql = "select * from score where num = ?";
		 //�������� ��ü
		 pstm = con.prepareStatement(sql);
		 // ?���� �� ����
		 pstm.setString(1, num);
		 
		 //���� ���� �� ��� ����
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
//���� ���� �����ϴ� �޼ҵ�
public void updateScore(String num, int sub1, int sub2, int sub3) {
	 
	 getCon();
	 
	 try {
		 
		 //�����غ�
		 String sql = "update score set sub1 = ?, sub2 = ?, sub3 =? where num =? ";
		 pstm = con.prepareStatement(sql);
		 
		 // ?���� ��
		 pstm.setInt(1, sub1);
		 pstm.setInt(2, sub2);
		 pstm.setInt(3, sub3);
		 pstm.setString(4, num);
		 
		 //��������
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
//�������� ���� �޼ҵ�
public void deleteScore(String num) {
	 getCon();
	 
	 try {
		 //���� ����
		 String sql ="delete from score where num = ?";
		 pstm = con.prepareStatement(sql);
		 //? ���� ��
		 pstm.setString(1, num);
		 //��������
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
