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
	
	// 개인회원 한 사람의 정보를 리턴하는 메서드
	public MemberDTO getOneMember(String id) {
		getConnect();
		MemberDTO mdto = new MemberDTO();
		try {
			String sql = "select * from member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	
	/*
	public ProductDTO buyProductSelect(int code) {
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
	*/
	
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
	public ArrayList<CartDTO> getAllCart(String id) {
		getConnect();
		ArrayList<CartDTO> a = new ArrayList<>();
		try {
			String sql = "select C.c_code,P.p_code,P.p_name,P.p_mainimg,P.p_price,P.p_delivfee, \r\n"
					+ "C.c_qty,C.c_total,C.m_id from product P inner join cart C on P.p_code = C.p_code \r\n"
					+ "where C.m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	// code에 해당하는 상품이 존재하는지 개수를 세는 메서드
    // cart 테이블에 데이터가 존재하는지 여부를 확인하는 메서드
    public int getCodeCount(String id, int code) {
    	getConnect();
    	int count = 0;
    	try {
    		String sql = "select count(*) from cart where m_id=? and p_code=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.setInt(2, code);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			count = rs.getInt(1);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return count;
    }
	
	// cart의 전체 레코드 개수를 return하는 메서드
    public int getAllCartCount(String id) {
    	getConnect();
    	int count = 0;
    	try {
    		String sql = "select count(*) from cart where m_id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			count = rs.getInt(1);
    		}	
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return count;
    }
	
	// cart 테이블에서 선택한 항목들을 삭제하는 메서드
    public void deleteCart(int code) {
    	getConnect();
    	try {
    		String sql = "delete from cart where c_code=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, code);
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
    
    // cart 테이블에 데이터가 존재할 경우, cnt는 원래 있던 cnt에 누적된다.
    public void updateCart1(int cnt, int price, int code) {
    	getConnect();
    	try {
    		String sql = "update cart set c_qty= c_qty + ?, c_total= c_qty * ? where p_code = ?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, cnt);
    		pstmt.setInt(2, price);
    		pstmt.setInt(3, code);
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
    
    // cart 테이블에 데이터가 존재할 경우 update
    public void updateCart2(int cnt, int code) {
    	getConnect();
    	try {
    		String sql = "update cart C inner join product P on P.p_code = C.p_code \r\n"
    				+ "set C.c_qty=?, C.c_total=C.c_qty*P.p_price where C.c_code=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, cnt);
    		pstmt.setInt(2, code);
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
    
    // 장바구니 총 상품금액을 구하는 메서드
    public int getItemTotal(String id) {
    	getConnect();
    	int itemTotal = 0;
    	try {
    		String sql = "select sum(c_total) from cart where m_id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			itemTotal = rs.getInt(1);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return itemTotal;
    }
    
    // 장바구니 총 배송비를 구하는 메서드
    public int getShippingTotal(String id) {
    	getConnect();
    	int shippingTotal = 0;
    	try {
    		String sql = "select sum(P.p_delivfee) from cart C inner join product P on P.p_code = C.p_code where C.m_id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			shippingTotal = rs.getInt(1);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return shippingTotal;
    }
    
    // cart 테이블에서 주문한 상품 중 하나의 정보를 return
    public CartDTO getCartSelect(int code) {
    	getConnect();
    	CartDTO cdto = new CartDTO();
    	try {
    		String sql = "select C.c_code,P.p_code,P.p_name,P.p_mainimg,P.p_price,P.p_delivfee, \r\n"
					+ "C.c_qty,C.c_total,C.m_id from product P inner join cart C on P.p_code = C.p_code \r\n"
					+ "where C.c_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cdto.setC_code(rs.getInt(1));
				cdto.setP_code(rs.getInt(2));
				cdto.setP_name(rs.getString(3));
				cdto.setP_mainimg(rs.getString(4));
				cdto.setP_price(rs.getInt(5));
				cdto.setP_delivfee(rs.getInt(6));
				cdto.setC_qty(rs.getInt(7));
				cdto.setC_total(rs.getInt(8));
				cdto.setM_id(rs.getString(9));
			}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return cdto;
    }
    
    // 로그인 되어있는 아이디로 MemberDTO 가져오기
    public MemberDTO getMemberByLoginId(String id) {
		getConnect();
		MemberDTO mdto = new MemberDTO();
		try {
			String sql = "select * from member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
    
    // 주문번호인 o_code를 작성하는 메서드 (같은 날짜에 물건을 구매하면 o_code가 1씩 증가, 날짜가 바뀌면 o_code는 1로 초기화)
    public int codeaddSelect() {
    	getConnect();
    	int maxcode = 0;
    	try {
    		String sql = "select ifnull(max(o_code),0)+1 from orders where o_date = current_date()";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			maxcode = rs.getInt(1);
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
    	return maxcode;
    }
    
    public void insertOrders(OrdersDTO odto) {
    	getConnect();
    	try {
    		String sql = "insert into orders values(current_date(),?,?,?,?,?)";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, odto.getO_code());
    		pstmt.setInt(2, odto.getP_code());
    		pstmt.setInt(3, odto.getO_qty());
    		pstmt.setInt(4, odto.getO_total());
    		pstmt.setString(5, odto.getM_id());
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
    
    public void insertDeliv(DelivDTO ddto) {
    	getConnect();
    	try {
    		String sql = "insert into delivaddress values(current_date(),?,?,?,?,?,?,?,?)";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, ddto.getO_code());
    		pstmt.setString(2, ddto.getD_delivname());
    		pstmt.setInt(3, ddto.getD_postcode());
    		pstmt.setString(4, ddto.getD_defaultaddr());
    		pstmt.setString(5, ddto.getD_detailaddr());
    		pstmt.setString(6, ddto.getD_phone());
    		pstmt.setString(7, ddto.getD_email());
    		pstmt.setString(8, ddto.getM_id());
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
    
    // 구매한 상품을 장바구니에서 삭제하는 메서드
    public void deleteOrderCart(int code, String id) {
    	getConnect();
    	try {
    		String sql = "delete from cart where p_code=? and m_id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, code);
    		pstmt.setString(2, id);
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
    
  //----------------------------------------------------    오티가 작성한 부분  ------------------------------------------------
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
  		// 로그인 되어있는 아이디로 OrdersDTO 가져오기 (member, delivaddress 테이블과 join 하기)
  		public ArrayList<OrderHistDTO> getOrdersByLoginId(String id) {
  			getConnect();
  			ArrayList<OrderHistDTO> a = new ArrayList<>();
  			try {
  				String sql = "select O.o_date,O.o_code,O.p_code,P.p_mainimg,O.o_qty,O.o_total, \r\n"
  						+ "D.d_delivname,D.d_postcode,D.d_defaultaddr,D.d_detailaddr,D.d_phone,O.m_id \r\n"
  						+ "from orders O inner join delivaddress D on O.o_date=D.o_date \r\n"
  						+ "and O.o_code=D.o_code inner join product P on O.p_code=P.p_code \r\n"
  						+ "where O.m_id=?";
  				// select * from orders O inner join delivaddress D on O.o_date=D.o_date and O.o_code=D.o_code inner join product P on O.p_code=P.p_code where O.m_id=?;
  				// O.o_date,O.o_code,O.p_code,P.p_mainimg,O.o_qty,O.o_total,D.d_delivname,D.d_postcode,D.d_defaultaddr,D.d_detailaddr,D.d_phone,O.m_id
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, id);
  				rs = pstmt.executeQuery();
  				while(rs.next()) {
  					OrderHistDTO odto = new OrderHistDTO();
  					odto.setO_date(rs.getString(1).toString());
  					odto.setO_code(rs.getInt(2));
  					odto.setP_code(rs.getInt(3));
  					odto.setP_mainimg(rs.getString(4));
  					odto.setO_qty(rs.getInt(5));
  					odto.setO_total(rs.getInt(6));
  					odto.setD_delivname(rs.getString(7));
  					odto.setD_postcode(rs.getInt(8));
  					odto.setD_defaultaddr(rs.getString(9));
  					odto.setD_detailaddr(rs.getString(10));
  					odto.setD_phone(rs.getString(11));
  					odto.setM_id(rs.getString(12));
  					a.add(odto);
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
  		
  		public void deleteOrders(String date, int code) {
  			getConnect();
  			try {
  				String sql = "delete from orders where o_date=? and o_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, date);
  				pstmt.setInt(2, code);
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
  		
  		public void deleteDelivaddress(String date, int code) {
  			getConnect();
  			try {
  				String sql = "delete from delivaddress where o_date=? and o_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, date);
  				pstmt.setInt(2, code);
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
  		
  	//----------------------------------------------------------------
  		// 전체 리뷰글의 개수를 출력하는 메서드
  		public int getAllReviewCount() {
  			getConnect();
  			int count = 0;
  			try {
  				String sql = "select count(*) from review";
  				pstmt = con.prepareStatement(sql);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					count = rs.getInt(1);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return count;
  		}
  		
  		// pageSize를 기준으로 리뷰글을 return 받아주는 메서드
  		public ArrayList<ReviewDTO> getAllReviewBoard(int startRow, int pageSize){
  			getConnect();
  			ArrayList<ReviewDTO> a = new ArrayList<>();
  			try {
  				String sql = "select R.r_code, R.r_pw, R.p_code, P.p_name, P.p_mainimg, R.r_title, R.r_content, R.m_name, \r\n"
  						+ "R.r_date, R.r_readcount, R.m_id from review R inner join product P on R.p_code = P.p_code \r\n"
  						+ "order by r_code desc limit ?,?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, startRow-1);
  				pstmt.setInt(2, pageSize);
  				rs = pstmt.executeQuery();
  				while(rs.next()) {
  					ReviewDTO rdto = new ReviewDTO();
  					rdto.setR_code(rs.getInt(1));
  					rdto.setR_pw(rs.getString(2));
  					rdto.setP_code(rs.getInt(3));
  					rdto.setP_name(rs.getString(4));
  					rdto.setP_mainimg(rs.getString(5));
  					rdto.setR_title(rs.getString(6));
  					rdto.setR_content(rs.getString(7));
  					rdto.setM_name(rs.getString(8));
  					rdto.setR_date(rs.getString(9).toString());
  					rdto.setR_readcount(rs.getInt(10));
  					rdto.setM_id(rs.getString(11));
  					a.add(rdto);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return a;
  		}
  		
  		// 상품별 리뷰글의 개수 리턴하는 메서드
  		public int getOneProductReviewCount(int p_code) {
  			getConnect();
  			int count = 0;
  			try {
  				String sql = "select count(*) from review where p_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, p_code);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					count = rs.getInt(1);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return count;
  		}
  		
  		// 한개의 상품별로 리뷰를 리턴하는 메서드
  		public ArrayList<ReviewDTO> getOneProductReviewBoard(int startRow, int pageSize, int p_code){
  			getConnect();
  			ArrayList<ReviewDTO> a = new ArrayList<>();
  			try {
  				String sql = "select R.r_code, R.r_pw, R.p_code, P.p_name, P.p_mainimg, R.r_title, R.r_content, R.m_name, \r\n"
  						+ "R.r_date, R.r_readcount, R.m_id from review R inner join product P on R.p_code = P.p_code \r\n"
  						+ "where R.p_code=? order by r_code desc limit ?,?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, p_code);
  				pstmt.setInt(2, startRow-1);
  				pstmt.setInt(3, pageSize);
  				rs = pstmt.executeQuery();
  				while(rs.next()) {
  					ReviewDTO rdto = new ReviewDTO();
  					rdto.setR_code(rs.getInt(1));
  					rdto.setR_pw(rs.getString(2));
  					rdto.setP_code(rs.getInt(3));
  					rdto.setP_name(rs.getString(4));
  					rdto.setP_mainimg(rs.getString(5));
  					rdto.setR_title(rs.getString(6));
  					rdto.setR_content(rs.getString(7));
  					rdto.setM_name(rs.getString(8));
  					rdto.setR_date(rs.getString(9).toString());
  					rdto.setR_readcount(rs.getInt(10));
  					rdto.setM_id(rs.getString(11));
  					a.add(rdto);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return a;
  		}
  		
  		public void insertReviewBoard(ReviewDTO rdto) {
  			getConnect();
  			try {
  				String sql = "insert into review values(null,?,?,?,?,?,current_Date(),0,?)";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, rdto.getR_pw());
  				pstmt.setInt(2, rdto.getP_code());
  				pstmt.setString(3, rdto.getR_title());
  				pstmt.setString(4, rdto.getR_content());
  				pstmt.setString(5, rdto.getM_name());
  				pstmt.setString(6, rdto.getM_id());
  				pstmt.executeUpdate();
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  		}
  		
  		public String getOneName(String id) {
  			getConnect();
  			String name = "";
  			try {
  				String sql = "select m_name from member where m_id=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, id);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					name = rs.getString(1);
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
  			return name;
  		}
  		
  		// 하나의 리뷰 글만 리턴하는 메서드
  		public ReviewDTO getOneReviewBoard(int code) {
  			getConnect();
  			ReviewDTO rdto = new ReviewDTO();
  			try {
  				// 조회수 증가 쿼리 작성
  				String readCountsql = "update review set r_readcount = r_readcount + 1 where r_code=?";
  				pstmt = con.prepareStatement(readCountsql);
  				pstmt.setInt(1, code);
  				pstmt.executeUpdate();
  				
  				String sql = "select R.r_code, R.r_pw, R.p_code, P.p_name, P.p_mainimg, R.r_title, R.r_content, R.m_name, \r\n"
  						+ "R.r_date, R.r_readcount, R.m_id from review R inner join product P on R.p_code = P.p_code where r_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, code);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					rdto.setR_code(rs.getInt(1));
  					rdto.setR_pw(rs.getString(2));
  					rdto.setP_code(rs.getInt(3));
  					rdto.setP_name(rs.getString(4));
  					rdto.setP_mainimg(rs.getString(5));
  					rdto.setR_title(rs.getString(6));
  					rdto.setR_content(rs.getString(7));
  					rdto.setM_name(rs.getString(8));
  					rdto.setR_date(rs.getString(9).toString());
  					rdto.setR_readcount(rs.getInt(10));
  					rdto.setM_id(rs.getString(11));
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return rdto;
  		}
  		
  		public ReviewDTO getOneUpdateReviewBoard(int code) {
  			getConnect();
  			ReviewDTO rdto = new ReviewDTO();
  			try {
  				String sql = "select R.r_code, R.r_pw, R.p_code, P.p_name, P.p_mainimg, R.r_title, R.r_content, R.m_name, \r\n"
  						+ "R.r_date, R.r_readcount, R.m_id from review R inner join product P on R.p_code = P.p_code where r_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, code);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					rdto.setR_code(rs.getInt(1));
  					rdto.setR_pw(rs.getString(2));
  					rdto.setP_code(rs.getInt(3));
  					rdto.setP_name(rs.getString(4));
  					rdto.setP_mainimg(rs.getString(5));
  					rdto.setR_title(rs.getString(6));
  					rdto.setR_content(rs.getString(7));
  					rdto.setM_name(rs.getString(8));
  					rdto.setR_date(rs.getString(9).toString());
  					rdto.setR_readcount(rs.getInt(10));
  					rdto.setM_id(rs.getString(11));
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return rdto;
  		}
  		
  		public void updateReviewBoard(int code, String subject, String content) {
  			getConnect();
  			try {
  				String sql = "update review set r_title=?,r_content=? where r_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, subject);
  				pstmt.setString(2, content);
  				pstmt.setInt(3, code);
  				pstmt.executeUpdate();
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  		}
  		
  		public void deleteReviewBoard(int code) {
  			getConnect();
  			try {
  				String sql = "delete from review where r_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, code);
  				pstmt.executeUpdate();
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  		}
  		
  	//----------------------------------------------------------------
  		// 전체 문의글의 개수를 출력하는 메서드
  		public int getAllInquiryCount() {
  			getConnect();
  			int count = 0;
  			try {
  				String sql = "select count(*) from inquiry";
  				pstmt = con.prepareStatement(sql);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					count = rs.getInt(1);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return count;
  		}
  		
  		// pageSize를 기준으로 문의글을 return 받아주는 메서드
  		public ArrayList<InquiryDTO> getAllInquiryBoard(int startRow, int pageSize){
  			getConnect();
  			ArrayList<InquiryDTO> a = new ArrayList<>();
  			try {
  				String sql = "select I.i_code, I.i_pw, I.p_code, P.p_name, P.p_mainimg, I.i_title, I.i_content, I.m_name, \r\n"
  						+ "I.i_date, I.i_readcount, I.ref, I.re_step, I.m_id from Inquiry I inner join product P \r\n"
  						+ "on I.p_code = P.p_code order by i_code desc limit ?,?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, startRow-1);
  				pstmt.setInt(2, pageSize);
  				rs = pstmt.executeQuery();
  				while(rs.next()) {
  					InquiryDTO idto = new InquiryDTO();
  					idto.setI_code(rs.getInt(1));
  					idto.setI_pw(rs.getString(2));
  					idto.setP_code(rs.getInt(3));
  					idto.setP_name(rs.getString(4));
  					idto.setP_mainimg(rs.getString(5));
  					idto.setI_title(rs.getString(6));
  					idto.setI_content(rs.getString(7));
  					idto.setM_name(rs.getString(8));
  					idto.setI_date(rs.getString(9).toString());
  					idto.setI_readcount(rs.getInt(10));
  					idto.setRef(rs.getInt(11));
  					idto.setRe_step(rs.getInt(12));
  					idto.setM_id(rs.getString(13));
  					a.add(idto);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return a;
  		}
  		
  		// 상품별 문의글 개수 리턴하는 메서드
  		public int getOneProductInquiryCount(int p_code) {
  			getConnect();
  			int count = 0;
  			try {
  				String sql = "select count(*) from inquiry where p_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, p_code);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					count = rs.getInt(1);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return count;
  		}
  		
  		// 한개의 상품별로 문의글을 리턴하는 메서드
  		public ArrayList<InquiryDTO> getOneProductInquiryBoard(int startRow, int pageSize, int p_code){
  			getConnect();
  			ArrayList<InquiryDTO> a = new ArrayList<>();
  			try {
  				String sql = "select I.i_code, I.i_pw, I.p_code, P.p_name, P.p_mainimg, I.i_title, I.i_content, I.m_name, \r\n"
  						+ "I.i_date, I.i_readcount, I.ref, I.re_step, I.m_id from Inquiry I inner join product P on I.p_code = P.p_code \r\n"
  						+ "where I.p_code=? order by i_code desc limit ?,?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, p_code);
  				pstmt.setInt(2, startRow-1);
  				pstmt.setInt(3, pageSize);
  				rs = pstmt.executeQuery();
  				while(rs.next()) {
  					InquiryDTO idto = new InquiryDTO();
  					idto.setI_code(rs.getInt(1));
  					idto.setI_pw(rs.getString(2));
  					idto.setP_code(rs.getInt(3));
  					idto.setP_name(rs.getString(4));
  					idto.setP_mainimg(rs.getString(5));
  					idto.setI_title(rs.getString(6));
  					idto.setI_content(rs.getString(7));
  					idto.setM_name(rs.getString(8));
  					idto.setI_date(rs.getString(9).toString());
  					idto.setI_readcount(rs.getInt(10));
  					idto.setRef(rs.getInt(11));
  					idto.setRe_step(rs.getInt(12));
  					idto.setM_id(rs.getString(13));
  					a.add(idto);
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return a;
  		}
  		
  		public void insertInquiryBoard(InquiryDTO idto) {
  			getConnect();
  			// ref, re_step 초기값 설정
  			int ref = 0;
  			int re_step = 1;
  			try {
  				String refSql = "select max(ref) from inquiry";
  				pstmt = con.prepareStatement(refSql);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					ref = rs.getInt(1)+1;
  				}
  				String sql = "insert into inquiry values(null,?,?,?,?,?,current_Date(),0,?,?,?)";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, idto.getI_pw());
  				pstmt.setInt(2, idto.getP_code());
  				pstmt.setString(3, idto.getI_title());
  				pstmt.setString(4, idto.getI_content());
  				pstmt.setString(5, idto.getM_name());
  				pstmt.setInt(6, ref);
  				pstmt.setInt(7, re_step);
  				pstmt.setString(8, idto.getM_id());
  				pstmt.executeUpdate();
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  		}
  		
  		// 하나의 문의 글만 리턴하는 메서드
  		public InquiryDTO getOneInquiryBoard(int code) {
  			getConnect();
  			InquiryDTO idto = new InquiryDTO();
  			try {
  				// 조회수 증가 쿼리 작성
  				String readCountsql = "update inquiry set i_readcount = i_readcount + 1 where i_code=?";
  				pstmt = con.prepareStatement(readCountsql);
  				pstmt.setInt(1, code);
  				pstmt.executeUpdate();
  				
  				String sql = "select I.i_code, I.i_pw, I.p_code, P.p_name, P.p_mainimg, I.i_title, I.i_content, I.m_name, \r\n"
  						+ "I.i_date, I.i_readcount, I.ref, I.re_step, I.m_id from inquiry I inner join product P on I.p_code = P.p_code where i_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, code);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					idto.setI_code(rs.getInt(1));
  					idto.setI_pw(rs.getString(2));
  					idto.setP_code(rs.getInt(3));
  					idto.setP_name(rs.getString(4));
  					idto.setP_mainimg(rs.getString(5));
  					idto.setI_title(rs.getString(6));
  					idto.setI_content(rs.getString(7));
  					idto.setM_name(rs.getString(8));
  					idto.setI_date(rs.getString(9).toString());
  					idto.setI_readcount(rs.getInt(10));
  					idto.setRef(rs.getInt(11));
  					idto.setRe_step(rs.getInt(12));
  					idto.setM_id(rs.getString(13));
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return idto;
  		}
  		
  		public InquiryDTO getOneUpdateInquiryBoard(int code) {
  			getConnect();
  			InquiryDTO idto = new InquiryDTO();
  			try {
  				String sql = "select I.i_code, I.i_pw, I.p_code, P.p_name, P.p_mainimg, I.i_title, I.i_content, I.m_name, \r\n"
  						+ "I.i_date, I.i_readcount, I.ref, I.re_step, I.m_id from inquiry I inner join product P on I.p_code = P.p_code where i_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, code);
  				rs = pstmt.executeQuery();
  				if(rs.next()) {
  					idto.setI_code(rs.getInt(1));
  					idto.setI_pw(rs.getString(2));
  					idto.setP_code(rs.getInt(3));
  					idto.setP_name(rs.getString(4));
  					idto.setP_mainimg(rs.getString(5));
  					idto.setI_title(rs.getString(6));
  					idto.setI_content(rs.getString(7));
  					idto.setM_name(rs.getString(8));
  					idto.setI_date(rs.getString(9).toString());
  					idto.setI_readcount(rs.getInt(10));
  					idto.setRef(rs.getInt(11));
  					idto.setRe_step(rs.getInt(12));
  					idto.setM_id(rs.getString(13));
  				}
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  			return idto;
  		}
  		
  		public void updateInquiryBoard(int code, String subject, String content) {
  			getConnect();
  			try {
  				String sql = "update inquiry set i_title=?,i_content=? where i_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, subject);
  				pstmt.setString(2, content);
  				pstmt.setInt(3, code);
  				pstmt.executeUpdate();
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  		}
  		
  		public void deleteInquiryBoard(int code) {
  			getConnect();
  			try {
  				String sql = "delete from inquiry where i_code=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setInt(1, code);
  				pstmt.executeUpdate();
  			}catch(Exception e) {
  				e.printStackTrace();
  			}finally {
  				try {
  					if(con!=null) con.close();
  					if(pstmt!=null) pstmt.close();
  					if(rs!=null) rs.close();
  				}catch(SQLException se){
  					se.printStackTrace();
  				}
  			}
  		}
}
