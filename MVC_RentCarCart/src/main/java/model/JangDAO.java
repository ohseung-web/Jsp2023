package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JangDAO {

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
    
    ////////////////////////////////////////////////////////////////////
 // 모든 장바구니의 정보를 검색하는 메소드
    public ArrayList<JangDTO> getAllJang(){
    	getConnect();
    	
    	ArrayList<JangDTO> a = new ArrayList<JangDTO>();
    	
    	try {
    	 
    		 String sql = "select * from rentjang order by no desc";
    		 pstmt = con.prepareStatement(sql);
    		 rs = pstmt.executeQuery();
    		 
    		 while(rs.next()) {
    			 JangDTO jdto = new JangDTO();
    			 jdto.setNo(rs.getInt(1));
    			 jdto.setImg(rs.getString(2));
    			 jdto.setName(rs.getString(3));
    			 jdto.setCnt(rs.getInt(4));
    			 jdto.setPrice(rs.getInt(5));
    			 
    			 a.add(jdto);
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
    
    // 하나의 자동차 정보를 저장하는 메소드
    public void insertJang(JangDTO jdto){
    	getConnect();
   
    	try {
       	 
   		 String sql = "insert into rentjang values(?,?,?,?,?)";
   		 pstmt = con.prepareStatement(sql);
   	     pstmt.setInt(1, jdto.getNo());
   	     pstmt.setString(2, jdto.getImg());
    	 pstmt.setString(3, jdto.getName());
   		 pstmt.setInt(4, jdto.getCnt());
   		 pstmt.setInt(5, jdto.getPrice());
   		 pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}
    
    // 장바구니 번호를 이용하여 해당 번호가 있으면 cnt로 개수를 리턴하는 메소드
    public int getNoCount(int no) {
    	getConnect();
    	int cnt = 0;
    	
    	try {
      		 String sql = "select count(*) from rentjang where no=?";
      		 pstmt = con.prepareStatement(sql);
      	     pstmt.setInt(1, no);
      	     rs = pstmt.executeQuery();
      	     if(rs.next()) {
      	    	 cnt = rs.getInt(1);
      	     }
   		} catch (Exception e) {
   			e.printStackTrace();
   		} finally {
   			try {
   				if (con != null)
   					con.close();
   				if (pstmt != null)
   					pstmt.close();
   				if (rs != null)
   					rs.close();
   			} catch (SQLException se) {
   				se.printStackTrace();
   			}
   		}
    	return cnt;
    }
    
    
    // 번호를 만족하는 개수 누적 업데이트 메소드
    public JangDTO updateNoCount(int cnt, int no) {
    	getConnect();
    	
    	JangDTO jdto = new JangDTO();
    	try {
     		 String sql = "update rentjang set cnt = cnt + ? where no=?";
     		 pstmt = con.prepareStatement(sql);
     		 pstmt.setInt(1, cnt);
     	     pstmt.setInt(2, no);
     	     pstmt.executeUpdate();
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			try {
  				if (con != null)
  					con.close();
  				if (pstmt != null)
  					pstmt.close();
  				if (rs != null)
  					rs.close();
  			} catch (SQLException se) {
  				se.printStackTrace();
  			}
  		}
    	return jdto;
    }
    
    // 번호에 해당하는 차량 한대만 삭제하는 메소드
    public void deletejang(int no) {
    	getConnect();
    	
    	try {
    		 String sql = "delete from rentjang where no=?";
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setInt(1, no);
    	     pstmt.executeUpdate();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try {
 				if (con != null)
 					con.close();
 				if (pstmt != null)
 					pstmt.close();
 				if (rs != null)
 					rs.close();
 			} catch (SQLException se) {
 				se.printStackTrace();
 			}
 		}
    }
    
    // 장바구니에서 수량만 변경되는 메소드 
    public JangDTO updatecount(int cnt, int no) {
    	getConnect();
    	
    	JangDTO jdto = new JangDTO();
    	try {
     		 String sql = "update rentjang set cnt=?  where no=?";
     		 pstmt = con.prepareStatement(sql);
     		 pstmt.setInt(1, cnt);
     	     pstmt.setInt(2, no);
     	     pstmt.executeUpdate();
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			try {
  				if (con != null)
  					con.close();
  				if (pstmt != null)
  					pstmt.close();
  				if (rs != null)
  					rs.close();
  			} catch (SQLException se) {
  				se.printStackTrace();
  			}
  		}
    	return jdto;
    }
    
    //상품번호에 해당하는 하나의 상품정보만 리턴하는 메소드
    public JangDTO buyselect(int no){
    	getConnect();
    	JangDTO jdto = new JangDTO();
  
    	try {
    		 String sql = "select * from rentjang where no=?";
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setInt(1, no);
    	     rs = pstmt.executeQuery();
    	     
    	     if(rs.next()) {
    	    	 
    	    	 jdto.setNo(rs.getInt(1));
    	    	 jdto.setImg(rs.getString(2));
    	    	 jdto.setName(rs.getString(3));
    	    	 jdto.setCnt(rs.getInt(4));
    	    	 jdto.setPrice(rs.getInt(5));
    	
    	     }
    	     
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try {
 				if (con != null)
 					con.close();
 				if (pstmt != null)
 					pstmt.close();
 				if (rs != null)
 					rs.close();
 			} catch (SQLException se) {
 				se.printStackTrace();
 			}
 		}
    	
    	return jdto;
    }
    
    // 주문일자와 오늘날짜가 같을 경우 주문번호가 1씩 증가되는 메소드
    public int noaddSelect() {
    	getConnect();
    	// maysql의 ifnull(a,0) => a가 null이면 0이 출력
    //	int maxno = 0;
    	int order_no = 0;
    	
    	try {
   	//	 String sql = "select ifnull(max(order_no),0)+1 from order_product where order_date = current_date()";
   		 String sql = "select max(order_no) from order_product where order_date = current_date()";
   		 pstmt = con.prepareStatement(sql);
   	     rs = pstmt.executeQuery();
   	     if(rs.next()) {
   	    //	 maxno = rs.getInt(1);
   	    	 order_no = rs.getInt(1)+1;
   	     }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
   	
     	return order_no;
    }
    
   // 구매한 상품 한개의 정보를 저장 (insert)하는 메소드를 작성
    public void insertProduct(ProductDTO pdto) {
    	getConnect();
    	
    	try {
      		 String sql = "insert into order_product values(current_date(),?,?,?,?,?,?,?,?)";
      		 pstmt = con.prepareStatement(sql);
      		 pstmt.setInt(1, pdto.getOrder_no());
      		 pstmt.setInt(2, pdto.getNo());
      		 pstmt.setString(3, pdto.getImg());
      		 pstmt.setString(4, pdto.getName());
      		 pstmt.setInt(5, pdto.getCnt());
      		 pstmt.setInt(6, pdto.getPrice());
      		 pstmt.setInt(7, pdto.getTotal());
      		 pstmt.setString(8, pdto.getId());
      		 pstmt.executeUpdate();
      	  
   		} catch (Exception e) {
   			e.printStackTrace();
   		} finally {
   			try {
   				if (con != null) con.close();
   				if (pstmt != null) pstmt.close();
   				if (rs != null) rs.close();
   			} catch (SQLException se) {
   				se.printStackTrace();
   			}
   		}
    	
    }
    
   // 구매한 상품 한개의 배송자 정보를 저장 (insert)하는 메소드를 작성
    public void insertBuy(BuyDTO bdto) {
    	getConnect();
    	
    	try {
      		 String sql = "insert into order_address values(current_date(),?,?,?,?,?,?,?)";
      		 pstmt = con.prepareStatement(sql);
      		 pstmt.setInt(1, bdto.getOrder_no());
      		 pstmt.setString(2, bdto.getBuy_name());
      		 pstmt.setString(3, bdto.getBuy_phone());
      		 pstmt.setString(4, bdto.getBuy_email());
      		 pstmt.setInt(5, bdto.getBuy_postcode());
      		 pstmt.setString(6, bdto.getBuy_roadaddress());
      		 pstmt.setString(7, bdto.getId());
      		 pstmt.executeUpdate();
   		} catch (Exception e) {
   			e.printStackTrace();
   		} finally {
   			try {
   				if (con != null) con.close();
   				if (pstmt != null) pstmt.close();
   				if (rs != null) rs.close();
   			} catch (SQLException se) {
   				se.printStackTrace();
   			}
   		}	
    }
    
    // 구매정보에 담긴 상품을 장바구니에서 삭제하는 메소드
    public void deleteJang(int no) {
    	getConnect();
    	
    	try {
     		 String sql = "delete from rentjang where no=?";
     		 pstmt = con.prepareStatement(sql);
     		 pstmt.setInt(1, no);
     		 pstmt.executeUpdate();
     	  
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			try {
  				if (con != null)
  					con.close();
  				if (pstmt != null)
  					pstmt.close();
  				if (rs != null)
  					rs.close();
  			} catch (SQLException se) {
  				se.printStackTrace();
  			}
    } 
   }
    
    // 구매한 한 사람의 배송지 정보 리턴 메소드
	public BuyDTO getOneBuy(String id) {
		getConnect();
		BuyDTO bdto = new BuyDTO();

		try {
			// 최근 주소지가 출력되도록 주문일자와 주문번호를 내림차순 정렬한다.
			String sql = "select * from order_address where id = ? order by order_date desc, order_no desc ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bdto.setOrder_date(rs.getString(1).toString());
				bdto.setOrder_no(rs.getInt(2));
				bdto.setBuy_name(rs.getString(3));
				bdto.setBuy_phone(rs.getString(4));
				bdto.setBuy_email(rs.getString(5));
				bdto.setBuy_postcode(rs.getInt(6));
				bdto.setBuy_roadaddress(rs.getString(7));
				bdto.setId(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
			return bdto;

		}
	}
 }
