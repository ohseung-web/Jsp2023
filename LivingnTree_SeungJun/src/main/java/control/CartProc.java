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
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
	
		LivingDAO ldao = new LivingDAO();
		CartDTO cdto = new CartDTO();

		// 상품코드가 null이 아니면 장바구니에 insert한다.
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
			if(loginId == null) {
				cdto.setM_id("guest");
			}else {
				cdto.setM_id(loginId);
			}
			
			ldao.insertCart(cdto);
		}
		
        // 반드시 insert 작업이 끝난 후 select 한 데이터를 배열에 담아 보낸다.
		// 선택한 상품이 없이 장바구니 아이콘을 클릭하면 아래 배열에 담은 데이터만 떠넘기는 것에 주의하자.
		ArrayList<CartDTO> cList =ldao.getAllCart();
		request.setAttribute("cList", cList);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?section=CartList.jsp");
		rd.forward(request, response);
	}
}
