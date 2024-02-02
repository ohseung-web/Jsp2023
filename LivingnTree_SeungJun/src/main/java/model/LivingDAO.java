package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.cj.protocol.Resultset;

public class LivingDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConnect() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 카테고리별 해당 상품들을 return하는 메서드 (기본)
	public ArrayList<ProductDTO> getAllProduct(int category, int startRow, int pageSize){
		getConnect();
		ArrayList<ProductDTO> a = new ArrayList<>();
		try {
			String sql = "select * from product where p_category=? order by p_code desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setP_code(rs.getInt(1));
				pdto.setP_category(rs.getInt(2));
				pdto.setP_name(rs.getString(3));
				pdto.setP_mainimg(rs.getString(4));
				pdto.setP_detailimg(rs.getString(5));
				pdto.setP_price(rs.getInt(6));
				pdto.setP_occ(rs.getString(7));
				pdto.setP_delivfee(rs.getInt(8));
				a.add(pdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return a;
	}
	
	// 카테고리별 해당 상품들을 return하는 메서드 (높은가격순)
	public ArrayList<ProductDTO> getAllProductAscPrice(int category, int startRow, int pageSize){
		getConnect();
		ArrayList<ProductDTO> a = new ArrayList<>();
		try {
			String sql = "select * from product where p_category=? order by p_price desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setP_code(rs.getInt(1));
				pdto.setP_category(rs.getInt(2));
				pdto.setP_name(rs.getString(3));
				pdto.setP_mainimg(rs.getString(4));
				pdto.setP_detailimg(rs.getString(5));
				pdto.setP_price(rs.getInt(6));
				pdto.setP_occ(rs.getString(7));
				pdto.setP_delivfee(rs.getInt(8));
				a.add(pdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return a;
	}
	
	// 카테고리별 해당 상품들을 return하는 메서드 (낮은 가격 순)
	public ArrayList<ProductDTO> getAllProductDescPrice(int category, int startRow, int pageSize){
		getConnect();
		ArrayList<ProductDTO> a = new ArrayList<>();
		try {
			String sql = "select * from product where p_category=? order by p_price asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setP_code(rs.getInt(1));
				pdto.setP_category(rs.getInt(2));
				pdto.setP_name(rs.getString(3));
				pdto.setP_mainimg(rs.getString(4));
				pdto.setP_detailimg(rs.getString(5));
				pdto.setP_price(rs.getInt(6));
				pdto.setP_occ(rs.getString(7));
				pdto.setP_delivfee(rs.getInt(8));
				a.add(pdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return a;
	}
	
	public int getAllProductCount(int category) {
		getConnect();
		int count = 0;
		try {
			String sql = "select count(*) from product where p_category=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return count;
	}
	
	// 회원가입 메서드 (한 사람의 정보를 member 테이블에 insert)
	public void insertMember(MemberDTO mdto) {
		getConnect();
		try {
			String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getM_id());
			pstmt.setString(2, mdto.getM_pw());
			pstmt.setString(3, mdto.getM_pwq());
			pstmt.setString(4, mdto.getM_pwa());
			pstmt.setString(5, mdto.getM_name());
			pstmt.setInt(6, mdto.getM_postcode());
			pstmt.setString(7, mdto.getM_defaultaddr());
			pstmt.setString(8, mdto.getM_detailaddr());
			pstmt.setString(9, mdto.getM_phone());
			pstmt.setString(10, mdto.getM_email());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	
	public String getOneId(String id) {
		getConnect();
		String checkId = "";
		try {
			String sql = "select m_id from member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checkId = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return checkId;
	}
	
	public String getMemberPw(String id) {
		getConnect();
		String pw = "";
		try {
			String sql = "select m_pw from member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return pw;
	}
	
	public ArrayList<String> getIdListByEmail(String name, String email) {
		getConnect();
		ArrayList<String> idList = new ArrayList<>();
		try {
			String sql = "select m_id from member where m_name=? and m_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idList.add(rs.getString(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return idList;
	}
	
	public ArrayList<String> getIdListByPhone(String name, String phone) {
		getConnect();
		ArrayList<String> idList = new ArrayList<>();
		try {
			String sql = "select m_id from member where m_name=? and m_phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idList.add(rs.getString(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return idList;
	}
	
	public MemberDTO getMemberByEmail(String id, String name, String email) {
		getConnect();
		MemberDTO mdto = new MemberDTO();
		try {
			String sql = "select * from member where m_id=? and m_name=? and m_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mdto.setM_id(rs.getString(1));
				mdto.setM_pw(rs.getString(2));
				mdto.setM_pwq(rs.getString(3));
				mdto.setM_pwa(rs.getString(4));
				mdto.setM_name(rs.getString(5));
				mdto.setM_postcode(rs.getInt(6));
				mdto.setM_defaultaddr(rs.getString(7));
				mdto.setM_detailaddr(rs.getString(8));
				mdto.setM_phone(rs.getString(9));
				mdto.setM_email(rs.getString(10));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return mdto;
	}
	
	public MemberDTO getMemberByPhone(String id, String name, String phone) {
		getConnect();
		MemberDTO mdto = new MemberDTO();
		try {
			String sql = "select * from member where m_id=? and m_name=? and m_phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mdto.setM_id(rs.getString(1));
				mdto.setM_pw(rs.getString(2));
				mdto.setM_pwq(rs.getString(3));
				mdto.setM_pwa(rs.getString(4));
				mdto.setM_name(rs.getString(5));
				mdto.setM_postcode(rs.getInt(6));
				mdto.setM_defaultaddr(rs.getString(7));
				mdto.setM_detailaddr(rs.getString(8));
				mdto.setM_phone(rs.getString(9));
				mdto.setM_email(rs.getString(10));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return mdto;
	}
	
	public ProductDTO getOneProduct(int code) {
		getConnect();
		ProductDTO pdto = new ProductDTO();
		try {
			String sql = "select * from product where p_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pdto.setP_code(rs.getInt(1));
				pdto.setP_category(rs.getInt(2));
				pdto.setP_name(rs.getString(3));
				pdto.setP_mainimg(rs.getString(4));
				pdto.setP_detailimg(rs.getString(5));
				pdto.setP_price(rs.getInt(6));
				pdto.setP_occ(rs.getString(7));
				pdto.setP_delivfee(rs.getInt(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return pdto;
	}
	// 장바구니 값 insert하는 메서드
	public void insertCart(CartDTO cdto) {
		getConnect();
		try {
			String sql = "insert into cart values(null,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cdto.getP_code());
			pstmt.setInt(2, cdto.getC_qty());
			pstmt.setInt(3, cdto.getC_total());
			pstmt.setString(4, cdto.getM_id());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	
	// product 테이블과 cart 테이블을 join하여 select하는 메서드
	public ArrayList<CartDTO> getAllCart() {
		getConnect();
		ArrayList<CartDTO> a = new ArrayList<>();
		try {
			String sql = "select C.c_code,P.p_code,P.p_name,P.p_mainimg,P.p_price,P.p_delivfee,\r\n"
					+ "C.c_qty,C.c_total,C.m_id from product P inner join cart C on P.p_code = C.p_code";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO cdto = new CartDTO();
				cdto.setC_code(rs.getInt(1));
				cdto.setP_code(rs.getInt(2));
				cdto.setP_name(rs.getString(3));
				cdto.setP_mainimg(rs.getString(4));
				cdto.setP_price(rs.getInt(5));
				cdto.setP_delivfee(rs.getInt(6));
				cdto.setC_qty(rs.getInt(7));
				cdto.setC_total(rs.getInt(8));
				cdto.setM_id(rs.getString(9));
				a.add(cdto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return a;
	}
	
	// keyword에 해당하는 상품을 리턴하는 메소도
	public ArrayList<ProductDTO> searchProduct(String keyword, int startRow, int pageSize) {
		getConnect();
		ArrayList<ProductDTO> a = new ArrayList<>();
	
		try {
			String sql = "select * from product where p_name Like concat('%',?,'%') limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setP_code(rs.getInt(1));
				pdto.setP_category(rs.getInt(2));
				pdto.setP_name(rs.getString(3));
				pdto.setP_mainimg(rs.getString(4));
				pdto.setP_detailimg(rs.getString(5));
				pdto.setP_price(rs.getInt(6));
				pdto.setP_occ(rs.getString(7));
				pdto.setP_delivfee(rs.getInt(8));
				a.add(pdto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return a;
	}
	// keyword에 해당하는 상품 모든 개수를 리턴하는 메소드
	public int getAllSearchCount(String keyword) {
		getConnect();
		int count = 0;
		try {
			String sql = "select count(*) from product where p_name Like concat('%',?,'%')";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			System.out.println("DB 특정단어 : "+keyword);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("DB 개수 : "+count);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return count;
	}
    
	// keyword(특정문자)별 상품들을 return하는 메서드 (낮은 가격 순)
		public ArrayList<ProductDTO> searchAscProduct(String keyword, int startRow, int pageSize){
			getConnect();
			ArrayList<ProductDTO> a = new ArrayList<>();
			try {
				String sql = "select * from product where p_name Like concat('%',?,'%') order by p_price asc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO pdto = new ProductDTO();
					pdto.setP_code(rs.getInt(1));
					pdto.setP_category(rs.getInt(2));
					pdto.setP_name(rs.getString(3));
					pdto.setP_mainimg(rs.getString(4));
					pdto.setP_detailimg(rs.getString(5));
					pdto.setP_price(rs.getInt(6));
					pdto.setP_occ(rs.getString(7));
					pdto.setP_delivfee(rs.getInt(8));
					a.add(pdto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(con != null) con.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
			return a;
		}
		
		// keyword(특정문자)별 상품들을 return하는 메서드 (높은 가격 순)
				public ArrayList<ProductDTO> searchDescProduct(String keyword, int startRow, int pageSize){
					getConnect();
					ArrayList<ProductDTO> a = new ArrayList<>();
					try {
						String sql = "select * from product where p_name Like concat('%',?,'%') order by p_price desc limit ?,?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, keyword);
						pstmt.setInt(2, startRow-1);
						pstmt.setInt(3, pageSize);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							ProductDTO pdto = new ProductDTO();
							pdto.setP_code(rs.getInt(1));
							pdto.setP_category(rs.getInt(2));
							pdto.setP_name(rs.getString(3));
							pdto.setP_mainimg(rs.getString(4));
							pdto.setP_detailimg(rs.getString(5));
							pdto.setP_price(rs.getInt(6));
							pdto.setP_occ(rs.getString(7));
							pdto.setP_delivfee(rs.getInt(8));
							a.add(pdto);
						}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try {
							if(con != null) con.close();
							if(pstmt != null) pstmt.close();
							if(rs != null) rs.close();
						}catch(SQLException se){
							se.printStackTrace();
						}
					}
					return a;
				}
				
				
	//----------------------------------------------------------------			
}