package fooding;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class FoodingDAO {
    
	// java에 db를 connect해준다. Connection하기 위해서 MySQL 드라이브명을 Class.forName에 입력한다.
    String id = "root"; // db 아이디
    String pw = "12345678"; // db 패스워드
    String url = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
    
    Connection con = getCon();
    PreparedStatement pstmt;
    ResultSet rs;
    
    public Connection getCon() {
    	try{
        	Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버를 자바에 접속
        	// db의 아이디, 패스워드, url을 자바에 연결한 드라이버와 연결시켜준다.
        	con = DriverManager.getConnection(url, id, pw);
        }catch(Exception e){
        	e.printStackTrace();
        }
		return con;
    }
    
    public void insertFooding(FoodingBean fbean) {
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
        	con.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    // 회원으로 가입한 한 회원의 id를 검색하는 메소드
    public String  chkId(String id) {
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
    	}
    	return chkeckId;
    }
}
