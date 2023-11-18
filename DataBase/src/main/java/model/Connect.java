package model;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Connect {
	
	
		    // getCon 메서드 생성
		    public static Connection getCon() {  
			   //커넥션풀을 이용하여 데이터 베이스에 접근하는 코드 작헝 	    	
		    	try {
		    		//외부에서 데이터를 읽어들여야 하기에
		    		Context initctx = new InitialContext();
		    		//톰캣 서버에 정보를 담아놓은 곳으로 이동
		    		Context envctx = (Context) initctx.lookup("java:comp/env");
		    		//데이터 소스 객체를 선언한다.
		    		DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
		    		//데이터 소스를 기준으로 커넥션을 연결해 주세요
		    		return ds.getConnection();
		    	}catch(Exception e) {
		    		e.printStackTrace();
		    	}
		        return null;
		    }	
		    
		    	/*try {
		    		// url="jdbc:mysql://localhost:3306/test?autoReconnect=true"
		    		//String url = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL

		    		String id = "root"; // db 아이디
				    String pw = "12345678"; // db 패스워드
				    String url = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
		    		Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버를 자바에 접속
		    		// db의 아이디, 패스워드, url을 자바에 연결한 드라이버와 연결시켜준다.
		        	return DriverManager.getConnection(url, id, pw);
		    	}catch(Exception e){
		    		e.printStackTrace();
		    	}
		        return null;
		    }*/
	
}
