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

import model.CartDTO;
import model.LivingDAO;
import model.MemberDTO;
import model.ProductDTO;

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
		
   	   // 비회원으로 상품을 구매하기위해 사용하는 코드
		LivingDAO ldao = new LivingDAO();
		ProductDTO pdto = new ProductDTO();
		CartDTO cdto = new CartDTO();
		MemberDTO mdto = new MemberDTO();
		ArrayList<CartDTO> chkList = new ArrayList<CartDTO>();
		
		// 비회원이 장바구니의 상품을 구매하기위해 선택한 상품 
		String chk = request.getParameter("chk");
		
		// 로그인 되지 않은 상태일 때 [BUY IT NOW]로 바로 구매하기 위한 코드
		int chkbool = chk.indexOf(" ");//선택한 상품번호옆에 공백이 존재하는지 여부를 체크  
		String cnt = request.getParameter("cnt"); //상품 상세리스트에서 넘겨준 수량
		int quanty = 0;
		
		if(!cnt.equals("null")) {
			quanty = Integer.parseInt(cnt);
		}
		
		if(userId != null && !userId.isEmpty() && userPw != null && !userPw.isEmpty()) {
			//LivingDAO ldao = new LivingDAO();
			String dbPw = ldao.getMemberPw(userId);
			
			// MemberLogin.jsp에서 get방식으로 넘겨준 chk의 값이 null이라는 건 비어있다는 뜻이 아니라 문자 "null"을 넘겼다는 뜻이다.
			if(dbPw.equals(userPw) && chk.equals("null") && cnt.equals("null")) { // 상품을 선택하지 않고 단순히 로그인을 할 때			
				
				session.setAttribute("loginId", userId);
				session.setAttribute("loginPw", userPw);
				session.setMaxInactiveInterval(60*5);//5분동안 로그인 상태 유지 함
				
				RequestDispatcher rdis = request.getRequestDispatcher("Main.jsp");
				rdis.forward(request, response);

			}else if(userPw.equals(dbPw) && !chk.equals("null")) { // 장바구니에서 상품선택하고 로그인 할때 바로구매로 넘기는 부분
				
                if(chkbool == -1) { // 로그인 되지 않은 상태일 때 [BUYITNOW]버튼 클릭 시 바로구매 
					
	        		int chkno = Integer.parseInt(chk);
	        		//장바구니가 아니라 상품테이블에서 상품을 select 하여야 한다.
	        		pdto = ldao.buyProductselect(chkno);
	        		request.setAttribute("cnt", quanty);
	        		request.setAttribute("pdto", pdto);
	        		
	        	}else {
	        		
					String chkArr[] = chk.split(" ");
	          
	        		for(int i=0;i<chkArr.length;i++) {
	        			int check = Integer.parseInt(chkArr[i]);
	        			cdto = ldao.getCartSelect(check);
	        			chkList.add(cdto);
	        		}
	        		// 선택한 상품중 손님(guest)인 상품을 장바구니에서 삭제
	        		for(int j=0; j<chkList.size(); j++) {     			
	        		   ldao.deleteOrderCart(chkList.get(j).getP_code(), "guest");
	        		}
	        		request.setAttribute("chkList", chkList);
	        	}
				
        		// 로그인된 id의 개인한사람의 정보를 출력 select하여 저장(주문/결제 기본정보 출력위해)
        		mdto = ldao.getOneMember(userId);
        		
        		session.setAttribute("loginId", userId);
        		request.setAttribute("mdto", mdto);
				RequestDispatcher rdis = request.getRequestDispatcher("CartOrder.jsp");
				rdis.forward(request, response);
				
			}else {
				request.setAttribute("msgError", "아이디 또는 비밀번호가 일치하지 않습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("MemberLoginError.jsp");
				rd.forward(request, response);
			}
		}
		
	}
}
