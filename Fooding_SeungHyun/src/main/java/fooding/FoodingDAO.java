package fooding;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
    
    // 회원으로 가입한 한 회원의 id를 검색하는 메소드
    public String  chkId(String id) {
    	getConnect();
    	   String chkeckId ="";
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
    
    // 회원으로 가입 한 회원의 pw를 검색하는 메소드 작성
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
    
      // --------------------------------------------
}
