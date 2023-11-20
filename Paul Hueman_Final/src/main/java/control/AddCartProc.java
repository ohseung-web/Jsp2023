package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartDAO;

@WebServlet("/AddCart.do")

public class AddCartProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String log = (String)session.getAttribute("paul_login");//유저아이디 세션
		if(log != null) {//u_id가 존재 한다면. 즉 이미 로그인 되있는 상태라면
			int c_cnt = Integer.parseInt(request.getParameter("c_cnt")); 		// 장바구니에 담길 수량
			String p_name = request.getParameter("p_name");  					// 상품이름
			String p_color = request.getParameter("p_color"); 					//상품색상
			int p_price = Integer.parseInt(request.getParameter("p_price")); 	//상품가격
			CartDAO cdao = new CartDAO();
			int dbcnt = cdao.getCount(p_name, p_color, log);
			if(dbcnt == 0) {
				//AfterAdded로 가서 alert후 itemList 화면으로가기
				cdao.insertCart(c_cnt, p_name, p_color, p_price, log);
				request.setAttribute("status", "success");
			} else if((c_cnt + dbcnt) > 0 && (c_cnt + dbcnt) <= 9999) {
				cdao.AddCount(p_name, p_color, log, c_cnt);
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "countover");
			}
		} else {
			request.setAttribute("status", "logerror");
		}
		RequestDispatcher dis = request.getRequestDispatcher("CartAfterAdded.jsp");
		dis.forward(request, response);
	}
}
