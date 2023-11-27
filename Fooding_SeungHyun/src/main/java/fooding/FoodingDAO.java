package fooding;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
}
