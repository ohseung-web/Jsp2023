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
		
		// 비회원으로 상품을 구매하기 위해 사용하는 코드
		LivingDAO ldao = new LivingDAO();
		ProductDTO pdto = new ProductDTO();
		CartDTO cdto = new CartDTO();
		MemberDTO mdto = new MemberDTO();
		ArrayList<CartDTO> chkList = new ArrayList<CartDTO>();
		
		// 비회원이 장바구니의 상품을 구매하기 위해 선택한 상품
		String chk = request.getParameter("chk");
		
		if(userId != null && !userId.isEmpty() && userPw != null && !userPw.isEmpty()) {
			// LivingDAO ldao = new LivingDAO();
			String dbPw = ldao.getMemberPw(userId);
			
			// MemberLogin.jsp에서 get방식으로 넘겨준 chk의 값이 null이라는 건 비어있다는 것이 아니라 문자 "null"을 넘겼다는 뜻이다.
			if(userPw.equals(dbPw) && userPw != null && !userPw.isEmpty()) {
				
				session.setAttribute("loginId", userId);
				session.setAttribute("loginPw", userPw);
				// 장바구니의 레코드 전체 개수를 session에 담는다.
				String loginId = (String)session.getAttribute("loginId");
				int cartCount = ldao.getAllCartCount(loginId);
				session.setAttribute("cartCount", cartCount);
				session.setMaxInactiveInterval(60*5); //5분동안 로그인 상태 유지됨
				
				// session.setMaxInactiveInterval(-1); // 무한정으로 세션이 종료되지 않는다.
				
				RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
				rd.forward(request, response);
			}else if(userPw.equals(dbPw) && userPw != null) {
				
				System.out.println("여기로 왔어요~~");
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
				// 로그인된 id의 개인 한 사람의 정보를 출력 select하여 저장(주문/결제 기본정보 출력 위해)
				mdto = ldao.getOneMember(userId);
				
				request.setAttribute("chkList", chkList);
				request.setAttribute("loginId", userId);
				request.setAttribute("mdto", mdto);
				RequestDispatcher rd = request.getRequestDispatcher("CartOrder.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("msgError", "아이디 또는 비밀번호가 일치하지 않습니다.");
				RequestDispatcher rd = request.getRequestDispatcher("MemberLoginError.jsp");
				rd.forward(request, response);
			}
		}
		
	}
}
