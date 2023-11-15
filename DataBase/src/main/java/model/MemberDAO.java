package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// mysql에 연결하고 select, insert, update, delete작업을
// 실행하는 클래스이다.
public class MemberDAO {

//	//mysql 접속하는 소스를 작성한다. 
//    String id = "root"; // 설정된 id
//    String Pass = "12345678"; // 설정된 password
//    String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; //접속URL
//	
//    Connection con; //데이터 베이스에 접근할수 있도록 설정
//    PreparedStatement pstmt; //데이터 베이스에서 쿼리를 실행시켜주는 객체
//    ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
//    
//    
//    //데이터 베이스에 접근할수 있도록 도와주는 메서드 작성
//	public void getCon() {
//		
//		try {
//			
//			//1. 해당 데이터 베이스를 사용한다고 선언(클래스를 등록=mysql을 사용)
//	    	 Class.forName("com.mysql.cj.jdbc.Driver");
//	    	 //2. 해당 데이터 베이스에 접속 반드시 java.sql에 존재하는 Connection을 사용한다.
//	    	 con = DriverManager.getConnection(jdbcUrl, id, Pass);
//			
//		}catch(Exception e) {
//			
//		}
//	}
	
	Connection con = DatabaseUtil.getConnection();
	PreparedStatement pstmt; //데이터 베이스에서 쿼리를 실행시켜주는 객체
    ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
    
	//데이터 베이스에 한사람의 회원 정보를저장해주는 메서드
	public void insertMember(MemberBean mbean) {
		
		try{
	    	 // String createSQL="INSERT INTO memberJoin VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	    	 //4. 쿼리를 사용하도록 설정 , Jsp에서 쿼리를 사용하도록 설정 
	    	 pstmt = con.prepareStatement("INSERT INTO memberJoin VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
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
	
	//모든회원의 정보를 리턴해주는 메소드 호출
	public ArrayList<MemberBean> allSelectMember(){
		 // ArrayList()는 가변길이로 데이터 저장해준다.
		 ArrayList<MemberBean> a = new ArrayList<>();
		 
		 try {
			 //쿼리 준비
			 String sql ="select * from memberJoin";
			 //쿼리를 실행시켜주는 객체 생성
			 pstmt = con.prepareStatement(sql);
			 //쿼리를 실행시킨 결과를 return해서 받아줌(mysql 테이블의 검색된 결과를 자바객체에 저장)
			 rs = pstmt.executeQuery();
			 //반복문을 사용해서 rs 저장된 데이터를 추출한다.
			 while(rs.next()) {//저장된 데이터 만큼까지 반복문 돌린다.
				 MemberBean bean = new MemberBean();//컬럼으로 나누어진 데이터를 빈클래스에 저장
				 bean.setId(rs.getString(1));
				 bean.setPw(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setTel(rs.getString(4));
				 bean.setHabby(rs.getString(5));
				 bean.setJob(rs.getString(6));
				 bean.setAge(rs.getString(7));
				 bean.setInfo(rs.getString(8));
				 //패키징된 MemberBean ArrayList()에 저장해준다.
				 a.add(bean);
			 }
			 //자원 반납
			 con.close();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 //다정된 ArrayList()를 return함
		 return a;
	}
	
}


