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

@WebServlet("/CartDelete.do")
public class CartDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LivingDAO ldao = new LivingDAO();
		CartDTO cdto = new CartDTO();
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null) {
			loginId = "guest";
		}
		
		String chk = request.getParameter("chk");
		String[] chkArr = chk.split(" "); // ex) chk = "1 2 3 ... " → chkArr = [1,2,3 ...]
		
		for(int i=0;i<chkArr.length;i++) {
			int check = Integer.parseInt(chkArr[i]);
			ldao.deleteCart(check);
		}
		
		// 장바구니의 레코드 전체 개수를 session에 담는다.
		int cartCount = ldao.getAllCartCount(loginId);
		session.setAttribute("cartCount", cartCount);
		session.setMaxInactiveInterval(-1); // 무한정으로 세션이 종료되지 않는다.
		
		ArrayList<CartDTO> cList = ldao.getAllCart(loginId);
		request.setAttribute("cList", cList);
		
		RequestDispatcher rd = request.getRequestDispatcher("CartProc.do");
		rd.forward(request, response);
	}
}
