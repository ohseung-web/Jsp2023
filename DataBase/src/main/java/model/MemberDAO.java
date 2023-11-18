package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// mysql에 연결하고 select, insert, update, delete작업을
// 실행하는 클래스이다.
public class MemberDAO {

	//	//mysql 접속하는 소스를 작성한다. 
	//    String id = "root"; // 설정된 id
	//    String Pass = "12345678"; // 설정된 password
	//    String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; //접속URL
	//	
	    Connection con; //데이터 베이스에 접근할수 있도록 설정
	    PreparedStatement pstmt; //데이터 베이스에서 쿼리를 실행시켜주는 객체
	    ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
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


	//Connection con = Connect.getCon();
	//Connection con = DatabaseUtil.getConnection();
   // PreparedStatement pstmt =null ; //데이터 베이스에서 쿼리를 실행시켜주는 객체
	//ResultSet rs = null; //데이터 베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	//데이터 베이스에 한사람의 회원 정보를저장해주는 메서드
	public void insertMember(MemberBean mbean) {
		getConnect();
		try{
			String sql="INSERT INTO memberJoin VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			//4. 쿼리를 사용하도록 설정 , Jsp에서 쿼리를 사용하도록 설정 
			pstmt = con.prepareStatement(sql);
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
			//con.close();

		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			
			try {
				if(rs != null)  rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
			
		}
	}

	//모든회원의 정보를 리턴해주는 메소드 호출
	public ArrayList<MemberBean> allSelectMember(){
		getConnect();
		// ArrayList()는 가변길이로 데이터 저장해준다.
		ArrayList<MemberBean> a = new ArrayList<>();

		try {
			//쿼리 준비
			String sql ="select * from memberjoin";
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
			// con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null)  rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
			
		}
		return a;
	}

	//한사람에 대한 정보를 리턴하는 메서드 작성
	public MemberBean oneSelectMember(String id) {
		getConnect();
		//한사람에 대한 정보만 리턴하기에 빈 클래스 객체 생성
		MemberBean bean = new MemberBean();

		try {

			String sql="select * from memberjoin where id=?";
			pstmt = con.prepareStatement(sql);
			//?의 값을 맵핑
			pstmt.setString(1, id);
			//쿼리 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPw(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHabby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			//con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null)  rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}

		return bean;
	}


	// 한 회원의 패스워드 값을 리턴하는 메소드
	public String getPass(String id) {
		getConnect();
		//스트링으로 리턴해야 하므로 스트링 변수 선언한다.
		String pass="";

		try {

			String sql ="select pw from memberjoin where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				pass = rs.getString(1);//패스워드 값이 저장된 매핑 인텍스
			}
			//con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null)  rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
			
		}
		return pass;
	}


	//한 회원의 정보를 수정하는 메소드
	public void updateMember(MemberBean mbean) {
		getConnect();
		try {
			String sql="update memberjoin set email=?,tel=? where id=?";
			pstmt = con.prepareStatement(sql);
			// ? 값 맵핑한다.
			pstmt.setString(1, mbean.getEmail());
			pstmt.setString(2, mbean.getTel());
			pstmt.setString(3, mbean.getId());
			//쿼리 실행
			pstmt.executeUpdate();
			// con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null)  rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
			
		}
	}


	// 한 회원을 삭제하는 메소드 작성
	public void deleteMember(String id) {
		getConnect();
		try {
			//쿼리준비
			String sql ="delete from memberjoin where id=?" ;
			//쿼리 실생 객체선언
			pstmt = con.prepareStatement(sql);
			// ?에 값을 맵핑
			pstmt.setString(1, id);
			//쿼리실행
			pstmt.executeUpdate();
			//자원 반납
			//con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null)  rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}

}




