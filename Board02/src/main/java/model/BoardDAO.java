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
	
	   // 하나의 새로운 게시글이 넘어와서 저장되는 메소드--------------------------------------------------------------
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
	   
	// 모든 게시글을 리턴해주는 메소드 작성  -----------------------------------------------------------------
	public ArrayList<BoardBean> getAllBoard(int start, int pageSize){
		getConnect();
		ArrayList<BoardBean> a = new ArrayList<>();
		try {
			// mysql의 limit 3, 4 의미 => 3번째 부터 ~ 6번째까지 (총 4개)를 출력하라는 의미이다.
			String sql = "select * from  board order by ref desc, re_step asc, re_level asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1); //limit는 0부터 시작하므로 start-1을 뺸다.
			pstmt.setInt(2, pageSize);
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
	
	// BoardInfo 하나의 게새글을 리턴하는 메소드 작성---------------------------------------------------------------
	public BoardBean getOneBoard(int num) {
		getConnect();
		// 리턴타입
		BoardBean bean = new BoardBean();
		try {
			 //조회수 증가 쿼리 준비
			 String readSql = "update board set readcount = readcount + 1 where num = ?";
			 pstmt = con.prepareStatement(readSql);
			 pstmt.setInt(1, num);
			 pstmt.executeUpdate();
			 
			 //쿼리준비
			String sql = "select * from board where num=?";
			//쿼리실행객체
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
			pstmt.setInt(1, num);
			// 쿼리실행 후 결과 리턴
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
		
		return bean;
	}
	
	//답변글이 저장되는 메소드 작성
	public void reWriteBoard(BoardBean bean) {
		getConnect();
		// 글그룹에 re_step와 re_level을 먼저 수정해 주어야 한다.
		// 부모글에 re_step + 1, re_level +1을 한다. 고로 부모글을 알아야 한다.
		// re_level은 부모글보다 큰 수에 모두 +1을 더한다.
		// 부모글 그룹과 글스탭, 글레벨을 읽어들인다.
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		try {
			// 부모글 보다 큰 re_level값에 모두 1씩 증가
			// (단, ref가 같은 그룹이어야 하고, 현재 re_level보다 큰값만)
			String levelsql ="update board set re_level = re_level + 1 where ref = ? and  re_level > ?";
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();
			
			//답변글 데이터를 저장
			String sql = "insert into board values(null,?,?,?,?,current_date(),?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref); //부모의 ref값 넣는다.
			pstmt.setInt(6, re_step+1); //답글이므로 부모글에 더하기 1한다.
			pstmt.setInt(7, re_level+1);
			pstmt.setString(8, bean.getContent());
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
	
	//BoardUpdate, Delete용 하나의 게시글 리턴 메소드
	public BoardBean getOneUpdateBoard(int num) {
		getConnect();
		// 리턴타입
		BoardBean bean = new BoardBean();
		try {
			 //쿼리준비
			String sql = "select * from board where num=?";
			//쿼리실행객체
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
			pstmt.setInt(1, num);
			// 쿼리실행 후 결과 리턴
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
		
		return bean;
	}
	
	//update와 Delete시 사용할 패스워드 값을 리턴해주는 메소드
	public String getPass(int num) {
		getConnect();
		String pw ="";
		
		try {
			 //쿼리준비
			String sql = "select password from board where num=?";
			//쿼리실행객체
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
			pstmt.setInt(1, num);
			// 쿼리실행 후 결과 리턴
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString(1);
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
		
		return pw;
	}
	
	// 하나의 게시글을 수정하는 메소드
	public void updateBoard(BoardBean bean) {
		getConnect();
		try {
			 //쿼리준비
			String sql = "update board set subject=?,content=? where num=?";
			//쿼리실행객체
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
		    pstmt.setString(1, bean.getSubject());
		    pstmt.setString(2, bean.getContent());
		    pstmt.setInt(3, bean.getNum());
			// 쿼리실행 후 결과 리턴
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
	
	//하나의 게시글을 삭제하는 메소드
	public void deleteBoard(int num) {
		getConnect();
		
		try {
			 //쿼리준비
			String sql = "delete from board where num=?";
			//쿼리실행객체
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
		    pstmt.setInt(1, num);
			// 쿼리실행 후 결과 리턴
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
	
	//-전체 글의 갯수를 리턴하는 메소드 작성 ---- 카운터링 
	public int getAllCount() {
		getConnect();
		//전체 게시글을 저장하는 변수
		int count = 0;
		
		try {
			 //쿼리준비
			String sql = "select count(*) from board";
			//쿼리실행객체
			pstmt = con.prepareStatement(sql);
		    rs = pstmt.executeQuery();
			// 쿼리실행 후 결과 리턴
			if(rs.next()) {
				count = rs.getInt(1); // 전체개시글 수 리턴
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
		
		return count;
	}
	
}
