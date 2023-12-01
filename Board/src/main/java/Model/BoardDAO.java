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
	   // 하나의 새로운 게시글이 넘어와서 저장되는 메소드
	   
	   public void insertBoard(BoardBean bean) {
		   getCon();
		   
		   // 빈클래스에 넘어오지 않았던 데이터 들을 초기화 하여야 한다.
		   int ref = 0;  // 글 그룹을 의미 = 쿼리를 실행시켜서 가장 큰 ref 값을 가저온 후 +1을 더해 주면 된다.
		   int re_step = 1; // 새글이기에 부모글
		   int re_level = 1;
		   
		   try {
			   
			     // 가장 큰 ref 값을 읽어오는 쿼리 준비
			   String refsql ="select max(ref) from board";
			   //쿼리 실행객체
			   
			   pstm = con.prepareStatement(refsql);
			   // 쿼리실행 결과를 리턴
			   rs = pstm.executeQuery();
			   if(rs.next()) {  //쿼리가 결과 값이 있다면 추출
				   ref = rs.getInt(1)+1; // 최대값에 +1을 더해서 결과 그룹을 설정
			   }
			   // 실제로 게시글 전체값을 테이블에 저장
			   
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
			 
			    // 쿼리 실행하시오
			   pstm.executeUpdate();
			  
		// 자원반납	   
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
	  /* // 모든 게시글을 리턴해주는 메소드 작성
	   public ArrayList<BoardBean> getAllBoard(){
		   
		   //리턴할 객체 선언
		   ArrayList<BoardBean> a = new ArrayList<BoardBean>();
		   
		   getCon();
		   
		   try {
			   //쿼리 준비
			   
			   String sql = "select * from board order by ref desc, re_step asc";
			   //쿼리실행 할객체 선언
			   pstm = con.prepareStatement(sql);
			   //쿼리실행 후 결과 저장
			   rs = pstm.executeQuery();
			   //데이터의 개수가 몇개인지 모르기에 반복문을 이용하여 데이터 추출한다.
			   while(rs.next()) {
				   // 데이터를 패키지(가방 = BoardBean 클래스를 이용하여)해줌
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
				   
				   //패키징한 데이터를 Array에 저장
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
	   
	   // 모든 게시글을 리턴해주는 메소드 작성
	   public ArrayList<BoardBean> getAllBoard(int start, int end){
		   
		   //리턴할 객체 선언
		   ArrayList<BoardBean> a = new ArrayList<BoardBean>();
		   
		   getCon();
		   
		   try {
			   //쿼리 준비
			   
			   String sql = "select * from (select A.*,Rownum  Rnum from (select * from board order by ref desc, re_step asc)  A)"
					   + "where Rnum >= ? and Rnum <= ?";
			   //쿼리실행 할객체 선언
			   pstm = con.prepareStatement(sql);
			   pstm.setInt(1, start);
			   pstm.setInt(2, end);
			   //쿼리실행 후 결과 저장
			   rs = pstm.executeQuery();
			   //데이터의 개수가 몇개인지 모르기에 반복문을 이용하여 데이터 추출한다.
			   while(rs.next()) {
				   // 데이터를 패키지(가방 = BoardBean 클래스를 이용하여)해줌
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
				   
				   //패키징한 데이터를 Array에 저장
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
// 답변글이 저장되는 메소드
	public void reWriteBoard(BoardBean bean) {
		//부모 글그룹과 글레벨 글스탭을 읽어들인다.
	   int ref = bean.getRef();
	   int re_step = bean.getRe_step();
	   int re_level = bean.getRe_level();
	   
	   getCon();
	   try {
	   //////////// 핵심코드 ///////////////
		   // 부모 글보다 큰 re_level 의 값을 전부 1씩 증가시켜준다.
		   String levelsql="update board set re_level=re_level + 1 where ref=? and re_level > ?";
		   //쿼리실행객체 선언
		   pstm = con.prepareStatement(levelsql);
		   pstm.setInt(1, ref);
		   pstm.setInt(2, re_level);
		   //쿼리실행
		   pstm.executeUpdate();
		   //답변글 데이터를 저장
		   String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
		   pstm = con.prepareStatement(sql);
		   //?의 값을 대입한다.
		   pstm.setString(1, bean.getWriter());
		   pstm.setString(2, bean.getEmail());
		   pstm.setString(3, bean.getSubject());
		   pstm.setString(4, bean.getPassword());
		   pstm.setInt(5,ref); // 부모의 ref값을 넣어줌
		   pstm.setInt(6, re_step+1); //답글이기에 부모 글 re_step에 1을 더해줌
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
	   //하나의 게시글을 리턴하는 메소드 작성 (boardinfo때 하나의 게시글을 작성할떄 사용하자)
	   
	   public  BoardBean getOneBoard(int num) {
		   
		   //리턴타입 선언
		   BoardBean bean = new BoardBean();
		   getCon();
		   
		   try {
			   //조회수 증가쿼리 준비
			   String redsql = "update board set readcount = readcount +1 where num=?";
			   pstm = con.prepareStatement(redsql);
			   pstm.setInt(1,num);
			   pstm.executeUpdate();
			   
			      //쿼리준비
			   String sql ="select * from board where num = ?";
			   //쿼리실행객체
			   pstm = con.prepareStatement(sql);
			   pstm.setInt(1, num);
			   //쿼리 실행 후 결과 리턴
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
	// boardupdate, delete용 하나의 게시글을 리턴
public  BoardBean getOneUpdateBoard(int num) {
		   
		   //리턴타입 선언
		   BoardBean bean = new BoardBean();
		   getCon();
		   
		   try {
			   		   
			      //쿼리준비
			   String sql ="select * from board where num = ?";
			   //쿼리실행객체
			   pstm = con.prepareStatement(sql);
			   pstm.setInt(1, num);
			   //쿼리 실행 후 결과 리턴
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
	   // 업데이트와 삭제시 필요한 패스워드 값을 리턴하는 메소드

    public String getPass(int num) {
    	//리턴할 변수객체 선언
    	String pass ="";
    	getCon();
    	try {
    		//쿼리준비
    		String sql="select password from board where num = ?";
    		//쿼리 실행할 객체 선언
    		pstm = con.prepareStatement(sql);
    		pstm.setInt(1, num);
    		rs = pstm.executeQuery();
    		
    		//패스워드 값을 저장
    		if(rs.next()) {
    			pass  = rs.getString(1);
    		}
    		
    		//자원반납
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

    // 하나의 게시글을 수정하는 메소드
    public void updateBoard(BoardBean bean) {
    	
    	getCon();
    	
    	try {
    		//쿼리준비
    		String sql="update board set subject=? ,  content=?  where num = ?";
    		pstm = con.prepareStatement(sql);
    		
    		// ?값 대입
    		pstm.setString(1, bean.getSubject());
    		pstm.setString(2, bean.getContent());
    		pstm.setInt(3, bean.getNum());
    		
    		pstm.executeUpdate();
    		
    		//자원반납
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
    // 하나의 게시글을 삭제하는 메소드
    
    public void deleteBoard(int num) {
    	getCon();
    	
    	try {
    		//삭제쿼리
    		String sql="delete from board where num = ?";
    		pstm = con.prepareStatement(sql);
    		//?
    		pstm.setInt(1, num);
    		//쿼리실생
    		pstm.executeUpdate();
    		//자원 반남
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
   //전체글의 갯수를 리턴하는 메소드 작성
    public int getAllCount() {
    	getCon();
    	//게시글 전체수를 지정하는 변수
    	int count = 0;
    	try {
    		//쿼리준비
    		String sql="select count(*) from board ";
    		//쿼리를 실행할 객체선언
    		pstm = con.prepareStatement(sql);
    		//쿼리실생 후 결과 리턴받음
    		rs = pstm.executeQuery();
    		if(rs.next()) {
    			count = rs.getInt(1);//전체게시글 수
    		}
    		
    		//자원 반남
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






