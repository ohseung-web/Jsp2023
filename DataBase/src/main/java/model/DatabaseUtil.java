package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
	
        try {
			String id = "root"; // 설정된 id
		    String Pass = "12345678"; // 설정된 password
		    String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; //접속URL
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    return DriverManager.getConnection(jdbcUrl, id, Pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
