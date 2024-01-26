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

public class LivingDAO_s {

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
			pstmt.setInt(2, startRow);
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
			pstmt.setInt(2, startRow);
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
			pstmt.setInt(2, startRow);
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
}
