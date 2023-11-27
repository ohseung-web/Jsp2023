package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
 
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
	
	   // 하나의 새로운 게시글이 넘어와서 저장되는 메소드
	   public void insertBoard(BoardBean boardBean) {
		   getConnect();
		   //빈클래스에 넘어오지 않았던 데이터들을 초기화 해야 한다.
		   int ref=0; //글그룹 = 쿼리 실행시 가장 큰 ref값을 가저온 후 더하기 1을 한다.
		   int re_step=1; //새로운 글은 부모글이므로 1
		   int re_level=1; 
		   
		   try {
			
			   // 가장 큰 ref값을 읽어오는 쿼리를 준비
			   String refsql = "select max(ref) from board";
			   // 쿼리 실행 객체 
			   pstmt = con.prepareStatement(refsql);
			   //쿼리 실행 결과를 리턴 받음
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				  ref = rs.getInt(1)+1; //최대값 +1 => 글그룹 설정 
			   }
			   //실제 게시글 전체값을 테이블에 저장
			   String sql="insert into board values(null,?,?,?,?,current_date(),?,?,?,0,?)";
			   pstmt = con.prepareStatement(sql);
			   // ? 값 매핑
			   pstmt.setString(1, boardBean.getWriter());
			   pstmt.setString(2, boardBean.getEmail());
			   pstmt.setString(3, boardBean.getSubject());
			   pstmt.setString(4, boardBean.getPassword());
			   pstmt.setInt(5, ref);
			   pstmt.setInt(6, re_step);
			   pstmt.setInt(7, re_level);
			   pstmt.setString(8, boardBean.getContent());
			   //쿼리 실행
			   pstmt.executeUpdate();
			   
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   try {
				   if(con != null) con.close();
				   if(pstmt != null) pstmt.close();
				   if(rs != null) rs.close();
			   }catch(Exception e) {
				   e.printStackTrace();
			   }
		   }
		   
	   }
	   
	// 모든 게시글을 리턴해주는 메소드 작성  
	public ArrayList<BoardBean> getAllBoard(){
		getConnect();
		ArrayList<BoardBean> a = new ArrayList<>();
		try {
			String sql = "select * from board order by ref desc, re_step asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//데이터를 패키징(가방=BoardBean클래스를이용)해줌
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				
				//패키징한 데이터 ArrayList 추가한다.
				a.add(bean);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			   try {
				   if(con != null) con.close();
				   if(pstmt != null) pstmt.close();
				   if(rs != null) rs.close();
			   }catch(Exception e) {
				   e.printStackTrace();
			   }
		   }
		
		return a;
	}
	
	
	
}
