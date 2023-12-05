package fooding;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FoodingDAO {
      
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
    
    // fooding  테이블 한명의 회원정보를 저장하는 메소드 ------------------------------------------------------------
    public void insertFooding(FoodingBean fbean) {
    	getConnect();
    	try {
    		// 쿼리 실행 준비 작업
    		String sql = "insert into fooding (name,id,pw,tel,email,address) values(?,?,?,?,?,?)";
        	// 쿼리를 사용하도록 설정 , 자동으로 생성된 키 값이 있는 resultSet Object 를 검색한다.
            pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        	// 데이터 연결
            pstmt.setString(1, fbean.getName());
        	pstmt.setString(2, fbean.getId());
        	pstmt.setString(3, fbean.getPw());
        	pstmt.setString(4, fbean.getTel());
        	pstmt.setString(5, fbean.getEmail());
        	pstmt.setString(6, fbean.getAddress());
        	// 쿼리 실행 : insert,update,delete는 executeUpdate를 이용하여 실행한다.
        	pstmt.executeUpdate();
        	// 자원 반납 : connection 종료
        	//con.close();
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
    
    // 회원으로 가입한 한 회원의 id를 검색하는 메소드 ----------------------------------------------------
    public String  chkId(String id) {
    	getConnect();
    	   String chkeckId ="";
    	   System.out.println(id);
    	try {
    		String sql ="select id from fooding where id=?";
     		pstmt = con.prepareStatement(sql);
     		pstmt.setString(1, id);
     		rs = pstmt.executeQuery();
     		if(rs.next()) {
     			chkeckId = rs.getString(1);
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
    	return chkeckId;
    }
    
    // 회원으로 가입 한 회원의 pw를 검색하는 메소드 작성 --------------------------------------------------
    public String getPass(String id) {
    	getConnect();
    	String pw ="";
    	try {
    	    String sql ="select pw from fooding where id=?";
    	    pstmt = con.prepareStatement(sql);
    	    pstmt.setString(1, id);
    	    rs = pstmt.executeQuery();
    	    if(rs.next()) {
    	    	pw = rs.getString(1);
    	    }
    	    
    	   // System.out.print(pw);
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
    
    // board dbjoin 메소드 작성 -----------------------------------------------------
    public FoodingBean dbjoin(String id) {
    	getConnect();
   
    	FoodingBean fbean = new FoodingBean();
    	
    	try {
    	
    		String sql ="select name, tel, email from fooding where id =?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			fbean.setName(rs.getString(1));
    			fbean.setTel(rs.getString(2));
    			fbean.setEmail(rs.getString(3));
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con != null) con.close();
    			if(pstmt != null) pstmt.close();
    			if(rs != null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	
    	
    	return fbean;
    }
  
    // foodingboard 테이블에 하나의 새로운 게시글 insert하는 메소드 작성 --------------------------------------
	   public void insertBoard(FoodingBoardBean fdbean) {
		   getConnect();
		   //빈클래스에 넘어오지 않았던 데이터들을 초기화 해야 한다.
		   int ref=0; //글그룹 = 쿼리 실행시 가장 큰 ref값을 가저온 후 더하기 1을 한다.
		   int re_step=1; //새로운 글은 부모글이므로 1
		   int re_level=1; 
		   
		   try {
			
			   // 가장 큰 ref값을 읽어오는 쿼리를 준비
			   String refsql = "select max(ref) from foodingboard";
			   // 쿼리 실행 객체 
			   pstmt = con.prepareStatement(refsql);
			   //쿼리 실행 결과를 리턴 받음
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				  ref = rs.getInt(1)+1; //최대값 +1 => 글그룹 설정 
			   }
			   //실제 게시글 전체값을 테이블에 저장
			   String sql="insert into foodingboard values(null,?,?,?,?,?,current_date(),?,?,?,0,?,?)";
			   pstmt = con.prepareStatement(sql);
			   // ? 값 매핑
			   pstmt.setString(1, fdbean.getName());
			   pstmt.setString(2, fdbean.getEmail());
			   pstmt.setString(3, fdbean.getTel());
			   pstmt.setString(4, fdbean.getSubject());
			   pstmt.setString(5, fdbean.getPassword());
			   pstmt.setInt(6, ref);
			   pstmt.setInt(7, re_step);
			   pstmt.setInt(8, re_level);
			   pstmt.setString(9, fdbean.getContent());
			   pstmt.setString(10, fdbean.getId());
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
    
	 //모든회원의 게시글 전체를 리턴하는 메소드 ---------------------------------------------------------
	public ArrayList<FoodingBoardBean> allFooding(){
		getConnect();
		ArrayList<FoodingBoardBean> a = new ArrayList<>();
		
		try {
	
			String sql = "select * from foodingboard  order by ref desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FoodingBoardBean bean = new FoodingBoardBean();
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setSubject(rs.getString(5));
				bean.setPassword(rs.getString(6));
				bean.setReg_date(rs.getString(7));
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));
				bean.setId(rs.getString(13));
				
				a.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return a;
	}
	   
	
	// BoardInfo 하나의 게새글을 리턴하는 메소드 작성---------------------------------------------------------------
		public FoodingBoardBean getOneBoard(int num) {
			getConnect();
			// 리턴타입
			
			FoodingBoardBean bean = new FoodingBoardBean();
			
		//	System.out.println(bean.getId());
			
			try {
				 //쿼리준비
				String sql = "select * from foodingboard where num=?";
				//쿼리실행객체
				pstmt = con.prepareStatement(sql);
				// ? 맵핑
				pstmt.setInt(1, num);
				// 쿼리실행 후 결과 리턴
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setNum(rs.getInt(1));
					bean.setName(rs.getString(2));
					bean.setEmail(rs.getString(3));
					bean.setTel(rs.getString(4));
					bean.setSubject(rs.getString(5));
					bean.setPassword(rs.getString(6));
					bean.setReg_date(rs.getDate(7).toString());
					bean.setRef(rs.getInt(8));
					bean.setRe_step(rs.getInt(9));
					bean.setRe_level(rs.getInt(10));
					bean.setReadcount(rs.getInt(11));
					bean.setContent(rs.getString(12));
					bean.setId(rs.getString(13));
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
	
	// 답변 리턴하는 메소드 ----------------------------------------------------------------------
	public void reWriteFooding(FoodingBoardBean bean) {
		getConnect();
		
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		System.out.println("ref"+ref);
		System.out.println("re_step"+re_step);
		
		try {
			
		
						// re_step가 1인 부모글에 re_step 더하기 4를하여 답변완료 출력하는 업데이트
						String levelsql ="update foodingboard set re_step = re_step + 4 where ref = ? and re_step=1";
						pstmt = con.prepareStatement(levelsql);
						pstmt.setInt(1, ref);
						//pstmt.setInt(2, re_level);
						pstmt.executeUpdate();
						
						//답변글 데이터를 저장
						String sql = "insert into foodingboard values(null,?,?,?,?,?,current_date(),?,?,?,0,?,?)";
						pstmt = con.prepareStatement(sql);
						// ? 맵핑
						pstmt.setString(1, bean.getName());
						pstmt.setString(2, bean.getEmail());
						pstmt.setString(3, bean.getTel());
						pstmt.setString(4, bean.getSubject());
						pstmt.setString(5, bean.getPassword());
						pstmt.setInt(6, ref); //부모의 ref값 넣는다.
						pstmt.setInt(7, re_step+1); //답글이므로 부모글에 더하기 1한다.
						pstmt.setInt(8, re_level+1);
						pstmt.setString(9, bean.getContent());
						pstmt.setString(10, bean.getId());
						pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				   if(con != null) con.close();
				   if(pstmt != null) pstmt.close();
				   if(rs != null) rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	//---------------------------------------------------------------------------------------------
		
}
