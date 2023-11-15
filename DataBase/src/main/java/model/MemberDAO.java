package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// mysql에 연결하고 select, insert, update, delete작업을
// 실행하는 클래스이다.
public class MemberDAO {

	//mysql 접속하는 소스를 작성한다. 
    String id = "root"; // 설정된 id
    String Pass = "12345678"; // 설정된 password
    String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; //접속URL
	
    Connection con; //데이터 베이스에 접근할수 있도록 설정
    PreparedStatement pstmt; //데이터 베이스에서 쿼리를 실행시켜주는 객체
    ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
    
    
    //데이터 베이스에 접근할수 있도록 도와주는 메서드 작성
	public void getCon() {
		
		try {
			
			//1. 해당 데이터 베이스를 사용한다고 선언(클래스를 등록=mysql을 사용)
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
	    	 //2. 해당 데이터 베이스에 접속 반드시 java.sql에 존재하는 Connection을 사용한다.
	    	 con = DriverManager.getConnection(jdbcUrl, id, Pass);
			
		}catch(Exception e) {
			
		}
	}
	
	//데이터 베이스에 한사람의 회원 정보를저장해주는 메서드
	public void insertMember(MemberBean mbean) {
		
		try{
	    	 getCon();
	    	 // String createSQL="INSERT INTO memberJoin VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	    	 //4. 쿼리를 사용하도록 설정 , Jsp에서 쿼리를 사용하도록 설정 
	    	 PreparedStatement pstmt = con.prepareStatement("INSERT INTO memberJoin VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
	    	 //5. ?에 맞게 데이터를 연결
	    	 pstmt.setString(1, mbean.getId());	
	    	 pstmt.setString(2, mbean.getPw());
	    	 pstmt.setString(3, mbean.getEmail());
	    	 pstmt.setString(4, mbean.getTel());
	    	 pstmt.setString(5, mbean.getHabby());
	    	 pstmt.setString(6, mbean.getJob());
	    	 pstmt.setString(7, mbean.getAge());
	    	 pstmt.setString(8, mbean.getInfo());
	    	 //6. mysql에서 쿼리를 실행하시오.
	    	 pstmt.executeUpdate(); //insert, delete, update시 사용하는 메서도
	    	 
	    	 //7. 자원 반납
	    	 con.close();
	    	 
	     }catch(Exception e){
	    	 e.printStackTrace();
	     }
	}
	
}


