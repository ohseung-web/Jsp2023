package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

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
    
    // 한 회원의 정보를 저장하는 메소드
    public void insertMember(MemberDTO mdto) {
    
    	 getConnect();
    	 
    	 try {
    		 String sql ="insert into memberjoin values(?,?,?,?,?,?,?,?)";
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, mdto.getId());
    		 pstmt.setString(2, mdto.getPw());
    		 pstmt.setString(3, mdto.getEmail());
    		 pstmt.setString(4, mdto.getTel());
    		 pstmt.setString(5, mdto.getHobby());
    		 pstmt.setString(6, mdto.getJob());
    		 pstmt.setString(7, mdto.getAge());
    		 pstmt.setString(8, mdto.getInfo());
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
    
    // 한사람의 id를 출력하는 메소드
    public String getId(String id){
    	getConnect();
    	String chkid = "";
    	
    	try {
   		 String sql ="select id from memberjoin where id=?";
   		 pstmt = con.prepareStatement(sql);
   		 pstmt.setString(1, id);
   		 rs = pstmt.executeQuery();
   		 if(rs.next()) {
   			chkid = rs.getString(1);
   		 }
   		 
   		System.out.println(chkid);
   		
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
    	return chkid;
    	 
    }
      
    //모든 회원의 정보를 리턴하는 메소드
    public ArrayList<MemberDTO> getAllMember(){
    	getConnect();
    	ArrayList<MemberDTO> a = new ArrayList<MemberDTO>();
    	
    	try {
      		 String sql ="select * from memberjoin";
      		 pstmt = con.prepareStatement(sql);
      		 rs = pstmt.executeQuery();
      		 while(rs.next()) {
      			MemberDTO mdto = new MemberDTO();
      			mdto.setId(rs.getString(1));
      			mdto.setPw(rs.getString(2));
      			mdto.setEmail(rs.getString(3));
      			mdto.setTel(rs.getString(4));
      			mdto.setHobby(rs.getString(5));
      			mdto.setJob(rs.getString(6));
      			mdto.setAge(rs.getString(7));
      			mdto.setInfo(rs.getString(8));
      			a.add(mdto);
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
    
    //
    
}
