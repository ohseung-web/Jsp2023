package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
    
	   String id = "test";
	   String password ="1234";
	   String url ="jdbc:oracle:thin:@localhost:1521:XE";
	   
	   Connection con;
	   PreparedStatement pstm;
	   ResultSet rs;
//--------------------------------------------------------------------------------------	   
	   public void getCon() {
		   try {
			       Class.forName("oracle.jdbc.driver.OracleDriver");
			       con = DriverManager.getConnection(url,id, password);
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	   }
//-------------------------------------------------------------------------------------------	   
	   // �ϳ��� ���ο� �Խñ��� �Ѿ�ͼ� ����Ǵ� �޼ҵ�
	   
	   public void insertBoard(BoardBean bean) {
		   getCon();
		   
		   // ��Ŭ������ �Ѿ���� �ʾҴ� ������ ���� �ʱ�ȭ �Ͽ��� �Ѵ�.
		   int ref = 0;  // �� �׷��� �ǹ� = ������ ������Ѽ� ���� ū ref ���� ������ �� +1�� ���� �ָ� �ȴ�.
		   int re_step = 1; // �����̱⿡ �θ��
		   int re_level = 1;
		   
		   try {
			   
			     // ���� ū ref ���� �о���� ���� �غ�
			   String refsql ="select max(ref) from board";
			   //���� ���ఴü
			   
			   pstm = con.prepareStatement(refsql);
			   // �������� ����� ����
			   rs = pstm.executeQuery();
			   if(rs.next()) {  //������ ��� ���� �ִٸ� ����
				   ref = rs.getInt(1)+1; // �ִ밪�� +1�� ���ؼ� ��� �׷��� ����
			   }
			   // ������ �Խñ� ��ü���� ���̺� ����
			   
			   String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			   pstm = con.prepareStatement(sql);
			   pstm.setString(1,bean.getWriter());
			   pstm.setString(2,bean.getEmail());
			   pstm.setString(3,bean.getSubject());
			   pstm.setString(4,bean.getPassword());
			   pstm.setInt(5, ref);
			   pstm.setInt(6, re_step);
			   pstm.setInt(7,re_level);
			   pstm.setString(8,bean.getContent());
			 
			    // ���� �����Ͻÿ�
			   pstm.executeUpdate();
			  
		// �ڿ��ݳ�	   
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
		   
	   }
//-----------------------------------------------------------------------------------------	   
	  /* // ��� �Խñ��� �������ִ� �޼ҵ� �ۼ�
	   public ArrayList<BoardBean> getAllBoard(){
		   
		   //������ ��ü ����
		   ArrayList<BoardBean> a = new ArrayList<BoardBean>();
		   
		   getCon();
		   
		   try {
			   //���� �غ�
			   
			   String sql = "select * from board order by ref desc, re_step asc";
			   //�������� �Ұ�ü ����
			   pstm = con.prepareStatement(sql);
			   //�������� �� ��� ����
			   rs = pstm.executeQuery();
			   //�������� ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� ������ �����Ѵ�.
			   while(rs.next()) {
				   // �����͸� ��Ű��(���� = BoardBean Ŭ������ �̿��Ͽ�)����
				   BoardBean bean = new BoardBean();
				   bean.setNum(rs.getInt(1));
				   bean.setWriter(rs.getString(2));
				   bean.setEmail(rs.getString(3));
				   bean.setSubject(rs.getString(4));
				   bean.setPassword(rs.getString(5));
				   bean.setDate(rs.getDate(6).toString());
				   
				   bean.setRef(rs.getInt(7));
				   bean.setRe_step(rs.getInt(8));
				   bean.setRe_level(rs.getInt(9));
				   bean.setReadcount(rs.getInt(10));
				   bean.setContent(rs.getString(11));
				   
				   //��Ű¡�� �����͸� Array�� ����
				   a.add(bean);
				   
			   }
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
		   
		   return a;
	   }*/
	   
	   // ��� �Խñ��� �������ִ� �޼ҵ� �ۼ�
	   public ArrayList<BoardBean> getAllBoard(int start, int end){
		   
		   //������ ��ü ����
		   ArrayList<BoardBean> a = new ArrayList<BoardBean>();
		   
		   getCon();
		   
		   try {
			   //���� �غ�
			   
			   String sql = "select * from (select A.*,Rownum  Rnum from (select * from board order by ref desc, re_step asc)  A)"
					   + "where Rnum >= ? and Rnum <= ?";
			   //�������� �Ұ�ü ����
			   pstm = con.prepareStatement(sql);
			   pstm.setInt(1, start);
			   pstm.setInt(2, end);
			   //�������� �� ��� ����
			   rs = pstm.executeQuery();
			   //�������� ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� ������ �����Ѵ�.
			   while(rs.next()) {
				   // �����͸� ��Ű��(���� = BoardBean Ŭ������ �̿��Ͽ�)����
				   BoardBean bean = new BoardBean();
				   bean.setNum(rs.getInt(1));
				   bean.setWriter(rs.getString(2));
				   bean.setEmail(rs.getString(3));
				   bean.setSubject(rs.getString(4));
				   bean.setPassword(rs.getString(5));
				   bean.setDate(rs.getDate(6).toString());
				   
				   bean.setRef(rs.getInt(7));
				   bean.setRe_step(rs.getInt(8));
				   bean.setRe_level(rs.getInt(9));
				   bean.setReadcount(rs.getInt(10));
				   bean.setContent(rs.getString(11));
				   
				   //��Ű¡�� �����͸� Array�� ����
				   a.add(bean);
				   
			   }
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
		   
		   return a;
	   }
	   
//-----------------------------------------------------------------------------------------------------------
// �亯���� ����Ǵ� �޼ҵ�
	public void reWriteBoard(BoardBean bean) {
		//�θ� �۱׷�� �۷��� �۽����� �о���δ�.
	   int ref = bean.getRef();
	   int re_step = bean.getRe_step();
	   int re_level = bean.getRe_level();
	   
	   getCon();
	   try {
	   //////////// �ٽ��ڵ� ///////////////
		   // �θ� �ۺ��� ū re_level �� ���� ���� 1�� ���������ش�.
		   String levelsql="update board set re_level=re_level + 1 where ref=? and re_level > ?";
		   //�������ఴü ����
		   pstm = con.prepareStatement(levelsql);
		   pstm.setInt(1, ref);
		   pstm.setInt(2, re_level);
		   //��������
		   pstm.executeUpdate();
		   //�亯�� �����͸� ����
		   String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
		   pstm = con.prepareStatement(sql);
		   //?�� ���� �����Ѵ�.
		   pstm.setString(1, bean.getWriter());
		   pstm.setString(2, bean.getEmail());
		   pstm.setString(3, bean.getSubject());
		   pstm.setString(4, bean.getPassword());
		   pstm.setInt(5,ref); // �θ��� ref���� �־���
		   pstm.setInt(6, re_step+1); //����̱⿡ �θ� �� re_step�� 1�� ������
		   pstm.setInt(7, re_level+1);
		   pstm.setString(8, bean.getContent());
		   pstm.executeUpdate();
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally { 
			 try {
				 if (rs != null) { rs.close(); }
				 if (pstm != null) { pstm.close(); }
				 if (con != null) { con.close(); }
			 }  catch (SQLException ex) {ex.printStackTrace(); }
		}
	}
//--------------------------------------------------------------------------------------------	   
	   //�ϳ��� �Խñ��� �����ϴ� �޼ҵ� �ۼ� (boardinfo�� �ϳ��� �Խñ��� �ۼ��ҋ� �������)
	   
	   public  BoardBean getOneBoard(int num) {
		   
		   //����Ÿ�� ����
		   BoardBean bean = new BoardBean();
		   getCon();
		   
		   try {
			   //��ȸ�� �������� �غ�
			   String redsql = "update board set readcount = readcount +1 where num=?";
			   pstm = con.prepareStatement(redsql);
			   pstm.setInt(1,num);
			   pstm.executeUpdate();
			   
			      //�����غ�
			   String sql ="select * from board where num = ?";
			   //�������ఴü
			   pstm = con.prepareStatement(sql);
			   pstm.setInt(1, num);
			   //���� ���� �� ��� ����
			   rs = pstm.executeQuery();
			   if(rs.next()) {
				   bean.setNum(rs.getInt(1));
				   bean.setWriter(rs.getString(2));
				   bean.setEmail(rs.getString(3));
				   bean.setSubject(rs.getString(4));
				   bean.setPassword(rs.getString(5));
				   bean.setDate(rs.getDate(6).toString());
				   bean.setRef(rs.getInt(7));
				   bean.setRe_step(rs.getInt(8));
				   bean.setRe_level(rs.getInt(9));
				   bean.setReadcount(rs.getInt(10));
				   bean.setContent(rs.getString(11));
			   }
			   
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
		   
		   return bean;
	   }
//----------------------------------------------------------------------------------------------	   
	// boardupdate, delete�� �ϳ��� �Խñ��� ����
public  BoardBean getOneUpdateBoard(int num) {
		   
		   //����Ÿ�� ����
		   BoardBean bean = new BoardBean();
		   getCon();
		   
		   try {
			   		   
			      //�����غ�
			   String sql ="select * from board where num = ?";
			   //�������ఴü
			   pstm = con.prepareStatement(sql);
			   pstm.setInt(1, num);
			   //���� ���� �� ��� ����
			   rs = pstm.executeQuery();
			   if(rs.next()) {
				   bean.setNum(rs.getInt(1));
				   bean.setWriter(rs.getString(2));
				   bean.setEmail(rs.getString(3));
				   bean.setSubject(rs.getString(4));
				   bean.setPassword(rs.getString(5));
				   bean.setDate(rs.getDate(6).toString());
				   
				   bean.setRef(rs.getInt(7));
				   bean.setRe_step(rs.getInt(8));
				   bean.setRe_level(rs.getInt(9));
				   bean.setReadcount(rs.getInt(10));
				   bean.setContent(rs.getString(11));
			   }
			   
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
		   
		   return bean;
	   }
//------------------------------------------------------------------------------------------------------------	   
	   // ������Ʈ�� ������ �ʿ��� �н����� ���� �����ϴ� �޼ҵ�

    public String getPass(int num) {
    	//������ ������ü ����
    	String pass ="";
    	getCon();
    	try {
    		//�����غ�
    		String sql="select password from board where num = ?";
    		//���� ������ ��ü ����
    		pstm = con.prepareStatement(sql);
    		pstm.setInt(1, num);
    		rs = pstm.executeQuery();
    		
    		//�н����� ���� ����
    		if(rs.next()) {
    			pass  = rs.getString(1);
    		}
    		
    		//�ڿ��ݳ�
    	 }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
    	return pass;
    }
    
    // ----------------------------------------------------------------------

    // �ϳ��� �Խñ��� �����ϴ� �޼ҵ�
    public void updateBoard(BoardBean bean) {
    	
    	getCon();
    	
    	try {
    		//�����غ�
    		String sql="update board set subject=? ,  content=?  where num = ?";
    		pstm = con.prepareStatement(sql);
    		
    		// ?�� ����
    		pstm.setString(1, bean.getSubject());
    		pstm.setString(2, bean.getContent());
    		pstm.setInt(3, bean.getNum());
    		
    		pstm.executeUpdate();
    		
    		//�ڿ��ݳ�
   	 }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
    }
    //-----------------------------------------------------------------------------
    // �ϳ��� �Խñ��� �����ϴ� �޼ҵ�
    
    public void deleteBoard(int num) {
    	getCon();
    	
    	try {
    		//��������
    		String sql="delete from board where num = ?";
    		pstm = con.prepareStatement(sql);
    		//?
    		pstm.setInt(1, num);
    		//�����ǻ�
    		pstm.executeUpdate();
    		//�ڿ� �ݳ�
    	 }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
    }
  //-------------------------------------------------------------------------  
   //��ü���� ������ �����ϴ� �޼ҵ� �ۼ�
    public int getAllCount() {
    	getCon();
    	//�Խñ� ��ü���� �����ϴ� ����
    	int count = 0;
    	try {
    		//�����غ�
    		String sql="select count(*) from board ";
    		//������ ������ ��ü����
    		pstm = con.prepareStatement(sql);
    		//�����ǻ� �� ��� ���Ϲ���
    		rs = pstm.executeQuery();
    		if(rs.next()) {
    			count = rs.getInt(1);//��ü�Խñ� ��
    		}
    		
    		//�ڿ� �ݳ�
    	 }catch(Exception e) {
			   e.printStackTrace();
		   }finally { 
				 try {
					 if (rs != null) { rs.close(); }
					 if (pstm != null) { pstm.close(); }
					 if (con != null) { con.close(); }
				 }  catch (SQLException ex) {ex.printStackTrace(); }
			}
    	return count;
    }
    //----------------------------------------------------------------------------------------------------
   
}






