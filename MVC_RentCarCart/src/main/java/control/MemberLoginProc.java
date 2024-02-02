package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyDTO;
import model.JangDAO;
import model.JangDTO;
import model.RentDAO;
import model.RentDTO;


@WebServlet("/MemberLoginProc.do")
public class MemberLoginProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
//		비회원으로 상품을 구매하기위해 사용하는 코드
		RentDTO rdto = new RentDTO();
		JangDTO jdto = new JangDTO();
		JangDAO jdao = new JangDAO();
		ArrayList<JangDTO> ac = new ArrayList<JangDTO>();
		
		// 비회원이 장바구니의 상품을 구매하기위해 선택한 상품 ---------------
		String chk = request.getParameter("chk");
		int chkbool = chk.indexOf(" ");//선택한 상품번호옆에 공백이 존재하는지 여부를 체크  
		String cnt = request.getParameter("cnt"); //상품테이블에서 넘어온 수량
		int quanty = 0;
		
		if(!cnt.equals("null")) {
			quanty = Integer.parseInt(cnt);
		}
		
		//---------------------------------------------------------
		//예외처리
		  if((userId != null && !userId.isEmpty()) && (userPw != null && !userPw.isEmpty())) {
			
			RentDAO rdao = new RentDAO();
			String dbPw = rdao.getMemberPw(userId);
			
			// id와 pw가 일치하는지 예외처리
			// MemberLogin.jsp에서 get방식으로 넘겨준 chk의 값이 null이라는 건 비어있다는 뜻이 아니라 문자 "null"을 넘겼다는 뜻이다.  
			if(dbPw.equals(userPw) && chk.equals("null") && cnt.equals("null")) {			
				// servlet에서 session을 지정하는 방식
				//HttpSession session = request.getSession();
				session.setAttribute("rentlogin", userId);
				session.setMaxInactiveInterval(60*5);//5분동안 로그인 상태 유지 함
				
				RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp");
				rdis.forward(request, response);

			}else if(dbPw.equals(userPw) && !chk.equals("null")) { // 비회원일 때 선택한 상품을 로그인하고 바로 구매하는 코드
					
				if(chkbool == -1) {
					
					System.out.println("여기로 왔어오~~"+chkbool);
	        		int chkno = Integer.parseInt(chk);
	        		System.out.println("여기로 왔어오~~"+chkno);
	        		rdto = jdao.buyRentselect(chkno);
	
	        		request.setAttribute("cnt", quanty);
	        		request.setAttribute("rdto", rdto);
	        		
	        	}else {
	        		System.out.println("여기 배열로 왔어오~~"+chkbool);
	        		String [] arrChk = chk.split(" ");
	            	int aChk = 0;
	            	for(int i=0; i<arrChk.length; i++) {
	        			aChk = Integer.parseInt(arrChk[i]);
	        			jdto = jdao.buyselect(aChk);
	        			ac.add(jdto);
	        		}
	            	request.setAttribute("ac", ac);
	        	}
				
				//-----------------------------------------------------------------------
				// 상품을 이미 구매한 회원인 경우 자동으로 주소 출력하는 코드
			    	BuyDTO bdto = new BuyDTO();
			    	// 한 사람의 구매주소 정보를 저장
			    	bdto = jdao.getOneBuy(userId);
			    	
			    	// 로그인된 id와 order_address테이블의 id가 같으면 이미 상품을 구매한 적이 있기때문에
			    	// BuyDTO에 존재하는 phone, roadaddress를 문자 자르기 함수를 이용하여 잘라 보낸다.
			    	if(userId.equals(bdto.getId())) {
			    		
			    		     // substring(a, b) : a부터 b전까지 문자 자르기
			    		       String phone02 = bdto.getBuy_phone().substring(4, 8);
			                   String phone03 = bdto.getBuy_phone().substring(9, 13);
			        	
			               // indexOf("a") : 문자 a가 위치하는 index번호를 숫자로 변환하여 출력
			        	    int stringNum = bdto.getBuy_roadaddress().indexOf("   "); 
			    		    String roadaddr = bdto.getBuy_roadaddress().substring(0, stringNum); 
			    		    
			    		    // substring(5) : 5번째위치 부터 그 뒤로 모두 자르기
			    		    String detailaddr = bdto.getBuy_roadaddress().substring(stringNum+3);
			    		    
			    		    request.setAttribute("bdto", bdto);
			        	    request.setAttribute("phone02", phone02);
			        	    request.setAttribute("phone03", phone03);
			    		    request.setAttribute("roadaddr", roadaddr);
			    	      	request.setAttribute("detailaddr", detailaddr);

			    	}
				   //-------------------------------------------------------------------------------- 
			       session.setAttribute("rentlogin", userId);
				   RequestDispatcher rdis = request.getRequestDispatcher("RentcarMain.jsp?section=OrderList.jsp");
				   rdis.forward(request, response);
				   
			}else {
				request.setAttribute("LoginError", "아이디와 패스워드를 확인하세요");
				RequestDispatcher rdis = request.getRequestDispatcher("Error.jsp");
				rdis.forward(request, response);
			}
			
		} else {
			request.setAttribute("LoginError", "아이디와 패스워드를 입력하세요");
			RequestDispatcher rdis = request.getRequestDispatcher("Error.jsp");
			rdis.forward(request, response);
		}
		
	}
}


