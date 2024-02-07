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

@WebServlet("/CartProc.do")
public class CartProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LivingDAO ldao = new LivingDAO();
		CartDTO cdto = new CartDTO();
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId == null) {
			loginId = "guest";
		}
		
		if(request.getParameter("code") != null && !request.getParameter("code").isEmpty()) {
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			int code = Integer.parseInt(request.getParameter("code"));
		//	String name = request.getParameter("name");
		//	String mainimg = request.getParameter("mainimg");
			int price = Integer.parseInt(request.getParameter("price"));
		//	int delivfee = Integer.parseInt(request.getParameter("delivfee"));
			int total = cnt * price;
			
			cdto.setP_code(code);
			cdto.setC_qty(cnt);
			cdto.setC_total(total);
			
			// 오티 수정 부분 ------------- 이부분 수정되지 않으면 계속 guest에 담김 상품은 장바구니에 담기지 않는다.
			cdto.setM_id(loginId);
			
//			if(loginId == null) {
//				cdto.setM_id("guest");
//			}else {
//				cdto.setM_id(loginId);
//			}
			
			// 장바구니에 중복으로 상품이 담기는 오류를 해결
			int count = ldao.getCodeCount(code, loginId);
			System.out.println("기존에 상품이 존재하는지 개수:"+count);
			
			if(count==0) { // 장바구니에 선택한 상품이 없을 때 장바구니에 새로 추가(insert)한다.
				ldao.insertCart(cdto);
			}else { // 장바구니에 선택한 상품이 이미 존재하면 개수만 update 해준다.
				ldao.updateCart1(cnt, price, code);
			}
		}
		
		// 장바구니의 레코드 전체 개수를 session에 담는다.
		int cartCount = ldao.getAllCartCount();
		session.setAttribute("cartCount", cartCount);
		session.setMaxInactiveInterval(-1); // 무한정으로 세션이 종료되지 않는다.
		
		int itemTotal = ldao.getItemTotal(loginId);
		int shippingTotal = ldao.getShippingTotal(loginId);
		request.setAttribute("itemTotal", itemTotal);
		request.setAttribute("shippingTotal", shippingTotal);
		
		// 오티 수정 부분 ---------------------------
		ArrayList<CartDTO> cList = ldao.getAllCart(loginId);
//		if(loginId == null) {
//			cList = ldao.getAllCart("guest");
//        }else {
//        	cList = ldao.getAllCart(loginId);
//        }
		request.setAttribute("cList", cList);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=CartList.jsp");
		rd.forward(request, response);
	}
}
