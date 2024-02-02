package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeteumDAO {
	String dbid = "test";
	String dbpw = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection conn = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	// ----------------------------------------------------------------------------------------------------
	// DB연결함수
		public void connect() {	
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, dbid, dbpw);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	// ----------------------------------------------------------------------------------------------------
	// 모든 상품정보를 불러오는 함수
		public ArrayList<TeteumDTO> getAllProduct() {
			connect();
			ArrayList<TeteumDTO> list = new ArrayList<TeteumDTO>();
			
			try {
				String sql = "select * from tt_product";
				pstm = conn.prepareStatement(sql);
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					TeteumDTO tdto = new TeteumDTO();
					
					tdto.setP_no(rs.getString(1));
					tdto.setP_name(rs.getString(2));
					tdto.setP_price(rs.getInt(3));
					tdto.setP_colorone(rs.getString(4));
					tdto.setP_colortwo(rs.getString(5));
					tdto.setP_img(rs.getString(6));
					tdto.setP_category(rs.getString(7));
					
					list.add(tdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(pstm!=null) {
					try {
						pstm.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}
			}
			return list;
		}
	// ----------------------------------------------------------------------------------------------------
	// 회원가입 함수
		public void join(TeteumDTO tdto) {
			connect();
			try {
				String sql = "insert into tt_member values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, tdto.getId());
				pstm.setString(2, tdto.getEmail());
				pstm.setString(3, tdto.getName());
				pstm.setString(4, tdto.getPassword());
				pstm.setString(5, tdto.getPhone());
				pstm.setString(6, tdto.getZipcode());
				pstm.setString(7, tdto.getRoadaddress());
				pstm.setString(8, tdto.getAgree_terms());
				pstm.setString(9, tdto.getAgree_age());
				pstm.setString(10, tdto.getAgree_email());
				pstm.setString(11, tdto.getDetailaddress());
				pstm.setString(12, tdto.getAgree_message());
				
				pstm.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(pstm!=null) {
					try {
						pstm.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}
			}
		}
	//----------------------------------------------------------------
	// 회원 한 명의 정보
	public TeteumDTO getMemberInfo(String id) {
		
		TeteumDTO tdto = new TeteumDTO();
		
		connect();
		
		try {

			String sql = "select * from tt_member where id = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);

			rs = pstm.executeQuery();

			if(rs.next()) {
				tdto.setId(rs.getString(1));
				tdto.setEmail(rs.getString(2));
				tdto.setName(rs.getString(3));
				tdto.setPassword(rs.getString(4));
				tdto.setPhone(rs.getString(5));
				tdto.setZipcode(rs.getString(6));
				tdto.setRoadaddress(rs.getString(7));
				tdto.setAgree_terms(rs.getString(8));
				tdto.setAgree_age(rs.getString(9));
				tdto.setAgree_email(rs.getString(10));
				tdto.setDetailaddress(rs.getString(11));
				tdto.setAgree_message(rs.getString(12));

			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			if(rs != null) {
				try { rs.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
		}
		return tdto;
	}
	// ----------------------------------------------------------------------------------------------------
	// DB에서 아이디 가져오는 함수
		public String getId(String id) {
			String getid = "";
			connect();
			try {
				String sql = "select id from tt_member where id = ?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, id);
				rs = pstm.executeQuery();		
				
				if(rs.next()) {
					getid = rs.getString(1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(pstm!=null) {
					try {
						pstm.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}
			}
			return getid;
		}
		
	// ----------------------------------------------------------------------------------------------------
	// DB에서 비밀번호 가져오는 함수
		public String getPw(String id) {
			String getpw = "";
			connect();
			try {
				String sql = "select password from tt_member where id = ?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, id);
				rs = pstm.executeQuery();		
				
				if(rs.next()) {
					getpw = rs.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(pstm!=null) {
					try {
						pstm.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}
			}
			return getpw;
		}
	//-------------------------------------------------------------
	// 회원정보 수정
	public void updateMember(TeteumDTO tdto) {
		
		connect();
		
		try {

			String sql = "update tt_member set email = ?, phone = ?, zipcode = ?, roadaddress = ?, agree_email = ?, detailAddress = ?, agree_message = ? where id = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, tdto.getEmail());
			pstm.setString(2, tdto.getPhone());
			pstm.setString(3, tdto.getZipcode());
			pstm.setString(4, tdto.getRoadaddress());
			pstm.setString(5, tdto.getAgree_email());
			pstm.setString(6, tdto.getDetailaddress());
			pstm.setString(7, tdto.getAgree_message());
			pstm.setString(8, tdto.getId());

			pstm.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			if(rs != null) {
				try { rs.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
		}
		//return tdto;
	}
	//-------------------------------------------------------------
	// 회원탈퇴
	public void deleteMember(String id) {
		
		connect();
		
		try {
			String sql = "delete from tt_member where id = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
	}
	//-------------------------------------------------------------
	// 비밀번호 변경
	public void updatePassword(String id, String newpassword) {
		
		connect();
		
		try {
			String sql = "update tt_member set password = ? where id = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, newpassword);
			pstm.setString(2, id);
			pstm.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(pstm!=null) {
				try {
					pstm.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		}
	}
	// ----------------------------------------------------------------------------------------------------
	// 해당 상품번호에 해당하는 상품정보 한 개만 가져오는 함수
		public TeteumDTO getOne(String p_no) {
			TeteumDTO tdto = new TeteumDTO();
			connect();
			
			try {
				String sql = "select * from tt_product where p_no = ?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, p_no);
				rs = pstm.executeQuery();
				
				if(rs.next()) {
					tdto.setP_no(rs.getString(1));
					tdto.setP_name(rs.getString(2));
					tdto.setP_price(rs.getInt(3));
					tdto.setP_colorone(rs.getString(4));
					tdto.setP_colortwo(rs.getString(5));
					tdto.setP_img(rs.getString(6));
					tdto.setP_category(rs.getString(7));
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(pstm!=null) {
					try {
						pstm.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}
			}
			return tdto;
		}
	// ----------------------------------------------------------------------------------------------------
	// 카테고리별 상품목록 가져오는 함수
		public ArrayList<TeteumDTO> getCategory(String p_category) {
			connect();
			ArrayList<TeteumDTO> list = new ArrayList<TeteumDTO>();
			
			try {
				String sql = "select * from tt_product where p_category = ?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, p_category);
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					TeteumDTO tdto = new TeteumDTO();
					
					tdto.setP_no(rs.getString(1));
					tdto.setP_name(rs.getString(2));
					tdto.setP_price(rs.getInt(3));
					tdto.setP_colorone(rs.getString(4));
					tdto.setP_colortwo(rs.getString(5));
					tdto.setP_img(rs.getString(6));
					tdto.setP_category(rs.getString(7));
					
					list.add(tdto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(pstm!=null) {
					try {
						pstm.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e2) {
						e2.printStackTrace();
					}
				}
			}
			return list;
		}
		//--------------------------------------------------------------------
		// 장바구니 담기
		public void insertCart(TeteumDTO tdto) {
			
			connect();
			
			try {
				String sql = "insert into tt_cart values(?, ?, ?, ?, ?, ?, ?, ?)";
				
				pstm = conn.prepareStatement(sql);
				
				pstm.setInt(1, tdto.getC_num());
				pstm.setString(2, tdto.getC_no());
				pstm.setString(3, tdto.getC_name());
				pstm.setInt(4, tdto.getC_cnt());
				pstm.setInt(5, tdto.getC_price());
				pstm.setString(6, tdto.getC_color());
				pstm.setString(7, tdto.getC_img());
				pstm.setString(8, tdto.getId());
				
				pstm.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {
					try { rs.close();
					}catch (SQLException se) { se.printStackTrace(); }
				}
				
				if(pstm != null) {
					try { pstm.close();
					}catch (SQLException se) { se.printStackTrace(); }
				}
				
				if(conn != null) {
					try { conn.close();
					}catch (SQLException se) { se.printStackTrace(); }
				}
			}
		}
		//-------------------------------------------------------------
		// 장바구니 번호 증가
		public int noCart() {
			
			connect();
			
			int maxno = 0;
			
			try {
			     String sql = "select nvl(max(c_num), 0) + 1 from tt_cart";
			     
			     pstm = conn.prepareStatement(sql);
			     
			     rs = pstm.executeQuery();
			     
			     if(rs.next()) {
			    	 maxno = rs.getInt(1);
			     }
			}catch(Exception e) {
				  e.printStackTrace();
			}finally {
				if(rs != null) {
					try { rs.close();
					}catch (SQLException se) { se.printStackTrace(); }
				}
				
				if(pstm != null) {
					try { pstm.close();
					}catch (SQLException se) { se.printStackTrace(); }
				}
				
				if(conn != null) {
					try { conn.close();
					}catch (SQLException se) { se.printStackTrace(); }
				}
			}
			return maxno;
		}
	//------------------------------------------------------------------
	// 장바구니 전체 리스트
	public ArrayList<TeteumDTO> getAllCart(String id){

		ArrayList<TeteumDTO> al = new ArrayList<TeteumDTO>();

		connect();

		try {

			String sql = "select * from tt_cart where id = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);

			rs = pstm.executeQuery();

			while(rs.next()) {

				TeteumDTO tdto = new TeteumDTO();

				tdto.setC_num(rs.getInt(1));
				tdto.setC_no(rs.getString(2));
				tdto.setC_name(rs.getString(3));
				tdto.setC_cnt(rs.getInt(4));
				tdto.setC_price(rs.getInt(5));
				tdto.setC_color(rs.getString(6));
				tdto.setC_img(rs.getString(7));
				tdto.setId(rs.getString(8));
				
				al.add(tdto);

			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {

			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

		}
		return al;

	}
	//---------------------------------------------------------------------
	// 장바구니 카운트
	public int getCountCart(String id) {
		
		int count = 0;
		
		connect();
		
		try {

			String sql = "select sum(c_cnt) from tt_cart where id = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);

			rs = pstm.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {

			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

		}
		return count;
	}
	//---------------------------------------------------------------------
	// 장바구니 총 합계
	public TeteumDTO getSumCart(String id){

		TeteumDTO tdto = new TeteumDTO();

		connect();

		try {

			String sql = "select sum(c_price) from tt_cart where id = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);

			rs = pstm.executeQuery();

			if(rs.next()) {
				tdto.setC_price(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {

			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

		}
		return tdto;

	}
	//-------------------------------------------------------------------
	// 장바구니 삭제
	public void deleteCart(String no) {
		
		connect();
		
		try {
			String sql = "delete from tt_cart where c_no = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, no);
			pstm.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
	}
	//----------------------------------------------------------------
	// 장바구니 수정 - 수량 증가 및 금액 증가
	public TeteumDTO updateCartUp(String no, String color, int cnt) {
		
		connect();
		
		TeteumDTO tdto = new TeteumDTO();
		
		try {
			String usql = "update tt_cart set c_cnt = ? + 1 where c_no = ? and c_color = ?";
			
			pstm = conn.prepareStatement(usql);
			pstm.setInt(1, cnt);
			pstm.setString(2, no);
			pstm.setString(3, color);
			pstm.executeUpdate();
			conn.commit();
			
			String sql = "update tt_cart set c_price = (select tp.p_price from tt_cart tc inner join tt_product tp on tc.c_no = tp.p_no where tc.c_no = ? and tc.c_color = ?) * c_cnt where c_no = ? and c_color = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, no);
			pstm.setString(2, color);
			pstm.setString(3, no);
			pstm.setString(4, color);
			pstm.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
		return tdto;
	}
	//----------------------------------------------------------------
	// 장바구니 수정 - 수량 감소 및 금액 감소
	public TeteumDTO updateCartDown(String no, String color, int cnt) {
		
		connect();
		
		TeteumDTO tdto = new TeteumDTO();
		
		try {
			String usql = "update tt_cart set c_cnt = ? - 1 where c_no = ? and c_color = ?";
			
			pstm = conn.prepareStatement(usql);
			pstm.setInt(1, cnt);
			pstm.setString(2, no);
			pstm.setString(3, color);
			pstm.executeUpdate();
			conn.commit();
			
			String sql = "update tt_cart set c_price = (select tp.p_price from tt_cart tc inner join tt_product tp on tc.c_no = tp.p_no where tc.c_no = ? and tc.c_color = ?) * c_cnt where c_no = ? and c_color = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, no);
			pstm.setString(2, color);
			pstm.setString(3, no);
			pstm.setString(4, color);
			pstm.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
		return tdto;
	}
	//------------------------------------------------------------------------
	// 장바구니 중복 상품 존재 여부 카운트
	public int getSameCart(String id, String no, String color) {
		
		int count = 0;
		
		connect();
		
		try {

			String sql = "select count(*) from tt_cart where id = ? and c_no = ? and c_color = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);
			pstm.setString(2, no);
			pstm.setString(3, color);

			rs = pstm.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {

			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }

			}

		}
		return count;
	}
	//---------------------------------------------------------------------
	// 장바구니 중복 상품 수량 누적
	public TeteumDTO updateSameCart(String no, String color, int cnt) {
		
		TeteumDTO tdto = new TeteumDTO();
		
		connect();
		
		try {
			String usql = "update tt_cart set c_cnt = ? + 1 where c_no = ? and c_color = ?";
			
			pstm = conn.prepareStatement(usql);
			pstm.setInt(1, cnt);
			pstm.setString(2, no);
			pstm.setString(3, color);
			pstm.executeUpdate();
			conn.commit();
			
			String sql = "update tt_cart set c_price = (select tp.p_price from tt_cart tc inner join tt_product tp on tc.c_no = tp.p_no where tc.c_no = ? and tc.c_color = ?) * c_cnt where c_no = ? and c_color = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, no);
			pstm.setString(2, color);
			pstm.setString(3, no);
			pstm.setString(4, color);
			pstm.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
		return tdto;
		
	}
	//-----------------------------------------------------------------------
	// 구매화면
	public TeteumDTO buySelect(String no) {
		
		connect();
		
		TeteumDTO tdto = new TeteumDTO();
		
		try {
			String sql = "select * from tt_cart where c_no = ?";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, no);
			
			rs = pstm.executeQuery();
		     
		    if(rs.next()) {
		    	tdto.setC_num(rs.getInt(1));
		    	tdto.setC_no(rs.getString(2));
				tdto.setC_name(rs.getString(3));
				tdto.setC_cnt(rs.getInt(4));
				tdto.setC_price(rs.getInt(5));
				tdto.setC_color(rs.getString(6));
				tdto.setC_img(rs.getString(7));
		     }
		     
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
		return tdto;
	}
	//--------------------------------------------------------------------
	// 구매 상품 구매번호 증가
	public int noSelect() {
		
		connect();
		
		int maxno = 0;
		
		try {
		     String sql = "select nvl(max(buy_num), 0) + 1 from tt_buyproduct where to_char(buy_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
		     
		     pstm = conn.prepareStatement(sql);
		     
		     rs = pstm.executeQuery();
		     
		     if(rs.next()) {
		    	 maxno = rs.getInt(1);
		     }
		}catch(Exception e) {
			  e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
		return maxno;
	}
	//---------------------------------------------------------------
	// 구매 완료 상품 정보
	public void insertBuyProduct(TeteumDTO tdto) {
		
		connect();
		
		try {
			String sql = "insert into tt_buyproduct values(sysdate, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, tdto.getBuy_num());
		    pstm.setString(2, tdto.getB_num());
		    pstm.setString(3, tdto.getB_img());
			pstm.setString(4, tdto.getB_name());
			pstm.setString(5, tdto.getB_color());
			pstm.setInt(6, tdto.getB_cnt());
			pstm.setInt(7, tdto.getB_price());
			pstm.setString(8, tdto.getId());
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
	}
	//---------------------------------------------------------------
	// 구매 완료 상품 배송지 정보
	public void insertDeliveryAddress(TeteumDTO tdto) {
		
		connect();
		
		try {
			String sql = "insert into tt_deliveryaddress values(sysdate, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, tdto.getBuy_num());
			pstm.setString(2, tdto.getD_name());
			pstm.setString(3, tdto.getD_phone());
			pstm.setString(4, tdto.getD_zipcode());
		    pstm.setString(5, tdto.getD_roadaddress());
		    pstm.setString(6, tdto.getD_detailaddress());
		    pstm.setString(7, tdto.getId());
		    pstm.setString(8, tdto.getD_deliveryrequest());
		    
			pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
	}
	//-----------------------------------------------------------------
	// 회원별 구매완료 목록 조회
	public ArrayList<TeteumDTO> getBuyProduct(String id) {
		
		ArrayList<TeteumDTO> arl =new ArrayList<TeteumDTO>();
		
		connect();
		
		try {
			String sql = "select * from tt_buyproduct where buy_id = ? order by buy_date desc, buy_num desc";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				TeteumDTO tdto = new TeteumDTO();
				
				tdto.setBuy_date(rs.getDate(1));
			    tdto.setBuy_num(rs.getInt(2));
			    tdto.setB_num(rs.getString(3));
			    tdto.setB_img(rs.getString(4));
				tdto.setB_name(rs.getString(5));
				tdto.setB_color(rs.getString(6));
				tdto.setB_cnt(rs.getInt(7));
				tdto.setB_price(rs.getInt(8));
				tdto.setId(rs.getString(9));
				
				arl.add(tdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(pstm!=null) {
				try {
					pstm.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		}
		return arl;
	}
	//----------------------------------------------------
	// 실시간 구매완료 상품 목록 조회 - 영수증 대체 역할
	public TeteumDTO getPurchaseProduct(TeteumDTO tdto) {
		
		TeteumDTO ttdto = new TeteumDTO();
		
		connect();
		
		try {
			String sql = "select * from tt_buyproduct where buy_id = ? and b_num = ? order by buy_date, buy_num";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, tdto.getId());
			pstm.setString(2, tdto.getB_num());
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {		
				ttdto.setBuy_date(rs.getDate(1));
			    ttdto.setBuy_num(rs.getInt(2));
			    ttdto.setB_num(rs.getString(3));
			    ttdto.setB_img(rs.getString(4));
				ttdto.setB_name(rs.getString(5));
				ttdto.setB_color(rs.getString(6));
				ttdto.setB_cnt(rs.getInt(7));
				ttdto.setB_price(rs.getInt(8));
				ttdto.setId(rs.getString(9));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(pstm!=null) {
				try {
					pstm.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		}
		return ttdto;
	}
	//========================================
    // 게시글 인서트 하는 메서드
   
    public void getInsert(TeteumDTO tdto) {
		
		connect();
		
		try {
			
			String sql="insert into tt_board values(b_no.nextval,?,?,?,?,sysdate)";
			
			pstm= conn.prepareStatement(sql);
			
			pstm.setString(1, tdto.getB_type());
			pstm.setString(2, tdto.getB_title());
			pstm.setString(3, tdto.getId());
			pstm.setString(4, tdto.getB_content());
			
			pstm.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) {try {rs.close();}catch(Exception e) {}}
			if(pstm !=null) {try {pstm.close();}catch(Exception e) {}}
			if(conn !=null) {try {conn.close();}catch(Exception e) {}}
		}
		
		
	}
   
   
 //=====================select========================
	
	public ArrayList<TeteumDTO> getAllmem(){
	
		ArrayList<TeteumDTO> tdtoarr=new ArrayList<TeteumDTO>();
		
		connect();
		
		try {
			
			String sql="select * from tt_board order by b_no desc";
			pstm=conn.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				TeteumDTO tdto = new TeteumDTO();
				
				tdto.setB_no(rs.getInt(1));
				tdto.setB_type(rs.getString(2));
				tdto.setB_title(rs.getString(3));
				tdto.setId(rs.getString(4));
				tdto.setB_content(rs.getString(5));
				tdto.setB_regdate(rs.getDate(6));
				
				tdtoarr.add(tdto);
			}
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) {try {rs.close();}catch(Exception e) {}}
			if(pstm !=null) {try {pstm.close();}catch(Exception e) {}}
			if(conn !=null) {try {conn.close();}catch(Exception e) {}}
		}
		return tdtoarr;
	}
	//--------------------------------------------------------------------
	// 회원별 작성 글 조회
	public ArrayList<TeteumDTO> getBoard(String id) {
		
		ArrayList<TeteumDTO> al =new ArrayList<TeteumDTO>();
		
		connect();
		
		try {
			String sql = "select * from tt_board where id = ? order by b_no";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				TeteumDTO tdto = new TeteumDTO();
				
				tdto.setB_no(rs.getInt(1));
				tdto.setB_type(rs.getString(2));
				tdto.setB_title(rs.getString(3));
				tdto.setId(rs.getString(4));
				tdto.setB_content(rs.getString(5));
				tdto.setB_regdate(rs.getDate(6));
				
				al.add(tdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(pstm!=null) {
				try {
					pstm.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		}
		return al;
	}

	 //=====================delete========================
  
	// 게시글 삭제
	public void deleteboard(int b_no) {
		
		connect();
		
		try {
			String sql = "delete from tt_board where b_no = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, b_no);
			pstm.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { rs.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(pstm != null) {
				try { pstm.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
			
			if(conn != null) {
				try { conn.close();
				}catch (SQLException se) { se.printStackTrace(); }
			}
		}
	}
	
	//==========================================================
	 // 게시글 수정
	public void Updateboard(String b_type,String b_content, int b_no) {
		connect();
		try {
			String sql = "update tt_board set b_type = ?, b_content = ? where b_no =? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, b_type);
			pstm.setString(2, b_content);
			pstm.setInt(3, b_no);
			pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (rs !=null) {
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (pstm !=null) {
				try {
					pstm.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (conn !=null) {
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	//--------------------------------------------------------------------
	// 회원별 작성 글 조회
	public TeteumDTO getBoard(int b_no) {
		
		TeteumDTO tdto = new TeteumDTO();
		
		connect();
		
		try {
			String sql = "select * from tt_board where b_no = ? order by b_no";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, b_no);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				
				
				tdto.setB_no(rs.getInt(1));
				tdto.setB_type(rs.getString(2));
				tdto.setB_title(rs.getString(3));
				tdto.setId(rs.getString(4));
				tdto.setB_content(rs.getString(5));
				tdto.setB_regdate(rs.getDate(6));
				
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(pstm!=null) {
				try {
					pstm.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		}
           return tdto;
	}
	//----------------------------------------------------------------
	// 아이디 찾기
	public String findId(String name, String email) {
		
		String findid = "";
		
		connect();
		
		try {

			String sql = "select id from tt_member where name = ? and email = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, name);
			pstm.setString(2, email);

			rs = pstm.executeQuery();

			if(rs.next()) {
				findid = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			if(rs != null) {
				try { rs.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
		}
		return findid;
	}
	
	//----------------------------------------------------------------
	// 비밀번호 찾기
	public String findPw(String id, String email) {
		
		String findpw = "";
		
		connect();
		
		try {

			String sql = "select password from tt_member where id = ? and email = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);
			pstm.setString(2, email);

			rs = pstm.executeQuery();

			if(rs.next()) {
				findpw = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			if(rs != null) {
				try { rs.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
		}
		return findpw;
	}
	//----------------------------OneId setect------------------------------------
	// 하나의 아이디를 불러오는 함수
	public String getOneId(String id) {
	
		String boardid = "";
		
		connect();
		
		try {

			String sql = "select id from tt_board where id = ?";

			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, id);

			rs = pstm.executeQuery();

			if(rs.next()) {
				boardid = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}finally {
			if(rs != null) {
				try { rs.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(pstm != null) {
				try { pstm.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close();
				}catch(SQLException ex) { ex.printStackTrace(); }
			}
		}
		return boardid;
		
	}

}
